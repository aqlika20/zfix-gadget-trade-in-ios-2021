//
//  LocationGPSTest.swift
//  Device
//
//  Created by Mery Sartika on 20/05/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit
import MapKit

class LocationGPSTest: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    @IBOutlet weak var map: MKMapView!
    
    var keepTag = ""
    var keepDeviceType = ""
    var keepModelName = ""
    var keepHardDisk = ""
    var keepOriginal = ""
    var keepGrade = ""
//    var keepPrice = 0
//    var minusPrice = 0
//    var reMinusPrice = ""
    
    var run = true
    
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
    
    override func viewDidLoad() {
        UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        super.viewDidLoad()
        map.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()
        
        do {
       
        
        if CLLocationManager.locationServicesEnabled() {
            if run == false { return }
            try locationManager.delegate = self
            try locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            try locationManager.startUpdatingLocation()
            
        
        }
        }
        catch {
            let alert = UIAlertController(title: "Lokasi GPS bermasalah.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                self.statusLocationGPS = 0
                //                    self.keepPrice = self.keepPrice - self.minusPrice
                //                    print(self.minusPrice)
                //                    print(self.keepPrice)
                self.performSegue(withIdentifier: "TestEndData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
        }
        
        
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let locValue:CLLocationCoordinate2D = manager.location?.coordinate else {
              let alert = UIAlertController(title: "Lokasi GPS bermasalah.", message: nil, preferredStyle: .alert)
                            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                                self.statusLocationGPS = 0
            //                    self.keepPrice = self.keepPrice - self.minusPrice
            //                    print(self.minusPrice)
            //                    print(self.keepPrice)
                                self.run = false
                                self.performSegue(withIdentifier: "TestEndData", sender: self)
                            }
                            alert.addAction(okBtn)
                            self.present(alert, animated: true, completion: nil)
            return
        }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let alert1 = UIAlertController(title: "Apakah Lokasi GPS normal?", message: nil, preferredStyle: .alert)
        let yes = UIAlertAction(title: "Ya", style: .default) { action in
            let alert = UIAlertController(title: "Lokasi GPS normal.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                //                self.deletedArr.removeAll()
                //                self.collectionView.reloadData()
                self.statusLocationGPS = 1
                self.performSegue(withIdentifier: "TestEndData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            print("Location / GPS is Normal")
        }
        let no = UIAlertAction(title: "Tidak", style: .default) { action in
            
            let alert = UIAlertController(title: "Lokasi GPS bermasalah.", message: nil, preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "Ok", style: .default) { action in
                //                self.deletedArr.removeAll()
                //                self.collectionView.reloadData()
                self.statusLocationGPS = 0
                self.performSegue(withIdentifier: "TestEndData", sender: self)
            }
            alert.addAction(okBtn)
            self.present(alert, animated: true, completion: nil)
            print("Location / GPS is Problem")
            //                self.deletedArr.removeAll()
            //                self.collectionView.reloadData()
        }
        alert1.addAction(yes)
        alert1.addAction(no)
        self.present(alert1, animated: true, completion: nil)
        let userLocation = locations.last
        let viewRegion = MKCoordinateRegion(center: (userLocation?.coordinate)!, latitudinalMeters: 600, longitudinalMeters: 600)
        self.map.setRegion(viewRegion, animated: true)
        //
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.run = false
        let testEnd = segue.destination as! TestEnd
        testEnd.keepTag = self.keepTag
        testEnd.keepDeviceType = self.keepDeviceType
        testEnd.keepModelName = self.keepModelName
        testEnd.keepHardDisk = self.keepHardDisk
        testEnd.keepOriginal = self.keepOriginal
        testEnd.keepGrade = self.keepGrade
//        testEnd.keepPrice = self.keepPrice
        testEnd.statusCPU = self.statusCPU
        testEnd.statusHardDisk = self.statusHardDisk
        testEnd.statusBattery = self.statusBattery
        testEnd.statusJailbreak = self.statusJailbreak
        testEnd.statusMemory = self.statusMemory
        testEnd.statusWifiBluetooth = self.statusWifiBluetooth
        testEnd.statusSimcard = self.statusSimcard
        testEnd.statusSilentButton = self.statusSilentButton
        testEnd.statusVolumeButton = self.statusVolumeButton
        testEnd.statusPowerButton = self.statusPowerButton
        testEnd.statusTouchScreen = self.statusTouchScreen
        testEnd.statusBackCamera = self.statusBackCamera
        testEnd.statusFrontCamera = self.statusFrontCamera
        testEnd.statusSpeakerEarpiece = self.statusSpeakerEarpiece
        testEnd.statusShake = self.statusShake
        testEnd.statusVibration = self.statusVibration
        testEnd.statusFlashlight = self.statusFlashlight
        testEnd.statusDisplay = self.statusDisplay
        testEnd.statusLocationGPS = self.statusLocationGPS
        testEnd.basePrice = self.basePrice
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
