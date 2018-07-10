//
//  pickPhotos.swift
//  Shutter 3
//
//  Created by Mario Kardum on 04/06/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class pickPhotos: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // sizes A, B, C, D and E are changable depending of the chosen frame. Same with the points A, B, C, D and E.
    // They mark where on background image will the photo be placed. It is the upper-left corner point of the each photo
    
    var sizeA: CGSize?
    var sizeB: CGSize?
    var sizeC: CGSize?
    var sizeD: CGSize?
    var sizeE: CGSize?
    
    var pointA: CGPoint?
    var pointB: CGPoint?
    var pointC: CGPoint?
    var pointD: CGPoint?
    var pointE: CGPoint?
    
    // pickImage opens the photo library
    

    @IBOutlet weak var pickImage: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    // Outlets for the warning message
    // Warning message shows up when a user chooses a frame without picking a photo first
    
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    
    
    // Point 0,0 for drawing frame image on background image
    
    var basicPoint = CGPoint(x: 0, y: 0)
    
    //frameImage is the frame designed by utopian-io contributors.
    //backgroundImage is blue or white (blank) image that has the same size as the frameImage.
    // The picked photo draws itself on the backgroundImage and the frameImage comes over it
    // Those variable come from chooseTheFrame view controller
    var frameImage: UIImage?
    var backgroundImage: UIImage?
    
    // Helpful label is here for later
    
    var secondHelpfulLabel: UILabel?
    // pickerImage is an imageView for image chosen from library
    @IBOutlet weak var pickerImage: UIImageView!
    @IBOutlet weak var frameImageView: UIImageView!
    
    // Button outlets for choosing a field where to place a photo from pickerImage
    
    @IBOutlet weak var fr1Button: UIButton!
    @IBOutlet weak var fr2Button: UIButton!
    @IBOutlet weak var fr3Button: UIButton!
    @IBOutlet weak var fr4Button: UIButton!
    @IBOutlet weak var fr5Button: UIButton!
    
    // These are variables that receive data from ChooseTheFrame view controller
    @IBOutlet weak var bckView: UIImageView!
    
    
    @IBOutlet weak var finalImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Placing the data from choosetheFrames view controller into outlets
        
        frameImageView.image = frameImage!
        bckView.image = backgroundImage!
        
        // Let's round some corners
        messageView.layer.cornerRadius = 12
        messageButton.layer.cornerRadius = 18
        
        // This is for two-photo frame
        
        if sizeC == CGSize(width: 0, height: 0) {
            fr3Button.isHidden = true
            fr4Button.isHidden = true
            fr5Button.isHidden = true
        }
        
        // for three-photo frame
        if sizeC != CGSize(width: 0, height: 0),
            sizeD == CGSize(width: 0, height: 0) {
            fr4Button.isHidden = true
            fr5Button.isHidden = true
        }
        
        // for four-photo frame
        if sizeD != CGSize(width: 0, height: 0),
            sizeE == CGSize(width: 0, height: 0) {
            fr5Button.isHidden = true
        }
        
        // You know what the save button does
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
        
        // ResizeImage func depends on var size (A,B, C, D or E)
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
    
    // combineTwo func depends on var point (A,B, C, D or E )
    
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
        
        // This is to prevent crushing
        // Instead of printing error, I added this warning message.
        // A user should firts pick a photo then pick a frame
        // The same is for the next four buttons
        
        
        if pickerImage.image == nil {
            messageView.isHidden = false
            messageLabel.isHidden = false
            messageButton.isHidden = false
        } else {
        
        //First let's call the resizeImge function to resize the picked photo to fit the frame
        // Same is for the next four buttons
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeA!)
        
        // Let's draw the resized photo onto white background
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointA!)
        
        
        // Let's draw the frame image onto the white backround with the photos drawn on it
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        
        
        // Now, let's hide those "helpful images"
        bckView.isHidden = true
        frameImageView.isHidden = true
        }

        
    }
    
    // Place the photo in frame 2
    
    @IBAction func fr2Action(_ sender: Any) {
        if pickerImage.image == nil {
           messageView.isHidden = false
            messageLabel.isHidden = false
            messageButton.isHidden = false
        } else {
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeB!)
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointB!)
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        bckView.isHidden = true
        frameImageView.isHidden = true
        }
        
    }
    
    // Place the photo in frame 3
    
    @IBAction func fr3Action(_ sender: Any) {
        if pickerImage.image == nil {
            messageView.isHidden = false
            messageLabel.isHidden = false
            messageButton.isHidden = false
        } else {
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeC!)
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointC!)
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        bckView.isHidden = true
        frameImageView.isHidden = true
        }
    }
    
    @IBAction func fr4Action(_ sender: Any) {
        if pickerImage.image == nil {
            messageView.isHidden = false
            messageLabel.isHidden = false
            messageButton.isHidden = false
        } else {
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeD!)
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointD!)
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        bckView.isHidden = true
        frameImageView.isHidden = true
        }
    }
    
    @IBAction func fr5Action(_ sender: Any) {
        if pickerImage.image == nil {
            messageView.isHidden = false
            messageLabel.isHidden = false
            messageButton.isHidden = false
        } else {
        self.pickerImage.image = resizeImage(image: pickerImage.image!, targetSize: sizeE!)
        self.bckView.image = combineTwo(bcgimage: bckView.image!, wtmimage: pickerImage.image!, thepoint: pointE!)
        self.finalImage.image = combineTwo(bcgimage: bckView.image!, wtmimage: frameImageView.image!, thepoint: basicPoint)
        bckView.isHidden = true
        frameImageView.isHidden = true
        }
    }
    
    
    @IBAction func messageAction(_ sender: Any) {
        
        
        // Hiding the warning message when OK is tapped
        messageView.isHidden = true
        messageLabel.isHidden = true
        messageButton.isHidden = true
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
