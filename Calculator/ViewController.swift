
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    private var userIsTyping = false
    
    private var displayValue : Double {
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
    
    private var model = Model()
    
    @IBAction func performOperation(sender: UIButton) {
        if userIsTyping{
            model.setOperand(displayValue)
        }
        
        if let symbol : String = sender.currentTitle!{
            model.performOperation(symbol)
            displayValue = model.result
        }
        
        userIsTyping = false
    }
}

 