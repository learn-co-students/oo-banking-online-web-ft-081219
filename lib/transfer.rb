require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end 
  
  def valid?
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false 
    end 
    #binding.pry  
  end
  
  def execute_transaction
    if self.sender.balance < @amount || status != 'pending' || !valid?
      #binding.pry
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

      
    else
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
    #binding.pry
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end 
  end 
end
