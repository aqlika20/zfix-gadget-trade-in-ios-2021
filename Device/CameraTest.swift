//
//  CameraTest.swift
//  Device
//
//  Created by Mery Sartika on 21/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import AVFoundation

class CameraTest: UIViewController {

    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var passButton: UIButton!
    
    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
//    var keepPrice = 0
//    var minusPrice = 0
//    var reMinusPrice = ""
    
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
    
    var basePrice = ""
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer : AVCaptureVideoPreviewLayer?
    var frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    var backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
//        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        
//        let request = NSMutableURLRequest(url: NSURL(string: "https://ifixnstore.id/trade-in-app/get-speaker-price.php") as! URL)
//        request.httpMethod = "POST"
//        let postString = "modelName="+keepModelName
//        print(postString)
//        request.httpBody = postString.data(using: .utf8)
//        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
//            guard let data = data, error == nil else {
//                print("error=\(error)")
//                return
//            }
//            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
//            let priceBase =  responseString!
//            self.reMinusPrice = priceBase.replacingOccurrences(of: "\"", with: "")
//            
//        }
//        task.resume()
        
        if #available(iOS 10.2, *)
        {
            guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            
                return
            }
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
                guard let currentCameraInput: AVCaptureInput = captureSession?.inputs.first else {
                    return
                }
                
                
                    if let input = currentCameraInput as? AVCaptureDeviceInput {
                        if input.device.position == .back {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                let alert1 = UIAlertController(title: "Apakah Kamera belakang normal?", message: nil, preferredStyle: .alert)
                                let yes = UIAlertAction(title: "Ya", style: .default) { action in
                                    let alert = UIAlertController(title: "Kamera belakang normal.", message: nil, preferredStyle: .alert)
                                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                                        self.statusBackCamera = 1
                                        self.switchToFrontCamera()
                                    }
                                    alert.addAction(okBtn)
                                    self.present(alert, animated: true, completion: nil)
                                    print("Back Camera is Normal")
                                }
                                let no = UIAlertAction(title: "Tidak", style: .default) { action in
                                    let alert = UIAlertController(title: "Kamera belakang bermasalah.", message: nil, preferredStyle: .alert)
                                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                                        self.statusBackCamera = 0
                                        self.switchToFrontCamera()
                                    }
                                    alert.addAction(okBtn)
                                    self.present(alert, animated: true, completion: nil)
                                    print("Back Camera is Problem")
                                    //                self.deletedArr.removeAll()
                                    //                self.collectionView.reloadData()
                                }
                                alert1.addAction(yes)
                                alert1.addAction(no)
                                self.present(alert1, animated: true, completion: nil)
                            
                            }
                        }
//                        else if input.device.position == .front {
//
//                        }
                        
                    }
                
            }
            catch {
                print("Back Camera is Problem")
                self.statusBackCamera = 0
//                self.keepPrice = self.keepPrice - self.minusPrice
//                print(self.minusPrice)
//                print(self.keepPrice)
                self.performSegue(withIdentifier: "TestThreeData", sender: self)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func switchToFrontCamera() {
        if frontCamera?.isConnected == true {
            captureSession?.stopRunning()
            guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
                return
            }
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                captureSession = AVCaptureSession()
                captureSession?.addInput(input)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                videoPreviewLayer?.frame = view.layer.bounds
                cameraView.layer.addSublayer(videoPreviewLayer!)
                captureSession?.startRunning()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    let alert1 = UIAlertController(title: "Apakah Kamera depan normal?", message: nil, preferredStyle: .alert)
                    let yes = UIAlertAction(title: "Ya", style: .default) { action in
                        let alert = UIAlertController(title: "Kamera depan normal.", message: nil, preferredStyle: .alert)
                        let okBtn = UIAlertAction(title:  "Ok", style: .default) { action in
                            self.statusFrontCamera = 1
                            self.performSegue(withIdentifier: "TestThreeData", sender: self)
                        }
                        alert.addAction(okBtn)
                        self.present(alert, animated: true, completion: nil)
                        print("Front Camera is Normal")
                    }
                    let no = UIAlertAction(title: "Tidak", style: .default) { action in
                        
                        let alert = UIAlertController(title: "Kamera depan bermasalah.", message: nil, preferredStyle: .alert)
                        let okBtn = UIAlertAction(title:  "Ok", style: .default) { action in
                            self.statusFrontCamera = 0
                            self.performSegue(withIdentifier: "TestThreeData", sender: self)
                        }
                        alert.addAction(okBtn)
                        self.present(alert, animated: true, completion: nil)
                        print("Front Camera is Problem")
                        //                self.deletedArr.removeAll()
                        //                self.collectionView.reloadData()
                    }
                    alert1.addAction(yes)
                    alert1.addAction(no)
                    self.present(alert1, animated: true, completion: nil)
                    
                }
                
                
            }
            catch {
                print("Front Camera is Problem")
                self.statusFrontCamera = 0
                //                self.keepPrice = self.keepPrice - self.minusPrice
                //                print(self.minusPrice)
                //                print(self.keepPrice)
                self.performSegue(withIdentifier: "TestThreeData", sender: self)

            }
        }
    }
    
