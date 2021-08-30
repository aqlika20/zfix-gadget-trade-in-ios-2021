//
//  SpeakerTest.swift
//  Device
//
//  Created by Mery Sartika on 21/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class SpeakerTest: UIViewController {
    
    @IBOutlet weak var s100hz: UIButton!
    @IBOutlet weak var s250hz: UIButton!
    @IBOutlet weak var s440hz: UIButton!
    @IBOutlet weak var s1khz: UIButton!
    @IBOutlet weak var s10khz: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    var run = true
    
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
    var statusSpeakerEarpiece = 0
    
    var basePrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
       MPVolumeView.setVolume(0.5)

        
        
            self.audio100hz()
        
        
    }
    
    func audio100hz() {
        if !run { return }
        
        do {
            guard let sound100hz = Bundle.main.path(forResource: "100Hz_44100Hz_16bit_05sec", ofType: "mp3", inDirectory: "audio") else { return }
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try? audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: sound100hz) as URL)
            if run == true {
                audioPlayer?.volume = 1.0
                audioPlayer?.play()
            s100hz.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.audioPlayer?.stop()
                    self.audio250hz()}
                
            }
           
            let audioSession = AVAudioSession()
            do {
                try audioSession.setActive(false)
                audioSession.addObserver(self, forKeyPath: "nothing", options: NSKeyValueObservingOptions.new, context: nil)
            } catch {
                let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                    self.run = false
                    self.statusSpeakerEarpiece = 0
                    self.performSegue(withIdentifier: "TestFourData", sender: self)
                }
                alert.addAction(okBtn)
                self.present(alert, animated: true, completion: nil)
                print("Speaker / Earpiece is Problem")
            }
          
            
        }
        catch{
           
        }
        
    }
    
    
    
    
    func audio250hz() {
        do {
            guard let sound250hz = Bundle.main.path(forResource: "250Hz_44100Hz_16bit_05sec", ofType: "mp3", inDirectory: "audio") else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                self.audio440hz()}
                return
                
            }
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: sound250hz) as URL)
            if run == true
            {
                audioPlayer?.volume = 1.0
                audioPlayer?.play()
            s250hz.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.audioPlayer?.stop()
                    self.audio440hz()} }
        }
        catch{
            let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.run = false
                self.statusSpeakerEarpiece = 0
                self.performSegue(withIdentifier: "TestFourData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            print("Speaker / Earpiece is Problem")
        }
        
    }
    
    func audio440hz() {
        do {
            guard let sound440hz = Bundle.main.path(forResource: "440Hz_44100Hz_16bit_05sec", ofType: "mp3", inDirectory: "audio") else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                
                self.audio1khz()}
                return
                
            }
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: sound440hz) as URL)
            if run == true {
                audioPlayer?.volume = 1.0
                audioPlayer?.play()
            s440hz.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.audioPlayer?.stop()
                    self.audio1khz()} }
        }
        catch{
            let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.run = false
                self.statusSpeakerEarpiece = 0
                self.performSegue(withIdentifier: "TestFourData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            print("Speaker / Earpiece is Problem")
        }
        
    }
    
    func audio1khz() {
        
        do {
            guard let sound1khz = Bundle.main.path(forResource: "1kHz_44100Hz_16bit_05sec", ofType: "mp3", inDirectory: "audio") else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                   
                                   self.audio10khz()}
                return
                
            }
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: sound1khz) as URL)
            if run == true {
                audioPlayer?.volume = 1.0
                audioPlayer?.play()
            s1khz.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.audioPlayer?.stop()
                    self.audio10khz()} }
        }
        catch{
            let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.run = false
                self.statusSpeakerEarpiece = 0
                self.performSegue(withIdentifier: "TestFourData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            print("Speaker / Earpiece is Problem")
        }
        
    }
    
    func audio10khz() {
        do {
            guard let sound10khz = Bundle.main.path(forResource: "10kHz_44100Hz_16bit_05sec", ofType: "mp3", inDirectory: "audio") else {
                
                    let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                        self.statusSpeakerEarpiece = 0
                        self.performSegue(withIdentifier: "TestFourData", sender: self)
                    }
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                    print("Speaker / Earpiece is Problem")
                    //                self.deletedArr.removeAll()
                    //                self.collectionView.reloadData()
                
                return
                
            }
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: sound10khz) as URL)
            if run == true {
                audioPlayer?.volume = 1.0
                audioPlayer?.play()
            s10khz.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.blue)
         
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.audioPlayer?.stop()
                let alert1 = UIAlertController(title: "Apakah Speaker / Earpiece normal?", message: nil, preferredStyle: .alert)
                let yes = UIAlertAction(title: "Ya", style: .default) { action in
                    let alert = UIAlertController(title: "Speaker / Earpiece normal.", message: nil, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                        self.statusSpeakerEarpiece = 1
                        self.performSegue(withIdentifier: "TestFourData", sender: self)
                    }
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                    print("Speaker / Earpiece is Normal")
                }
                let no = UIAlertAction(title: "Tidak", style: .default) { action in
                    
                    let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                        self.statusSpeakerEarpiece = 0
                        self.performSegue(withIdentifier: "TestFourData", sender: self)
                    }
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                    print("Speaker / Earpiece is Problem")
                    //                self.deletedArr.removeAll()
                    //                self.collectionView.reloadData()
                }
                
                alert1.addAction(yes)
                alert1.addAction(no)
                self.present(alert1, animated: true, completion: nil)
               
                
            }
        }
            
        }
        catch{
            let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.run = false
                self.statusSpeakerEarpiece = 0
                self.performSegue(withIdentifier: "TestFourData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            print("Speaker / Earpiece is Problem")
        }
    }
    

    @IBAction func skippButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Speaker / Earpiece bermasalah.", message: nil, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
            self.run = false
            self.statusSpeakerEarpiece = 0
            self.performSegue(withIdentifier: "TestFourData", sender: self)
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
        print("Speaker / Earpiece is Problem")
//        self.keepPrice = self.keepPrice - self.minusPrice
//        print(self.minusPrice)
//        print(self.keepPrice)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let shakeTest = segue.destination as! ShakeTest
        shakeTest.keepTag = self.keepTag
        shakeTest.keepDeviceType = self.keepDeviceType
        shakeTest.keepModelName = self.keepModelName
        shakeTest.keepHardDisk = self.keepHardDisk
        shakeTest.keepOriginal = self.keepOriginal
        shakeTest.keepGrade = self.keepGrade
//        shakeTest.keepPrice = self.keepPrice
//        shakeTest.minusPrice = Int(self.reMinusPrice) ?? 0
        shakeTest.statusCPU = self.statusCPU
        shakeTest.statusHardDisk = self.statusHardDisk
        shakeTest.statusBattery = self.statusBattery
        shakeTest.statusJailbreak = self.statusJailbreak
        shakeTest.statusMemory = self.statusMemory
        shakeTest.statusWifiBluetooth = self.statusWifiBluetooth
        shakeTest.statusSimcard = self.statusSimcard
        shakeTest.statusSilentButton = self.statusSilentButton
        shakeTest.statusVolumeButton = self.statusVolumeButton
        shakeTest.statusPowerButton = self.statusPowerButton
        shakeTest.statusTouchScreen = self.statusTouchScreen
        shakeTest.statusBackCamera = self.statusBackCamera
        shakeTest.statusFrontCamera = self.statusFrontCamera
        shakeTest.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        shakeTest.basePrice = self.basePrice
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
