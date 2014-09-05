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



puts ("1234".match(/^\d+/)).to_s.to_i

compute_expression("(2+3)+((2+3-5)+3)")


# expr = "(2+3)"
# exp_stack = []
# while expr.length > 0
#     if expr =~ /^[\(\+\-]/
#         sub_exp = expr.match(/^[\(\+\-]/).to_s
#         exp_stack.push(sub_exp)
#         print "#{sub_exp}: "
#         puts exp_stack
#         expr = expr[1..-1]
#     elsif expr =~ /^\d+/
#         sub_exp = expr.match(/^\d+/).to_s
#         exp_stack.push(sub_exp.to_i)
#         print "#{sub_exp}: "
#         puts exp_stack
#         puts exp_stack.length
#         expr = expr[sub_exp.length..-1]
#     elsif expr =~ /^\)/
#         puts exp_stack
#         expr = expr[sub_exp.length..-1]
#         eval_stack = []
#         eval = exp_stack.pop
#         puts eval
#         puts exp_stack.length
#         while exp_stack.length > 0 && !(eval =~ /\(/)
#             eval_stack.push(eval)
#             eval = exp_stack.pop
#         end
#         while eval_stack.length > 1
#             a = eval_stack.pop
#             op = eval_stack.pop
#             b = eval_stack.pop
#             if op =~ /\+/
#                 eval_stack.push(a + b)
#             elsif op =~ /\-/
#                 eval_stack.push(a + b)
#             end
#         end
#         exp_stack.push(eval_stack.pop)
#         puts exp_stack
#     end
# end

# while exp_stack.length > 1
#         eval_stack = []
#         eval = exp_stack.pop
#         while exp_stack.length > 0 && !(eval =~ /\(/)
#             eval_stack.push(eval)
#             eval = exp_stack.push
#         end
#         exp_stack.pop
#         while eval_stack.length > 1
#             a = eval_stack.pop
#             op = eval_stack.pop
#             b = eval_stack.pop
#             if op =~ /\+/
#                 eval_stack.push(a + b)
#             elsif op =~ /\-/
#                 eval_stack.push(a + b)
#             end
#         end
#         exp_stack.push(eval_stack.pop)
#     end
#     puts exp_stack.pop