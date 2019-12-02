require 'pry'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.sender.balance < self.amount
      p "Transaction rejected. Please check your account balance."
    else
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
      @amount = 0
    end
  end
end
