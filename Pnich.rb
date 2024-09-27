#Practice1
puts "Hello, World!"

name = "Nichaphat Jandang"

def greet
  puts "Good morning!"
  yield
end

greet{puts name}

#Practice2
array = [2,3,4,5,6]

puts "Second element is #{array[1]}"

array.push(7)

puts "Length of this #{array.length}"

hash = {title:"colony of ants",author:nil,pages:60}

hash[:author] = "antlion"

hash[:published_year] = 2003

hash.delete(:pages)

puts hash

#Practice3
number = 21
if number > 0
  puts "This number #{number} is positive"
elsif number == 0
  puts "This number #{number} is zero"
elsif number < 0
  puts "This number #{number} is negative"
else puts "Unknow values"
end

if number%2 == 1
  puts "#{number} is odd number"
else
  puts "#{number} is even number"
end

count = 0
while count != 10
  puts count +=1
end

number = 0
count = 0
while count !=5
  count +=1
  puts number
  number += 2

end

#Practice4
def block
  puts "Hello, world!"
end
block

def numb
  (1..5).each do |number|
    yield number
  end
end
numb{|number| puts number}

def multiply
  yield 6,9
end
multiply{|a,b| puts "Answers of #{a} * #{b} is #{a*b}"}

def greet
  if block_given?
    yield
  else
    puts "No block given"
  end
end

greet
greet { puts "Hello, World!" }

#Practice5
class User
  attr_accessor :name, :email, :password

  def initialize(name, email, password)
    @name = name
    @email = email
    @password = password
  end

  def enter_room(room)
    room.enter_room(self)
  end

  def send_message(room, content)
    message = Message.new(self, room, content)
    room.broadcast(message)
  end
    
  def acknowledge_message(room, message)
    puts "#{@name} acknowledged the message: '#{message.content}' in room #{room.name}"
  end
end

class Room
  attr_accessor :name, :description, :users

  def initialize(name, description)
    @name = name
    @description = description
    @users = []
  end

  def enter_room(user)
    @users << user unless @users.include?(user)
    puts "#{user.name} has entered the room '#{self.name}'"
  end

  def broadcast(message)
    puts "Room #{self.name}: #{message.user.name} says: '#{message.content}'"
    @users.each do |user|
      next if user == message.user #คนส่ง
      user.acknowledge_message(self, message)
    end
  end
end

class Message
  attr_accessor :user, :room, :content

  def initialize(user, room, content)
    @user = user
    @room = room
    @content = content
  end
end

user1 = User.new("นิชาพั้ด", "นิชาพั้ด@บียู.com", "พาดเวิด1")
user2 = User.new("พิชานั้ด", "พิชานั้ด@บูยี.com", "เพิ้ดหว่าด2")

room1 = Room.new("ทั่วปาย", "ห้องพูดคุย")

user1.enter_room(room1)
user2.enter_room(room1)

user1.send_message(room1, "หวัดดี!")
user2.send_message(room1, "ว่างายย!")
