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

exp_tree = nil

priority = ["^","*","+"]
prev_op = nil

while expr.length > 0
    parse = getNextParse(expr)[0]
    puts parse
    expr = getNextParse(expr)[1]

    prev_op = nil
    prev_num = nil
    case expr
    when /\^/
        sub_exp = Node.new(parse)
        if prev_num == nil
            puts "Error"
        elsif prev_op =~ /^[\+\-\^\*\/]/
            prev_op.right = sub_exp
            sub_exp.left = prev_num
        end
    when /[\*\/]/
        sub_exp = Node.new(parse)
        
    when /\+\-/
        sub_exp = Node.new(parse)
        
    when /\d+/
        sub_exp = Node.new(parse.to_i)
        
    end
end