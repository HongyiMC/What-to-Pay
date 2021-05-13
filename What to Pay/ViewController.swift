import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var aSpending: UITextField!
    @IBOutlet weak var bSpending: UITextField!
    @IBOutlet weak var cSpending: UITextField!
    @IBOutlet weak var dSpending: UITextField!
    
    @IBOutlet weak var aTotalLabel: UILabel!
    @IBOutlet weak var bTotalLabel: UILabel!
    @IBOutlet weak var cTotalLabel: UILabel!
    @IBOutlet weak var dTotalLabel: UILabel!
    
    @IBOutlet weak var totalSpending: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aTotalLabel.text = ""
        bTotalLabel.text = ""
        cTotalLabel.text = ""
        dTotalLabel.text = ""
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTotal(_ sender: Any) {
        let aPayment = (aSpending.text! as NSString).doubleValue
        let bPayment = (bSpending.text! as NSString).doubleValue
        let cPayment = (cSpending.text! as NSString).doubleValue
        let dPayment = (dSpending.text! as NSString).doubleValue
        let totalPayment = (totalSpending.text! as NSString).doubleValue
        let totalBeforeTax = aPayment + bPayment + cPayment + dPayment
        let aPercent = aPayment / totalBeforeTax
        let bPercent = bPayment / totalBeforeTax
        let cPercent = cPayment / totalBeforeTax
        let dPercent = dPayment / totalBeforeTax
        
        let aPayAmount = totalPayment * aPercent
        let bPayAmount = totalPayment * bPercent
        let cPayAmount = totalPayment * cPercent
        let dPayAmount = totalPayment * dPercent
        let aPayAmountDisplay = round(100*aPayAmount)/100
        let bPayAmountDisplay = round(100*bPayAmount)/100
        let cPayAmountDisplay = round(100*cPayAmount)/100
        let dPayAmountDisplay = round(100*dPayAmount)/100
        
        aTotalLabel.text = "$\(aPayAmountDisplay)"
        bTotalLabel.text = "$\(bPayAmountDisplay)"
        cTotalLabel.text = "$\(cPayAmountDisplay)"
        dTotalLabel.text = "$\(dPayAmountDisplay)"
        self.view.endEditing(true)
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

