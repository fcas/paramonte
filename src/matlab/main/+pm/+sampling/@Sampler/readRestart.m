function restartList = readRestart(self, pattern)
    %
    %   Return a list of objects of class ``pm.sampling.FileContentsRestartDRAM``
    %   containing the content(s) of the ParaMonte simulation output restart
    %   file(s) whose path(s) match the specified input ``pattern`` or the
    %   simulation specification ``sampler.spec.outputFileName``.
    %
    %   \warning
    %
    %       This method is to be only used for post-processing of the output
    %       restart file(s) of an already finished simulation. Although possible,
    %       this method is NOT meant to be called by all processes
    %       in MPI-parallel simulations.
    %
    %   \warning
    %
    %       Currently, only the restart output files in ASCII format can be read via this method.
    %       The binary restart files are not meant to be parsed via this method.
    %       To request for ASCII restart output files in simulations,
    %       set the input simulation specification,
    %
    %           SAMPLER.spec.restartFileFormat = "ascii",
    %
    %       where SAMPLER can be an instance of any one of the ParaMonte
    %       sampler classes, such as ParaDRAM().
    %
    %   \warning
    %
    %       Avoid using this routine for very large long simulations.
    %       Reading the full restart file of a large-scale simulation problem
    %       can be extremely memory-intensive.
    %
    %   Parameters
    %   ----------
    %
    %       pattern
    %
    %           The input scalar MATLAB string containing the pattern matching
    %           the desired restart file(s) whose contents is to be read.
    %           The specified ``pattern`` only needs to partially identify
    %           the name of the simulation to which the restart file belongs.
    %           For example, specifying ``"./mydir/mysim"`` as input will
    %           lead to a search for file(s) beginning with "mysim" and
    %           ending with ``"_restart.txt"`` inside the directory ``"./mydir/"``.
    %
    %           If there are multiple files matching in the input ``pattern``,
    %           then all such files will be read and returned as elements of a list.
    %
    %           If the specified pattern is a valid existing URL, the file will be
    %           downloaded as a temporary file to the local system, its contents
    %           shall be parsed and the file will be subsequently removed.
    %
    %           If the input ``pattern`` is empty, then the method will search
    %           for any possible candidate files with the appropriate suffix
    %           in the current working directory.
    %
    %           (optional, default = ``sampler.spec.outputFileName`` or ``"./"``)
    %
    %   Returns
    %   -------
    %
    %       restartList
    %
    %           The output MATLAB cell array of objects
    %           of class ``pm.sampling.FileContentsRestart``,
    %           each of which corresponds to the contents
    %           of a unique restart file.
    %
    %   Interface
    %   ---------
    %
    %       sampler = pm.sampling.Sampler();
    %       restartList = sampler.readRestart();
    %       restartList = sampler.readRestart([]);
    %       restartList = sampler.readRestart(pattern);
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    %   Example
    %   -------
    %
    %       sampler.readRestart("./out/test_run_");
    %
    %       sampler.spec.outputFileName = "./out/test_run_";
    %       sampler.readRestart();
    %
    %       sampler.readRestart("./out/test_run_", ",");
    %
    %       sampler.spec.outputSeparator = ",";
    %       sampler.readRestart("./out/test_run_");
    %
    %       sampler.spec.outputFileName = "./out/test_run_";
    %       sampler.spec.outputSeparator = ",";
    %       sampler.readRestart();
    %
    if nargin < 2
        if 0 < pm.array.len(self.spec.outputFileName)
            pattern = string(self.spec.outputFileName);
        else
            pattern = [];
        end
    end
    ftype = "restart";
    pathList = self.findfile(ftype, pattern);
    restartList = cell(length(pathList), 1);
    for ifile = length(pathList) : -1 : 1
        if ~self.silent
            disp("processing file: """ + pathList(ifile) + """");
        end
        restartList{ifile} = pm.sampling.FileContentsRestartDRAM(pathList(ifile), self.silent);
    end
end