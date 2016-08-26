import Foundation

class Model{
    private var accumulator : Double = 0.0
    
    func setOperand(x : Double) {
        accumulator = x
    }
    
    private enum Operation {
        case Constant(Double)
        case Unary(Double -> Double)
        case Binary((Double, Double) -> Double)
        case Equals
    }
    
    private var operations : Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.Unary(sqrt),
        "sq" : Operation.Unary({$0 * $0}),
        "cos" : Operation.Unary(cos),
        "sin" : Operation.Unary(sin),
        "tan" : Operation.Unary(tan),
        "±" : Operation.Unary({-$0}),
        "+" : Operation.Binary({$0 + $1}),
        "-" : Operation.Binary({$0 - $1}),
        "x" : Operation.Binary({$0 * $1}),
        "/" : Operation.Binary({$0 / $1}),
        "=" : Operation.Equals
    ]
    
    private struct PendingBinaryOperationInfo {
        var function : (Double, Double) -> Double
        var firstOprand : Double
    }
    
    private var pending2 : PendingBinaryOperationInfo?
    
    func performOperation(symbol : String){
        switch operations[symbol]! {
        case Operation.Constant(let v) : accumulator = v
        case Operation.Unary(let f) : accumulator = f(accumulator)
        case Operation.Binary(let f) : if pending2 == nil{
            pending2 = PendingBinaryOperationInfo(function: f, firstOprand: accumulator)
        }else{
            accumulator = pending2!.function(pending2!.firstOprand, accumulator)
            pending2!.firstOprand = accumulator
            }
        case Operation.Equals : if pending2 != nil {
            accumulator = pending2!.function(pending2!.firstOprand, accumulator)
            pending2 = nil
            }
        }
    }
    
    var result : Double {
        get{return accumulator}
    }
}
