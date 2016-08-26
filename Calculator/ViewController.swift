
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
        displayValue = M_PI
        userIsTyping = false
    }
}

