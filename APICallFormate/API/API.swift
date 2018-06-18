//
//  API
//
//  Created by JITESH on 01/06/18.
//  Copyright © 2018 JITESH. All rights reserved.
//

import Foundation
import Photos
open class API
{
    internal static var manager: AFHTTPRequestOperationManager?
    
    open static func setup()
    {
        UserDefaults.standard.setValue(API_MAIN_URL, forKey: "baseUrl")
        UserDefaults.standard.synchronize()
        manager = AFHTTPRequestOperationManager(baseURL: URL(string: API_MAIN_URL))
     //   manager?.requestSerializer.setValue("text/html", forHTTPHeaderField: "content-type")
        //manager?.responseSerializer.setValue("", forKey: "")
//        manager?.securityPolicy.allowInvalidCertificates = true
//        manager?.securityPolicy.validatesDomainName = false
        //manager?.requestSerializer = AFJSONRequestSerializer()
        //manager?.responseSerializer = AFJSONResponseSerializer()
    }
    //MARK:- Set/Get Device Token
    open static func setDeviceToken(token: String)
    {
        UserDefaults.standard.setValue(token, forKey: "device_token")
        UserDefaults.standard.synchronize()
    }
    open static func getDeviceTypeID() -> String
    {
        return "1"
    }
    open static func getDeviceToken() -> String
    {
        if UserDefaults.standard.value(forKey: "device_token") == nil{
            setDeviceToken(token: "")
        }
        return UserDefaults.standard.value(forKey: "device_token") as! String
    }
    //MARK:- Set/Get Page Index
    open static func setPageIndex(page: Int)
    {
        UserDefaults.standard.setValue(page, forKey: "page_index")
        UserDefaults.standard.synchronize()
    }
    open static func getPageIndex() -> Int
    {
        return UserDefaults.standard.value(forKey: "page_index") as! Int
    }
    
    open static func setInitialValues()
    {
    }
    //MARK:- Set/Get Role
    open static func setRole(role: String)
    {
        UserDefaults.standard.setValue(role, forKey: "Role")
        UserDefaults.standard.synchronize()
    }
    open static func getRole() -> String
    {
        return UserDefaults.standard.value(forKey: "Role") as! String
    }
    open static func setRoleName(role: String)
    {
        UserDefaults.standard.setValue(role, forKey: "RoleName")
        UserDefaults.standard.synchronize()
    }
    open static func getRoleName() -> String
    {
        return UserDefaults.standard.value(forKey: "RoleName") as! String
    }
    //MARK:- Set/Get User Detail
    open static func setLoggedUserData(dict: NSMutableDictionary)
    {
        UserDefaults.standard.setValue(dict, forKey: "userData")
        UserDefaults.standard.synchronize()
    }
    open static func getLoggedUserData() -> NSMutableDictionary
    {
        let dd: NSDictionary = UserDefaults.standard.value(forKey: "userData") as! NSDictionary
        let dictUser: NSMutableDictionary = NSMutableDictionary.init(dictionary: dd)
        return dictUser
    }
    //MARK:- Set/Get Register Type
    open static func setRegType(type: String)
    {
        UserDefaults.standard.setValue(type, forKey: "regType")
        UserDefaults.standard.synchronize()
    }
    open static func getRegType() -> String
    {
        return UserDefaults.standard.value(forKey: "regType") as! String
    }
    //MARK:- Set/Get Login Type
    open static func setLoginType(type: String)
    {
        UserDefaults.standard.setValue(type, forKey: "loginType")
        UserDefaults.standard.synchronize()
    }
    open static func getLoginType() -> String
    {
        return UserDefaults.standard.value(forKey: "loginType") as! String
    }
    //MARK:- Set/Get Access Token
    open static func setAccessToke(token: String)
    {
        UserDefaults.standard.setValue(token, forKey: "accessToken")
        UserDefaults.standard.synchronize()
    }
    open static func getAccessToke() -> String
    {
        if UserDefaults.standard.value(forKey: "accessToken") == nil{
            setAccessToke(token: "")
        }
        return UserDefaults.standard.value(forKey: "accessToken") as! String
    }
    //MARK:- Set/Get XMPP Password
    open static func setXMPPPWD(type: String)
    {
        UserDefaults.standard.setValue(type, forKey: "xmppPwd")
        UserDefaults.standard.synchronize()
    }
    open static func getXMPPPWD() -> String
    {
        return UserDefaults.standard.value(forKey: "xmppPwd") as! String
    }
    //MARK:- Set/Get IsLogin
    open static func setIsLogin(type: Bool)
    {
        UserDefaults.standard.setValue(type, forKey: "isLogin")
        UserDefaults.standard.synchronize()
    }
    open static func getIsLogin() -> Bool
    {
        if UserDefaults.standard.object(forKey: "isLogin") == nil
        {
            setIsLogin(type: false)
            return false
        }
        return UserDefaults.standard.value(forKey: "isLogin") as! Bool
    }
    //MARK:- Set/Get IsFrom Notification
    open static func isFromNotification() -> Bool
    {
        if UserDefaults.standard.value(forKey: "isFromNotification") == nil{
            setIsFromNotification(type: false)
        }
        return UserDefaults.standard.value(forKey: "isFromNotification") as! Bool
    }
    open static func setIsFromNotification(type: Bool)
    {
        UserDefaults.standard.setValue(type, forKey: "isFromNotification")
        UserDefaults.standard.synchronize()
    }
    //MARK:- Set/Get Notification Response
    open static func setNotiDict(dict: NSDictionary)
    {
        UserDefaults.standard.setValue(dict, forKey: "setNotiDict")
        UserDefaults.standard.synchronize()
    }
    open static func getNotiDict() -> NSDictionary
    {
        let dd: NSDictionary = UserDefaults.standard.value(forKey: "setNotiDict") as! NSDictionary
        return dd
    }
    
