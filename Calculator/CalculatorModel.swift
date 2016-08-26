import Foundation

class Model{
    private var accumulator : Double = 0.0

    func setOperand(x : Double) {
        accumulator = x
    }
    
    func performOperation(symbol : String){
        switch symbol {
        case "π":
            accumulator = M_PI
        case "√":
            accumulator = sqrt(accumulator)
        default:
            accumulator = 0
        }
        
    }
    
    var result : Double {
        get{return accumulator}
    }
}
