def compute_expression(expr)
    exp_stack = []
    while expr.length > 0
        if expr =~ /^[\(\+\-]/
            sub_exp = expr.match(/^[\(\+\-]/).to_s
            exp_stack.push(sub_exp)
            expr = expr[1..-1]
        elsif expr =~ /^\d+/
            sub_exp = expr.match(/^\d+/).to_s
            exp_stack.push(sub_exp.to_i)
            expr = expr[sub_exp.length..-1]
        elsif expr =~ /^\)/
            expr = expr[sub_exp.length..-1]
            exp_stack = evaluate(exp_stack)
        end
    end

    puts evaluate(exp_stack)
end

def evaluate(exp_stack)
    eval_stack = []
    while exp_stack.length > 0
        eval = exp_stack.pop
        if eval =~ /\(/
            break
        else
            eval_stack.push(eval)
        end
    end
    while eval_stack.length > 1
        a = eval_stack.pop
        op = eval_stack.pop
        b = eval_stack.pop
        if op =~ /\+/
            eval_stack.push(a + b)
        elsif op =~ /\-/
            eval_stack.push(a - b)
        end
    end

    return exp_stack.push(eval_stack.pop)
end

compute_expression("(2+3)+((2+3-5)+3)")

