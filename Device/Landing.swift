//
//  Landing.swift
//  Device
//
//  Created by Mery Sartika on 14/06/19.
//  Copyright © 2019 MTA. All rights reserved.
//

import UIKit

class Landing: UIViewController {

    @IBOutlet weak var imageQRCode: UIImageView!
    @IBOutlet weak var cutList: UITextView!
    
    var code = ""
    var signature = ""
    var keepGrade = ""
    var basePrice = ""
    var keepPrice = ""
    var cut = ""
    
    @IBOutlet weak var startPrice: UILabel!
    @IBOutlet weak var endPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIApplication.shared.keyWindow?.windowLevel = UIWindow.Level.statusBar
        
        cutList.text = "\(cut)"
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedPrice = numberFormatter.string(from: NSNumber(value : Int(keepPrice)!))
        
        
//        let QRCode = generateQRCode(from: code)
        let QRCode = generateQRCode(from: "Grade : \(keepGrade), Rp. \(formattedPrice!)")
        
        startPrice.text = "\(basePrice)"
        endPrice.text = "Rp. \(formattedPrice!)"
        imageQRCode.image = QRCode
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {self.screenshotMethod()}
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }

    
    
    
    func screenshotMethod() {
        
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
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
