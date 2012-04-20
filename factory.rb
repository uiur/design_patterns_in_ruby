# Factory Method
class Park
  def initialize(number_animals)
    @animals = []
    number_animals.times do |i|
      @animals << new_animal("#{i}")
    end
  end

  def simulate
    @animals.each {|animal| animal.speak }
  end

  def new_animal(name)
    raise 'Implement new_animal'
  end
end

class CatPark < Park
  def new_animal(name)
    Cat.new(name)
  end
end

class HumanPark < Park
  def new_animal(name)
    Human.new(name)
  end
end

class Animal
  def initialize(name)
    @name = name
  end
end

class Cat < Animal
  def speak
    puts "#{@name}: にゃーん"
  end
end

class Human < Animal
  def speak
    puts "#{@name}: おれは#{@name}や。なんで檻の中におんねん"
  end
end

c = CatPark.new(4)
c.simulate
h = HumanPark.new(3)
h.simulate

# Abstract Factory
