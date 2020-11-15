class Transfer
  # your code here
  attr_accessor :status, :receiver, :sender, :amount
  attr_writer 
  attr_reader
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end
  def valid?
   if sender.valid? && receiver.valid?
      true
  else
      false
  end
  end

  def execute_transaction 
    if (sender.balance > amount) && (valid?) && (self.status == "pending")
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
end
  def reverse_transfer
    #binding.pry
    if @status == "complete"
      sender.balance = sender.deposit(amount)
      receiver.balance = receiver.deposit(-amount)
      @status = "reversed"
      end
  end
end
