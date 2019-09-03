require 'pry'
class Transfer
  attr_accessor :receiver, :amount, :sender, :status, :withdrawl, :deposit
  
 def initialize(sender, receiver, amount)
   @receiver = receiver
   @amount = amount
   @sender = sender
   @status = "pending"
 end
 
 def valid?
  sender.valid? && receiver.valid?
 end
 
 def execute_transaction
  if @sender.balance > amount && valid? && @status == "pending"
  @sender.balance -= @amount 
   @receiver.balance += @amount
    @status = "complete"
   else
        @status = "rejected"
       "Transaction rejected. Please check your account balance."
   end
 end
 
 def reverse_transfer 
  if @receiver.balance > amount && valid? && @status == "complete"
    # binding.pry
       @receiver.balance -= @amount 
       @sender.balance += @amount
       @status = "reversed"
     else 
       @status = "rejected"

 end
 end
end
