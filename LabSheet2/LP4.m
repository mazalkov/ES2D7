classdef ChildSavingsAccount < BankAccount

    properties
        AccountWard;
        ChildAge;
        PayInterest;
    end
    
    
    methods
        function InterestChecker(obj)
            if obj.ChildAge < 18
                obj.PayInterest = true;
            else
                obj.PayInterest = false;
            end
        end
        
    end
end
