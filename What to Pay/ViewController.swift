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
        self.aSpending.delegate = self
    }

    @IBAction func calculateTotal(_ sender: Any) {
        let aPayment = Double(aSpending.text!)!
        let bPayment = Double(bSpending.text!)!
        let cPayment = Double(cSpending.text!)!
        let dPayment = Double(dSpending.text!)!
        let totalPayment = Double(totalSpending.text!)!
        let totalBeforeTax = aPayment + bPayment + cPayment + dPayment
        let aPercent = Double(aSpending.text!)! / totalBeforeTax
        let bPercent = Double(bSpending.text!)! / totalBeforeTax
        let cPercent = Double(cSpending.text!)! / totalBeforeTax
        let dPercent = Double(dSpending.text!)! / totalBeforeTax
        
        let aPayAmount = totalPayment * aPercent
        let bPayAmount = totalPayment * bPercent
        let cPayAmount = totalPayment * cPercent
        let dPayAmount = totalPayment * dPercent
        let aPayAmountDisplay = Double(round(100*aPayAmount)/100)
        let bPayAmountDisplay = Double(round(100*bPayAmount)/100)
        let cPayAmountDisplay = Double(round(100*cPayAmount)/100)
        let dPayAmountDisplay = Double(round(100*dPayAmount)/100)
        
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

