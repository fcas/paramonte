function reportList = readReport(self, pattern)
    %
    %   Return a list of objects of class ``pm.sampling.FileContentsReport``
    %   containing the content(s) of the ParaMonte simulation output report
    %   file(s) whose path(s) match the specified input ``pattern`` or the
    %   simulation specification ``sampler.spec.outputFileName``.
    %
    %   \warning
    %
    %       This method is to be only used for post-processing of the output
    %       report file(s) of an already finished simulation. Although possible,
    %       this method is NOT meant to be called by all processes
    %       in MPI-parallel simulations.
    %
    %   Parameters
    %   ----------
    %
    %       pattern
    %
    %           The input scalar MATLAB string containing the pattern matching
    %           the desired report file(s) whose contents is to be read.
    %           The specified ``pattern`` only needs to partially identify
    %           the name of the simulation to which the report file belongs.
    %           For example, specifying ``"./mydir/mysim"`` as input will
    %           lead to a search for file(s) beginning with "mysim" and
    %           ending with ``"_report.txt"`` inside the directory ``"./mydir/"``.
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
    %       reportList
    %
    %           The output MATLAB cell array of objects
    %           of class ``pm.sampling.FileContentsReport``,
    %           each of which corresponds to the contents
    %           of a unique report file.
    %
    %   Interface
    %   ---------
    %
    %       sampler = pm.sampling.Sampler();
    %       reportList = sampler.readReport();
    %       reportList = sampler.readReport([]);
    %       reportList = sampler.readReport(pattern);
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    %   Example
    %   -------
    %
    %       sampler.readReport("./out/test_run_");
    %
    %       sampler.spec.outputFileName = "./out/test_run_";
    %       sampler.readReport();
    %
    %       sampler.readReport("./out/test_run_", ",");
    %
    %       sampler.spec.outputSeparator = ",";
    %       sampler.readReport("./out/test_run_");
    %
    %       sampler.spec.outputFileName = "./out/test_run_";
    %       sampler.spec.outputSeparator = ",";
    %       sampler.readReport();
    %
    if nargin < 2
        if 0 < pm.array.len(self.spec.outputFileName)
            pattern = string(self.spec.outputFileName);
        else
            pattern = [];
        end
    end
    ftype = "report";
    pathList = self.findfile(ftype, pattern);
    reportList = cell(length(pathList), 1);
    for ifile = length(pathList) : -1 : 1
        if ~self.silent
            disp("processing file: """ + pathList(ifile) + """");
        end
        reportList{ifile} = pm.sampling.FileContentsReport(pathList(ifile), self.silent, self.method);
    end
end