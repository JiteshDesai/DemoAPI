//
//  WebParserWS.swift
//  MyPetCredential
//
//  Created by Gong on 1/1/16.
//  Copyright © 2016 Gong. All rights reserved.
//

import UIKit

enum ServiceType : String
{
    case TYPE_GET = "TYPE_GET",TYPE_POST = "TYPE_POST",TYPE_POST_KEY = "TYPE_POST_KEY",TYPE_DELETE = "TYPE_DELETE",TYPE_POST_RAWDATA = "TYPE_POST_RAWDATA"
}

protocol responseDelegate
{
    func didFinishWithSuccess(ServiceName:String,Response:NSMutableDictionary)
}

var Delegate: responseDelegate?

class WebParserWS: NSObject
{
    
    class func fetchDataWithURL(url:NSString,type:ServiceType,ServiceName:String,bodyObject:AnyObject?,delegate:responseDelegate,isShowProgress:Bool)
    {
        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        let strUrl = NSString(format:"%@",url)
        
        
        let URL = NSURL(string:strUrl as String)
        
        let request = NSMutableURLRequest(url: URL! as URL)
        
       // NSLog("URL: %@", url)
       
        if(GlobalFunction.iSinternetConnection())
        {
            if(isShowProgress)
            {
               SVProgressHUD.show()
               
            }
            
            if(type == ServiceType.TYPE_POST)
            {
                NSLog("Parameters:%@",bodyObject! as! String)

                request.httpMethod = "POST"
                
                do
                {
                    request.httpBody = bodyObject!.data(using: String.Encoding.utf8.rawValue)
                }
                catch
                {
                    print("Error is \(error)")
                    
                }

            }
            else if(type == ServiceType.TYPE_POST_RAWDATA)
            {
             //NSLog("Parameters:%@",bodyObject! as! String)
                
                request.httpMethod = "POST"
                
                do
                {
                    let arr = bodyObject as! NSMutableArray
                    
                    let data = try JSONSerialization.data(withJSONObject: arr, options: JSONSerialization.WritingOptions(rawValue: UInt(0)))
                    
                    
                    //request.httpBody = bodyObject!.data(using: String.Encoding.utf8.rawValue)
                    request.httpBody = data
                    
                }
                catch
                {
                    print("Error is \(error)")
                    
                }
                
            }

            else if(type == ServiceType.TYPE_POST_KEY)
            {
                request.httpMethod = "POST"
                
                request.httpBody = (strUrl.data(using: String.Encoding.utf8.rawValue)! as NSData) as Data
            }
            else if (type == ServiceType.TYPE_GET)
            {
                request.httpMethod = "GET"
            }
            else if(type == ServiceType.TYPE_DELETE)
            {
                request.httpMethod = "DELETE"
            }
            
            let task =  session.dataTask(with: request as URLRequest, completionHandler: {(data,response, error) -> Void in
              
                DispatchQueue.main.sync()
                {
                        self.hideProgressHud()
                }
                
                if (error == nil) {
                    
                    let responseString = String(data: data!, encoding: String.Encoding.utf8)
                    
                    NSLog("%@",responseString!)
            
                    do
                    {
                        let dicResonseData = try JSONSerialization.jsonObject(with: data!,
                                                                                      options:JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableDictionary
                         delegate.didFinishWithSuccess(ServiceName: ServiceName,Response:dicResonseData)
                    }
                    catch
                    {
                        print("Error is \(error)")
                        
                       // SVProgressHUD.dismiss()
                    }
                    
                }
                else {
                    
                    print("URL Session Task Failed: %@", error!.localizedDescription);
                    
                  //  SVProgressHUD.dismiss()
                }
            })
            task.resume()

            
        }
        else
        {
            GlobalFunction.showAlertMessage("Please check your Internet connection")
        }
        
    }
    
    class func hideProgressHud()
    {
        SVProgressHUD.dismiss()
    }
    
}


