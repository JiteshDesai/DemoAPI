
import UIKit

class pickerClass: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource
{

    //MARK:- Outlet
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var pickerHeader: UILabel!
    @IBOutlet weak var pickerCancel: UIButton!
    @IBOutlet weak var pickerDone: UIButton!
    
    var dictUser: NSMutableDictionary = NSMutableDictionary()
    var fromWhere: String = ""
    var arrOfPicker: NSMutableArray = NSMutableArray()
    var custObj : customClassViewController = customClassViewController()
    //MARK:- View Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        dictUser = API.getLoggedUserData()
        if fromWhere == "receiptAdd"
        {
            arrOfPicker = NSMutableArray.init(array: dictUser.object(forKey: "CurrencyMaster") as! NSArray)
        }
        else if fromWhere == "addNewBiz"
        {
            arrOfPicker = NSMutableArray.init(array: dictUser.object(forKey: "CurrencyMaster") as! NSArray)
        }
        picker.reloadAllComponents()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Action Zone
    @IBAction func btnDismis(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnPickerDone(_ sender: Any)
    {
        if arrOfPicker.count == 0
        {
            custObj.alertMessage("There is no records found")
            return
        }
        self.dismiss(animated: true, completion: nil)
        let str: String = (arrOfPicker.object(at: picker.selectedRow(inComponent: 0)) as AnyObject).object(forKey: "CurrencyName") as! String
        let strSymbol: String = (arrOfPicker.object(at: picker.selectedRow(inComponent: 0)) as AnyObject).object(forKey: "CurrencySymbol") as! String
        let strID: String = String(format: "%d", (arrOfPicker.object(at: picker.selectedRow(inComponent: 0)) as AnyObject).object(forKey: "CurrencyID") as! Int)
        
        if fromWhere == "receiptAdd"
        {
            
        }
        else if fromWhere == "addNewBiz"
        {
            
        }
    }
    @IBAction func btnPcikerCancel(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK:- Uipickerview Delegate
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return arrOfPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        let str: String = (arrOfPicker.object(at: row) as AnyObject).object(forKey: "CurrencyName") as! String
        return str
    }
}
