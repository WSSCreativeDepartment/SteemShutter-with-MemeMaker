//
//  pickPhotos.swift
//  Shutter 3
//
//  Created by Mario Kardum on 04/06/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class pickPhotos: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // sizes A, B, and C are changable depending of the chosen frame. Same with the points A, B, and C
    
    var sizeA: CGSize?
    var sizeB: CGSize?
    var sizeC: CGSize?
    
    var pointA: CGPoint?
    var pointB: CGPoint?

    // pickerImage is an imageView for image chosen from library
    @IBOutlet weak var pickImage: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var pointC: CGPoint?
    
    // Point 0,0 for drawing frame image on background image
    
    var basicPoint = CGPoint(x: 0, y: 0)
    
    //
    var frameImage: UIImage?
    var backgroundImage: UIImage?
    
    // Helpful label is here for later
    
    var secondHelpfulLabel: UILabel?
    
    @IBOutlet weak var pickerImage: UIImageView!
    @IBOutlet weak var frameImageView: UIImageView!
    
    // Button outlets for choosing a field where to place a photo from pickerImage
    
    @IBOutlet weak var fr1Button: UIButton!
    @IBOutlet weak var fr2Button: UIButton!
    @IBOutlet weak var fr3Button: UIButton!
    
    // These are variables that receive data from ChooseTheFrame view controller
    @IBOutlet weak var bckView: UIImageView!
    
    
    @IBOutlet weak var finalImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frameImageView.image = frameImage!
        bckView.image = backgroundImage!
        
        // This is for two-photo frame
        
        if sizeC == CGSize(width: 0, height: 0) {
            fr3Button.isHidden = true
        }
        
       saveButton.isHidden = false
        

    }
    
    
    // Functions for Photo Library
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        pickerImage.image = selectedImage
        dismiss(animated: true, completion: nil)
        
        // ResizeImage func depends on var size (A,B, or C)
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
    
    // combineTwo func depends on var point (A,B, or C)
    
    func combineTwo (bcgimage image1: UIImage, wtmimage image2: UIImage, thepoint point: CGPoint) -> UIImage {
        UIGraphicsBeginImageContext(image1.size);
        
        
        image1.draw(in: CGRect(x: 0, y: 0, width: image1.size.width, height: image1.size.height))
        
        
        image2.draw(at: point)
        let newImage2 = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage2!
    }
    
    // Button for picking an image from photo Library
    
    @IBAction func pickImageAction(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        
        present(controller, animated: true, completion: nil)
    
        
    }
    
    // We "DRAW" chosen hoto on the background image and at the end, we draw a frame over it. 
    
    // Place the photo in frame 1
    
    @IBAction func fr1Action(_ sender: Any) {
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeA!)
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointA!)
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        
        bckView.isHidden = true
        frameImageView.isHidden = true

        
    }
    
    // Place the photo in frame 2
    
    @IBAction func fr2Action(_ sender: Any) {
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeB!)
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointB!)
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        bckView.isHidden = true
        frameImageView.isHidden = true
        
    }
    
    // Place the photo in frame 3
    
    @IBAction func fr3Action(_ sender: Any) {
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeC!)
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointC!)
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        bckView.isHidden = true
        frameImageView.isHidden = true
    }
    
    // Back Button
    
    @IBAction func backButtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Save finished collage image to your Photo Library
    
    @IBAction func saveButton(_ sender: Any) {
        
        guard let imageToSave = finalImage.image
            else {
                return
        }
        
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
