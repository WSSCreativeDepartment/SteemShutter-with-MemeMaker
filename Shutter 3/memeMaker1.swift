//
//  memeMaker1.swift
//  Shutter 3
//
//  Created by Mario Kardum on 09/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class memeMaker1: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate {
    
    // Button outlets: back button and two buttons for choosing the image. First is for choosing an image at the begining, second for changing the image
    
    
    @IBOutlet weak var backBtn3: UIButton!
    @IBOutlet weak var chooseTheImage: UIButton!
    @IBOutlet weak var choseimage2: UIButton!
    
    // next button - button to proceed to see the meme
    
    @IBOutlet weak var nextBtn: UIButton!
    
    
    // when you pick an image, it appears in this image view. Then you haveto choose the frame to place it
    
    @IBOutlet weak var pickedImage: UIImageView!
    
    // Meme text fields
    
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    
    // Font buttons
    
    @IBOutlet weak var fontsBtn: UIButton!
    @IBOutlet weak var colorBtmn: UIButton!
    @IBOutlet weak var fontpicker: UIPickerView!
    
    // Signature Laben and icon
    
    @IBOutlet weak var gnatureIcon: UIImageView!
    @IBOutlet weak var gnatureLabel: UILabel!
    
    // Hide signature
    
    @IBOutlet weak var hidSigBut: UIButton!
    
    
    // Help vars for fonts
    
    var labelFont: UIFont?
    var labelColor: UIColor?
    var superColor = UIColor.black
    
    
    // Images added for drawing text on the source images
    
    var laImage: UIImage?
    
    var hotImage: UIImage?
    
    // Fonts for the picker
    
    let fontos = ["HoeflerText-Black", "Farah", "BradleyHandITCTT-Bold", "Noteworthy-Bold", "SnellRoundhand-Bold", "MarkerFelt-Wide", "Avenir-BlackOblique", "Futura-CondensedExtraBold", "Courier-BoldOblique", "HiraKakuProN-W3"]
    
    
    // Colors buttons
    // collors are for meme text
    
    @IBOutlet weak var pinkButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var lightBlueButton: UIButton!
    
    var allColor: UIColor?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting rounded buttons
        
        pinkButton.layer.cornerRadius = 8
        redButton.layer.cornerRadius = 8
        blueButton.layer.cornerRadius = 8
        whiteButton.layer.cornerRadius = 8
        greenButton.layer.cornerRadius = 8
        blackButton.layer.cornerRadius = 8
        orangeButton.layer.cornerRadius = 8
        lightBlueButton.layer.cornerRadius = 8
        
        chooseTheImage.layer.cornerRadius = 8
        choseimage2.layer.cornerRadius = 8
        
        nextBtn.isHidden = true
        
        
     
        
        self.topTextField.delegate = self
        self.bottomTextField.delegate = self
        fontpicker.delegate = self
        fontpicker.isHidden = true
        fontpicker.dataSource = self
        
        
        // allColor is the color of the text that draws on your image
        
        allColor = UIColor.white
        
        
        
     

    }
    
    // Pulling signature text from NSUserDefaults
    // The signature is saved inside the app untill you change it
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myName") as? String {
            gnatureLabel.text = x
        }
        
        if let y = UserDefaults.standard.object(forKey: "supak") {
            gnatureLabel.font = UIFont(name: y as! String, size: 16)
        }
        
    }
    
    // Functions for pickerView
    // The list of fonts is in this picker
    
    // Choose only 1 font
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontos[row]
    }
    
    // setting the chosen font for the top and bottom meme text
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        labelFont = UIFont(name: fontos[row], size: 28)
        topTextField.font = labelFont
        bottomTextField.font = labelFont
        fontpicker.isHidden = true
        
    }
    
    // Image Picker
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info [UIImagePickerControllerOriginalImage] as! UIImage
        pickedImage.image = selectedImage
        dismiss(animated: true, completion: nil)
        choseimage2.isHidden = false
        chooseTheImage.isHidden = true
        self.gnatureIcon.image = resizeImage2(image: gnatureIcon.image!, targetSize: CGSize(width: (pickedImage.image?.size.width)!/12.1, height: (pickedImage.image?.size.height)!/16.128))
        nextBtn.isHidden = false
    }
    
    // Texts
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        topTextField.resignFirstResponder()
        bottomTextField.resignFirstResponder()
        return true
    }
    
    
    
    
    // Drawing signature on the photo

    
    func textToImage2(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = allColor
        
        
        // Stroke is the OUTLINE of the text
        let strokeColor = UIColor.black
        
        let fname = gnatureLabel.font.fontName
        
        let textFont = UIFont(name: fname, size: ((gnatureIcon.image?.size.height)!/1.75))
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.strokeColor: strokeColor,
            NSAttributedStringKey.strokeWidth: -1,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as [NSAttributedStringKey : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    
    
    // Drawing Steem logo on the photo
    
    
    func combineTwo (bcgimage image1: UIImage, wtmimage image2: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(image1.size);
        image1.draw(in: CGRect(x: 0, y: 0, width: image1.size.width, height: image1.size.height))
        
        
        image2.draw(at: CGPoint(x: (gnatureIcon.image?.size.width)!/3, y: ((pickedImage.image?.size.height)!-(gnatureIcon.image?.size.height)!-((gnatureIcon.image?.size.height)!/3))))
        let newImage2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage2!
    }
    
    
    
    // Resize Steem logo
    
    func resizeImage2(image: UIImage, targetSize: CGSize ) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    
    
    
    // Buttons
    
    
    // Font picker
    
    
    @IBAction func fontsAction(_ sender: Any) {
        if fontpicker.isHidden {
            fontpicker.isHidden = false
        }
    }
    
  //  @IBAction func colorAction(_ sender: Any) {
//    }
    
    
    
    // back button
    @IBAction func back3Act(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // Choose image button
    
    @IBAction func chooseImageAction(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
        
    }
    
    
    
    // Change image button
    
    @IBAction func chose2(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
    }
    
    
    
    
    // Next Button
    
    @IBAction func nextButton(_ sender: Any) {
        
        
        // Calling function textToImage to draw top text field and bottom text field on the photo
        
        self.hotImage = textToImage(drawText: topTextField.text!, inImage: pickedImage.image!, atPoint: CGPoint(x: ((pickedImage.image?.size.width)!/2), y: (((pickedImage.image?.size.height)!/30))))
        
        self.laImage = textToImage(drawText: bottomTextField.text!, inImage: hotImage!, atPoint: CGPoint(x: ((hotImage?.size.width)!/2), y: ((hotImage?.size.height)!-((hotImage?.size.height)!/4.4))))
        
        if gnatureIcon.isHidden == false {
        
        
            
    // Calling function textToImage2 to draw signature label on the photo

            
        self.laImage = textToImage2(drawText: gnatureLabel.text!, inImage: laImage!, atPoint: CGPoint(x: (gnatureIcon.image?.size.width)!/0.8, y: ((laImage!.size.height)-(gnatureIcon.image?.size.height)!-((gnatureIcon.image?.size.height)!/5))))
        self.laImage = combineTwo(bcgimage: laImage!, wtmimage: gnatureIcon.image!)
        }
        
        
        // Performing segue to see the results
  
        
        performSegue(withIdentifier: "meme2meme", sender: nil)
        
        
        
    }
    
    
    // Hide signature?Show signature button
    
    @IBAction func hidSigButAct(_ sender: Any) {
        if
            gnatureIcon.isHidden == false {
                gnatureIcon.isHidden = true
                gnatureLabel.isHidden = true
            hidSigBut.setTitle("Show signature", for: .normal)
            }
        else {
            gnatureIcon.isHidden = false
            gnatureLabel.isHidden = false
            hidSigBut.setTitle("Hide signature", for: .normal)
        
        
        }
    }
    
    // preparing the result image for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        //passby - imaginary function
        var passby = segue.destination as! memeMaker2
        
        passby.theImage = laImage
    }
    
    
    
    
    // function to draw meme text on the photo
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = allColor
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
            NSAttributedStringKey.strokeWidth: -3.0,
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
    
    
    
    
    // color buttons actions
    
    @IBAction func pinkAction(_ sender: Any) {
        
        // setting the chosen color for top meme text, bottom meme text and the signatre text
        
        allColor = pinkButton.backgroundColor
        topTextField.textColor = pinkButton.backgroundColor
        bottomTextField.textColor = pinkButton.backgroundColor
        gnatureLabel.textColor = pinkButton.backgroundColor
        
        
    }
    @IBAction func redAction(_ sender: Any) {
        allColor = redButton.backgroundColor
        topTextField.textColor = redButton.backgroundColor
        bottomTextField.textColor = redButton.backgroundColor
        gnatureLabel.textColor = redButton.backgroundColor
    }
    @IBAction func blueAction(_ sender: Any) {
        allColor = blueButton.backgroundColor
        topTextField.textColor = blueButton.backgroundColor
        bottomTextField.textColor = blueButton.backgroundColor
        gnatureLabel.textColor = blueButton.backgroundColor
    }
    @IBAction func whiteAction(_ sender: Any) {
        allColor = whiteButton.backgroundColor
        topTextField.textColor = whiteButton.backgroundColor
        bottomTextField.textColor = whiteButton.backgroundColor
        gnatureLabel.textColor = whiteButton.backgroundColor
    }
    
    @IBAction func greenAction(_ sender: Any) {
        allColor = greenButton.backgroundColor
        topTextField.textColor = greenButton.backgroundColor
        bottomTextField.textColor = greenButton.backgroundColor
        gnatureLabel.textColor = greenButton.backgroundColor
    }
    @IBAction func blackAction(_ sender: Any) {
        allColor = blackButton.backgroundColor
        topTextField.textColor = blackButton.backgroundColor
        bottomTextField.textColor = blackButton.backgroundColor
        gnatureLabel.textColor = blackButton.backgroundColor
    }
    @IBAction func orangeAction(_ sender: Any) {
        allColor = orangeButton.backgroundColor
        topTextField.textColor = orangeButton.backgroundColor
        bottomTextField.textColor = orangeButton.backgroundColor
        gnatureLabel.textColor = orangeButton.backgroundColor
    }
    @IBAction func lightBlueAction(_ sender: Any) {
        allColor = lightBlueButton.backgroundColor
        topTextField.textColor = lightBlueButton.backgroundColor
        bottomTextField.textColor = lightBlueButton.backgroundColor
        gnatureLabel.textColor = lightBlueButton.backgroundColor
    }
    
    
    

  

}
