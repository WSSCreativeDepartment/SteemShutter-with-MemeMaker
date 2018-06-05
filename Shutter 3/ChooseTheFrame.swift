//
//  ChooseTheFrame.swift
//  Shutter 3
//
//  Created by Mario Kardum on 04/06/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class ChooseTheFrame: UIViewController {
    
    // Vars of frames. Each frame has the same sized background.
    
    var frame: UIImage?
    var background: UIImage?
    
    
    // Points depend of chosen frame
    
    // This is for data that passes on through segue
    
    var thePoint: CGPoint?
    var point1: CGPoint?
    var point2: CGPoint?
    var point3: CGPoint?
    
    // Sizes depends of chosen frame
    // This is for data that passes on through segue

    
    var theSize: CGSize?
    var size1: CGSize?
    var size2: CGSize?
    var size3: CGSize?
    
    // For something in the future
    
    var helpfulLabel: UILabel?
    
    
    // Hidden image views that contain frames and backgrounds
    
    @IBOutlet weak var fram1: UIImageView!
    @IBOutlet weak var fram2: UIImageView!
    @IBOutlet weak var fram3: UIImageView!
    @IBOutlet weak var fram4: UIImageView!
    @IBOutlet weak var fram5: UIImageView!
    
    @IBOutlet weak var blu1: UIImageView!
    @IBOutlet weak var blu2: UIImageView!
    @IBOutlet weak var blu3: UIImageView!
    @IBOutlet weak var blu4: UIImageView!
    @IBOutlet weak var blu5: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }
    
    // This is important! When you choose a frame, you actually chose and it,s background, sizes for photos and point to draw them on the same JPG image
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var pickedFrame = segue.destination as! pickPhotos
        
        pickedFrame.sizeA = size1
        pickedFrame.sizeB = size2
        pickedFrame.sizeC = size3
        
        pickedFrame.pointA = point1
        pickedFrame.pointB = point2
        pickedFrame.pointC = point3
        
        pickedFrame.frameImage = frame
        pickedFrame.backgroundImage = background
        
        
    }
    
    
    // These are action functions of the "frame buttons". Each button has an image of it's attributed frame. Choose one and go to next view controller
    
    
    @IBAction func actionOne(_ sender: Any) {
        
        
        
        frame = fram1.image
        background = blu1.image
        size1 = CGSize(width: 347, height: 462)
        point1 = CGPoint(x: 0, y: 0)
        size2 = CGSize(width: 616, height: 462)
        point2 = CGPoint(x: 387, y: 0)
        size3 = CGSize(width: 0, height: 0)
        point3 = CGPoint(x: 0, y: 0)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)
        
        
    }
    @IBAction func actionTwo(_ sender: Any) {
        
        frame = fram2.image
        background = blu2.image
        size1 = CGSize(width: 480, height: 640)
        point1 = CGPoint(x: 0, y: 0)
        size2 = CGSize(width: 480, height: 640)
        point2 = CGPoint(x: 520, y: 0)
        size3 = CGSize(width: 0, height: 0)
        point3 = CGPoint(x: 0, y: 0)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

        
    }
    @IBAction func actionThree(_ sender: Any) {
        
        frame = fram3.image
        background = blu3.image
        size1 = CGSize(width: 1000, height: 750)
        point1 = CGPoint(x: 0, y: 0)
        size2 = CGSize(width: 1000, height: 750)
        point2 = CGPoint(x: 0, y: 790)
        size3 = CGSize(width: 0, height: 0)
        point3 = CGPoint(x: 0, y: 0)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

    }
    @IBAction func actionFour(_ sender: Any) {
        
        
        frame = fram4.image
        background = blu4.image
        size1 = CGSize(width: 525, height: 700)
        point1 = CGPoint(x: 0, y: 0)
        size2 = CGSize(width: 440, height: 330)
        point2 = CGPoint(x: 565, y: 0)
        size3 = CGSize(width: 440, height: 330)
        point3 = CGPoint(x: 565, y: 370)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

        
    }
    @IBAction func actionFive(_ sender: Any) {
        
        frame = fram5.image
        background = blu5.image
        size1 = CGSize(width: 480, height: 640)
        point1 = CGPoint(x: 0, y: 0)
        size2 = CGSize(width: 480, height: 640)
        point2 = CGPoint(x: 520, y: 0)
        size3 = CGSize(width: 1000, height: 750)
        point3 = CGPoint(x: 0, y: 680)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

    }
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
}
