classdef Ellipse < pm.vis.cascade.Cascade
    %
    %   This is the Ellipse class for generating
    %   instances of 2-dimensional Ellipse plots
    %   based on the relevant MATLAB
    %   intrinsic functions.
    %
    %   Parameters
    %   ----------
    %
    %       gramian
    %
    %           See the corresponding input argument to the class ``pm.vis.plot.Ellipse``.
    %
    %       center
    %
    %           See the corresponding input argument to the class ``pm.vis.plot.Ellipse``.
    %
    %       cval
    %
    %           See the corresponding input argument to the class ``pm.vis.plot.Ellipse``.
    %
    %       varargin
    %
    %           Any ``property, value`` pair of the parent object.
    %           If the property is a ``struct()``, then its value must be given as a cell array,
    %           with consecutive elements representing the struct ``property-name, property-value`` pairs.
    %           Note that all of these property-value pairs can be also directly set via the
    %           parent object attributes, before calling the ``make()`` method.
    %
    %       \note
    %
    %           The input ``varargin`` can also contain the components
    %           of the ``template`` component of the parent object.
    %
    %   Attributes
    %   ----------
    %
    %       See below and also the documentation of the
    %       attributes of the superclass ``pm.vis.figure.Figure``.
    %
    %   Returns
    %   -------
    %
    %       An object of class ``pm.vis.cascade.Ellipse``.
    %
    %   Interface
    %   ---------
    %
    %       p = pm.vis.cascade.Ellipse();
    %       p = pm.vis.cascade.Ellipse(gramian);
    %       p = pm.vis.cascade.Ellipse(gramian, center);
    %       p = pm.vis.cascade.Ellipse(gramian, center, cval);
    %       p = pm.vis.cascade.Ellipse(gramian, center, cval, varargin);
    %
    %   Example
    %   -------
    %
    %       p = pm.vis.cascade.Ellipse();
    %       p.make("dims", [1, 2]);
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    methods(Access = public)
        function self = Ellipse(gramian, center, cval, varargin)
            %%%% Define the missing optional values as empty with the right rank.
            if  nargin < 3
                cval = zeros(0, 0);
            end
            if  nargin < 2
                center = zeros(0, 0);
            end
            if  nargin < 1
                gramian = zeros(0, 0, 0);
            end
            self = self@pm.vis.cascade.Cascade(pm.vis.plot.Ellipse(gramian, center, cval), varargin{:});
        end
    end
end