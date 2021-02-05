classdef BankAccount < handle
    
    properties
        Balance;
        AccountNum;
        HolderName;
    end
    
    
    methods
        
        function SetBalance(obj, NewBalance)
            if isa(NewBalance, 'float')
                obj.Balance = NewBalance;
            else
                error("New balance must be a valid numeric type")
            end
        end
        
        function DispBalance(obj)
            sprintf("The current account balance is: £%.2f", obj.Balance)
        end
        
        function ReturnedBalance = GetBalance(obj)
            ReturnedBalance = obj.Balance;
        end
        
        function Withdraw(obj, amount)
            if isa(amount, 'float')
                if amount < 10000
                    obj.Balance = obj.Balance - amount;
                    sprintf("The new balance after withdrawing £%.2f is £%.2f", amount, obj.Balance)
                else
                    error("You cannot withdraw more than £10,000")
                end
            else
                error("Amount to withdraw must be a valid numeric type")
            end
        end
        
        function PayIn(obj, amount)
            if isa(amount, 'float')
                if amount > 0
                    obj.Balance = obj.Balance + amount;
                    sprintf("Thce new balance after paying in £%.2f is £%.2f", amount, obj.Balance)
                else
                    error("You cannot pay in a negative amount")
                end
            else
                error("Amount to pay in must be a valid numeric type")
            end
        end
        
        
    end
end
