####################################################################################################################################
####################################################################################################################################
####
####   MIT License
####
####   ParaMonte: plain powerful parallel Monte Carlo library.
####
####   Copyright (C) 2012-present, The Computational Data Science Lab
####
####   This file is part of the ParaMonte library.
####
####   Permission is hereby granted, free of charge, to any person obtaining a 
####   copy of this software and associated documentation files (the "Software"), 
####   to deal in the Software without restriction, including without limitation 
####   the rights to use, copy, modify, merge, publish, distribute, sublicense, 
####   and/or sell copies of the Software, and to permit persons to whom the 
####   Software is furnished to do so, subject to the following conditions:
####
####   The above copyright notice and this permission notice shall be 
####   included in all copies or substantial portions of the Software.
####
####   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
####   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
####   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
####   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
####   DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
####   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
####   OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
####
####   ACKNOWLEDGMENT
####
####   ParaMonte is an honor-ware and its currency is acknowledgment and citations.
####   As per the ParaMonte library license agreement terms, if you use any parts of 
####   this library for any purposes, kindly acknowledge the use of ParaMonte in your 
####   work (education/research/industry/development/...) by citing the ParaMonte 
####   library as described on this page:
####
####       https://github.com/cdslaborg/paramonte/blob/main/ACKNOWLEDGMENT.md
####
####################################################################################################################################
####################################################################################################################################

#[=======================================================================[.rst:
FindCoarray
----------

Finds compiler flags or library necessary to support Fortran 2008/2018 coarrays.

This packages primary purposes are:

* for compilers natively supporting Fortran coarrays without needing compiler options, simply indicating Coarray_FOUND  (example: Cray)
* for compilers with built-in Fortran coarray support, enable compiler option (example: Intel Fortran)
* for compilers needing a library such as OpenCoarrays, presenting library (example: GNU)


Result Variables
^^^^^^^^^^^^^^^^

``Coarray_FOUND``
  indicates coarray support found (whether built-in or library)

``Coarray_LIBRARIES``
  coarray library path
``Coarray_COMPILE_OPTIONS``
  coarray compiler options
``Coarray_EXECUTABLE``
  coarray executable e.g. ``cafrun``
``Coarray_MAX_NUMPROCS``
  maximum number of parallel processes
``Coarray_NUMPROC_FLAG``
  use for executing in parallel: ${Coarray_EXECUTABLE} ${Coarray_NUMPROC_FLAG} ${Coarray_MAX_NUMPROCS} ${CMAKE_CURRENT_BINARY_DIR}/myprogram

Cache Variables
^^^^^^^^^^^^^^^^

The following cache variables may also be set:

``Coarray_LIBRARY``
  The coarray libraries, if needed and found
#]=======================================================================]

cmake_policy(VERSION 3.3)

set(options_coarray Intel)  # flags needed
set(opencoarray_supported GNU)  # future: Flang, etc.

unset(Coarray_COMPILE_OPTIONS)
unset(Coarray_LIBRARY)
unset(Coarray_REQUIRED_VARS)

if(CMAKE_Fortran_COMPILER_ID IN_LIST options_coarray)

  if(CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
    if(WIN32)
      set(Coarray_COMPILE_OPTIONS /Qcoarray:shared)
      list(APPEND Coarray_REQUIRED_VARS ${Coarray_COMPILE_OPTIONS})
    elseif(UNIX AND NOT APPLE)
      set(Coarray_COMPILE_OPTIONS -coarray=shared)
      set(Coarray_LIBRARY -coarray=shared)  # ifort requires it at build AND link
      list(APPEND Coarray_REQUIRED_VARS ${Coarray_LIBRARY})
    endif()
  endif()

elseif(CMAKE_Fortran_COMPILER_ID IN_LIST opencoarray_supported)

  find_package(OpenCoarrays)

  if(OpenCoarrays_FOUND)
    set(Coarray_LIBRARY OpenCoarrays::caf_mpi)

    set(Coarray_EXECUTABLE cafrun)

    include(ProcessorCount)
    ProcessorCount(Nproc)
    set(Coarray_MAX_NUMPROCS ${Nproc})
    set(Coarray_NUMPROC_FLAG -np)

    list(APPEND Coarray_REQUIRED_VARS ${Coarray_LIBRARY})
  elseif(CMAKE_Fortran_COMPILER_ID STREQUAL GNU)
    set(Coarray_COMPILE_OPTIONS -fcoarray=single)
    list(APPEND Coarray_REQUIRED_VARS ${Coarray_COMPILE_OPTIONS})
  endif()

endif()


set(CMAKE_REQUIRED_FLAGS ${Coarray_COMPILE_OPTIONS})
set(CMAKE_REQUIRED_LIBRARIES ${Coarray_LIBRARY})
include(CheckFortranSourceCompiles)
check_fortran_source_compiles("real :: x[*]; end" f08coarray SRC_EXT f90)
unset(CMAKE_REQUIRED_FLAGS)
unset(CMAKE_REQUIRED_LIBRARIES)

list(APPEND Coarray_REQUIRED_VARS ${f08coarray})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Coarray
  REQUIRED_VARS Coarray_REQUIRED_VARS)

if(Coarray_FOUND)
  set(Coarray_LIBRARIES ${Coarray_LIBRARY})
endif()

mark_as_advanced(
  Coarray_LIBRARY
  Coarray_REQUIRED_VARS
)