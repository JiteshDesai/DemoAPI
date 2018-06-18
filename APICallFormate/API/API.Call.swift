
//
//  API
//
//  Created by JITESH on 01/06/18.
//  Copyright © 2018 JITESH. All rights reserved.
//
import Foundation

extension API
{
    public static func callApiPOST(strUrl: String, parameter: NSDictionary, success: ((NSDictionary) -> Void)?, error: ((NSError) -> Void)?)
    {
        let custObj: customClassViewController = customClassViewController()
        
        manager?.post(strUrl, parameters: parameter,
                      success: { (op, response) -> Void in
                        
                        let dict: NSDictionary!
                        dict = response as! NSDictionary
                        if dict.object(forKey: "ReturnMsg") as! String == "Invalid User Token"
                        {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "logout"), object: nil)
                        }
                        success? (dict)
                        
        },failure: { (op, fault) -> Void in
            print(fault ?? 0)
            custObj.hideSVHud()
            if custObj.checkInternet() == false
            {
                
            }
            else
            {
                custObj.alertMessage(ERROR_MESSAGE)
            }
        })
    }
    public static func callApiGET(strUrl: String, parameter: NSDictionary, success: ((NSDictionary) -> Void)?, error: ((NSError) -> Void)?)
    {
        let custObj: customClassViewController = customClassViewController()
        
        manager?.get(strUrl, parameters: parameter,
                      success: { (op, response) -> Void in
                        
                        let dict: NSDictionary!
                        dict = response as! NSDictionary
                        success? (dict)
        },failure: { (op, fault) -> Void in
            print(fault ?? 0)
            custObj.hideSVHud()
            if custObj.checkInternet() == false
            {
                
            }
            else
            {
                custObj.alertMessage(ERROR_MESSAGE)
            }
        })
    }
    public static func callApiWithArray(strUrl: String, parameter: NSMutableArray, success: ((NSDictionary) -> Void)?, error: ((NSError) -> Void)?)
    {
        let custObj: customClassViewController = customClassViewController()
        
        manager?.post(strUrl, parameters: parameter,
                      success: { (op, response) -> Void in
                        
                        let dict: NSDictionary!
                        dict = response as! NSDictionary
                        success? (dict)
        },failure: { (op, fault) -> Void in
            print(fault ?? 0)
            custObj.hideSVHud()
            if custObj.checkInternet() == false
            {
                
            }
            else
            {
                custObj.alertMessage(ERROR_MESSAGE)
            }
        })
    }
    public static func callApiPostWithImage(strUrl: String, parameter: NSDictionary, imageData : NSData, parameterName : String, fileName : String, mimeType : String, success: ((NSDictionary) -> Void)?, error: ((NSError) -> Void)?)
    {
        let custObj: customClassViewController = customClassViewController()
        if custObj.checkInternet() == false
        {
            
        }
        
        manager?.post(strUrl, parameters: parameter, constructingBodyWith: {(formData: AFMultipartFormData?) -> Void in
            
            formData?.appendPart(withFileData: imageData as Data!, name: parameterName, fileName: fileName, mimeType: mimeType)
            
        }, success: { (op, response) -> Void in
            
            let dict: NSDictionary!
            dict = response as! NSDictionary
            success? (dict)
        },failure: { (op, fault) -> Void in
            print(fault ?? 0)
            SVProgressHUD.dismiss()
        })
        
    }

}
