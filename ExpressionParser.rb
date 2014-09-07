class Node
    attr_reader :word :left :right
    def initialize(word)
        @word = word
    end
end


def getNextParse(expr)
    parse = expr.match(/^[\+\-\^\*\/\(\)]|^\d+/).to_s
    expr = expr[parse.length..-1]
    return [parse, expr]
end

expr = "12+3^2*2-2*4"

priority = ["^","*","+"]

while expr.length > 0
    parse = getNextParse(expr)[0]
    puts parse
    expr = getNextParse(expr)[1]

    case expr
    when /\^/
        Node.new(parse)
        
    when /[\*\/]/
        Node.new(parse)
        
    when /\+\-/
        Node.new(parse)
        
    when /\d+/
        Node.new(parse.to_i)
    end
end