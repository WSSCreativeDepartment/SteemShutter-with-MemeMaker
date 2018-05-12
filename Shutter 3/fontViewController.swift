//
//  fontViewController.swift
//  Shutter 3
//
//  Created by Mario Kardum on 07/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class fontViewController: UIViewController {
    
    
    @IBOutlet weak var f1: UILabel!
    @IBOutlet weak var f2: UILabel!
    @IBOutlet weak var f3: UILabel!
    @IBOutlet weak var f4: UILabel!
    @IBOutlet weak var f5: UILabel!
    @IBOutlet weak var f6: UILabel!
    @IBOutlet weak var f7: UILabel!
    @IBOutlet weak var f8: UILabel!
    
    var stringText = String()
    var fontt: UIFont?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        f1.text = stringText
        f2.text = stringText
        f3.text = stringText
        f4.text = stringText
        f5.text = stringText
        f6.text = stringText
        f7.text = stringText
        f8.text = stringText

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var potpis = segue.destination as! ViewController
        potpis.theFont = fontt
        potpis.textStr = stringText
        UserDefaults.standard.set(fontt?.fontName, forKey: "guzo")
        
    }
    
    @IBAction func b1(_ sender: Any) {
        
        fontt = f1.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    @IBAction func b2(_ sender: Any) {
        fontt = f2.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    @IBAction func b3(_ sender: Any) {
        
        fontt = f3.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    @IBAction func b4(_ sender: Any) {
        
        fontt = f4.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    @IBAction func b5(_ sender: Any) {
        
        fontt = f5.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    @IBAction func b6(_ sender: Any) {
        
        fontt = f6.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    @IBAction func b7(_ sender: Any) {
        
        fontt = f7.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    @IBAction func b8(_ sender: Any) {
        
        fontt = f8.font
        
        UserDefaults.standard.set(stringText, forKey: "myUserName")
        
        performSegue(withIdentifier: "segwa", sender: nil)
    }
    
    
    @IBAction func backButton3Action(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