//    @IBAction func passButton(_ sender: UIButton) {
//        guard let currentCameraInput: AVCaptureInput = captureSession?.inputs.first else {
//            return
//        }
//
//        if let input = currentCameraInput as? AVCaptureDeviceInput {
//            if input.device.position == .back {
//                let alert = UIAlertController(title: "Back Camera is Normal", message: nil, preferredStyle: .alert)
//                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
//                    self.switchToFrontCamera()
//                }
//                alert.addAction(okBtn)
//                self.present(alert, animated: true, completion: nil)
//                print("Back Camera is Normal")
//
//            }
//            if input.device.position == .front {
//                let alert = UIAlertController(title: "Front Camera is Normal", message: nil, preferredStyle: .alert)
//                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
//                    self.statusCamera = 1
//                    self.performSegue(withIdentifier: "TestThreeData", sender: self)
//                }
//                alert.addAction(okBtn)
//                self.present(alert, animated: true, completion: nil)
//                print("Front Camera is Normal")
//
//            }
//
//        }
//    }
    
//    @IBAction func skipButton(_ sender: UIButton) {
//        guard let currentCameraInput: AVCaptureInput = captureSession?.inputs.first else {
//            return
//        }
//
//        if let input = currentCameraInput as? AVCaptureDeviceInput {
//            if input.device.position == .back {
//                let alert = UIAlertController(title: "Back Camera is Problem", message: nil, preferredStyle: .alert)
//                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
//                    self.switchToFrontCamera()
//                }
//                alert.addAction(okBtn)
//                self.present(alert, animated: true, completion: nil)
//                print("Back Camera is Problem")
//                passButton.isEnabled = false
//            }
//            if input.device.position == .front {
//
//                let alert = UIAlertController(title: "Front Camera is Problem", message: nil, preferredStyle: .alert)
//                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
//                    self.statusCamera = 0
//                    self.keepPrice = self.keepPrice - self.minusPrice
//                    print(self.minusPrice)
//                    print(self.keepPrice)
//                    self.performSegue(withIdentifier: "TestThreeData", sender: self)
//
//                }
//                alert.addAction(okBtn)
//                self.present(alert, animated: true, completion: nil)
//                print("Front Camera is Problem")
//
//            }
//
//
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let speakerTest = segue.destination as! SpeakerTest
        speakerTest.keepTag = self.keepTag
        speakerTest.keepDeviceType = self.keepDeviceType
        speakerTest.keepModelName = self.keepModelName
        speakerTest.keepHardDisk = self.keepHardDisk
        speakerTest.keepOriginal = self.keepOriginal
        speakerTest.keepGrade = self.keepGrade
//        speakerTest.keepPrice = self.keepPrice
//        speakerTest.minusPrice = Int(self.reMinusPrice) ?? 0
        speakerTest.statusCPU = self.statusCPU
        speakerTest.statusHardDisk = self.statusHardDisk
        speakerTest.statusBattery = self.statusBattery
        speakerTest.statusJailbreak = self.statusJailbreak
        speakerTest.statusMemory = self.statusMemory
        speakerTest.statusWifiBluetooth = self.statusWifiBluetooth
        speakerTest.statusSimcard = self.statusSimcard
        speakerTest.statusSilentButton = self.statusSilentButton
        speakerTest.statusVolumeButton = self.statusVolumeButton
        speakerTest.statusPowerButton = self.statusPowerButton
        speakerTest.statusTouchScreen = self.statusTouchScreen
        speakerTest.statusBackCamera = self.statusBackCamera
        speakerTest.statusFrontCamera = self.statusFrontCamera
        speakerTest.basePrice = self.basePrice
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) != nil else {

                let alert = UIAlertController(title: "Back Camera is Problem", message: nil, preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                    self.statusBackCamera = 0
                    switchToFrontCameraCheck()
                }
                alert.addAction(okBtn)
                self.present(alert, animated: true, completion: nil)
                print("Back Camera is Problem")

            return
        }
        
        guard AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) != nil else {

                let alert = UIAlertController(title: "Front Camera is Problem", message: nil, preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                    self.statusFrontCamera = 0
                    self.cameraView.isHidden = true
                    self.performSegue(withIdentifier: "TestThreeData", sender: self)
                }
                alert.addAction(okBtn)
                self.present(alert, animated: true, completion: nil)
                print("Back Camera is Problem")

            return
        }

        func switchToFrontCameraCheck() {
            guard AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) != nil else {

                    let alert = UIAlertController(title: "Front Camera is Problem", message: nil, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                        self.statusFrontCamera = 0
                        self.cameraView.isHidden = true
                        self.performSegue(withIdentifier: "TestThreeData", sender: self)
                    }
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                    print("Front Camera is Problem")

                return
            }
            switchToFrontCamera()
        }
        
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
