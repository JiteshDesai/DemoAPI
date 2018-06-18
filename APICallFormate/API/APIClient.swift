//
//  ApiClient.swift
//
//  Created by JITESH on 01/06/18.
//  Copyright © 2018 JITESH. All rights reserved.
//

import UIKit
import AFNetworking
import SVProgressHUD
import SCLAlertView

class APIClient: NSObject,NSURLConnectionDataDelegate {
    

    class var sharedInstance : APIClient {
        
        struct Static {
            static let instance : APIClient = APIClient()
        }
        return Static.instance
    }
    
  
    let manager : AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
    let sessionManager : AFHTTPSessionManager = AFHTTPSessionManager()
    let JSONResponse : AFJSONResponseSerializer = AFJSONResponseSerializer()
    var responseData : NSMutableData!
    
    func MakeAPICallWithEndURl(_ url: NSString!, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, NSError?)->()) ->() {
        
        print(url)
        print(parameters)
        
        manager.responseSerializer = JSONResponse
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let isNetworkAvailables = APIClient.isNetworkAvailable() 
        
        if isNetworkAvailables {
            manager.post(url as String, parameters: parameters, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                
            }, success: { (operation: AFHTTPRequestOperation!, responseData: Any!) -> Void in
                var responseDict : NSDictionary!
                
                if((responseData as AnyObject).count > 0){
                    responseDict = responseData as! NSDictionary
                }
                completionHandler(responseDict,nil)
            }, failure: { (operation,error : Error) -> Void in
                completionHandler(nil, error as NSError?)
            })
        }
        else {
             SCLAlertView().showError("Network Error..", subTitle:"Please chack network connection", closeButtonTitle:"OK")
        }
        
    }
    func postImToServer(_ url: NSString, image: NSMutableArray, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, NSError?)->())->(){
        
        print("Requesting \( url)")
        print("Parameters: \(parameters!)")
        
//        let imageData  = UIImagePNGRepresentation(image)
        
        if (image.count > 0)
        {
            manager.post(url as String, parameters: parameters!, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                for i in 0..<image.count {
                    if(((image[i] as! NSDictionary).allKeys[0] as! String) == "image"){
                        formData.appendPart(withFileData: (image[i] as! NSDictionary).allValues[0] as! Data, name: "filedata_\(i)", fileName: "photo\(i).jpg", mimeType: "image/jpeg")
                    }
                    else {
                        formData.appendPart(withFileData: (image[i] as! NSDictionary).allValues[0] as! Data, name: "filedata_\(i)", fileName: "video\(i).mp4", mimeType: "video/mp4")
                    }
                }
            }, success: { (operation :AFHTTPRequestOperation, responseData : Any!) -> Void in
                var responseDict : NSDictionary!
                if((responseData as AnyObject).count > 0) {
                    
                    responseDict = responseData as! NSDictionary
                    print(responseDict)
                    completionHandler(responseDict,nil)
                    
                }
            },
               failure: { (operation, error : Error) -> Void in
                completionHandler(nil, error as NSError?)
            })
        }
    }
    
    func postImageToServer(_ url: NSString, image: UIImage!, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, NSError?)->())->(){
        
        print("Requesting \( url)")
        print("Parameters: \(parameters!)")
        
        let imageData  = UIImagePNGRepresentation(image)

        
        if (imageData != nil)
        {
            manager.post(url as String, parameters: parameters!, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                formData.appendPart(withFileData: imageData!, name: "filedata", fileName: "photo.jpg", mimeType: "image/jpeg")
                }, success: { (operation :AFHTTPRequestOperation, responseData : Any!) -> Void in
                    var responseDict : NSDictionary!
                    if((responseData as AnyObject).count > 0) {
                        
                        responseDict = responseData as! NSDictionary
                        print(responseDict)
                        completionHandler(responseDict,nil)
                        
                    }
                },
                   failure: { (operation, error : Error) -> Void in
                    completionHandler(nil, error as NSError?)
            })
        }
    }
   

    
    func postVideoToServer(_ url: NSString, video: Data!, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, NSError?)->())->(){
        
        print("Requesting \( url)")
        print("Parameters: \(parameters!)")
        
        
        if (video != nil)
        {
            manager.post(url as String, parameters: parameters!, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
                formData.appendPart(withFileData: video! as Data, name: "filedata", fileName: "video.mp4", mimeType: "video/mp4")
            }, success: { (operation :AFHTTPRequestOperation, responseData : Any!) -> Void in
                var responseDict : NSDictionary!
                if((responseData as AnyObject).count > 0) {
                    
                    responseDict = responseData as! NSDictionary
                    print(responseDict)
                    completionHandler(responseDict,nil)
                    
                }
            },
               failure: { (operation, error : Error) -> Void in
                completionHandler(nil, error as NSError?)
            })
        }
    }
    
    
    func makeGetAPICallWithGeoLocation(url: NSString!, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, NSError?)->()) ->() {
        
        let URL = url
        print("Requesting \( URL!)")
       
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.manager.get(URL as! String, parameters: parameters, success: { (task, responseObject) -> Void in
            completionHandler(responseObject as? NSDictionary,nil)
        }) { (task, error) -> Void in
            completionHandler(nil,error as NSError?)
        }
    }
    
    
    func postImageToServerFile(_ url: NSString, file: Data, extantionType: String, fileName: String, parameters: NSDictionary!, completionHandler:@escaping (NSDictionary?, NSError?)->())->(){
        
        print("Requesting \( url)")
        print("Parameters: \(parameters!)")
        
        manager.post(url as String, parameters: parameters!, constructingBodyWith: { (formData: AFMultipartFormData!) -> Void in
            formData.appendPart(withFileData: file, name: "artwork", fileName: fileName, mimeType: extantionType)
        }, success: { (operation :AFHTTPRequestOperation, responseData : Any!) -> Void in
            var responseDict : NSDictionary!
            if((responseData as AnyObject).count > 0) {
                
                responseDict = responseData as! NSDictionary
                print(responseDict)
                completionHandler(responseDict,nil)
                
            }
        },
           failure: { (operation, error : Error) -> Void in
            completionHandler(nil, error as NSError?)
        })
        
    }
    
    
    class func isNetworkAvailable() -> Bool
    {
        do {
            let reachability = Reachability.init()
            let networkStatus: Int = reachability!.currentReachabilityStatus.hashValue
            return networkStatus != 0
            
        }catch ReachabilityError.FailedToCreateWithAddress(let address) {
            print("can not open \(address)")
            return false
        } catch {}
        return false
    }
    
    
    //MARK: - ProgressView
    
    class func showProgress() {
        
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
        SVProgressHUD.show()
    }
    
    class func dismissProgress() {
        
        SVProgressHUD.dismiss()
    }
    
  

}
