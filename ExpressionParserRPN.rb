def getNextParse(expr)
    parse = expr.match(/^[\+\-\^\*\/\s\,\&\|\!\%\~]|^\d+\.?\d*|^\.\d+|[\*\<\>]{2}/).to_s
    expr = expr[parse.length..-1]
    return [parse, expr]
end

expr = "12 ~"
expr_stack = Array.new

while expr.length > 0
    parse = getNextParse(expr)
    sub_expr = parse[0]
    expr = parse[1]

    # puts sub_expr
    case sub_expr
    when /\-?\d+\.?\d*/
        expr_stack.push(sub_expr.to_f)
    when /\>{2}/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a.to_i >> b.to_i)
        else
            puts "ERROR"
        end
     when /\~/
        a = expr_stack.pop
        if !(a.nil?)
            expr_stack.push(~a)
        else
            puts "ERROR"
        end
    when /\<{2}/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a.to_i << b.to_i)
        else
            puts "ERROR"
        end
    when /\^/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a.to_i ^ b.to_i)
        else
            puts "ERROR"
        end
    when /\&/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a.to_i & b.to_i)
        else
            puts "ERROR"
        end
    when /\|/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a.to_i | b.to_i)
        else
            puts "ERROR"
        end
    when /\%/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a % b)
        else
            puts "ERROR"
        end
    when /\*{2}/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a ** b)
        else
            puts "ERROR"
        end
    when /[\*]/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a * b)
        else
            puts "ERROR"
        end
    when /[\/]/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a / b)
        else
            puts "ERROR"
        end
    when /\+/
        b = expr_stack.pop
        a = expr_stack.pop
        if !(a.nil? || b.nil?)
            expr_stack.push(a + b)
        else
            puts "ERROR"
        end
    when /[\-]/
        neg_test = getNextParse(expr)
        if neg_test[0] =~/\d+\.?\d*|\.\d+/
            expr = neg_test[1]
            expr_stack.push(-(neg_test[0].to_f))
        else
            b = expr_stack.pop
            a = expr_stack.pop
            if !(a.nil? || b.nil?)
                expr_stack.push(a - b)
            elsif a.nil? && !b.nil?
                expr_stack.push(-b)
            else
                puts "ERROR"
            end
        end
    end
end
if expr_stack.length > 2
    puts "ERROR: not enough ops"
else
    puts expr_stack.pop
end

