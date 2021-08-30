//
//  Flashlight.swift
//  Device
//
//  Created by Mery Sartika on 14/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import AVFoundation
extension AVCaptureDevice {
    var isLocked: Bool {
        do {
            try lockForConfiguration()
            return true
        } catch {
            print(error)
            return false
        }
    }
    func setTorch(intensity: Float) {
        guard hasTorch && isLocked else { return }
        defer { unlockForConfiguration() }
        if intensity > 0 {
            if torchMode == .off {
                torchMode = .on
            }
            do {
                try setTorchModeOn(level: intensity)
            } catch {
                print(error)
            }
        } else {
            torchMode = .off
        }
    }
//    func setTorchOff() {
//        guard hasTorch && isLocked else { return }
//        defer { unlockForConfiguration() }
//            torchMode = .off
//
//    }
}

class Flashlight: UIViewController {

    var device: AVCaptureDevice!
    override func viewDidLoad() {
        super.viewDidLoad()
        device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified)
    }
    
    @IBAction func flashlighfunc(_ sender: UISlider) {
        device.setTorch(intensity: sender.value)
    }
    
    @IBAction func flashlightback(_ sender: UIButton) {
        device.setTorch(intensity: 0)
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
