//
//  memeMaker2.swift
//  Shutter 3
//
//  Created by Mario Kardum on 09/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit


class memeMaker2: UIViewController {
    
    
    // A simple view controller that lets us decide will we save the meme or create the other one.
    
    
    // Image from memeMaker1 View Controller
    
    var theImage: UIImage?
    
    
    // save and back buttons

    @IBOutlet weak var backbut5: UIButton!
    @IBOutlet weak var savebut2: UIButton!
 
    
    // Image view for theImage
    
    @IBOutlet weak var memeImage: UIImageView!
    
   
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        memeImage.image = theImage
       

       

    }
   
    
    // back button
    
    @IBAction func back6(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // save to Photo Library
    
    @IBAction func savact(_ sender: Any) {
        guard let imageToSave = memeImage.image
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
