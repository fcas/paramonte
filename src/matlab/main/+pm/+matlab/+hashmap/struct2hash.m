function hashmap = struct2hash(object, exkeys, unique, onlyfull)
    %
    %   Return a hashmap cell array containing all field names
    %   and field values of input scalar MATLAB ``object`` as (key, val)
    %   stored sequentially in the cell array.
    %
    %   Parameters
    %   ----------
    %
    %       object
    %
    %           The input scalar MATLAB struct
    %           whose field names and values are
    %           to be converted to a hashmap cell.
    %
    %       exkeys
    %
    %           The input vector of MATLAB strings
    %           containing a list of field names of the input ``object``
    %           that must be excluded from the output hashmap cell.
    %           (**optional**, default = ``[]``)
    %
    %       unique
    %
    %           The input scalar MATLAB logical.
    %           If ``true``, only the first instance of occurrence
    %           of any field name is added to the output cell array
    %           without considering case-sensitivity of the field names.
    %           (**optional**, default = ``false``)
    %
    %       onlyfull
    %
    %           The input scalar MATLAB logical.
    %           If ``true``, only the structure field names field values
    %           are nonempty (as assessed by the MATLAB intrinsic ``isempty()``)
    %           are included in the output hashmap.
    %           (**optional**, default = ``false``)
    %
    %   Returns
    %   -------
    %
    %       hashmap
    %
    %           The output cell array of even number of elements
    %           containing the field names and values of the input ``object``
    %           as ``(key, val)`` pairs stored sequentially as the cell elements.
    %
    %   Interface
    %   ---------
    %
    %       hashmap = pm.matlab.hashmap.struct2hash(object)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, exkeys)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, [], unique)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, exkeys, unique)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, exkeys, [], onlyfull)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, [], unique, onlyfull)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, exkeys, unique, onlyfull)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, [], [], onlyfull)
    %       hashmap = pm.matlab.hashmap.struct2hash(object, [], [], [])
    %
    %   Example
    %   -------
    %
    %       s = struct("key1", 1, "key2", "val2", "Key2", "val2duplicate", "key3", false, "key4", []);
    %       hashmap = pm.matlab.hashmap.struct2hash(s)
    %       hashmap = pm.matlab.hashmap.struct2hash(s, "key1")
    %       hashmap = pm.matlab.hashmap.struct2hash(s, [], true)
    %       hashmap = pm.matlab.hashmap.struct2hash(s, "key1", true)
    %       hashmap = pm.matlab.hashmap.struct2hash(s, "key1", [], true)
    %
    %   LICENSE
    %   -------
    %
    %       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md
    %
    fnameList = fieldnames(object);
    fnameListLen = length(fnameList);
    if nargin < 4; onlyfull = []; end
    if nargin < 3; unique = []; end
    if nargin < 2; exkeys = []; end
    if isempty(unique); unique = false; end
    if isempty(onlyfull); onlyfull = false; end
    if unique
        fnameListLower = lower(fnameList);
    end
    hashmap = cell(fnameListLen * 2, 1);
    exkeys = string(exkeys);
    counter = 0;
    for i = 1 : fnameListLen
        fname = string(fnameList{i});
        if ~any(strcmp(exkeys, fname))
            if ~(onlyfull && isempty(object.(fname))) && ~(unique && any(strcmpi(fnameListLower(1 : i - 1), fname)))
                counter = counter + 1;
                hashmap{counter} = fname;
                counter = counter + 1;
                hashmap{counter} = object.(fname);
            end
        end
    end
    hashmap = hashmap(1 : counter);
end
