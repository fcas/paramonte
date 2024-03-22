! Define example template macro to avoid duplications. See the example output for actual usage.
#define SET_POLY_ADD \
block; \
    TYPE(RKC), allocatable :: Lhs(:), Rhs(:), Add(:); \
    Lhs = LHS; \
    Rhs = RHS; \
    call disp%skip(); \
    call disp%show("getPolyStr(Lhs)"); \
    call disp%show( getPolyStr(Lhs) ); \
    call disp%show("getPolyStr(Rhs)"); \
    call disp%show( getPolyStr(Rhs) ); \
    call disp%show("Add = getPolyAdd(Lhs, Rhs)"); \
                    Add = getPolyAdd(Lhs, Rhs); \
    call disp%show("getPolyStr(Add)"); \
    call disp%show( getPolyStr(Add) ); \
    call disp%skip(); \
end block;

program example

    use pm_kind, only: SK, IK
    use pm_kind, only: RKC => RKS ! all processor real and complex kinds are supported.
    use pm_io, only: display_type
    use pm_polynomial, only: getPolyAdd
    use pm_polynomial, only: getPolyStr

    implicit none

    integer(IK) :: lenQuo
    type(display_type) :: disp
    disp = display_type(file = "main.out.F90")

#define LHS [real(RKC) :: ]
#define RHS [real(RKC) :: ]
#define TYPE real
SET_POLY_ADD

#define LHS [real(RKC) :: ]
#define RHS [real(RKC) :: -1., +1.]
#define TYPE real
SET_POLY_ADD

#define LHS [real(RKC) :: -1., +1.]
#define RHS [real(RKC) :: ]
#define TYPE real
SET_POLY_ADD

#define LHS [real(RKC) :: +1., +1.]
#define RHS [real(RKC) :: -1., +1.]
#define TYPE real
SET_POLY_ADD

#define LHS [real(RKC) :: 2., 3., 1.]
#define RHS [real(RKC) :: 1., 1.]
#define TYPE real
SET_POLY_ADD

#define LHS [real(RKC) :: -42., 0., -12., 1.]
#define RHS [real(RKC) :: 1., -2., 1.]
#define TYPE real
SET_POLY_ADD

#define LHS [real(RKC) :: -42., 0., -12., 1.]
#define RHS [real(RKC) :: -2., 1.]
#define TYPE real
SET_POLY_ADD


#define LHS [complex(RKC) :: ]
#define RHS [complex(RKC) :: ]
#define TYPE complex
SET_POLY_ADD

#define LHS [complex(RKC) :: ]
#define RHS cmplx([real(RKC) :: -1., +1.], -[real(RKC) :: -1., +1.], RKC)
#define TYPE complex
SET_POLY_ADD

#define LHS cmplx([real(RKC) :: -1., +1.], -[real(RKC) :: -1., +1.], RKC)
#define RHS [complex(RKC) :: ]
#define TYPE complex
SET_POLY_ADD

#define LHS cmplx([real(RKC) :: -4., 0., -2., 1.], -[real(RKC) :: -4., 0., -2., 1.], RKC)
#define RHS cmplx([real(RKC) :: -3., 1.], -[real(RKC) :: -3., 1.], RKC)
#define TYPE complex
SET_POLY_ADD

#define LHS cmplx([real(RKC) :: 2., 3., 1.], -[real(RKC) :: 2., 3., 1.], RKC)
#define RHS cmplx([real(RKC) :: 1., 1.], -[real(RKC) :: 1., 1.], RKC)
#define TYPE complex
SET_POLY_ADD

#define LHS cmplx([real(RKC) :: -42., 0., -12., 1.], -[real(RKC) :: -42., 0., -12., 1.], RKC)
#define RHS cmplx([real(RKC) :: 1., -2., 1.], -[real(RKC) :: 1., -2., 1.], RKC)
#define TYPE complex
SET_POLY_ADD

#define LHS cmplx([real(RKC) :: -42., 0., -12., 1.], -[real(RKC) :: -42., 0., -12., 1.], RKC)
#define RHS cmplx([real(RKC) :: -2., 1.], -[real(RKC) :: -2., 1.])
#define TYPE complex
SET_POLY_ADD

end program example