    //MARK:- Set/Get Demat Data
    open static func setDematDetail(dict: NSDictionary)
    {
        UserDefaults.standard.setValue(dict, forKey: "dematDetail")
        UserDefaults.standard.synchronize()
    }
    open static func getDematDetail() -> NSDictionary
    {
        if(UserDefaults.standard.value(forKey: "dematDetail") == nil)
        {
            return NSDictionary()
        }
        let dd: NSDictionary = UserDefaults.standard.value(forKey: "dematDetail") as! NSDictionary
        return dd
    }
    
    //MARK:- Set/Get Address Data
    open static func setAddressDetail(dict: NSDictionary)
    {
        UserDefaults.standard.setValue(dict, forKey: "addressDetail")
        UserDefaults.standard.synchronize()
    }
    open static func getAddressDetail() -> NSDictionary
    {
        if(UserDefaults.standard.value(forKey: "addressDetail") == nil)
        {
            return NSDictionary()
        }
        let dd: NSDictionary = UserDefaults.standard.value(forKey: "addressDetail") as! NSDictionary
        return dd
    }
    
    //MARK:- Set/Get User ID
    open static func getUserID() -> String
    {
        return UserDefaults.standard.value(forKey: "user_id") as! String
    }
    open static func setUserId(strId: String)
    {
        UserDefaults.standard.setValue(strId, forKey: "user_id")
        UserDefaults.standard.synchronize()
    }
    //MARK:- Set/Get Password
    open static func getPssword() -> String
    {
        return UserDefaults.standard.value(forKey: "password") as! String
    }
    open static func setPssword(pass: String)
    {
        UserDefaults.standard.setValue(pass, forKey: "password")
        UserDefaults.standard.synchronize()
    }
    
    open static func getProfileID() -> String
    {
        return UserDefaults.standard.value(forKey: "profile_id") as! String
    }
    open static func setProfileId(strId: String)
    {
        UserDefaults.standard.setValue(strId, forKey: "profile_id")
        UserDefaults.standard.synchronize()
    }
    
    open static func getCartProducts() -> NSArray
    {
        if UserDefaults.standard.value(forKey: "cart_products") == nil
        {
            return NSArray()
        }
        
        return UserDefaults.standard.value(forKey: "cart_products") as! NSArray
    }
    
    open static func setCartProducts(cartProducts: NSArray)
    {
        UserDefaults.standard.setValue(cartProducts, forKey: "cart_products")
        UserDefaults.standard.synchronize()
    }
    
    open static func isDeviceTokenUpdated() -> Bool
    {
        if UserDefaults.standard.value(forKey: "isDeviceTokenUpdated") == nil{
            return false
        }
        return UserDefaults.standard.value(forKey: "isDeviceTokenUpdated") as! Bool
    }
    
