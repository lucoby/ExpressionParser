def getNextParse(expr)
    parse = expr.match(/^[\+\-\^\*\/\(\)]|^\d+/).to_s
    expr = expr[parse.length..-1]
    return [parse, expr]
end

expr = "(12+3^2)*2-2*4"
while expr.length > 0
    puts getNextParse(expr)[0]
    expr = getNextParse(expr)[1]
end