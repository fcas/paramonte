program example

    use pm_kind, only: SK, IK, LK, RK
    use pm_distUnif, only: getUnifRand
    use pm_arraySelect, only: getSelected
    use pm_io, only: display_type

    implicit none

    type(display_type) :: disp
    disp = display_type(file = "main.out.F90")

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!Select the `rank`th smallest element in the input `integer` Array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    block
        use pm_kind, only: IKG => IKL
        integer(IK) :: rank, lenArray
        integer, parameter :: TKG = merge(IKG, IK, IKG > 0)
        integer(TKG), allocatable :: array(:)
        integer(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(-9, +9, lenArray)")
                        array = getUnifRand(-9, +9, lenArray)
        call disp%show("array")
        call disp%show( array )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    block
        use pm_kind, only: IKG => IKS
        integer(IK) :: rank, lenArray
        integer, parameter :: TKG = merge(IKG, IK, IKG > 0)
        integer(TKG), allocatable :: array(:)
        integer(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(-9, +9, lenArray)")
                        array = getUnifRand(-9, +9, lenArray)
        call disp%show("array")
        call disp%show( array )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    block
        use pm_kind, only: IKG => IKD
        integer(IK) :: rank, lenArray
        integer, parameter :: TKG = merge(IKG, IK, IKG > 0)
        integer(TKG), allocatable :: array(:)
        integer(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(-9, +9, lenArray)")
                        array = getUnifRand(-9, +9, lenArray)
        call disp%show("array")
        call disp%show( array )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    block
        use pm_kind, only: IKG => IKH
        integer(IK) :: rank, lenArray
        integer, parameter :: TKG = merge(IKG, IK, IKG > 0)
        integer(TKG), allocatable :: array(:)
        integer(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(-9, +9, lenArray)")
                        array = getUnifRand(-9, +9, lenArray)
        call disp%show("array")
        call disp%show( array )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!Select the `rank`th smallest element in the input `real` Array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    block
        use pm_kind, only: RKG => RKS
        integer(IK) :: rank, lenArray
        integer, parameter :: TKG = merge(RKG, RK, RKG > 0)
        real(TKG), allocatable :: array(:)
        real(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(-9, +9, lenArray)")
                        array = getUnifRand(-9, +9, lenArray)
        call disp%show("array")
        call disp%show( array )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    block
        use pm_kind, only: RKG => RKD
        integer(IK) :: rank, lenArray
        integer, parameter :: TKG = merge(RKG, RK, RKG > 0)
        real(TKG), allocatable :: array(:)
        real(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(-9, +9, lenArray)")
                        array = getUnifRand(-9, +9, lenArray)
        call disp%show("array")
        call disp%show( array )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    block
        use pm_kind, only: RKG => RKH
        integer(IK) :: rank, lenArray
        integer, parameter :: TKG = merge(RKG, RK, RKG > 0)
        real(TKG), allocatable :: array(:)
        real(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(-9, +9, lenArray)")
                        array = getUnifRand(-9, +9, lenArray)
        call disp%show("array")
        call disp%show( array )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!Select the `rank`th smallest element in the input Fortran `string` (character) array.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    block
        use pm_kind, only: TKG => SK
        character(2, TKG) :: selection
        character(2, TKG), allocatable :: array(:)
        integer(IK) :: rank, lenArray
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand('AA', 'ZZ', lenArray)")
                        array = getUnifRand('AA', 'ZZ', lenArray)
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%skip()
    end block

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!Select the `rank`th smallest element in the input Fortran `string` (character) scalar.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    block
        use pm_kind, only: TKG => SK
        character(1, TKG) :: selection
        character(:, TKG), allocatable :: array
        integer(IK) :: rank, lenArray
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = getUnifRand(repeat('A', lenArray), repeat('Z', lenArray))")
                        array = getUnifRand(repeat('A', lenArray), repeat('Z', lenArray))
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%skip()
    end block

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!Select the `rank`th smallest element in the input array of containers of Fortran `string` (character) scalars.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    block
        use pm_container, only: css => css_type
        integer(IK) :: rank, lenArray, iell
        type(css), allocatable :: array(:)
        type(css) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = [(css(getUnifRand('A', 'Z', getUnifRand(1_IK, 9_IK))), iell = 1, lenArray)]")
                        array = [(css(getUnifRand('A', 'Z', getUnifRand(1_IK, 9_IK))), iell = 1, lenArray)]
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%skip()
    end block

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!Select according to an input user-defined comparison function.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    block
        use pm_kind, only: TKG => IK
        integer(IK) :: rank, lenArray, i
        integer(TKG), allocatable :: array(:)
        integer(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = int([((-2)**i, i = 1, lenArray)], kind = TKG)")
                        array = int([((-2)**i, i = 1, lenArray)], kind = TKG)
        call disp%show("array")
        call disp%show( array )
        call disp%show("!Select the `rank`th largest element via an input custom-designed `isSorted()` function.")
        call disp%show("selection = getSelected(array, rank, isSorted_IK)")
                        selection = getSelected(array, rank, isSorted_IK)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    block
        use pm_kind, only: TKG => RK
        integer(IK) :: rank, lenArray, i
        real(TKG), allocatable :: array(:)
        real(TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = int([((-2)**i, i = 1, lenArray)], kind = TKG)")
                        array = int([((-2)**i, i = 1, lenArray)], kind = TKG)
        call disp%show("array")
        call disp%show( array )
        call disp%show("!Select the `rank`th smallest element solely based on the magnitude of numbers using a custom comparison function.")
        call disp%show("selection = getSelected(array, rank, isSorted_RK)")
                        selection = getSelected(array, rank, isSorted_RK)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

    block
        use pm_kind, only: TKG => SK
        integer(IK) :: rank, lenArray, i
        character(:,TKG), allocatable :: array
        character(1,TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = 'ParaMonte'")
                        array = 'ParaMonte'
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%show("!Select the `rank`th smallest element with case-sensitivity (default behavior).")
        call disp%show("selection = getSelected(array, rank)")
                        selection = getSelected(array, rank)
        call disp%show("selection")
        call disp%show( selection , deliml = SK_"""" )
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%skip()
    end block

    block
        use pm_kind, only: TKG => SK
        integer(IK) :: rank, lenArray, i
        character(:,TKG), allocatable :: array
        character(1,TKG) :: selection
        call disp%skip()
        call disp%show("lenArray = getUnifRand(5_IK, 9_IK)")
                        lenArray = getUnifRand(5_IK, 9_IK)
        call disp%show("rank = getUnifRand(1_IK, lenArray)")
                        rank = getUnifRand(1_IK, lenArray)
        call disp%show("[lenArray, rank]")
        call disp%show( [lenArray, rank] )
        call disp%show("array = 'ParaMonte'")
                        array = 'ParaMonte'
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%show("!Select the `rank`th smallest element WITHOUT case-sensitivity via a custom-designed input comparison function.")
        call disp%show("selection = getSelected(array, rank, isSorted_SK)")
                        selection = getSelected(array, rank, isSorted_SK)
        call disp%show("selection")
        call disp%show( selection , deliml = SK_"""" )
        call disp%show("array")
        call disp%show( array , deliml = SK_"""" )
        call disp%skip()
    end block

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("!Expedite the selection process for a partially sorted array via optional arguments `lb` or `ub`.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    block
        integer(IK), allocatable :: array(:)
        integer(IK) :: selection
        integer(IK) :: rank
        call disp%skip()
        call disp%show("rank = 3_IK")
                        rank = 3_IK
        call disp%show("array = [-3, -1, -2, 1, 2, 3] ! all elements after index `3` are sorted (`ub = 3_IK`).")
                        array = [-3, -1, -2, 1, 2, 3] ! all elements after index `3` are sorted (`ub = 3_IK`).
        call disp%show("selection = getSelected(array, rank, ub = 3_IK) ! all elements after index `3` are sorted (`ub = 3_IK`).")
                        selection = getSelected(array, rank, ub = 3_IK)
        call disp%show("selection")
        call disp%show( selection )
        call disp%show("array")
        call disp%show( array )
        call disp%skip()
    end block

contains

    function isSorted_IK(a,b) result(isSorted)
        use pm_kind, only: LK, IK8
        integer(IK), intent(in) :: a, b
        logical(LK) :: isSorted
        isSorted = a > b
    end function

    function isSorted_RK(a,b) result(isSorted)
        use pm_kind, only: LK, RK
        integer(RK), intent(in) :: a, b
        logical(LK) :: isSorted
        isSorted = abs(a) < abs(b)
    end function

    function isSorted_SK(a,b) result(isSorted)
        use pm_kind, only: LK, SK
        use pm_strASCII, only: getStrLower
        character(1, SK), intent(in) :: a, b
        logical(LK) :: isSorted
        isSorted = getStrLower(a) < getStrLower(b)
    end function

end program example