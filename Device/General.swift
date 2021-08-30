//
//  General.swift
//  Device
//
//  Created by Mery Sartika on 27/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import MediaPlayer
import SystemConfiguration
import Foundation
import AVFoundation
import AVKit
import Mute
import CoreTelephony

extension MPVolumeView {
    static func setVolume(_ volume: Float) {
        let volumeView = MPVolumeView()
        let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider
        
        
        slider?.value = volume
        
    }
}

public extension UIDevice {
    
    //CPUInformation
    //Original Author: HAS
    // https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model
    // Modified by Sam Trent
    
    public func CPUName() -> String
    {
        var processorNames = Array(CPUinfo().keys)
        return processorNames[0]
    }
    
    public func CPUSpeed() -> String
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
        case "iPhone11,2":                              return ["A12 Bionic":"2.5 GHz"]
        case "iPhone11,4", "iPhone11,6":                return ["A12 Bionic":"2.5 GHz"]
        case "iPhone11,8":                              return ["A12 Bionic":"2.5 GHz"]
        case "iPhone12,1":                              return ["A13 Bionic":"2.65 GHz"]
        case "iPhone12,3":                              return ["A13 Bionic":"2.65 GHz"]
        case "iPhone12,5":                              return ["A13 Bionic":"2.65 GHz"]
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

class General: UIViewController {
    
    @IBOutlet weak var cpu: UIButton!
    @IBOutlet weak var hardDisk: UIButton!
    @IBOutlet weak var battery: UIButton!
    @IBOutlet weak var jailbreak: UIButton!
    @IBOutlet weak var memory: UIButton!
    @IBOutlet weak var wifi: UIButton!
    @IBOutlet weak var simcard: UIButton!
    @IBOutlet weak var silentButton: UIButton!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var volumeButton: UIButton!
    
    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
    //    var keepPrice = 0
    
    var statusCPU = 0
    var statusHardDisk = 0
    var statusBattery = 0
    var statusJailbreak = 0
    var statusMemory = 0
    var statusWifiBluetooth = 0
    var statusSimcard = 0
    var statusSilentButton = 0
    var statusVolumeButton = 0
    var statusPowerButton = 0
    
    var basePrice = ""
    
    var silentCondition = ""
    
    
    var soundSession:Bool = false
    var volumeSession:Bool = true
    var silentSession:Bool = true
    var bottom:Bool!
    var up:Bool!
    var silent = false
    
