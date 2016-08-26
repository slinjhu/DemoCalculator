
import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var display: UILabel!
    
    var displayValue : Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit = Double(sender.currentTitle!)!

        displayValue = digit
    }

}

