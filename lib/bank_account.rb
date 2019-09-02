require "pry"
class BankAccount
  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit)
    @balance += deposit
  end

  def display_balance
    p "Your balance is $#{self.balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      return true
    else 
      return false
    end
  end

  def close_account
    @status = "closed"
  end

end
