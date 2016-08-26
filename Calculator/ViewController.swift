
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    var displayValue : Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit : String = sender.currentTitle!
        let currentDisplay = display.text!
        if(userIsTyping){
            display.text = currentDisplay + digit
        }else{
            display.text = digit
        }
        userIsTyping = true
    }
    
    @IBAction func performOperation(sender: UIButton) {
        if let symbol : String = sender.currentTitle!{
            switch symbol {
            case "π":
                displayValue = M_PI
            default:
                displayValue = 0
            }
        }
        
        userIsTyping = false
    }
}

 