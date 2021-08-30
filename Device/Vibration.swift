//
//  Vibration.swift
//  Device
//
//  Created by Mery Sartika on 14/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import AVFoundation

extension UIDevice {
    static func vibrate1() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
class Vibration: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func vibrationfunc(_ sender: UIButton) {
        UIDevice.vibrate1()
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
