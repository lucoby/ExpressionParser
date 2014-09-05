def compute_expression(expr)
    exp_stack = []
    while expr.length > 0
        if expr =~ /^[\(\+\-]|^\d+/
            sub_exp = expr.match(/^[\(\+\-]|^\d+/)
            exp_stack.push(sub_exp)
            expr = expr[sub_exp.length..-1]
        else
        end
    end


end
str = "1234"
puts "123".match(/^[\(\+\-]|^\d+/)
puts str[1..-1]
