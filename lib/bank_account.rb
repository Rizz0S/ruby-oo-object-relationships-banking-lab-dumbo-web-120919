class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize (name)
        @name = name
        @balance = 1000
        @status = "open"


    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def deposit (money)
        @balance += money
    end

    def withdraw (money)
        @balance -= money
    end

    def valid?
        @status == "open" && self.balance > 0
    end

    def close_account
        @status = "closed"
    end

end
