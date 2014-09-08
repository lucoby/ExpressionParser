def getNextParse(expr)
    parse = expr.match(/^[\+\-\^\*\/\s]|^\d+/).to_s
    expr = expr[parse.length..-1]
    return [parse, expr]
end

expr = "12 2 +"
expr_stack = Array.new
while expr.length > 0
    parse = getNextParse(expr)
    sub_exp = parse[0]
    expr = parse[1]

    puts sub_expr
    case sub_expr
    when /\^/
        
    when /[\*]/

    when /[\/]/
        
    when /\+/

    when /[\-]/
        
    when /\d+/
    
    end
end

