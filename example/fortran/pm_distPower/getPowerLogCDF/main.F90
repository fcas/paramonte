program example

    use pm_kind, only: SK, IK, LK
    use pm_distPower, only: getPowerLogCDF
    use pm_io, only: display_type

    implicit none

    real                    :: logCDF(3)

    type(display_type)      :: disp
    disp = display_type(file = "main.out.F90")

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Compute the Cumulative Distribution Function (CDF) of the Power distribution.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%skip()
    call disp%show("logCDF(1) = getPowerLogCDF(logx = 3., alpha = +2., logMaxX = 5.) ! Power distribution.")
                    logCDF(1) = getPowerLogCDF(logx = 3., alpha = +2., logMaxX = 5.) ! Power distribution.
    call disp%show("logCDF(1)")
    call disp%show( logCDF(1) )
    call disp%skip()

    call disp%skip()
    call disp%show("logCDF(1:3) = getPowerLogCDF(logx = [3., 4., 5.], alpha = [+2., +3., +4.], logMaxX = 5.) ! Power distribution.")
                    logCDF(1:3) = getPowerLogCDF(logx = [3., 4., 5.], alpha = [+2., +3., +4.], logMaxX = 5.) ! Power distribution.
    call disp%show("logCDF(1:3)")
    call disp%show( logCDF(1:3) )
    call disp%skip()

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Compute the Cumulative Distribution Function (CDF) of the Truncated Power distribution.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%skip()
    call disp%show("logCDF(1) = getPowerLogCDF(logx = 3., alpha = 1., logMinX = -2., logMaxX = 5.) ! Truncated Power distribution.")
                    logCDF(1) = getPowerLogCDF(logx = 3., alpha = 1., logMinX = -2., logMaxX = 5.) ! Truncated Power distribution.
    call disp%show("logCDF(1)")
    call disp%show( logCDF(1) )
    call disp%skip()

    call disp%skip()
    call disp%show("logCDF(1:3) = getPowerLogCDF(logx = [3., 0., -2.], alpha = [+1., +2., +3.], logMinX = -2., logMaxX = 5.) ! Truncated Power distribution.")
                    logCDF(1:3) = getPowerLogCDF(logx = [3., 0., -2.], alpha = [+1., +2., +3.], logMinX = -2., logMaxX = 5.) ! Truncated Power distribution.
    call disp%show("logCDF(1:3)")
    call disp%show( logCDF(1:3) )
    call disp%skip()

    !%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ! Output an example array for visualization.
    !%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    block
        use pm_arraySpace, only: setLinSpace
        real :: alpha(2), logMinX, logMaxX, logCDF(4), logx(2000)
        integer(IK) :: fileUnit, i
        call setLinSpace(logx, x1 = log(0.001), x2 = log(10.))
        alpha = [+0.5, +2.0]
        logMinX = log(3.)
        logMaxX = log(8.)
        open(newunit = fileUnit, file = "getPowerLogCDF.RK.txt")
        do i = 1, size(logx, 1, IK)
            logCDF = -huge(0.)
            if (logx(i) <= logMaxX) then
                logCDF(1:2) = getPowerLogCDF(logx(i), alpha, logMaxX)
                if (logMinX <= logx(i)) logCDF(3:4) = getPowerLogCDF(logx(i), alpha, logMinX, logMaxX)
            end if
            write(fileUnit, "(5(g0,:,', '))") exp(logx(i)), exp(logCDF)
        end do
        close(fileUnit)
    end block

end program example