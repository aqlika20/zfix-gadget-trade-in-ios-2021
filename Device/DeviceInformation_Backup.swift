//
//  DeviceInformation.swift
//  Device
//
//  Created by Mery Sartika on 15/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import SystemConfiguration

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
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch)"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
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
    
    //CPUInformation
    //Original Author: HAS
    // https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model
    // Modified by Sam Trent
    
    public func getCPUName() -> String
    {
        var processorNames = Array(CPUinfo().keys)
        return processorNames[0]
    }
    
    public func getCPUSpeed() -> String
    {
        var processorSpeed = Array(CPUinfo().values)
        return processorSpeed[0]
    }
    
    
    private func CPUinfo() -> Dictionary<String, String> {
        
        #if (arch(i386) || arch(x86_64)) && os(iOS)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
        
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif
        
        switch identifier {
        case "iPod5,1":                                 return ["A5":"800 MHz"] // underclocked
        case "iPod7,1":                                 return ["A8":"1.4 GHz"]
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return ["A4":"800 MHz"] // underclocked
        case "iPhone4,1":                               return ["A5":"800 MHz"] // underclocked
        case "iPhone5,1", "iPhone5,2":                  return ["A6":"1.3 GHz"]
        case "iPhone5,3", "iPhone5,4":                  return ["A6":"1.3 GHz"]
        case "iPhone6,1", "iPhone6,2":                  return ["A7":"1.3 GHz"]
        case "iPhone7,2":                               return ["A8":"1.4 GHz"]
        case "iPhone7,1":                               return ["A8":"1.4 GHz"]
        case "iPhone8,1":                               return ["A9":"1.85 GHz"]
        case "iPhone8,2":                               return ["A9":"1.85 GHz"]
        case "iPhone9,1", "iPhone9,3":                  return ["A10 Fusion":"2.34 GHz"]
        case "iPhone9,2", "iPhone9,4":                  return ["A10 Fusion":"2.34 GHz"]
        case "iPhone8,4":                               return ["A9":"1.85 GHz"]
        case "iPhone10,1", "iPhone10,4":                return ["A11 Bionic":"2.39 GHz"]
        case "iPhone10,2", "iPhone10,5":                return ["A11 Bionic":"2.39 GHz"]
        case "iPhone10,3", "iPhone10,6":                return ["A11 Bionic":"2.39 GHz"]
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return ["A5":"1.0 GHz"]
        case "iPad3,1", "iPad3,2", "iPad3,3":           return ["A5X":"1.0 GHz"]
        case "iPad3,4", "iPad3,5", "iPad3,6":           return ["A6X":"1.4 GHz"]
        case "iPad4,1", "iPad4,2", "iPad4,3":           return ["A7":"1.4 GHz"]
        case "iPad5,3", "iPad5,4":                      return ["A8X":"1.5 GHz"]
        case "iPad6,11", "iPad6,12":                    return ["A9":"1.85 GHz"]
        case "iPad2,5", "iPad2,6", "iPad2,7":           return ["A5":"1.0 GHz"]
        case "iPad4,4", "iPad4,5", "iPad4,6":           return ["A7":"1.3 GHz"]
        case "iPad4,7", "iPad4,8", "iPad4,9":           return ["A7":"1.3 GHz"]
        case "iPad5,1", "iPad5,2":                      return ["A8":"1.5 GHz"]
        case "iPad6,3", "iPad6,4":                      return ["A9X":"2.16 GHz"] // underclocked
        case "iPad6,7", "iPad6,8":                      return ["A9X":"2.24 GHz"]
        case "iPad7,1", "iPad7,2":                      return ["A10X Fusion":"2.34 GHz"]
        case "iPad7,3", "iPad7,4":                      return ["A10X Fusion":"2.34 GHz"]
        case "AppleTV5,3":                              return ["A8":"1.4 GHz"]
        case "AppleTV6,2":                              return ["A10X Fusion":"2.34 GHz"]
        case "AudioAccessory1,1":                       return ["A8":"1.4 GHz"] // clock speed is a guess
        default:                                        return ["N/A":"N/A"]
        }
    }
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
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var deviceType: UILabel!
    @IBOutlet weak var modelName: UILabel!
    @IBOutlet weak var modelIdentifier: UILabel!
    @IBOutlet weak var systemName: UILabel!
    @IBOutlet weak var systemVersion: UILabel!
    
    //Var DisplayInformation
    @IBOutlet weak var screenWidth: UILabel!
    @IBOutlet weak var screenHeight: UILabel!
    @IBOutlet weak var screenSize: UILabel!
    @IBOutlet weak var ppiDensity: UILabel!
    @IBOutlet weak var brightnessLevel: UILabel!
    
    //Var CPUInformation
    @IBOutlet weak var cpuName: UILabel!
    @IBOutlet weak var cpuSpeed: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //For GeneralInformation
        let name = UIDevice.current.name
        let type = UIDevice.current.model
        let model = UIDevice.modelName
        let systemname = UIDevice.current.systemName
        let systemversion = UIDevice.current.systemVersion
        
        print("device name = \(name)")
        print("device type = \(type)")
        print("device model = \(model)")
        print("device identifier = \(machineName())")
        print("system name = \(systemname)")
        print("system version = \(systemversion)")
        
        deviceName.text = name
        deviceType.text = type
        modelName.text = model
        modelIdentifier.text = machineName()
        systemName.text = systemname
        systemVersion.text = systemversion
        
        //For DisplayInformation
        let scale = UIScreen.main.scale
        let ppi = scale * ((UIDevice.current.userInterfaceIdiom == .pad) ? 132 : 163);
        let width = UIScreen.main.bounds.size.width * scale
        let height = UIScreen.main.bounds.size.height * scale
        let horizontal = width / ppi, vertical = height / ppi;
        let diagonal = sqrt(pow(horizontal, 2) + pow(vertical, 2))
        let screensize = String(format: "%0.1f", diagonal)
        let brightnesslevel = UIScreen.main.brightness*100
        
        print("screen width = \(Int(width))")
        print("screen height = \(Int(height))")
        print("screen size = \(screensize)\"")
        print("ppi density = ~\(Int(ppi))")
        print("brightness level = \(Int(brightnesslevel))%")
        
        screenWidth.text = "\(Int(width))"
        screenHeight.text = "\(Int(height))"
        screenSize.text = "\(screensize)\""
        ppiDensity.text = "~\(Int(ppi))"
        brightnessLevel.text = "\(Int(brightnesslevel))%"
        
        //For CPUInformation
        print("cpu type = \(UIDevice.current.getCPUName())")
        print("cpu speed = \(UIDevice.current.getCPUSpeed())")
        
        cpuName.text = "\(UIDevice.current.getCPUName())"
        cpuSpeed.text = "\(UIDevice.current.getCPUSpeed())"
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
