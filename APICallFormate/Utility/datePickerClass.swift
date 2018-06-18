

import UIKit

class datePickerClass: UIViewController
{
    //MARK:- Outlet
    @IBOutlet weak var btnDatePickerDone: UIButton!
    @IBOutlet weak var btnDatePickerCancel: UIButton!
    @IBOutlet weak var lblDatePikerHeader: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var fromWhere: String = ""
    
    var custObj : customClassViewController = customClassViewController()
    //MARK:- View Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if fromWhere == "receiptAdd" || fromWhere == "addNewBiz"
        {
            //datePicker.minimumDate = Date()
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
    //MARK:- Action Zone
    @IBAction func btnDatePickerDone(_ sender: Any)
    {
        let df: DateFormatter = DateFormatter()
        df.dateFormat = "dd/MM/yyyy"
        if fromWhere == "filter"
        {
            
        }
        else if fromWhere == "receiptAdd"
        {
        }
        else if fromWhere == "addNewBiz"
        {
            
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnDatePickerCancel(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnDismiss(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
