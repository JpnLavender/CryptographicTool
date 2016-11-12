 class Application
   def main
     gc = get_code
     if gc[0] == "decode"
       puts gc[2].deciphering(gc[1].to_s.to_i, code)
     elsif gc[0] == "encode"
       puts gc[2].deciphering(gc[1].to_s.to_i, code.invert)
     else
       puts "Optinon at Encode or Decode Only"
       puts "input format is [encode or decode] [Number of turns] [String]"
     end
   end

   def get_code : Array
     gets.to_s.chomp.split(" ")
   end

   def code : Hash
     return {
       "a" => "l", "b" => "v",
       "c" => "x", "d" => "s",
       "e" => "w", "f" => "d",
       "g" => "f", "h" => "g",
       "i" => "u", "j" => "h",
       "k" => "j", "l" => "k",
       "m" => "n", "n" => "b",
       "o" => "i", "p" => "o",
       "q" => "p", "r" => "e",
       "s" => "a", "t" => "r",
       "u" => "y", "v" => "c",
       "w" => "q", "x" => "z",
       "y" => "t", "z" => "m" }
   end
 end

 class String
   def deciphering(num : Int32, code : Hash)
     ary = Array(String).new
     self.split("").each do |v|
       ary << code[v]
     end
     if num == 1
       return ary.join("")
     else
       ary.join("").deciphering(num - 1, code)
     end
   end
 end

 Application.new.main