    //MARK:- Encode
    open static func encodeBase64FromString (_ value: String) -> String
    {
        if let data: Data = value.data(using: String.Encoding.utf8)
        {
            let encoded = data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
            return encoded.replacingOccurrences(of: "<", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ">", with: "")
        }
        return value
    }
    open static func encodeBase64FromData (_ value: Data) -> String
    {
        let encoded = value.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return encoded.replacingOccurrences(of: "<", with: "")
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: ">", with: "")
        return encoded
    }
    //MARK:- Email Validation
    open static func validateEmail(enteredEmail:String) -> Bool
    {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    
    open static func setFilterData(dict: NSMutableDictionary)
    {
        UserDefaults.standard.setValue(dict, forKey: "filter")
        UserDefaults.standard.synchronize()
    }
    
    //MARK:- date
    
    open static func convertDateToString(strDate : String, fromFormat : String, toFormat : String) -> String
    {
        if strDate == ""
        {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        dateFormatter.dateFormat = fromFormat
        
        let dateOriginal : Date = dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = toFormat
        let strConvertedDate : String = String.init(format: "%@", dateFormatter.string(from: dateOriginal))
        return strConvertedDate
    }
    
   
    
    //MARK:- Content Message show
    open static func isShowContentMessage(arr: NSMutableArray) -> Bool
    {
        if arr.count == 0
        {
            return false
        }
        else
        {
            return true
        }
    }
    //MARK:- All Method for video
    open static func createDir(dirName: String) -> (Bool,String?,NSError?) {
        let fileManager = FileManager.default
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filePath =  tDocumentDirectory.appendingPathComponent("\(dirName)")
            if !fileManager.fileExists(atPath: filePath.path) {
                do {
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    return  (true,filePath.absoluteString ,nil)
                } catch let error as NSError {
                    NSLog("Couldn't create document directory")
                    return (false,nil,error)
                }
            }
            else
            {
                return (false,nil,NSError(domain: "The file exist", code: 12, userInfo: nil))
            }
        }
        else
        {
            return (false,nil,NSError(domain: "The file exist", code: 12, userInfo: nil))
        }
    }
    open static func getDir(dirName: String) -> URL? {
        let fileManager = FileManager.default
        if let tDocumentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            if dirName == ""
            {
                return tDocumentDirectory
            }
            else
            {
                return tDocumentDirectory.appendingPathComponent("\(dirName)")
            }
        }
        else
        {
            return nil
        }
    }
    open static func resolutionForLocalVideo(url: URL) -> CGSize? {
        guard let track = AVURLAsset(url: url).tracks(withMediaType: AVMediaType.video).first else { return nil }
        let size = track.naturalSize.applying(track.preferredTransform)
        return CGSize(width: fabs(size.width), height: fabs(size.height))
    }
    
    open static func ThemeColor() -> UIColor
    {
        return UIColor(rgb: 0x1976D2, a: 1)
    }
    
    open static func logoutFromApp()
    {
        API.setLoggedUserData(dict: NSMutableDictionary())
        API.setIsLogin(type: false)
        API.setUserId(strId: "")
        
        UserDefaults.standard.synchronize()
        
        let storyboard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let login: LoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let loginNavigation = UINavigationController(rootViewController: login)
        let deleObj: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        deleObj.window?.rootViewController = loginNavigation
        
        deleObj.window?.makeKeyAndVisible()
    }
    open static func stringValueFromDictionary(dic: NSDictionary, key: String) -> String
    {
        var str : String = ""
        if !(dic.object(forKey: key) is NSNull)
        {
            if dic.object(forKey: key) is String
            {
                str = String.init(format:"%@",dic.object(forKey: key) as! String)
            }
            else if dic.object(forKey: key) is Int
            {
                str = String.init(format:"%ld",dic.object(forKey: key) as! Int)
            }
            else if dic.object(forKey: key) is Float
            {
                str = String.init(format:"%f",dic.object(forKey: key) as! Float)
            }
            //let str: String = dic.object(forKey: key) is String ? String.init(format:"%@",dic.object(forKey: key) as! String) : String.init(format:"%ld",dic.object(forKey: key) as! NSInteger)
            return str
        }
        return str
    }
    
    open static func jsonToString(json: NSDictionary) -> String
    {
        var convertedString: String = ""
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted) // first of all convert json to the data
            convertedString = String(data: data1, encoding: String.Encoding.utf8)! // the data will be converted to the string
            print(convertedString) // <-- here is ur string
            
        } catch let myJSONError {
            print(myJSONError)
            
        }
        return convertedString
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
extension String {
    
