classdef MyFirstClass < handle
    
    properties
        MainValue;
    end
    
    methods
        function add(obj, inputArg)
            obj.MainValue = obj.MainValue + inputArg;
        end
        
        function DispValue(obj)
            disp(sprtingf('MainValue: %d',obj.MainValue))
        end
        
        function subtract(obj, inputArg)
            obj.MainValue = obj.MainValue - inputArg;
            % tests can be performed manually
        end  
    end

end
