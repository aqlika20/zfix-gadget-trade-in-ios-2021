//
//  LCDCheck.swift
//  Device
//
//  Created by Mery Sartika on 08/07/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class LCDCheck: UIViewController {

    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
    
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
    
    var statusLCD = 0
    
    var basePrice = ""
    
    @IBOutlet weak var normal: UIButton!
    @IBOutlet weak var broken: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        normal.titleLabel?.textAlignment = NSTextAlignment.center
        broken.titleLabel?.textAlignment = NSTextAlignment.center
        // Do any additional setup after loading the view.
    }
    
    @IBAction func normal(_ sender: Any) {
        statusLCD = 1
        performSegue(withIdentifier: "LCDCheckData", sender: self)
    }
    
    @IBAction func problem(_ sender: Any) {
        statusLCD = 0
        performSegue(withIdentifier: "LCDCheckData", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let touchIDfaceIDCheck = segue.destination as! TouchIDFaceIDCheck
        touchIDfaceIDCheck.keepTag = self.keepTag
        touchIDfaceIDCheck.keepDeviceType = self.keepDeviceType
        touchIDfaceIDCheck.keepModelName = self.keepModelName
        touchIDfaceIDCheck.keepHardDisk = self.keepHardDisk
        touchIDfaceIDCheck.keepOriginal = self.keepOriginal
        touchIDfaceIDCheck.keepGrade = self.keepGrade
        touchIDfaceIDCheck.statusCPU = self.statusCPU
        touchIDfaceIDCheck.statusHardDisk = self.statusHardDisk
        touchIDfaceIDCheck.statusBattery = self.statusBattery
        touchIDfaceIDCheck.statusJailbreak = self.statusJailbreak
        touchIDfaceIDCheck.statusMemory = self.statusMemory
        touchIDfaceIDCheck.statusWifiBluetooth = self.statusWifiBluetooth
        touchIDfaceIDCheck.statusSimcard = self.statusSimcard
        touchIDfaceIDCheck.statusSilentButton = self.statusSilentButton
        touchIDfaceIDCheck.statusVolumeButton = self.statusVolumeButton
        touchIDfaceIDCheck.statusPowerButton = self.statusPowerButton
        touchIDfaceIDCheck.statusTouchScreen = self.statusTouchScreen
        touchIDfaceIDCheck.statusBackCamera = self.statusBackCamera
        touchIDfaceIDCheck.statusFrontCamera = self.statusFrontCamera
        touchIDfaceIDCheck.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        touchIDfaceIDCheck.statusShake = self.statusShake
        touchIDfaceIDCheck.statusVibration = self.statusVibration
        touchIDfaceIDCheck.statusFlashlight = self.statusFlashlight
        touchIDfaceIDCheck.statusDisplay = self.statusDisplay
        touchIDfaceIDCheck.statusLocationGPS = self.statusLocationGPS
        touchIDfaceIDCheck.statusLCD = self.statusLCD
        touchIDfaceIDCheck.basePrice = self.basePrice
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
}
