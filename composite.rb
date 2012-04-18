class Mafia
  attr_reader :name
  def initialize(name)
    @name = name
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def power
    @members.inject(0) {|sum, member| sum += member.power }
  end
end

class Member
  attr_reader :name, :power
  def initialize(name, power)
    @name = name
    @power = power
  end
end

matatabi = Mafia.new('Matatabi')
mike = Member.new('mike', 530000)
hone = Mafia.new('Hone')
pochi = Member.new('pochi', 240000)
buchi = Member.new('buchi', 10000)

matatabi.add_member(mike)
matatabi.add_member(hone)
hone.add_member(pochi)
hone.add_member(buchi)

katsuo = Mafia.new('Katsuo Family')
tama = Member.new('tama', 470000)
shamisen = Mafia.new('Shamisen')
shami = Member.new('shami', 300000)
nyago = Member.new('nyago', 350000)

katsuo.add_member(tama)
katsuo.add_member(shamisen)
shamisen.add_member(shami)
shamisen.add_member(nyago)

puts matatabi.power
puts katsuo.power

neko = Mafia.new('Neko')
neko.add_member(matatabi)
neko.add_member(katsuo)

puts neko.power
