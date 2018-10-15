class Stack

    def initialize
        @array = []
    end


    def push(item)
        @array << item
    end

    def pop()
        return @array.pop()
    end

end
