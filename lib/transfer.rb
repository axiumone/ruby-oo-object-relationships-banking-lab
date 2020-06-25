class Transfer

  attr_accessor :sender, :receiver, :status, :amount, :balance

  executed = false

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount
end

def valid?
  @sender.valid? && @receiver.valid?
end

def execute_transaction
  if @sender.balance > @amount && valid? && @status == "pending"
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
end

def reverse_transfer
  if @status = "complete" && @status != "pending"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"

      end
end



end



