class Transfer

  attr_accessor :amount, :sender, :receiver, :status
  
      def initialize(sender, receiver, amount)
          @sender = sender 
          @receiver = receiver
          @status = "pending"
          @amount = amount
      end 


 def valid?
  if sender.valid? && receiver.valid?
    true
  else
    false
  end
end 

 def execute_transaction
if valid? 
  if @sender.balance > @amount 
    if status == "pending"
  @sender.balance -= @amount
  @receiver.balance += @amount
  @status = "complete"
    end 
else 
  @status= "rejected"
  "Transaction rejected. Please check your account balance."
 end 
else 
  @status= "rejected"
  "Transaction rejected. Please check your account balance."
end 
end 

def reverse_transfer
if @status == "complete"
  @receiver.balance -= @amount
  @sender.balance += @amount 
  @status = "reversed"
end
end 

end
