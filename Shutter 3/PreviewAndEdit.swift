//
//  PreviewAndEdit.swift
//  Shutter 3
//
//  Created by Mario Kardum on 04/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class PreviewAndEdit: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Outlets
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var filter1Button: UIButton!
    @IBOutlet weak var filterPicker: UIPickerView!
    
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var logoText: UILabel!
    
    @IBOutlet weak var cropButton: NSLayoutConstraint!
    
    
    
    
    var image: UIImage?
    
    var filterName: CIFilter?
    
    let filters = ["CIPhotoEffectMono", "CISepiaTone", "CIColorMonochrome", "CIPhotoEffectChrome", "CIColorInvert", "CIPhotoEffectInstant", "CIPhotoEffectFade", "CIPhotoEffectTonal", "CIVignette", "CIPhotoEffectProcess"]

    
    var finalText = String()
    var finalFont = UIFont()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        filterPicker.isHidden = true
        filterPicker.delegate = self
        filterPicker.dataSource = self
        
        photo.image = image
        
        logoText.text = finalText
        logoText.font = finalFont
        
        
        
        
        
        self.logoImage.image = resizeImage(image: logoImage.image!, targetSize: CGSize(width: (photo.image?.size.width)!/12.1, height: (photo.image?.size.height)!/16.128))
        
        

    }
    
    // Filter Pickers
    
 
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return filters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return filters[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        filterName = CIFilter(name: filters[row])
        photo.image = filtersDone(image: photo.image!)
        filterPicker.isHidden = true
    }
    
    


    
    func filtersDone(image:UIImage) -> UIImage {
        let cgimg = image.cgImage
        let coreImage = CIImage(cgImage: cgimg!)
        let filter = filterName
        filter?.setValue(coreImage, forKey: kCIInputImageKey)
        
        let context = CIContext(options: [kCIContextUseSoftwareRenderer: true])
        let outputImage = context.createCGImage((filter?.outputImage)!, from: (filter?.outputImage?.extent)!)
        var newImage = UIImage(cgImage: outputImage!)
        return newImage
    }
    
    
    
    func resizeImage(image: UIImage, targetSize: CGSize ) -> UIImage {
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
    
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let strokeColor = UIColor.black

        let fname = logoText.font.fontName
        
        let textFont = UIFont(name: fname, size: ((logoImage.image?.size.height)!/2))
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.strokeColor: strokeColor,
            NSAttributedStringKey.strokeWidth: -1.0,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as [NSAttributedStringKey : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    func combineTwo (bcgimage image1: UIImage, wtmimage image2: UIImage) -> UIImage {
        UIGraphicsBeginImageContext(image1.size);
        image1.draw(in: CGRect(x: 0, y: 0, width: image1.size.width, height: image1.size.height))
        
        
        image2.draw(at: CGPoint(x: (logoImage.image?.size.width)!/3, y: ((photo.image?.size.height)!-(logoImage.image?.size.height)!-((logoImage.image?.size.height)!/3))))
        let newImage2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage2!
    }
    
    
    
    
    @IBAction func clearFilters(_ sender: Any) {
        photo.image = image
    }
    
    
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        
        self.photo.image = textToImage(drawText: logoText.text!, inImage: photo.image!, atPoint: CGPoint(x: (logoImage.image?.size.width)!/0.8, y: ((photo.image?.size.height)!-(logoImage.image?.size.height)!-((logoImage.image?.size.height)!/3))))
        self.photo.image = combineTwo(bcgimage: photo.image!, wtmimage: logoImage.image!)

        
        
        
        
        guard let imageToSave = photo.image
        else {
            return
        }
        
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func filter1Action(_ sender: Any) {
        if filterPicker.isHidden {
            filterPicker.isHidden = false
        }
  

    }
        
    
    @IBAction func rotateAction(_ sender: Any) {
        photo.image = photo.image?.rotate(radians: .pi/2)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var slika = segue.destination as! cropperView
        slika.photka = photo.image!
        slika.font = logoText.font
        slika.tekst = logoText.text!
    }

    @IBAction func cropAction(_ sender: Any) {
        
        performSegue(withIdentifier: "cropseg1", sender: nil)
        
        
    }
    

}
extension UIImage {
    func rotate(radians: Float) -> UIImage? {
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, self.scale)
        let context2 = UIGraphicsGetCurrentContext()!
        
        context2.translateBy(x: newSize.width/2, y: newSize.height/2)
        context2.rotate(by: CGFloat(radians))
        
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage2
    }
}
