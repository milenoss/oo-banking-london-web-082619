require 'pry'
class Transfer
  attr_accessor :transfer, :sender, :status, :amount,:receiver

def initialize (sender,receiver,amount)
@sender = sender 
@status = "pending"
@amount = 50 
@receiver = receiver 

  end

  def valid?
   @sender.valid? && @receiver.valid? ? true : false
  end

    def execute_transaction
      if valid? && sender.balance > amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
   
  def reverse_transfer 
  if self.status == "complete"
    sender.balance += amount
    receiver.balance -= amount
    @status = "reversed"
  end
end
end