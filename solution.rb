puts "Enter hours and minutes "
$hours = gets
$minutes = gets
$day =$hours.to_i * 60 + $minutes.to_i;
puts $day
puts "current time is : #{$day.to_i / 60 % 24}:#{$day.to_i % 60}" 

puts "1.ADD MINUTES  \n2.SUBTRACT MINUTES \n3.check equal time \n4.Exit "

def add(min)

    $day = $day.to_i + min.to_i
    puts "#{$day.to_i / 60 % 24}:#{$day.to_i % 60}" 
end


def minus(min)
    $day = $day.to_i - min.to_i
    puts "#{$day.to_i / 60 % 24}:#{$day.to_i % 60}"
end

def check_equal(mn)

if($day.to_i == mn.to_i )

    puts"clocks are equal"
else

    puts"clocks are not equal"
end
end
while(true)
str = gets.to_i
  
# using case statement 
case str  
  
# using when 
when 1 
    puts"enter minutes : "
  a=gets.to_i
  add(a)
when 2
    puts"enter minutes : "
    b=gets.to_i
  minus(b)
  
when 3  
    puts"enter clock time to compare : "
  hrr=gets.to_i
  mnn=gets.to_i
  mnn=hrr.to_i * 60 + mnn.to_i;
   check_equal(mnn) 


when 4  
    break;
else  
  puts "wrong option"
  
end  
end