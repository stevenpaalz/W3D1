class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            ele = self[i]
            prc.call(ele)

            i += 1
        end 
        self
    end
end

return_value = [1, 2, 3].my_each do |num|
    puts num
   end.my_each do |num|
    puts num
   end

p return_value