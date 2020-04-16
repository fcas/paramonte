classdef LineScatterPlot < Plot1D
%   This is the LinePlot class for generating instances 
%   of line figures based on matplotlib library's 
%   line() and functions.
%
%   Usage
%   -----
%   first generate an object of this class by optionally 
%   passing the following parameters described below. Then call 
%   the plot() method. The generated object is also callable with 
%   the same input parameters as the object's constructor.
%
%   Parameters
%   ----------
%       dataFrame
%           a Pandas dataframe from which the selected data will be plotted.
%       xcolumns
%           optional argument that determines the columns of dataframe to serve as 
%           the x-values. It can have three forms:
%               1.  a list of column indices in the input dataFrame.
%               2.  a list of column names in dataFrame.columns.
%               3.  a range(start,stop,step), representing the column indices 
%                   in the input dataFrame.
%           Examples:
%               1.  xcolumns = [0,1,4,3]
%               2.  xcolumns = ["SampleLogFunc","SampleVariable1"]
%               3.  xcolumns = range(17,7,-2)
%           However, in all cases, it must have a length that is either 1 or equal 
%           to the length of ycolumns. If the length is 1, then xcolumns will be 
%           plotted against data corresponding to each element of ycolumns.
%           If not provided, the default will be the count of the rows of the 
%           input dataFrame.
%       ycolumns
%           optional argument that determines the columns of dataframe to serve 
%           as the y-values. It can have three forms:
%               1.  a list of column indices in the input dataFrame.
%               2.  a list of column names in dataFrame.columns.
%               3.  a range(start,stop,step), representing the column indices 
%                   in the input dataFrame.
%           Examples:
%               1.  ycolumns = [0,1,4,3]
%               2.  ycolumns = ["SampleLogFunc","SampleVariable1"]
%               3.  ycolumns = range(17,7,-2)
%           However, in all cases, it must have a length that is either 1 or 
%           equal to the length of xcolumns. If the length is 1, then ycolumns 
%           will be plotted against data corresponding to each element of xcolumns. 
%           If not provided, the default includes all columns of the dataframe. 
%       ccolumns
%           (line-color-columns) optional argument that determines the columns 
%           of dataframe to serve as the color-values corresponding to each 
%           line-segment in the plot. If provided, a matplotlib LineCollection 
%           will be added to the plot. It can have three forms:
%               1.  a list of column indices in the input dataFrame.
%               2.  a list of column names in dataFrame.columns.
%               3.  a range(start,stop,step), representing the column indices 
%                   in the input dataFrame.
%           Examples:
%               1.  ccolumns = [0,1,4,3]
%               2.  ccolumns = ["SampleLogFunc","SampleVariable1"]
%               3.  ccolumns = range(17,7,-2)
%           However, in all cases, it must have a length that is either 1 or 
%           equal to the lengths of xcolumns or ycolumns, whichever is not 1. 
%           If the length is 1, then the same color will be used for plotting 
%           data corresponding to each element of xcolumns. If not provided, 
%           the default will be the count of the rows of the input dataFrame. 
%           If set to None, no colored LineCollection will be added to the plot.
%       rows
%           optional argument that determines the rows of dataframe 
%           to be visualized. It can be either:
%               1.  a range(start,stop,step), or, 
%               2.  a list of row indices in dataFrame.index.
%           Examples:
%               1.  rows = range(17,7,-2)
%               2.  rows = [i for i in range(7,17)]
%           If not provided, the default includes all rows of the dataframe.
%       lc_kws
%           optional cell array of string values to be passed to matplotlib's 
%           LineCollection() class. For example: 
%               lc_kws = {"cmap":"autumn"}
%           The default is {}. 
%           If set to None, no colored LineCollection will be plotted.
%       gca_kws
%           optional cell array of string values to be passed to seaborn's 
%           set() function. For example: 
%               gca_kws = {"style":"darkgrid"}
%           if set to None, then no call to set() function will be made.
%       gcf_kws
%           optional cell array of string values to be passed to matplotlib's 
%           figure() function. For example: 
%               gcf_kws = {"facecolor":"w","dpi":150}
%       plot_kws
%           optional cell array of string values to be passed to matplotlib's 
%           plot() function. For example: 
%               plot_kws = {"linewidth":0.5}
%           The default is {}.
%           If set to None, no fixed-color line plot will be plotted. 
%       legend_kws
%           optional cell array of string values to be passed to matplotlib's 
%           legend() function. If it is set to None, no legend will be added
%           to the plot. If it is set to {}, then the legend will be added 
%           to the plot and automatically adjusted. For example: 
%               legend_kws = {"labels":["Variable1","Variable2"]}
%           legend will be added to plot only if simple line plot with no 
%           color-mappings are requested.
%       colorbar_kws
%           optional cell array of string values to be passed to matplotlib's 
%           figure.colorbar() function. For example: 
%               colorbar_kws = {"orientation":"vertical"}
%           The default is {}. If set to None, no colorbar will be plotted.
%       outputFile
%           optional string representing the name of the output file in which 
%           the figure will be saved. If not provided, no output file will be generated.
%       axes
%           the axes object to which the plot must be added.
%           The default is None in which case the output of matplotlib's gca()
%           function wil be used to get the current active axes.
%
%   Attributes
%   ----------
%       All of the parameters described above, except dataFrame.
%           a reference to the dataFrame will be implicitly stored in the object.
%       target
%           a callable object of ParaMonte library's class Target which can 
%           be used to add target point and lines to the current active plot.
%       currentFig
%           an object of class ParaMonteFigure which is initially None, but upon 
%           making a plot, is populated with attributes representing all outputs 
%           from matplotlib/seaborn function calls, with the following attributes:
%               figure
%                   the output of matplotlib's figure() function.
%               axes
%                   the axes on which the plot is made.
%               plot
%                   a list of Line2D objects which is the output 
%                   of matplotlib's plot() function.
%               lineCollection
%                   an object of type LineCollection which is the 
%                   output of matplotlib's LineCollection() class.
%               legend
%                   the output of matplotlib's legend() function.
%               colorbar
%                   the output of matplotlib's Figure.colorbar() function.
%
%   Returns
%   -------
%       LinePlot
%
%   ----------------------------------------------------------------------

    %*******************************************************************************************************************************
    %*******************************************************************************************************************************

    properties (Access = public)

        ycolumns
        ccolumns
        plot_kws
        surface_kws
        scatter_kws
        colorbar_kws
        colormap

    end

    properties (Access = protected, Hidden)
        %dfref = [];
        %isdryrun = [];
        plotType
    end

    %*******************************************************************************************************************************
    %*******************************************************************************************************************************

    methods (Hidden)

        %***********************************************************************************************************************
        %***********************************************************************************************************************

        function reset(self)

            reset@Plot1D(self);
            self.ycolumns = {};
            self.ccolumns = {};
            self.plot_kws = [];
            self.surface_kws = {};
            self.scatter_kws = {};
            self.colorbar_kws = {};
            self.colormap = {};

        end

        %***************************************************************************************************************************
        %***************************************************************************************************************************

    end

    %*******************************************************************************************************************************
    %*******************************************************************************************************************************

    methods (Access = public)

        %***************************************************************************************************************************
        %***************************************************************************************************************************

        function self = LineScatterPlot(varargin) % expected input arguments: dataFrame, plotType

            self@Plot1D(varargin{1});
            self.plotType = varargin{2};
            self.reset()
            %self.target    = Target()
            self.isdryrun = true;
            self.plot();
            self.isdryrun = false;

        end

        %***********************************************************************************************************************
        %***********************************************************************************************************************

        function plot(self,varargin)
        %   Generate a line plot from the selected columns of the object's dataframe.
        %   
        %   Parameters
        %   ----------
        %       None
        %   
        %   Returns
        %   -------
        %       None. However, this method causes side-effects by manipulating 
        %       the existing attributes of the object.

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%% parse arguments
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            self.parseArgs(varargin{:})

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %%%% set what to plot
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            plotEnabled = isa(self.plot_kws,"cell");
            surfaceEnabled = isa(self.surface_kws,"cell");
            scatterEnabled = isa(self.scatter_kws,"cell");
            colorScatterEnabled = false;
            %if scatterEnabled
            %    if getKeyVal(self.scatter_kws)
            %    key = string(self.scatter_kws)
            %    if strcmpcolorScatterEnabled = 
            %end

            cEnabled =  ( isa(self.colormap,"cell") || isa(self.colormap,"string") || isa(self.colormap,"char") ) && ...
                        ( isa(self.ccolumns,"cell") || isa(self.ccolumns,"string") || isa(self.ccolumns,"char") ) && ...
                        ( isa(self.surface_kws,"cell") || isa(self.scatter_kws,"cell") );
            lgEnabled = isa(self.legend_kws,"cell") && ~cEnabled;

            if scatterEnabled
                self.scatter_kws = addKeyVal("marker",".",self.scatter_kws{:});
            end

            if plotEnabled
                self.plot_kws = addKeyVal("linewidth",1,self.plot_kws{:});
            end

            if cEnabled && ~getVecLen(string(self.colormap))
                self.colormap = "autumn";
            end

            figEnabled = isa(self.gcf_kws,"cell");

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if self.isdryrun; return; end
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % generate figure and axes if needed

            if figEnabled
                self.currentFig.gcf = figure(self.gcf_kws{:});
            else
                set(0, 'CurrentFigure', gcf);
                self.currentFig.gcf = gcf;
            end

            % check rows presence

            if getVecLen(self.rows)
                rowindex = self.rows;
            else
                rowindex = 1:1:length(self.dfref{:,1});
            end
            %ndata = length(rowindex);

            % check columns presence

            if getVecLen(self.xcolumns)
                [xcolnames, xcolindex] = getColNamesIndex(self.dfref.Properties.VariableNames,self.xcolumns);
            else
                xcolindex = [];
                xcolnames = "Count";
                xdata = rowindex;
            end

            [ycolnames, ycolindex] = getColNamesIndex(self.dfref.Properties.VariableNames,self.ycolumns);

            % set line plot color data

            if cEnabled
                if getVecLen(self.ccolumns)
                    [ccolnames, ccolindex] = getColNamesIndex(self.dfref.Properties.VariableNames,self.ccolumns);
                else
                    ccolindex = [];
                    ccolnames = "Count";
                    cdata = 1:1:length(self.dfref{:,1});
                end
            else
                ccolindex = [];
                ccolnames = [];
                cdata = [];
            end

            % check the lengths are consistent

            xcolindexlen = length(xcolindex);
            ycolindexlen = length(ycolindex);
            ccolindexlen = length(ccolindex);
            maxLenColumns = max (   [ xcolindexlen ...
                                    , ycolindexlen ...
                                    , ccolindexlen ...
                                    ] ...
                                );

            if xcolindexlen~=maxLenColumns && xcolindexlen>1; error("length of xcolumns must be either 1 or equal to the lengths of ycolumns or ccolumns."); end
            if ycolindexlen~=maxLenColumns && ycolindexlen>1; error("length of ycolumns must be either 1 or equal to the lengths of xcolumns or ccolumns."); end
            if ccolindexlen~=maxLenColumns && ccolindexlen>1; error("length of ccolumns must be either 1 or equal to the lengths of xcolumns or ycolumns."); end

            % assign data in case of single column assignments

            if xcolindexlen==1
                xdata = self.dfref{rowindex,xcolindex};
            end
            if ycolindexlen==1
                ydata = self.dfref{rowindex,ycolindex};
            end
            if ccolindexlen==1
                cdata = self.dfref{rowindex,ccolindex};
            end

            % add line plot

            hold on; box on;

            lglabels = [];
            if cEnabled
                colormap(self.colormap);
            end

            if scatterEnabled || surfaceEnabled || plotEnabled

                for i = 1:maxLenColumns

                    if xcolindexlen>1
                        xdata = self.dfref{rowindex,xcolindex(i)};
                    end
                    if ycolindexlen>1
                        ydata = self.dfref{rowindex,ycolindex(i)};
                    end
                    if ccolindexlen>1
                        cdata = self.dfref{rowindex,ccolindex(i)};
                    end

                    if lgEnabled
                        if xcolindexlen<2 && ycolindexlen>=1
                            lglabels = [ lglabels , ycolnames(i) ];
                        elseif xcolindexlen>1 && ycolindexlen<2
                            lglabels = [ lglabels , xcolnames(i) ];
                        else
                            lglabels = [ lglabels , xcolnames(i)+"-"+ycolnames(i) ];
                        end
                    end

                    % add plot

                    if plotEnabled
                        self.currentFig.plot = plot ( xdata ...
                                                    , ydata ...
                                                    , self.plot_kws{:} ...
                                                    );
                    end

                    if surfaceEnabled
                        self.currentFig.surface = color_line(xdata,ydata,cdata,self.surface_kws{:});
                    end

                    if scatterEnabled 
                        if cEnabled
                            self.currentFig.scatter = scatter   ( xdata ...
                                                                , ydata ...
                                                                , 5 ...
                                                                , cdata ...
                                                                , self.scatter_kws{:} ...
                                                                );
                        else
                            %plot_kws = {};
                            %if ~isa(self.plot_kws,"cell"); plot_kws = self.plot_kws;
                            self.currentFig.plot = plot ( xdata ...
                                                    , ydata ...
                                                    , self.scatter_kws{:} ...
                                                    );
                        end
                    end

                end % loop plot

                self.currentFig.gca = gca;

            end

            % add axis labels

            if xcolindexlen>1
                self.currentFig.xlabel = xlabel("Variable Values");
            else
                self.currentFig.xlabel = xlabel(xcolnames(1));
            end

            if ycolindexlen>1
                self.currentFig.ylabel = ylabel("Variable Values");
            else
                self.currentFig.ylabel = ylabel(ycolnames(1));
            end

            % add line colorbar

            colorbarEnabled = cEnabled && isa(self.colorbar_kws,"cell"); %&& ccolindexlen==1;
            if colorbarEnabled
                [fontsize, keyFound] = getKeyVal("fontsize",self.colorbar_kws{:});
                if keyFound
                    fontsize_kws = {"fontsize",fontsize};
                else
                    fontsize_kws = {"fontsize",self.currentFig.ylabel.FontSize};
                    self.colorbar_kws = [ self.colorbar_kws , fontsize_kws ];
                end
                self.currentFig.colorbar = colorbar(self.colorbar_kws{:});
                ylabel(self.currentFig.colorbar,ccolnames(1),fontsize_kws{:});
            else
                colorbar('off');
                self.currentFig.colorbar = [];
            end

            self.doStuffPlot1D(lgEnabled,lglabels)

            hold off;

        end % function plot

        %***********************************************************************************************************************
        %***********************************************************************************************************************

    end % methods

    %***************************************************************************************************************************
    %***************************************************************************************************************************

end % classdef LinePlot