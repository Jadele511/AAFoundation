# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        return nil if self.length == 0
        self.max - self.min
    end

    def average
        return nil if self.length == 0
        self.sum * 1.00 / self.length
    end

    def median
        len = self.length
        return nil if self.length == 0 
        self.sort!
        len.even? ?  self[len/2-1..len/2].average :  self[len/2]
    end


    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] += 1}
        hash
    end

    def my_count(val)
        self.counts[val]
    end

    def my_index(val)
        self.each_index {|i| return i if self[i] == val }
        nil
    end

    def my_uniq
        res = []
        self.each {|ele| res << ele if !res.include?(ele)}
        res
    end

    def my_transpose
        len = self.length
        res = Array.new(len) {Array.new(len)}
        self.each_index do |i|
            self.each_index do |j|
                res[i][j] = self[j][i] 
            end
        end
        res
    end
end
