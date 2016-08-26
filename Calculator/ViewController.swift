
import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(sender: UIButton) {
        let digit : Double = Double(sender.currentTitle!)!
        display.text = String(digit)
    }

}

