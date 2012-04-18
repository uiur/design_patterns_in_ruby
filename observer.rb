class Human
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
    @observers = []
  end

  def birthday!
    @age += 1
    notify_observers
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  private
  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
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
