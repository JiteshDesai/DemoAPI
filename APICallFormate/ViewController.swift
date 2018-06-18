//
//  ViewController.swift
//  APICallFormate
//
//  Created by JITESH on 14/06/18.
//  Copyright © 2018 JITESH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
/*    func apiCallForgotPassword(strEmail : String)
    {
        //let dictPharmacy = UserDefaults.standard.object(forKey: LOGGED_IN_PHARMACY_DETAIL) as! NSDictionary
//        if custObj.checkInternet() == false
//        {
//            return
//        }
//        custObj.showSVHud("")
//
//        let dictToSend: NSMutableDictionary = NSMutableDictionary()
//
//        dictToSend.setObject(strEmail, forKey: "email" as NSCopying)
//
//        let apiURL : URL = URL.init(string: String.init(format: "%@%@", API_MAIN_URL, API_FORGOT_PASSWORD))!
//        let request : NSMutableURLRequest = NSMutableURLRequest.init(url: apiURL, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 120)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Basic cmFodWxAM2FkZWFsLmluOkt5OTlGSzZhcjZoMTU3NURqdzU2NDc4ZTUzZHJUODNR", forHTTPHeaderField: "Authorization")
//
//        let strData : String = custObj.dict(toJson: dictToSend)
//        request.httpBody = strData.data(using: String.Encoding.utf8)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            
//            self.custObj.hideSVHud()
            if(error == nil)
            {
                if(data != nil)
                {
                    do {
                        let stringDic = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                        let dict : NSMutableDictionary = NSMutableDictionary.init(dictionary: stringDic! as NSDictionary)
                        print(dict)
                        
                        if(dict.object(forKey: "status") != nil)
                        {
                            if(dict.object(forKey: "status") as! Int == 400)
                            {
                                DispatchQueue.main.async {
//                                    self.custObj.alertMessage(dict.object(forKey: "message") as! String)
                                }
                            }
                        }
                        else
                        {
                            DispatchQueue.main.async {
//                                self.custObj.alertMessage(dict.object(forKey: "message") as! String)
                            }
                        }
                    }
                    catch let error
                    {
                        print(error)
                        DispatchQueue.main.async {
//                            self.custObj.alertMessage(error.localizedDescription)
                        }
                    }
                }
            }
            else
            {
                DispatchQueue.main.async {
//                    self.custObj.alertMessage(error?.localizedDescription)
                }
            }
        });
        
        task.resume()
    }*/
    
    //MARK:- API Call
/*    func callLoginAPI()
    {
        view.endEditing(true)
        custObj.showSVHud("Loading")
        let parameter: NSMutableDictionary = NSMutableDictionary()
        let loginURL : String = String.init(format: "%@?email=%@&password=%@", API_Login, self.txtUserName.text!, self.txtPassword.text!)
        print(parameter)
        API.callApiGET(strUrl: custObj.encodeURL(withUTF8: loginURL),parameter: parameter,success: { (response) in
            self.custObj.hideSVHud()
            print(response)
            let strLoginUserId: String = response as! String
            if (strLoginUserId != "0")
            {
                API.setIsLogin(type: true)
                UserDefaults.standard.setValue(strLoginUserId, forKey: "loginUserId")
                UserDefaults.standard.synchronize()
                API.setLoginUserId(uid: String.init(strLoginUserId))
                API.setLoginUserName(uName: self.txtUserName.text!)
                API.setLoginUserPassword(uPassword: self.txtPassword.text!)
                self.appDel.getTabbar()
                self.present(self.appDel.tabBar!, animated: false, completion: nil)
                self.custObj.alertMessage("Login successfully")
                
            }
            else
            {
                self.custObj.alertMessage("Email or Password may be wrong")
            }
        }, error: { (error) in
            print(error)
            self.custObj.hideSVHud()
            self.custObj.alertMessage(ERROR_MESSAGE)
        })
    }*/

}

extension Dictionary {
    
    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func printJson() {
        print(json)
    }
    
}
