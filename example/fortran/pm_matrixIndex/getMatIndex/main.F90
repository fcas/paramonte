program example

    use pm_kind, only: SK, IK
    use pm_io, only: display_type
    use pm_distUnif, only: setUnifRand
    use pm_matrixIndex, only: getMatIndex
    use pm_matrixIndex, only: lfpack
    use pm_matrixIndex, only: rfpack
    use pm_matrixIndex, only: rdpack
    use pm_matrixIndex, only: uppDia
    use pm_matrixIndex, only: lowDia
    use pm_err, only: setAsserted
    use pm_val2str, only: getStr

    implicit none

    integer(IK) :: doff, indexLFP, indexRFP(2), indexRDP(2), jndexRDP(2)
    integer(IK), parameter :: nrow = 5, ncol = 5
    character(2) :: matRDP(nrow, ncol)

    type(display_type) :: disp
    disp = display_type(file = "main.out.F90")

    block
        integer :: icol, irow
    do icol = 1, ncol
        do irow = 1, nrow
            matRDP(irow, icol) = getStr(irow)//getStr(icol)
        end do
    end do
    end block

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Upper triangle of an RDP matrix to LFP matrix.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%skip()
    call disp%show("matRDP")
    call disp%show( matRDP , deliml = """" )

    call disp%skip()
    call disp%show("indexRDP = [2, 3]")
                    indexRDP = [2, 3]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 5_IK)")
                    call setAsserted(indexLFP == 5_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [4, 2]; doff = -2")
                    indexRDP = [4, 2]; doff = -2
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK), doff)")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK), doff)
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 7_IK)")
                    call setAsserted(indexLFP == 7_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK), doff) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK), doff)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [5, 4]; doff = -2")
                    indexRDP = [5, 4]; doff = -2
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK), doff)")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK), doff)
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 17_IK)")
                    call setAsserted(indexLFP == 17_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK), doff) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK), doff)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [5, 5]; doff = -5")
                    indexRDP = [5, 5]; doff = -5
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK), doff)")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK), doff)
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 25_IK)")
                    call setAsserted(indexLFP == 25_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK), doff) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, uppDia, shape(matRDP, IK), doff)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Lower triangle of a RDP matrix to LFP matrix.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%skip()
    call disp%show("matRDP")
    call disp%show( matRDP , deliml = """" )

    call disp%skip()
    call disp%show("indexRDP = [3, 2]")
                    indexRDP = [3, 2]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 7_IK)")
                    call setAsserted(indexLFP == 7_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [2, 4]; doff = +2")
                    indexRDP = [2, 4]; doff = +2
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK), doff) ! 16")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK), doff)
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 16_IK)")
                    call setAsserted(indexLFP == 16_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK), doff) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK), doff)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [4, 5]; doff = +2")
                    indexRDP = [4, 5]; doff = +2
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK), doff) ! 21")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK), doff)
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 21_IK)")
                    call setAsserted(indexLFP == 21_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK), doff) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK), doff)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [5, 5]; doff = +5")
                    indexRDP = [5, 5]; doff = +5
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK), doff)")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK), doff)
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 25_IK)")
                    call setAsserted(indexLFP == 25_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK), doff) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK), doff)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [4, 2]")
                    indexRDP = [4, 2]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK)) ! 8")
                    indexLFP = getMatIndex(lfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))
    call disp%show("indexLFP")
    call disp%show( indexLFP )
    call disp%show("call setAsserted(indexLFP == 8_IK)")
                    call setAsserted(indexLFP == 8_IK)
    call disp%show("jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, lfpack, indexLFP, lowDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Upper triangle of a RDP matrix to RFP matrix.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%skip()
    call disp%show("matRDP")
    call disp%show( matRDP , deliml = """" )

    call disp%skip()
    call disp%show("indexRDP = [2, 3];")
                    indexRDP = [2, 3];
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [2, 1]))")
                    call setAsserted(all(indexRFP == [2, 1]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [1, 2]")
                    indexRDP = [1, 2]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [5, 1]))")
                    call setAsserted(all(indexRFP == [5, 1]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [4, 5]")
                    indexRDP = [4, 5]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [4, 3]))")
                    call setAsserted(all(indexRFP == [4, 3]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [5, 5]")
                    indexRDP = [5, 5]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [5, 3]))")
                    call setAsserted(all(indexRFP == [5, 3]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))
    call disp%skip()

    call disp%skip()
    call disp%show("matRDP(1:4, 1:4)")
    call disp%show( matRDP(1:4, 1:4) , deliml = """" )

    call disp%skip()
    call disp%show("indexRDP = [2, 3]")
                    indexRDP = [2, 3]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [2, 1]))")
                    call setAsserted(all(indexRFP == [2, 1]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [2, 2]")
                    indexRDP = [2, 2]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [5, 2]))")
                    call setAsserted(all(indexRFP == [5, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [3, 4]")
                    indexRDP = [3, 4]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [3, 2]))")
                    call setAsserted(all(indexRFP == [3, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [4, 4]")
                    indexRDP = [4, 4]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, uppDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [4, 2]))")
                    call setAsserted(all(indexRFP == [4, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, uppDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%show("! Lower triangle of a RDP matrix to RFP matrix.")
    call disp%show("!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
    call disp%skip()

    call disp%skip()
    call disp%show("matRDP")
    call disp%show( matRDP , deliml = """" )

    call disp%skip()
    call disp%show("indexRDP = [3, 2]")
                    indexRDP = [3, 2]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [3, 2]))")
                    call setAsserted(all(indexRFP == [3, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [2, 1]")
                    indexRDP = [2, 1]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [2, 1]))")
                    call setAsserted(all(indexRFP == [2, 1]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [5, 4]")
                    indexRDP = [5, 4]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [1, 3]))")
                    call setAsserted(all(indexRFP == [1, 3]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [5, 5]")
                    indexRDP = [5, 5]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK))
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [2, 3]))")
                    call setAsserted(all(indexRFP == [2, 3]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK)) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK))
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))
    call disp%skip()

    call disp%skip()
    call disp%show("matRDP(1:4, 1:4)")
    call disp%show( matRDP(1:4, 1:4) , deliml = """" )

    call disp%skip()
    call disp%show("indexRDP = [3, 2]")
                    indexRDP = [3, 2]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [4, 2]))")
                    call setAsserted(all(indexRFP == [4, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [2, 2]")
                    indexRDP = [2, 2]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [3, 2]))")
                    call setAsserted(all(indexRFP == [3, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [4, 3]")
                    indexRDP = [4, 3]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [1, 2]))")
                    call setAsserted(all(indexRFP == [1, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

    call disp%skip()
    call disp%show("indexRDP = [4, 4]")
                    indexRDP = [4, 4]
    call disp%show("matRDP(indexRDP(1), indexRDP(2))")
    call disp%show( matRDP(indexRDP(1), indexRDP(2)) , deliml = """" )
    call disp%show("indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)")
                    indexRFP = getMatIndex(rfpack, rdpack, indexRDP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("indexRFP")
    call disp%show( indexRFP )
    call disp%show("call setAsserted(all(indexRFP == [2, 2]))")
                    call setAsserted(all(indexRFP == [2, 2]))
    call disp%show("jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK) ! revert")
                    jndexRDP = getMatIndex(rdpack, rfpack, indexRFP, lowDia, shape(matRDP, IK) - 1_IK)
    call disp%show("jndexRDP")
    call disp%show( jndexRDP )
    call disp%show("call setAsserted(all(jndexRDP == indexRDP))")
                    call setAsserted(all(jndexRDP == indexRDP))

end program example