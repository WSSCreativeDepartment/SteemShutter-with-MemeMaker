//
//  cropperView.swift
//  Shutter 3
//
//  Created by Mario Kardum on 16/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class cropperView: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!{
        
        didSet {
            scrollView.delegate = self
            scrollView.maximumZoomScale = 10.0
            scrollView.minimumZoomScale = 1.0
            
        }
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var helpLabel: UILabel!
    
    @IBOutlet weak var backbtn: UIButton!
    @IBOutlet weak var cropbtn: UIButton!
    @IBOutlet weak var nextbtn: UIButton!
    
    @IBOutlet weak var cropFrame: CropFrame!
    
    var photka: UIImage?
    var font: UIFont?
    var tekst = String()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = photka
        
        self.cropFrame.layer.borderWidth = 1
        self.cropFrame.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        
        helpLabel?.text = tekst
        helpLabel?.font = font

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    var cropArea:CGRect{
        get{
            let factor = imageView.image!.size.width/view.frame.width
            let scale = 1/scrollView.zoomScale
            let imageFrame = imageView.imageFrame()
            let x = (scrollView.contentOffset.x + cropFrame.frame.origin.x - imageFrame.origin.x) * scale * factor
            let y = (scrollView.contentOffset.y + cropFrame.frame.origin.y - imageFrame.origin.y) * scale * factor
            let width = cropFrame.frame.size.width * scale * factor
            let height = cropFrame.frame.size.height * scale * factor
            return CGRect(x: x, y: y, width: width, height: height)
        }
    }
    
    
    
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var druga = segue.destination as! PreviewAndEdit
        druga.image = imageView.image!
        druga.finalText = helpLabel.text!
        druga.finalFont = helpLabel.font!
        
        
        
        
    }
    
    @IBAction func backAct(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cropAct(_ sender: Any) {
        let croppedCGImage = imageView.image?.cgImage?.cropping(to: cropArea)
        let croppedImage = UIImage(cgImage: croppedCGImage!)
        imageView.image = croppedImage
        scrollView.zoomScale = 1
        cropFrame.isHidden = true
        nextbtn.isHidden = false
        cropbtn.isHidden = true
    }
    
    
    @IBAction func nextAct(_ sender: Any) {
        performSegue(withIdentifier: "cropseg2", sender: nil)
    }
    
    


}
extension UIImageView{
    func imageFrame()->CGRect{
        let imageViewSize = self.frame.size
        guard let imageSize = self.image?.size else{return CGRect.zero}
        let imageRatio = imageSize.width / imageSize.height
        let imageViewRatio = imageViewSize.width / imageViewSize.height
        
        if imageRatio < imageViewRatio {
            let scaleFactor = imageViewSize.height / imageSize.height
            let width = imageSize.width * scaleFactor
            let topLeftX = (imageViewSize.width - width) * 0.5
            return CGRect(x: topLeftX, y: 0, width: width, height: imageViewSize.height)
        }else{
            let scalFactor = imageViewSize.width / imageSize.width
            let height = imageSize.height * scalFactor
            let topLeftY = (imageViewSize.height - height) * 0.5
            return CGRect(x: 0, y: topLeftY, width: imageViewSize.width, height: height)
        }
    }
    
    
}

class CropFrame: UIView {
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
    
}
