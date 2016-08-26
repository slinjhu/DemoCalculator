import Foundation

class Model{
    private var accumulator : Double = 0.0
    
    func setOperand(x : Double) {
        accumulator = x
    }
    
    enum Operation {
        case Constant(Double)
        case Unary(Double -> Double)
        case Binary
        case Equals
    }
    
    private var operations : Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.Unary(sqrt),
        "cos" : Operation.Unary(cos),
        "sin" : Operation.Unary(sin)
    ]
    
    func performOperation(symbol : String){
        switch operations[symbol]! {
        case Operation.Constant(let v) : accumulator = v
        case Operation.Unary(let f) : accumulator = f(accumulator)
        case Operation.Binary : break
        case Operation.Equals : break
        }
        
    }
    
    var result : Double {
        get{return accumulator}
    }
}
