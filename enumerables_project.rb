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

    def my_reject(&prc)
        i = 0
        new_arr = []

        while i < self.length
            ele = self[i]
            new_arr << ele if !prc.call(ele)

            i += 1
        end
        new_arr

    end

    def my_all?(&prc)
        i = 0

        while i < self.length
            ele = self[i]
            return false if !prc.call(ele)
            
            i += 1
        end

        true
    end

    def my_any?(&prc)
        i = 0

        while i < self.length
            ele = self[i]
            return true if prc.call(ele)
            
            i += 1
        end

        false
    end

    def my_flatten
        return [self] if !self.is_a?(Array)
        results = []
        self.each do |ele|
            if ele.is_a?(Array)
                results += ele.my_flatten
            else
                results += [ele]
            end
        end
        results
    end

    def my_zip(*args)
        new_arr = Array.new(self.length) {Array.new(args.length + 1)}
        self.each_with_index do |ele, idx|
            args.each_with_index do |arg, arg_i|
                arg.each_with_index do |sub_ele, sub_idx|
                    if idx == sub_idx
                        new_arr[idx] << ele
                        new_arr[idx] << sub_ele

                end


                

            end
        end
    end

end

# [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]



# a = [1, 2, 3]
# a.my_any? { |num| num > 1 } # => true
# a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]



# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end

# p return_value

