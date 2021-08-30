//
//  TestStart.swift
//  Device
//
//  Created by Mery Sartika on 17/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import MediaPlayer
import SystemConfiguration
import Foundation
import AVFoundation
import AVKit



class TestStart: UIViewController {
  
    
    @IBOutlet weak var cpu: UIButton!
    @IBOutlet weak var hardDisk: UIButton!
    @IBOutlet weak var battery: UIButton!
    @IBOutlet weak var jailbreak: UIButton!
    @IBOutlet weak var touchScreen: UIButton!
    @IBOutlet weak var memory: UIButton!
    @IBOutlet weak var silenceButton: UIButton!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var volumeButton: UIButton!
    @IBOutlet weak var wifi: UIButton!
    @IBOutlet weak var simcard: UIButton!
    @IBOutlet weak var camera: UIButton!
    @IBOutlet weak var speaker: UIButton!
    @IBOutlet weak var shake: UIButton!
    @IBOutlet weak var vibration: UIButton!
    @IBOutlet weak var flashlight: UIButton!
    @IBOutlet weak var locationGPS: UIButton!
    @IBOutlet weak var display: UIButton!
    
    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
    
    var basePrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        silenceButton.titleLabel?.textAlignment = NSTextAlignment.center
        volumeButton.titleLabel?.textAlignment = NSTextAlignment.center
        powerButton.titleLabel?.textAlignment = NSTextAlignment.center
        touchScreen.titleLabel?.textAlignment = NSTextAlignment.center
        display.titleLabel?.textAlignment = NSTextAlignment.center
        speaker.titleLabel?.textAlignment = NSTextAlignment.center
        wifi.titleLabel?.textAlignment = NSTextAlignment.center
    
    }
    
   

    
    @IBAction func TestStart(_ sender: UIButton) {
        let alert1 = UIAlertController(title: "Saat anda memulai, tes tidak dapat dibatalkan.", message: nil, preferredStyle: .alert)
        let yesBtn1 = UIAlertAction(title: "Mulai", style: .default) { action in
            self.performSegue(withIdentifier: "TestStartData", sender: self)
        }
        let noBtn1 = UIAlertAction(title: "Batal", style: .default) { action in
            
        }
        alert1.addAction(yesBtn1)
        alert1.addAction(noBtn1)
        self.present(alert1, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let general = segue.destination as! General
        general.keepTag = self.keepTag
        general.keepDeviceType = self.keepDeviceType
        general.keepModelName = self.keepModelName
        general.keepHardDisk = self.keepHardDisk
        general.keepOriginal = self.keepOriginal
        general.keepGrade = self.keepGrade
        general.basePrice = self.basePrice
//        general.keepPrice = self.keepPrice
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
