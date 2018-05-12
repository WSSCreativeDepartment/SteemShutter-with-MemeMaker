//
//  memeMaker1.swift
//  Shutter 3
//
//  Created by Mario Kardum on 09/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class memeMaker1: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var backBtn3: UIButton!
    @IBOutlet weak var chooseTheImage: UIButton!
    @IBOutlet weak var choseimage2: UIButton!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    @IBOutlet weak var fontsBtn: UIButton!
    @IBOutlet weak var colorBtmn: UIButton!
    @IBOutlet weak var fontpicker: UIPickerView!
    
    var labelFont: UIFont?
    var labelColor: UIColor?
    var superColor = UIColor.black
    
    var laImage: UIImage?
    
    var hotImage: UIImage?
    
    let fontos = ["HoeflerText-Black", "Farah", "BradleyHandITCTT-Bold", "Noteworthy-Bold", "SnellRoundhand-Bold", "MarkerFelt-Wide", "Avenir-BlackOblique", "Futura-CondensedExtraBold"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        fontpicker.delegate = self
        fontpicker.isHidden = true
        fontpicker.dataSource = self
        
     

    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelFont = UIFont(name: fontos[row], size: 28)
        topTextField.font = labelFont
        bottomTextField.font = labelFont
        fontpicker.isHidden = true
        
    }
    
    // Picker
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info [UIImagePickerControllerOriginalImage] as! UIImage
        pickedImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // Texts
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
        return true
    }
    
    
    

    
    
    
    // Buttons
    
    
    @IBAction func fontsAction(_ sender: Any) {
        if fontpicker.isHidden {
            fontpicker.isHidden = false
        }
    }
    
    @IBAction func colorAction(_ sender: Any) {
    }
    
    
    
    
    @IBAction func back3Act(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func chooseImageAction(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
        choseimage2.isHidden = false
        chooseTheImage.isHidden = true
    }
    
    
    @IBAction func chose2(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        self.hotImage = textToImage(drawText: topTextField.text!, inImage: pickedImage.image!, atPoint: CGPoint(x: ((pickedImage.image?.size.width)!/2), y: (((pickedImage.image?.size.height)!/30))))
        
        self.laImage = textToImage(drawText: bottomTextField.text!, inImage: hotImage!, atPoint: CGPoint(x: ((hotImage?.size.width)!/2), y: ((hotImage?.size.height)!-((hotImage?.size.height)!/4.4))))
  
        
        performSegue(withIdentifier: "meme2meme", sender: nil)
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var passby = segue.destination as! memeMaker2
        
        passby.theImage = laImage
    }
    
    
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let strokeColor = UIColor.black
       
        let fontix = topTextField.font?.fontName
        
        let textFont = UIFont(name: fontix!, size: (pickedImage.image?.size.width)!/10.4)
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            
            
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.strokeColor: strokeColor,
            NSAttributedStringKey.strokeWidth: -5.0,
            NSAttributedStringKey.paragraphStyle: paragraph,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as [NSAttributedStringKey : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        let rect2 = CGRect(x: point.x - rect.size.width/2, y: point.y, width: rect.size.width, height: rect.size.height)

        text.draw(in: rect2, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    

  

}
