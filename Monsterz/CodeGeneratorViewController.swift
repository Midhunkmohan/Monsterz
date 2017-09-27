//
//  CodeGeneratorViewController.swift
//  Monsterz
//
//  Created by Pixbit Solutions on 24/06/1939 Saka.
//  Copyright © 1939 Saka Pixbit Solutions. All rights reserved.
//

import UIKit

import DLRadioButton

class CodeGeneratorViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!/*{
        didSet{
            slider.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
        }
    }*/ // The commented code is to transform slider in horizontal angle
    
    @IBOutlet var imgQrCode: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var btnQRCode: DLRadioButton!
    
    var qrcodeImage: CIImage!
    var tag = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.hideKeyboardWhenTappedAround()
        textField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "QR Code Generator"
        btnQRCode.isSelected = true
        textField.isEnabled = true
        slider.isHidden = true
    }
    
    // MARK:- UIButton Actions
    
    // Generate Button
    
    @IBAction func performButtonAction(sender: AnyObject) {
        if qrcodeImage == nil && (textField.text?.characters.count)! > 0{
            
            if tag == 1{
                qrcodeImage = qrCodefromString(string: textField.text!)
            }else{
                qrcodeImage = barCodefromString(string: textField.text!)
            }
            
            imgQrCode.image = UIImage(ciImage: qrcodeImage)
            textField.isEnabled = !textField.isEnabled
            slider.isHidden = !slider.isHidden
            textField.resignFirstResponder()
            displayQRCodeImage()
            if textField.text == "" {
                return
            }
        }
    }
    
    @IBAction func didClearBtnClicked(_ sender: Any) {
        textField.text = ""
        imgQrCode.image = nil
        qrcodeImage = nil
        textField.becomeFirstResponder()
        textField.isEnabled = !textField.isEnabled
        slider.isHidden = !slider.isHidden
    }
    
    @IBAction func changeImageViewScale(sender: AnyObject) {
         imgQrCode.transform = CGAffineTransform(scaleX: CGFloat(slider.value), y: CGFloat(slider.value))
    }
    
    @objc @IBAction fileprivate func logSelectedButton(_ radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!))
            }
            
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!))
            tag = (radioButton.selected()?.tag)!
        }
    }
    
    func displayQRCodeImage() {
        let scaleX = imgQrCode.frame.size.width / qrcodeImage.extent.size.width
        let scaleY = imgQrCode.frame.size.height / qrcodeImage.extent.size.height
        
        let transformedImage = qrcodeImage.applying(CGAffineTransform(scaleX: scaleX, y: scaleY))
        
        imgQrCode.image = UIImage(ciImage: transformedImage)
    }
    
    func barCodefromString(string : String) -> CIImage? {
        
        let data = string.data(using: .ascii)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        
        return filter?.outputImage
    }
    
    func qrCodefromString(string:String)-> CIImage?{
        
        let data = string.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("Q", forKey: "inputCorrectionLevel")
        
        return filter?.outputImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
