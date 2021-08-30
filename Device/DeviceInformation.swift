//
//  DeviceInformation.swift
//  Device
//
//  Created by Mery Sartika on 15/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import SystemConfiguration

struct Device: Decodable {

   
    let price: String?

    init(price: String? = nil) {
        self.price = price
    }
}

struct Networking {


    static func getJson(_ type: String, _ model: String, _ memory: String, completionHandler: @escaping (Device) -> ()) {

        let headers = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Host": "ifixnstore.id",
            "accept-encoding": "gzip, deflate",
            "content-length": "26",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]

        let qType = "type="+type
        let qModel = "&model="+model
        let qMemory = "&memory="+memory+" GB"

        let postData = NSMutableData(data: qType.data(using: String.Encoding.utf8)!)
        postData.append(qModel.data(using: String.Encoding.utf8)!)
        postData.append(qMemory.data(using: String.Encoding.utf8)!)


        let urlRequest = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/TradeinApp/app-resource/ios/get-information.php")! as URL,
                                             cachePolicy: .useProtocolCachePolicy,
                                             timeoutInterval: 10.0)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = headers
        urlRequest.httpBody = postData as Data

        URLSession.shared.dataTask(with: urlRequest as URLRequest, completionHandler: { (data, response, error) -> Void in

            guard let data = data, error == nil else {
                print(error!.localizedDescription)
                return
            }

            var resultForDevice = Device()

            do {
                resultForDevice = try JSONDecoder().decode(Device.self, from: data)
                print(resultForDevice.price ?? "test getting price")
                completionHandler(resultForDevice)
            } catch {
                print(error.localizedDescription)
                completionHandler(resultForDevice)
            }
        }).resume()
    }
}

public extension UIDevice {
    //GeneralInformation
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String {
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPhone12,1":                              return "iPhone 11"
            case "iPhone12,3":                              return "iPhone 11 Pro"
            case "iPhone12,5":                              return "iPhone 11 Pro Max"
            case "iPad1,1" :                                return "iPad 1"
            case "iPad2,1", "iPad2,4" :                     return "iPad 2 (Wifi)"
            case "iPad2,2", "iPad2,3" :                     return "iPad 2 (Wifi + Cellular)"
            case "iPad3,1" :                                return "iPad 3 (Wifi)"
            case "iPad3,2", "iPad3,3":                      return "iPad 3 (Wifi + Cellular)"
            case "iPad3,4" :                                return "iPad 4 (Wifi)"
            case "iPad3,5", "iPad3,6" :                     return "iPad 4 (Wifi + Cellular)"
            case "iPad4,1" :                                return "iPad Air (Wifi)"
            case "iPad4,2", "iPad4,3" :                     return "iPad Air (Wifi + Cellular)"
            case "iPad5,3" :                                return "iPad Air 2 (Wifi)"
            case "iPad5,4" :                                return "iPad Air 2 (Wifi + Cellular)"
            case "iPad6,11" :                               return "iPad 5 (Wifi)"
            case "iPad6,12" :                               return "iPad 5 (Wifi + Cellular)"
            case "iPad7,5" :                                return "iPad 6 (Wifi)"
            case "iPad7,6" :                                return "iPad 6 (Wifi + Cellular)"
            case "iPad2,5" :                                return "iPad Mini (Wifi)"
            case "iPad2,6", "iPad2,7":                      return "iPad Mini (Wifi + Cellular)"
            case "iPad4,4":                                 return "iPad Mini 2 (Wifi)"
            case "iPad4,5", "iPad4,6":                      return "iPad Mini 2 (Wifi + Cellular)"
            case "iPad4,7":                                 return "iPad Mini 3 (Wifi)"
            case "iPad4,8", "iPad4,9":                      return "iPad Mini 3 (Wifi + Cellular)"
            case "iPad5,1":                                 return "iPad Mini 4 (Wifi)"
            case "iPad5,2":                                 return "iPad Mini 4 (Wifi + Cellular)"
            case "iPad6,3":                                 return "iPad Pro 9.7-inch (Wifi)"
            case "iPad6,4":                                 return "iPad Pro 9.7-inch (Wifi + Cellular)"
            case "iPad6,7":                                 return "iPad Pro 12.9-inch (Wifi)"
            case "iPad6,8":                                 return "iPad Pro 12.9-inch (Wifi + Cellular)"
            case "iPad7,1":                                 return "iPad Pro 12.9-inch 2017 (Wifi)"
            case "iPad7,2":                                 return "iPad Pro 12.9-inch 2017 (Wifi + Cellular)"
            case "iPad7,3" :                                return "iPad Pro 10.5-inch (Wifi)"
            case "iPad7,4":                                 return "iPad Pro 10.5-inch (Wifi + Cellular)"
            case "iPad8,1", "iPad8,2":                      return "iPad Pro 11-inch (Wifi)"
            case "iPad8,3", "iPad8,4":                      return "iPad Pro 11-inch (Wifi + Cellular)"
            case "iPad8,5", "iPad8,6":                      return "iPad Pro 12.9-inch 2018 (Wifi)"
            case "iPad8,7", "iPad8,8":                      return "iPad Pro 12.9-inch 2018 (Wifi + Cellular)"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
}

//GeneralInformation
func machineName() -> String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    return machineMirror.children.reduce("") { identifier, element in
        guard let value = element.value as? Int8, value != 0 else { return identifier }
        return identifier + String(UnicodeScalar(UInt8(value)))
    }
}