    var containsUnicodeCharacters: Bool {
        for scalar in unicodeScalars {
            if scalar.value > 0x00FF {
                return true
            }
        }
        return false
    }
    
}

extension UIColor
{
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0)
    {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(rgb: Int, a: CGFloat = 1.0)
    {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}

extension String {
    var pairs: [String] {
        var result: [String] = []
        let characters = Array(self.characters)
        stride(from: 0, to: characters.count, by: 1).forEach {
            result.append(String(characters[$0..<min($0+2, characters.count)]))
        }
        return result
    }
    mutating func insert(separator: String, every n: Int) {
        self = inserting(separator: separator, every: n)
    }
    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""
        let characters = Array(self.characters)
        stride(from: 0, to: characters.count, by: n).forEach {
            result += String(characters[$0..<min($0+n, characters.count)])
            if $0+n < characters.count {
                result += separator
            }
        }
        return result
    }
}
extension String
{
    var length: Int { return characters.count} // Swift 2.0
}
extension AVURLAsset {
    var fileSize: Float? {
        let keys: Set<URLResourceKey> = [.fileSizeKey]
        //let keys: Set<URLResourceKey> = [.totalFileSizeKey, .fileSizeKey]
        let resourceValues = try? url.resourceValues(forKeys: keys)
        let totalSize: Float = Float.init((resourceValues?.fileSize)!)
        return (totalSize/(1024.0 * 1024.0))
    }
    func getTotalMediaTime() -> String
    {
        let totalSeconds = Int(CMTimeGetSeconds(self.duration))
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        let mediaDuration :String = String(format:"%02i:%02i",minutes, seconds)
        return mediaDuration
    }
    func getThumbnailFrom(path: URL) -> UIImage? {
        do {
            let asset = AVURLAsset(url: path , options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return UIImage(named:"placeholder")
        }
    }
}
extension AVAsset {
    var screenSize: CGSize? {
        if let track = tracks(withMediaType: .video).first {
            let size = __CGSizeApplyAffineTransform(track.naturalSize, track.preferredTransform)
            return CGSize(width: fabs(size.width), height: fabs(size.height))
        }
        return nil
    }
}
extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool {
        return isValid(regex: regex.rawValue)
    }
    
