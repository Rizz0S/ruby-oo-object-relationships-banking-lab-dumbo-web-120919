class Transfer
    
    attr_reader :sender, :receiver, :amount
    attr_accessor :status

    def initialize (sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"

    end

    def valid?
      self.sender.valid? && self.receiver.valid? && self.sender.balance > amount
    end

    def execute_transaction
      if !self.valid? 
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif self.valid? && self.status == "pending"
        self.sender.withdraw(self.amount)
        self.receiver.deposit(self.amount)
        @status = "complete"
      end
    end

    def reverse_transfer
      if @status == "complete"
        self.receiver.withdraw(self.amount)
        self.sender.deposit(self.amount)
        @status = "reversed"
      end
    end


end
