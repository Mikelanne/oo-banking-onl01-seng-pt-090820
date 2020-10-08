require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  
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
   if self.valid? && sender.balance > amount && status = "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount 
      self.status = "complete"
    else
      status = "rejected"
    end 
  end 
  
  
end