    private var audioLevel : Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        MPVolumeView.setVolume(0.5)
        wifi.titleLabel?.textAlignment = NSTextAlignment.center
        silentButton.titleLabel?.textAlignment = NSTextAlignment.center
        volumeButton.titleLabel?.textAlignment = NSTextAlignment.center
        powerButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getCPU(true)}
        // Do any additional setup after loading the view.
    }
    
    func getCPU(_ run : Bool) {
        if run == false { return }
      
        print("CPU Name = \(UIDevice.current.CPUName())")
        print("CPU Speed = \(UIDevice.current.CPUSpeed())")
//        if UIDevice.current.CPUName() == "" || UIDevice.current.CPUSpeed() == "" {
//            statusCPU = 0
//            cpu.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
//        }
//        else {
            statusCPU = 1
            cpu.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `1.0` to the desired number of seconds.
            //            self.touchScreen.titleLabel!.text = "Step \n 20 \n Test"
            self.getMemory(true)
        }
        
        
    }
    
    func getMemory(_ run : Bool) {
        if run == false { return }
        //To Do : Validation
        let basememory =  ProcessInfo.processInfo.physicalMemory
        let totalmemory = Double(basememory) / (1000000000)
//        if totalmemory <= 0 {
//            statusMemory = 0
//            memory.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
//        }
//        else {
            statusMemory = 1
            print("Memory = \(Int(totalmemory.rounded(.down)))GB")
            memory.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
//        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getHardDisk(true)}
    }
    
    
    func  getHardDisk(_ run : Bool) {
        if run == false { return }
      
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
        let getFreeSpace = Double(getFreeSize()!) / 1000000000
        let getDiskSpace = Double(getTotalSize()!) / 1000000000
        if getFreeSpace < 0 || getDiskSpace <= 0 {
            statusHardDisk = 0
            hardDisk.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
        }
        else {
            statusHardDisk = 1
            print("Disk Space = \(Int(getDiskSpace.rounded(.up)))GB")
            print("Free Space = \(Int(getFreeSpace.rounded(.up)))GB")
            hardDisk.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getBattery(true)}
        
    }
    
    func getBattery(_ run : Bool) {
        if run == false { return }
     
        UIDevice.current.isBatteryMonitoringEnabled = true
        var batteryLevel : Float {
            return UIDevice.current.batteryLevel
        }
        
        print("Battery Level = \(Int(batteryLevel*100))%")
        
        
        
        let alert1 = UIAlertController(title: "Apakah Baterai normal?", message: nil, preferredStyle: .alert)
                                       let yes = UIAlertAction(title: "Ya", style: .default) { action in
                                           let alert = UIAlertController(title: "Baterai normal.", message: nil, preferredStyle: .alert)
                                           let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                                                self.statusBattery = 1
                                            self.battery.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getJailbreak(true)}
                                           }
                                           alert.addAction(okBtn)
                                           self.present(alert, animated: true, completion: nil)
                                           print("Battery is Normal")
                                       }
                                       let no = UIAlertAction(title: "Tidak", style: .default) { action in
                                           
                                           let alert = UIAlertController(title: "Baterai bermasalah.", message: nil, preferredStyle: .alert)
                                           let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                                               self.statusBattery = 0
                                            self.battery.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getJailbreak(true)}
                                               
                                           }
                                           alert.addAction(okBtn)
                                        self.present(alert, animated: true, completion: nil)
                                       print("Battery is Problem")
                                        //                self.deletedArr.removeAll()
                                        //                self.collectionView.reloadData()
                }
                                        alert1.addAction(yes)
                                        alert1.addAction(no)
                                        self.present(alert1, animated: true, completion: nil)
                                        
        
        
    }
    
    
    func isJailbroken() -> Bool {
        #if arch(i386) || arch(x86_64)
        // This is a Simulator not an idevice
        return false
        #else
        let fm = FileManager.default
        if(fm.fileExists(atPath: "/private/var/lib/apt")) {
            //The device is not jailbroken
            return true
        } else {
            //The device is not jailbroken
            return false
        }
        #endif
    }
    
    
    func getJailbreak(_ run : Bool) {
        if run == false { return }
        if isJailbroken() == false {
            print("Jailbreak = No")
            statusJailbreak = 1
            jailbreak.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
        }
        else {
            print("Jailbreak = Yes")
            statusJailbreak = 0
            jailbreak.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getWifiBluetooth(true)}
        
    }
    
   
    func isWifiEnabled() -> Bool {
        var addresses = [String]()
        
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return false }
        guard let firstAddr = ifaddr else { return false }
        
        for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            addresses.append(String(cString: ptr.pointee.ifa_name))
        }
        
        var counts:[String:Int] = [:]
        
        for item in addresses {
            counts[item] = (counts[item] ?? 0) + 1
        }
        
        freeifaddrs(ifaddr)
        guard let count = counts["awdl0"] else { return false }
        return count > 1
    }
    
    func getWifiBluetooth(_ run : Bool) {
        if run == false { return }
        if isWifiEnabled() == true {
            print("Wifi in Connection = Yes")
            let alert1 = UIAlertController(title: "Apakah Bluetooth normal?", message: nil, preferredStyle: .alert)
            let yesBtn1 = UIAlertAction(title: "Ya", style: .default) { action in
                
                let alert = UIAlertController(title: "Bluetooth normal.", message: nil, preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                     
                 self.statusWifiBluetooth = 1
                 self.wifi.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                 DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getSimcard(true)}
                }
                alert.addAction(okBtn)
                self.present(alert, animated: true, completion: nil)
              print("Is Bluetooth Normal? = Yes")
                
            }
            let noBtn1 = UIAlertAction(title: "Tidak", style: .default) { action in
                let alert = UIAlertController(title: "Bluetooth bermasalah.", message: nil, preferredStyle: .alert)
                               let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                                    
                               self.statusWifiBluetooth = 0
                                self.wifi.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getSimcard(true)}
                               }
                               alert.addAction(okBtn)
                               self.present(alert, animated: true, completion: nil)
                print("Is Bluetooth Normal? = No")
                
                //                self.deletedArr.removeAll()
                //                self.collectionView.reloadData()
            }
            alert1.addAction(yesBtn1)
            alert1.addAction(noBtn1)
            self.present(alert1, animated: true, completion: nil)
            
        }
        else {

            let alertController1 = UIAlertController(title: "Wifi", message: "Dimohon untuk mengaktifkan Wifi!", preferredStyle: .alert)
                let confirmAction = UIAlertAction(title: "Konfirmasi", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    
                        self.getWifiBluetooth(true)
                    
                }
            let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.statusWifiBluetooth = 0
                            print("Wifi Connection = No")
                            print("Is Bluetooth Normal? = No")
                self.wifi.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getSimcard(true)}

            }

                // Add the actions
                alertController1.addAction(confirmAction)
            alertController1.addAction(skipAction)
                self.present(alertController1, animated: true, completion: nil)

            }
        
        
    }
    
    func getSimcard(_ run : Bool) {
        if run == false { return }
        else {
            var availableSIM: Bool {
                return CTTelephonyNetworkInfo().subscriberCellularProvider?.mobileNetworkCode != nil
            }

            if keepDeviceType == "iPad" && keepModelName.range(of: "Wifi") != nil && keepModelName.range(of: "Cellular") == nil {
                self.simcard.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                self.statusSimcard = 1
                print("Simcard is Normal")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getSilentButton(true)}
            }
            else {
                if availableSIM == true {

                    self.simcard.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                    self.statusSimcard = 1
                    print("Simcard is Normal")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getSilentButton(true)}
                }

                if availableSIM == false {

                    let alertController1 = UIAlertController(title: "Kartu SIM", message: "Dimohon untuk memasukkan Kartu SIM!", preferredStyle: .alert)
                    let confirmAction = UIAlertAction(title: "Konfirmasi", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        if availableSIM == true {
                            self.simcard.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                            self.statusSimcard = 1
                            print("Simcard is Normal")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getSilentButton(true)}
                        }
                        else {
                            self.getSimcard(true)
                        }
                    }

//                    // Add the actions
                    alertController1.addAction(confirmAction)
                    self.present(alertController1, animated: true, completion: nil)

                }
            }


        }
       
        
        
    }
    
  
    
    private func getSilentButton(_ run : Bool) {
        if run == false { return }
        
         
             let alertController = UIAlertController(title: "Tombol Silent", message: "Gunakan Tombol Silent!", preferredStyle: .alert)
                    // Create the action
                  
                    let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        self.statusSilentButton = 0
                        print("Silent Button is Problem")
                        self.silentButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getVolumeButton(true)}

                    }
        
        if self.keepDeviceType == "iPad"  {
                                       let notAvailableAction = UIAlertAction(title: "Tidak ada", style: UIAlertAction.Style.default) {
                                           UIAlertAction in
                                        self.statusSilentButton = 1
                                           print("Silent Button is Normal")
                                        self.silentButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getVolumeButton(true)}

                                       }
                                        alertController.addAction(skipAction)
                                       alertController.addAction(notAvailableAction)
                                   }

                    // Add the actions
        else {
            alertController.addAction(skipAction)
        }
                
            //
                    self.present(alertController, animated: true, completion: nil)
                    self.silentCondition = ""
                    
                    // Notify every 2 seconds
                    //        Mute.shared.checkInterval = 2.0
                    
                    // Always notify on interval
                    Mute.shared.alwaysNotify = false
                    
                    Mute.shared.notify = { [weak self] m in
                        //            print(m ? "Muted" : "Not Muted")
                        //            self?.dismiss(animated: true, completion: nil)
                        //            self?.silentButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                        
                        if m && self?.silentSession == true {
                            alertController.dismiss(animated: true, completion: nil)
                            self?.silentCondition = "Muted"
                            
                        }
                        
                        if self?.silentCondition == "Muted" && self?.silentSession == true {
                            
                                let alertController = UIAlertController(title: "Tombol Silent", message: "Gunakan Tombol Silent!", preferredStyle: .alert)
                          
                                let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
                                    UIAlertAction in
                                    self?.statusSilentButton = 0
                                    print("Silent Button is Problem")
                                    self?.silentButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self?.getVolumeButton(true)}

                                }
                            
                            if self?.keepDeviceType == "iPad"  {
                                let notAvailableAction = UIAlertAction(title: "Tidak ada", style: UIAlertAction.Style.default) {
                                    UIAlertAction in
                                    self?.statusSilentButton = 1
                                    print("Silent Button is Normal")
                                    self?.silentButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self?.getVolumeButton(true)}

                                }
                                alertController.addAction(notAvailableAction)
                            }
                            
                            
                                alertController.addAction(skipAction)
                            
                                self?.present(alertController, animated: true, completion: nil)
                            
                        }
                        
                        if !m && self?.silentSession == true {
                            self?.silentCondition = "Not Muted"
                        }
                        
                        
                        if self?.silentCondition == "Not Muted" && self?.silentSession == true {
                                print("Silent Button is Normal")
                                self?.statusSilentButton = 1
                                self?.silentSession = false
                                self?.dismiss(animated: true, completion: nil)
                                self?.silentButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self?.getVolumeButton(true)}
                           
                        }
        
       
            
            
            
            
            
            
        }
        
        // Update label when notification received
       
       
        // Stop after 5 seconds
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
        //            Mute.shared.isPaused = true
        //        }
        
        // Re-start after 10 seconds
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
        //            Mute.shared.isPaused = false
        //        }
       
        
    }
    
    private func getVolumeButton(_ run : Bool) {
        if run == false { return }
        
        
        
        
        
        
        do {
            let audioSession = AVAudioSession()
            try audioSession.setActive(true)
            audioSession.addObserver(self, forKeyPath: "outputVolume", options: NSKeyValueObservingOptions.new, context: nil)
            audioLevel = audioSession.outputVolume
            print(audioLevel)
            if audioLevel == -0.0625 {
                self.up = true
                self.bottom = false
            let alertController = UIAlertController(title: "Tombol Volume", message: "Tekan Tombol Volume atas (jika tidak berhasil, coba kembali)!", preferredStyle: .alert)
            // Create the action
            let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.statusVolumeButton = 0
                print("Volume is Problem")
                self.volumeButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton(true)}
                
            }
            
            // Add the actions
            alertController.addAction(skipAction)
            self.present(alertController, animated: true, completion: nil)
            
               
            }
            else {
                 self.up = false
                self.bottom = true
                let alertController = UIAlertController(title: "Tombol Volume", message: "Tekan Tombol Volume bawah (jika tidak berhasil, coba kembali)!", preferredStyle: .alert)
                // Create the action
                let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.statusVolumeButton = 0
                    print("Volume is Problem")
                    self.volumeButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton(true)}
                    
                }
                
                // Add the actions
                alertController.addAction(skipAction)
                self.present(alertController, animated: true, completion: nil)
        
               
            }
        } catch {
            print("Volume is Problem")
            self.statusVolumeButton = 0
            self.volumeButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton(true)}
        }
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //        if keyPath == "outputVolume" {
        //            print("Volume Button is Normal")
        //             self.statusVolumeButton = 1
        //            dismiss(animated: true, completion: nil)
        //            self.volumeButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
        //            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton()}
        //        }
        //        else if keyPath == "noVolume" {
        //            print("Volume is hold")
        //        }
        if keyPath == "outputVolume"{
            let audioSession = AVAudioSession.sharedInstance()
            
           
                if up == true && bottom == false && volumeSession == true && audioSession.outputVolume > audioLevel {
                    
                    do {print("Volume is Normal")
                        
                        
                        self.dismiss(animated: true, completion: nil)
                        if soundSession == false { try audioSession.setActive(true) }
                        else if soundSession == true { try audioSession.setActive(false) }
                        
                        let alertController = UIAlertController(title: "Tombol Volume", message: "Tekan Tombol Volume bawah (jika tidak berhasil, coba kembali)!", preferredStyle: .alert)
                        // Create the action
                        let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
                            UIAlertAction in
                            self.statusVolumeButton = 0
                            self.volumeSession = false
                            print("Volume is Problem")
                            self.volumeButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton(true)}
                            
                        }
                        bottom = true
                        // Add the actions
                        alertController.addAction(skipAction)
                        self.present(alertController, animated: true, completion: nil) }
                    catch { }
                    
                }
                
                if up == true && bottom == true && volumeSession == true && audioSession.outputVolume < audioLevel {
                    
                    do {print("Volume is Normal")
                        
                        soundSession = true
                        self.statusVolumeButton = 1
                        self.dismiss(animated: true, completion: nil)
                        try audioSession.setActive(false)
                        self.volumeButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton(true)}
                        
                    }
                    catch { }
                    
                }
            
            if up == false && bottom == true && volumeSession == true && audioSession.outputVolume < audioLevel {
                
                do {print("Volume is Normal")
                    
                    
                    self.dismiss(animated: true, completion: nil)
                    if soundSession == false { try audioSession.setActive(true) }
                    else if soundSession == true { try audioSession.setActive(false) }
                    
                    let alertController = UIAlertController(title: "Tombol Volume", message: "Tekan Tombol Volume atas (jika tidak berhasil, coba kembali)!", preferredStyle: .alert)
                    // Create the action
                    let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
                        UIAlertAction in
                        self.statusVolumeButton = 0
                        self.volumeSession = false
                        print("Volume is Problem")
                        self.volumeButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton(true)}
                        
                    }
                    bottom = false
                    // Add the actions
                    alertController.addAction(skipAction)
                    self.present(alertController, animated: true, completion: nil) }
                catch { }
                
            }
            
            if up == false && bottom == false && volumeSession == true && audioSession.outputVolume > audioLevel {
                
                do {print("Volume is Normal")
                    
                    soundSession = true
                    self.statusVolumeButton = 1
                    self.dismiss(animated: true, completion: nil)
                    try audioSession.setActive(false)
                    self.volumeButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.getPowerButton(true)}
                    
                }
                catch { }
                
            }
            
            
            
            
            audioLevel = audioSession.outputVolume
            print(audioSession.outputVolume)
            
        }
    }
    
    func getPowerButton(_ run : Bool) {
        if run == false { return }
        // Create the alert controller
        
        let alertController = UIAlertController(title: "Tombol Power", message: "Tekan Tombol Power!", preferredStyle: .alert)
        let notificationCenter1 = NotificationCenter.default
        notificationCenter1.addObserver(self, selector: #selector(isPowerButton), name: UIApplication.didEnterBackgroundNotification, object: nil)
        // Create the action
        let skipAction = UIAlertAction(title: "Lewati", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.statusPowerButton = 0
            print("Power Button is Problem")
            self.powerButton.setGradientBackground(colorOne: Colors.red, colorTwo: Colors.red)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {self.performSegue(withIdentifier: "TestOneData", sender: self)}
            
        }
        
        // Add the actions
        alertController.addAction(skipAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func isPowerButton() {
        statusPowerButton = 1
        self.dismiss(animated: true, completion: nil)
        powerButton.setGradientBackground(colorOne: Colors.green, colorTwo: Colors.green)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {self.performSegue(withIdentifier: "TestOneData", sender: self)}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.getCPU(false)
        self.getHardDisk(false)
        self.getBattery(false)
        self.getJailbreak(false)
        self.getMemory(false)
        self.getWifiBluetooth(false)
        self.getSimcard(false)
        self.getSilentButton(false)
        self.getVolumeButton(false)
        self.getPowerButton(false)
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
        self.volumeSession = false
        self.silentSession = false
        let touchScreenTest = segue.destination as! TouchScreenTest
        touchScreenTest.keepTag = self.keepTag
        touchScreenTest.keepDeviceType = self.keepDeviceType
        touchScreenTest.keepModelName = self.keepModelName
        touchScreenTest.keepHardDisk = self.keepHardDisk
        touchScreenTest.keepOriginal = self.keepOriginal
        touchScreenTest.keepGrade = self.keepGrade
        //        touchScreenTest.keepPrice = self.keepPrice
        touchScreenTest.statusCPU = self.statusCPU
        touchScreenTest.statusHardDisk = self.statusHardDisk
        touchScreenTest.statusBattery = self.statusBattery
        touchScreenTest.statusJailbreak = self.statusJailbreak
        touchScreenTest.statusMemory = self.statusMemory
        touchScreenTest.statusWifiBluetooth = self.statusWifiBluetooth
        touchScreenTest.statusSimcard = self.statusSimcard
        touchScreenTest.statusSilentButton = self.statusSilentButton
        touchScreenTest.statusVolumeButton = self.statusVolumeButton
        touchScreenTest.statusPowerButton = self.statusPowerButton
        touchScreenTest.basePrice = self.basePrice
        
        
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

