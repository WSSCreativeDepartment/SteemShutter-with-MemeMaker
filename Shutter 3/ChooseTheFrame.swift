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
    var point4: CGPoint?
    var point5: CGPoint?
    
    // Sizes depends of chosen frame
    // This is for data that passes on through segue

    
    var theSize: CGSize?
    var size1: CGSize?
    var size2: CGSize?
    var size3: CGSize?
    var size4: CGSize?
    var size5: CGSize?
    
    // For something in the future
    
    var helpfulLabel: UILabel?
    
    
    // Hidden image views that contain frames and backgrounds
    
    
    // frames
    
    @IBOutlet weak var fram1: UIImageView!
    @IBOutlet weak var fram2: UIImageView!
    @IBOutlet weak var fram3: UIImageView!
    @IBOutlet weak var fram4: UIImageView!
    @IBOutlet weak var fram5: UIImageView!
    @IBOutlet weak var fram6: UIImageView!
    @IBOutlet weak var fram7: UIImageView!
    @IBOutlet weak var fram8: UIImageView!
    @IBOutlet weak var fram9: UIImageView!
    @IBOutlet weak var fram10: UIImageView!
    
    
    
    
    // blank backgrounds
    
    @IBOutlet weak var blu1: UIImageView!
    @IBOutlet weak var blu2: UIImageView!
    @IBOutlet weak var blu3: UIImageView!
    @IBOutlet weak var blu4: UIImageView!
    @IBOutlet weak var blu5: UIImageView!
    @IBOutlet weak var blu6: UIImageView!
    @IBOutlet weak var blu7: UIImageView!
    @IBOutlet weak var blu8: UIImageView!
    @IBOutlet weak var blu9: UIImageView!
    @IBOutlet weak var blu10: UIImageView!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }
    
    // This is important! When you choose a frame, you actually chose and it,s background, sizes for photos and point to draw them on the same JPG image
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var pickedFrame = segue.destination as! pickPhotos
        
        
        
        // this is data to send in pickPhotos view controller. The sizes and the font depend on the chosen frame
        pickedFrame.sizeA = size1
        pickedFrame.sizeB = size2
        pickedFrame.sizeC = size3
        pickedFrame.sizeD = size4
        pickedFrame.sizeE = size5
        
        pickedFrame.pointA = point1
        pickedFrame.pointB = point2
        pickedFrame.pointC = point3
        pickedFrame.pointD = point4
        pickedFrame.pointE = point5
        
        pickedFrame.frameImage = frame
        pickedFrame.backgroundImage = background
        
        
    }
    
    
    // These are action functions of the "frame buttons". Each button has an image of it's attributed frame. Choose one and go to next view controller
    
    
    @IBAction func actionOne(_ sender: Any) {
        
        // in the next ten buttons I defined the sizes and the points for each of available frames
        
        frame = fram1.image
        background = blu1.image
        size1 = CGSize(width: 882, height: 666)
        point1 = CGPoint(x: 10, y: 10)
        size2 = CGSize(width: 438, height: 573)
        point2 = CGPoint(x: 10, y: 679)
        size3 = CGSize(width: 439, height: 573)
        point3 = CGPoint(x: 458, y: 679)
        size4 = CGSize(width: 0, height: 0)
        point4 = CGPoint(x: 0, y: 0)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)
        
        
    }
    @IBAction func actionTwo(_ sender: Any) {
        
        frame = fram2.image
        background = blu2.image
        size1 = CGSize(width: 437, height: 579)
        point1 = CGPoint(x: 10, y: 10)
        size2 = CGSize(width: 437, height: 579)
        point2 = CGPoint(x: 454, y: 10)
        size3 = CGSize(width: 437, height: 579)
        point3 = CGPoint(x: 10, y: 595)
        size4 = CGSize(width: 437, height: 579)
        point4 = CGPoint(x: 454, y: 595)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

        
    }
    @IBAction func actionThree(_ sender: Any) {
        
        frame = fram3.image
        background = blu3.image
        size1 = CGSize(width: 437, height: 580)
        point1 = CGPoint(x: 10, y: 10)
        size2 = CGSize(width: 437, height: 580)
        point2 = CGPoint(x: 455, y: 10)
        size3 = CGSize(width: 0, height: 0)
        point3 = CGPoint(x: 0, y: 0)
        size4 = CGSize(width: 0, height: 0)
        point4 = CGPoint(x: 0, y: 0)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

    }
    @IBAction func actionFour(_ sender: Any) {
        
        
        frame = fram4.image
        background = blu4.image
        size1 = CGSize(width: 875, height: 664)
        point1 = CGPoint(x: 10, y: 10)
        size2 = CGSize(width: 259, height: 385)
        point2 = CGPoint(x: 10, y: 685)
        size3 = CGSize(width: 259, height: 385)
        point3 = CGPoint(x: 309, y: 685)
        size4 = CGSize(width: 259, height: 385)
        point4 = CGPoint(x: 610, y: 685)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

        
    }
    @IBAction func actionFive(_ sender: Any) {
        
        frame = fram5.image
        background = blu5.image
        size1 = CGSize(width: 571, height: 433)
        point1 = CGPoint(x: 40, y: 35)
        size2 = CGSize(width: 273, height: 361)
        point2 = CGPoint(x: 620, y: 79)
        size3 = CGSize(width: 228, height: 302)
        point3 = CGPoint(x: 140, y: 478)
        size4 = CGSize(width: 304, height: 228)
        point4 = CGPoint(x: 25, y: 824)
        size5 = CGSize(width: 398, height: 527)
        point5 = CGPoint(x: 461, y: 510)

        
        performSegue(withIdentifier: "choosephotos", sender: nil)

    }
    
    @IBAction func actionSix(_ sender: Any) {
        frame = fram6.image
        background = blu6.image
        size1 = CGSize(width: 871, height: 650)
        point1 = CGPoint(x: 10, y: 10)
        size2 = CGSize(width: 871, height: 650)
        point2 = CGPoint(x: 10, y: 689)
        size3 = CGSize(width: 0, height: 0)
        point3 = CGPoint(x: 0, y: 0)
        size4 = CGSize(width: 0, height: 0)
        point4 = CGPoint(x: 0, y: 0)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)
        
        
        performSegue(withIdentifier: "choosephotos", sender: nil)
    }
    
    @IBAction func actionSeven(_ sender: Any) {
        frame = fram7.image
        background = blu7.image
        size1 = CGSize(width: 873, height: 641)
        point1 = CGPoint(x: 18, y: 18)
        size2 = CGSize(width: 421, height: 309)
        point2 = CGPoint(x: 18, y: 685)
        size3 = CGSize(width: 421, height: 309)
        point3 = CGPoint(x: 464, y: 685)
        size4 = CGSize(width: 0, height: 0)
        point4 = CGPoint(x: 0, y: 0)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)
        
        
        performSegue(withIdentifier: "choosephotos", sender: nil)
        
    }
    
    
    
    @IBAction func actionEight(_ sender: Any) {
        frame = fram8.image
        background = blu8.image
        size1 = CGSize(width: 671, height: 502)
        point1 = CGPoint(x: 20, y: 20)
        size2 = CGSize(width: 671, height: 502)
        point2 = CGPoint(x: 20, y: 548)
        size3 = CGSize(width: 671, height: 502)
        point3 = CGPoint(x: 20, y: 1080)
        size4 = CGSize(width: 0, height: 0)
        point4 = CGPoint(x: 0, y: 0)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)
        
        
        performSegue(withIdentifier: "choosephotos", sender: nil)
    }
    
    @IBAction func actionNine(_ sender: Any) {
        frame = fram9.image
        background = blu9.image
        size1 = CGSize(width: 686, height: 912)
        point1 = CGPoint(x: 14, y: 20)
        size2 = CGSize(width: 209, height: 282)
        point2 = CGPoint(x: 14, y: 955)
        size3 = CGSize(width: 209, height: 282)
        point3 = CGPoint(x: 252, y: 955)
        size4 = CGSize(width: 209, height: 282)
        point4 = CGPoint(x: 490, y: 955)
        size5 = CGSize(width: 0, height: 0)
        point5 = CGPoint(x: 0, y: 0)
        
        
        performSegue(withIdentifier: "choosephotos", sender: nil)
        
        
        
    }
    
    @IBAction func actionTen(_ sender: Any) {
        frame = fram10.image
        background = blu10.image
        size1 = CGSize(width: 682, height: 514)
        point1 = CGPoint(x: 15, y: 15)
        size2 = CGSize(width: 327, height: 438)
        point2 = CGPoint(x: 15, y: 547)
        size3 = CGSize(width: 327, height: 438)
        point3 = CGPoint(x: 366, y: 547)
        size4 = CGSize(width: 327, height: 438)
        point4 = CGPoint(x: 15, y: 1004)
        size5 = CGSize(width: 327, height: 438)
        point5 = CGPoint(x: 366, y: 1004)
        
        
        performSegue(withIdentifier: "choosephotos", sender: nil)
        
        
    }
    
    
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
}
