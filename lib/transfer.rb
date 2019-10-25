require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @@TRANSACTION_HISTORY = []

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
    if valid? && sender.balance > amount && status = "pending"
      @@TRANSACTION_HISTORY << amount
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else 
      self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
    
  end
  
  def reverse_transfer
    if status == "complete" 
    end
  end
 
end

