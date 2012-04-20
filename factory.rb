# Factory Method
module FactoryMethod
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
end

# Abstract Factory
module AbstractFactory
  class Park
    def initialize(number_animals, factory)
      @animals = []
      @food = factory.new_food
      number_animals.times do |i|
        @animals << factory.new_animal("#{i}")
      end
    end

    def simulate
      @animals.each do |animal|
        animal.speak
        animal.eat(@food)
      end
    end
  end

  class Factory
    def new_animal(name)
      raise 'Implement new_animal'
    end

    def new_food
      raise 'Implement new_food'
    end
  end

  class CatFactory
    def new_animal(name)
      Cat.new(name)
    end

    def new_food
      Food.new('かつお')
    end
  end

  class HumanFactory
    def new_animal(name)
      Human.new(name)
    end

    def new_food
      Food.new('牛めし')
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

    def eat(food)
      puts "#{food.name} うまいにゃ"
    end
  end

  class Human < Animal
    def speak
      puts "#{@name}: おれは#{@name}や。なんで檻の中におんねん"
    end

    def eat(food)
      puts "#{food.name} うめぇぇえぇぇえ"
    end
  end

  class Food
    attr_reader :name
    def initialize(name)
      @name = name
    end
  end

  c = Park.new(4, CatFactory.new)
  c.simulate
  h = Park.new(3, HumanFactory.new)
  h.simulate
end
