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
    while self.status == "pending" do
      if @sender.balance < @amount
        p "Transaction rejected. Please check your account balance."
      else
        @sender.balance -= @amount
        @receiver.balance += @amount
        self.status = "complete"
      end
    end
    self.status = "pending"
  end
end
