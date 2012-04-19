# Proxy
# 他のオブジェクトのように振舞う
class BankAccount
  attr_reader :balance
  def initialize(starting_balance=0)
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class BankAccountProxy
  def initialize(starting_balance=0, password='hoge')
    @starting_balance = starting_balance
    @password = password
  end

  def method_missing(name, *args)
    check_password(args.last)
    subject.send(name, *args.take(args.size - 1))
  end

  def check_password(password)
    if password != @password
      raise 'Passwordちゃうやんけ'
    end
  end

  def subject
    @subject ||= BankAccount.new(@starting_balance)
  end
end

b = BankAccountProxy.new
p b.deposit(1000, 'hoge')
p b.withdraw(400, 'hoge')
p b.withdraw(10000, 'heoheuoca')
