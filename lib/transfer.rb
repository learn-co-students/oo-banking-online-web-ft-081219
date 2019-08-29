class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(n1,n2,amt)
    @sender=n1
    @receiver=n2
    @status="pending"
    @amount=amt
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if @status=="pending"
      if !@sender.valid? || @sender.balance<@amount || !@receiver.valid?
        @status="rejected"
        "Transaction rejected. Please check your account balance."
      else
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status="complete"
      end
    end
  end

  def reverse_transfer
    if @status=="complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status="reversed"
    end
  end

end