    func isValid(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeAColl() {
        if isValid(regex: .phone) {
            if let url = URL(string: "tel://\(self.onlyDigits())"), UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
    }
}
extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
extension UILabel {
    func setHTMLFromString(htmlText: String) {
        let modifiedFont = String(format:"<span style=\"font-family: 'HelveticaNeue'; font-size: \(self.font!.pointSize)\">%@</span>", htmlText)
        
        
        //process collection values
        let attrStr =  try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options:[.documentType: NSAttributedString.DocumentType.html,
                     .characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        
        
        self.attributedText = attrStr
    }
}
extension UITextView {
    func setHTMLFromString(htmlText: String) {
        let modifiedFont = String(format:"<span style=\"font-family: 'HelveticaNeue'; font-size: \(self.font!.pointSize)\">%@</span>", htmlText)
        
        
        //process collection values
        let attrStr =  try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options:[.documentType: NSAttributedString.DocumentType.html,
                     .characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        
        
        self.attributedText = attrStr
    }
}
extension String
{
    var length: Int { return characters.count} // Swift 2.0
}

public enum Model : String {
    case simulator   = "simulator/sandbox",
    iPod1            = "iPod 1",
    iPod2            = "iPod 2",
    iPod3            = "iPod 3",
    iPod4            = "iPod 4",
    iPod5            = "iPod 5",
    iPad2            = "iPad 2",
    iPad3            = "iPad 3",
    iPad4            = "iPad 4",
    iPhone4          = "iPhone 4",
    iPhone4S         = "iPhone 4S",
    iPhone5          = "iPhone 5",
    iPhone5S         = "iPhone 5S",
    iPhone5C         = "iPhone 5C",
    iPadMini1        = "iPad Mini 1",
    iPadMini2        = "iPad Mini 2",
    iPadMini3        = "iPad Mini 3",
    iPadAir1         = "iPad Air 1",
    iPadAir2         = "iPad Air 2",
    iPadPro9_7       = "iPad Pro 9.7\"",
    iPadPro9_7_cell  = "iPad Pro 9.7\" cellular",
    iPadPro10_5      = "iPad Pro 10.5\"",
    iPadPro10_5_cell = "iPad Pro 10.5\" cellular",
    iPadPro12_9      = "iPad Pro 12.9\"",
    iPadPro12_9_cell = "iPad Pro 12.9\" cellular",
    iPhone6          = "iPhone 6",
    iPhone6plus      = "iPhone 6 Plus",
    iPhone6S         = "iPhone 6S",
    iPhone6Splus     = "iPhone 6S Plus",
    iPhoneSE         = "iPhone SE",
    iPhone7          = "iPhone 7",
    iPhone7plus      = "iPhone 7 Plus",
    iPhone8          = "iPhone 8",
    iPhone8plus      = "iPhone 8 Plus",
    iPhoneX          = "iPhone X",
    unrecognized     = "?unrecognized?"
}

public extension UIDevice {
    public var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        var modelMap : [ String : Model ] = [
            "i386"       : .simulator,
            "x86_64"     : .simulator,
            "iPod1,1"    : .iPod1,
            "iPod2,1"    : .iPod2,
            "iPod3,1"    : .iPod3,
            "iPod4,1"    : .iPod4,
            "iPod5,1"    : .iPod5,
            "iPad2,1"    : .iPad2,
            "iPad2,2"    : .iPad2,
            "iPad2,3"    : .iPad2,
            "iPad2,4"    : .iPad2,
            "iPad2,5"    : .iPadMini1,
            "iPad2,6"    : .iPadMini1,
            "iPad2,7"    : .iPadMini1,
            "iPhone3,1"  : .iPhone4,
            "iPhone3,2"  : .iPhone4,
            "iPhone3,3"  : .iPhone4,
            "iPhone4,1"  : .iPhone4S,
            "iPhone5,1"  : .iPhone5,
            "iPhone5,2"  : .iPhone5,
            "iPhone5,3"  : .iPhone5C,
            "iPhone5,4"  : .iPhone5C,
            "iPad3,1"    : .iPad3,
            "iPad3,2"    : .iPad3,
            "iPad3,3"    : .iPad3,
            "iPad3,4"    : .iPad4,
            "iPad3,5"    : .iPad4,
            "iPad3,6"    : .iPad4,
            "iPhone6,1"  : .iPhone5S,
            "iPhone6,2"  : .iPhone5S,
            "iPad4,1"    : .iPadAir1,
            "iPad4,2"    : .iPadAir2,
            "iPad4,4"    : .iPadMini2,
            "iPad4,5"    : .iPadMini2,
            "iPad4,6"    : .iPadMini2,
            "iPad4,7"    : .iPadMini3,
            "iPad4,8"    : .iPadMini3,
            "iPad4,9"    : .iPadMini3,
            "iPad6,3"    : .iPadPro9_7,
            "iPad6,11"   : .iPadPro9_7,
            "iPad6,4"    : .iPadPro9_7_cell,
            "iPad6,12"   : .iPadPro9_7_cell,
            "iPad6,7"    : .iPadPro12_9,
            "iPad6,8"    : .iPadPro12_9_cell,
            "iPad7,3"    : .iPadPro10_5,
            "iPad7,4"    : .iPadPro10_5_cell,
            "iPhone7,1"  : .iPhone6plus,
            "iPhone7,2"  : .iPhone6,
            "iPhone8,1"  : .iPhone6S,
            "iPhone8,2"  : .iPhone6Splus,
            "iPhone8,4"  : .iPhoneSE,
            "iPhone9,1"  : .iPhone7,
            "iPhone9,2"  : .iPhone7plus,
            "iPhone9,3"  : .iPhone7,
            "iPhone9,4"  : .iPhone7plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,2" : .iPhone8plus,
            "iPhone10,3" : .iPhoneX,
            "iPhone10,6" : .iPhoneX
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            return model
        }
        return Model.unrecognized
    }
}

