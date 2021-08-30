//
//  TestEnd.swift
//  Device
//
//  Created by Mery Sartika on 27/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class TestEnd: UIViewController {

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
    var statusTouchScreen = 0
    var statusBackCamera = 0
    var statusFrontCamera = 0
    var statusSpeakerEarpiece = 0
    var statusShake = 0
    var statusVibration = 0
    var statusFlashlight = 0
    var statusDisplay = 0
    var statusLocationGPS = 0
    
    var basePrice = ""
    
    
    
    @IBOutlet weak var cpu: UIButton!
    @IBOutlet weak var hardDisk: UIButton!
    @IBOutlet weak var battery: UIButton!
    @IBOutlet weak var jailbreak: UIButton!
    @IBOutlet weak var memory: UIButton!
    @IBOutlet weak var wifi: UIButton!
    @IBOutlet weak var simcard: UIButton!
    @IBOutlet weak var silentButton: UIButton!
    @IBOutlet weak var volumeButton: UIButton!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var touchScreen: UIButton!
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var speaker: UIButton!
    @IBOutlet weak var shake: UIButton!
    @IBOutlet weak var vibration: UIButton!
    @IBOutlet weak var flashlight: UIButton!
    @IBOutlet weak var display: UIButton!
    @IBOutlet weak var location: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        silentButton.titleLabel?.textAlignment = NSTextAlignment.center
        volumeButton.titleLabel?.textAlignment = NSTextAlignment.center
        powerButton.titleLabel?.textAlignment = NSTextAlignment.center
        touchScreen.titleLabel?.textAlignment = NSTextAlignment.center
        display.titleLabel?.textAlignment = NSTextAlignment.center
        speaker.titleLabel?.textAlignment = NSTextAlignment.center
        wifi.titleLabel?.textAlignment = NSTextAlignment.center
        cpu.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        hardDisk.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        battery.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        jailbreak.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        memory.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        wifi.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        simcard.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        silentButton.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        volumeButton.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        powerButton.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        touchScreen.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        camera.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        speaker.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        shake.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        vibration.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        flashlight.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        display.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        location.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
        
        print(statusCPU)
        print(statusHardDisk)
        print(statusBattery)
        print(statusJailbreak)
        print(statusMemory)
        print(statusWifiBluetooth)
        print(statusSilentButton)
        print(statusVolumeButton)
        print(statusPowerButton)
        print(statusTouchScreen)
        print(statusBackCamera)
        print(statusFrontCamera)
        print(statusSpeakerEarpiece)
        print(statusShake)
        print(statusVibration)
        print(statusFlashlight)
        print(statusDisplay)
        print(statusLocationGPS)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func TestEnd(_ sender: UIButton) {
        performSegue(withIdentifier: "TestEndData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let LCDCheck = segue.destination as! LCDCheck
        LCDCheck.keepTag = self.keepTag
        LCDCheck.keepDeviceType = self.keepDeviceType
        LCDCheck.keepModelName = self.keepModelName
        LCDCheck.keepHardDisk = self.keepHardDisk
        LCDCheck.keepOriginal = self.keepOriginal
        LCDCheck.keepGrade = self.keepGrade
        LCDCheck.statusCPU = self.statusCPU
        LCDCheck.statusHardDisk = self.statusHardDisk
        LCDCheck.statusBattery = self.statusBattery
        LCDCheck.statusJailbreak = self.statusJailbreak
        LCDCheck.statusMemory = self.statusMemory
        LCDCheck.statusWifiBluetooth = self.statusWifiBluetooth
        LCDCheck.statusSimcard = self.statusSimcard
        LCDCheck.statusSilentButton = self.statusSilentButton
        LCDCheck.statusVolumeButton = self.statusVolumeButton
        LCDCheck.statusPowerButton = self.statusPowerButton
        LCDCheck.statusTouchScreen = self.statusTouchScreen
        LCDCheck.statusBackCamera = self.statusBackCamera
        LCDCheck.statusFrontCamera = self.statusFrontCamera
        LCDCheck.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        LCDCheck.statusShake = self.statusShake
        LCDCheck.statusVibration = self.statusVibration
        LCDCheck.statusFlashlight = self.statusFlashlight
        LCDCheck.statusDisplay = self.statusDisplay
        LCDCheck.statusLocationGPS = self.statusLocationGPS
        LCDCheck.basePrice = self.basePrice
//        let physicalCheck = segue.destination as! PhysicalCheck
//        physicalCheck.keepDeviceType = self.keepDeviceType
//        physicalCheck.keepModelName = self.keepModelName
//        physicalCheck.keepHardDisk = self.keepHardDisk
//        physicalCheck.keepOriginal = self.keepOriginal
//        physicalCheck.keepGrade = self.keepGrade
//        physicalCheck.statusCPU = self.statusCPU
//        physicalCheck.statusHardDisk = self.statusHardDisk
//        physicalCheck.statusBattery = self.statusBattery
//        physicalCheck.statusJailbreak = self.statusJailbreak
//        physicalCheck.statusMemory = self.statusMemory
//        physicalCheck.statusWifi = self.statusWifi
//        physicalCheck.statusSimcard = self.statusSimcard
//        physicalCheck.statusSilentButton = self.statusSilentButton
//        physicalCheck.statusVolumeButton = self.statusVolumeButton
//        physicalCheck.statusPowerButton = self.statusPowerButton
//        physicalCheck.statusTouchScreen = self.statusTouchScreen
//        physicalCheck.statusBackCamera = self.statusBackCamera
//        physicalCheck.statusFrontCamera = self.statusBackCamera
//        physicalCheck.statusSpeaker = self.statusSpeaker
//        physicalCheck.statusShake = self.statusShake
//        physicalCheck.statusVibration = self.statusVibration
//        physicalCheck.statusFlashlight = self.statusFlashlight
//        physicalCheck.statusDisplay = self.statusDisplay
//        physicalCheck.statusLocationGPS = self.statusLocationGPS
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