class DeviceInformation: UIViewController {
    
    //Var GeneralInformation
    @IBOutlet weak var `continue`: UIButton!
    @IBOutlet weak var deviceType: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var memory:UILabel!
    @IBOutlet weak var priceStart: UILabel!
    //    @IBOutlet weak var price: UILabel!
    
    var deviceTypeVar = ""
    var modelNameVar = ""
    var hardDiskVar = ""
    
    var deviceTypeData = ""
    var modelNameData = ""
    var hardDiskData = ""
    
    var basePrice = ""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        
      
       
        self.`continue`.isEnabled = false
        
        //For GeneralInformation
        let type = UIDevice.current.model
        let model = UIDevice.modelName
        
        func getFreeSize() -> Int? {
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
                if let freeSize = dictionary[FileAttributeKey.systemFreeSize] as? NSNumber {
                    return freeSize.intValue
                }
            }else{
                print("Error Obtaining System Memory Info:")
            }
            return nil
        }
        
        func getTotalSize() -> Int?{
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
                if let freeSize = dictionary[FileAttributeKey.systemSize] as? NSNumber {
                    return freeSize.intValue
                }
            }else{
                print("Error Obtaining System Memory Info:")
            }
            return nil
        }
        let getDiskSpace = Double(getTotalSize()!) / 1000000000
        
        deviceTypeVar = type
        modelNameVar = model
        hardDiskVar = "\(Int(getDiskSpace.rounded(.up)))"
        self.deviceType.text = deviceTypeVar
        self.modelName.text = modelNameVar
        self.memory.text = "\(hardDiskVar) GB"

        loadData(deviceTypeVar, modelNameVar, hardDiskVar)
       print("\(deviceTypeVar) , \(modelNameVar) , \(hardDiskVar)")
    }
    
    func loadData(_ type: String, _ model: String, _ memory: String) {

        //TODO: buat ui dinamis sesuai grading, handler kalau beberapa grade nil
        Networking.getJson(type, model, memory) { ( result) in
            DispatchQueue.main.async {

                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                let formattedPrice = numberFormatter.string(from: NSNumber(value : Int(result.price!)!))

               
                self.priceStart.text = "Rp. \(formattedPrice!)"
                self.basePrice = "Rp. \(formattedPrice!)"
                
                if self.priceStart.text != "Memuat"  {
                    self.`continue`.isEnabled = true
                }
            }
        }
    }
    
    @IBAction func `continue`(_ sender: UIButton) {
        self.deviceTypeData = self.deviceTypeVar
        self.modelNameData = self.modelNameVar
        self.hardDiskData = self.hardDiskVar
        performSegue(withIdentifier: "DeviceInformationData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let deviceOriginal = segue.destination as! DeviceOriginal
        deviceOriginal.keepDeviceType = self.deviceTypeData
        deviceOriginal.keepModelName = self.modelNameData
        deviceOriginal.keepHardDisk = self.hardDiskData
        deviceOriginal.basePrice = self.basePrice
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (!InternetConnection.Connection()) {
            let alert = UIAlertController(title: "Dimohon untuk menghidupkan koneksi Internet!", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                UIControl().sendAction(#selector(NSXPCConnection.suspend), to: UIApplication.shared, for: nil)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    exit(0)
                }
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
