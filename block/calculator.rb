
Addition = lambda{ |a,b| return a+b }
Subtraction  = lambda{ |a,b| return a-b }
Multiplication = lambda{ |a,b| return a*b }
Division = lambda{ |a,b| return a/b }



puts Addition.call(12,13)
puts Addition.object_id
puts Addition.class
puts Addition.class.superclass

