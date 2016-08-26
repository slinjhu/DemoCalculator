import Foundation

class Model{
    private var accumulator : Double = 0.0
    
    func setOperand(x : Double) {
        accumulator = x
    }
    
    enum Operation {
        case Constant(Double)
        case Unary
        case Binary
        case Equals
    }
    
    private var operations : Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E)
    ]
    
    func performOperation(symbol : String){
        switch operations[symbol]! {
        case Operation.Constant(let v) : accumulator = v
        case Operation.Unary : break
        case Operation.Binary : break
        case Operation.Equals : break
        }
        
    }
    
    var result : Double {
        get{return accumulator}
    }
}
