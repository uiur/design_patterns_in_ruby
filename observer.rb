module Subject
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify
    @observers.each do |observer|
      observer.update(self)
    end
  end
end

class Human
  include Subject
  attr_reader :name, :age
  def initialize(name, age)
    super()
    @name = name
    @age = age
  end

  def birthday!
    @age += 1
    notify
  end
end

class Presenter
  def update(changed_human)
    puts "Happy Birthday! #{changed_human.name}!"
  end
end

h = Human.new('Uiui', 11)
h.add_observer(Presenter.new)
h.birthday!
