

import UIKit

class PickerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate
{
    //MARK:- Outlets
    
    @IBOutlet weak var tblPicker: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var viewNavBar: UIView!
    
    var strNavTitle: String = ""
    let custObj: customClassViewController = customClassViewController()
    var arrOfTBLData : NSMutableArray = NSMutableArray()
    var arrOfTBLDataAll : NSMutableArray = NSMutableArray()

    var objCart: CartViewController!

    var isEmptyArray : Bool = false
    var selectCaryItem : Int = 0
    
    //MARK:- View
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        searchBar.showsCancelButton = false

        searchBar.delegate = self

        tblPicker.delegate = self
        tblPicker.dataSource = self
        tblPicker.register(UINib(nibName: "SingleItemPicker", bundle: nil), forCellReuseIdentifier: "SingleItemPicker")
        tblPicker.backgroundColor = UIColor.white
        tblPicker.tableFooterView = UIView.init(frame: .zero)
        //tblPicker.alwaysBounceVertical = false
        
        tblPicker.rowHeight = UITableViewAutomaticDimension
        tblPicker.estimatedRowHeight = 44
        tblPicker.layoutSubviews()
        
        tblPicker.layer.cornerRadius = 5
        tblPicker.clipsToBounds = true

        if(objCart != nil)
        {
            

        }
        if arrOfTBLData.count == 0
        {
            isEmptyArray = true
            arrOfTBLData.add("No Data found")
        }
        
        arrOfTBLDataAll = NSMutableArray.init(array: arrOfTBLData)
        
        searchBar.isHidden = false
        searchBar.layer.cornerRadius = 1.0
        searchBar.clipsToBounds = true

        if(tblPicker.frame.size.height > CGFloat(arrOfTBLData.count * 44))
        {
            tblPicker.frame = CGRect.init(x: tblPicker.frame.origin.x, y: tblPicker.frame.origin.y, width: tblPicker.frame.size.width, height: CGFloat(arrOfTBLData.count * 44))
            searchBar.isHidden = true
            
            tblPicker.center = self.view.center
        }

       // tblPicker.bounces = false
        
        self.tblPicker.reloadData()
        
        if strNavTitle == ""
        {
            lblTitle.text = "Select Option"
        }
        else
        {
            lblTitle.text =  strNavTitle
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Action Zones
    @IBAction func btnCloseAction(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnBack(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- TableView Delegate
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrOfTBLData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleItemPicker", for: indexPath as IndexPath) as! SingleItemPicker
        cell.backgroundColor = UIColor.white

        if(objCart != nil)
        {
            cell.lblPickerText.text = ((arrOfTBLData.object(at: indexPath.row) as! NSDictionary).object(forKey: "Name") as! String)
        }
        else
        {
            cell.lblPickerText.text = (arrOfTBLData.object(at: indexPath.row) as! String)
        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(isEmptyArray == false)
        {
            let dict: NSDictionary = arrOfTBLData.object(at: indexPath.row) as! NSDictionary
            if(objCart != nil)
            {
                let dic: NSMutableDictionary = NSMutableDictionary.init(dictionary: objCart.arrOfProducts.object(at: selectCaryItem) as! NSDictionary)
                dic.setObject(dict.object(forKey: "Name") as! String, forKey: "new_lot_size" as NSCopying)
                objCart.arrOfProducts.replaceObject(at: selectCaryItem, with: dic)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notiQuantityReload"), object: nil)
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }

    
    //MARK:- Searchbar delegate
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
    {
        searchBar.showsCancelButton = true
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.searchBar.becomeFirstResponder()
        }, completion: { (finished) -> Void in
            // ....
            self.view.endEditing(true)
            searchBar.showsCancelButton = false
        })
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.text = ""
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.searchBar.becomeFirstResponder()
        }, completion: { (finished) -> Void in
            // ....
            
        })
        self.view.endEditing(true)
        searchBar.showsCancelButton = false
        arrOfTBLData = NSMutableArray.init(array: arrOfTBLDataAll)
        tblPicker.reloadData()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        arrOfTBLData = NSMutableArray()
        
        if(searchText == "")
        {
            arrOfTBLData = NSMutableArray.init(array: arrOfTBLDataAll)
        }
        else
        {
            for item in arrOfTBLDataAll
            {
                let dict : NSDictionary = item as! NSDictionary
                
                var keyToUse : String = ""
                
                if(objCart != nil)
                {
                    keyToUse = "Name"
                }
                
                let strToBeSearch:NSString! = (dict.object(forKey: keyToUse) as! String) as NSString
                
                if(((strToBeSearch.uppercased).contains(searchText.uppercased())))
                {
                    arrOfTBLData.add(dict)
                }
            }
        }
        
        tblPicker.reloadData()
    }
}

