//
//  fontovi.swift
//  Shutter 3
//
//  Created by Mario Kardum on 09/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class fontovi: UIViewController {
    
    
    var stringName = String()
    var chosenFont: UIFont?
    
    // FontLabels
    
    @IBOutlet weak var font1: UILabel!
    @IBOutlet weak var font2: UILabel!
    @IBOutlet weak var font3: UILabel!
    @IBOutlet weak var font4: UILabel!
    @IBOutlet weak var font5: UILabel!
    @IBOutlet weak var font6: UILabel!
    @IBOutlet weak var font7: UILabel!
    @IBOutlet weak var font8: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        font1.text = stringName
        font2.text = stringName
        font3.text = stringName
        font4.text = stringName
        font5.text = stringName
        font6.text = stringName
        font7.text = stringName
        font8.text = stringName


    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        UserDefaults.standard.set(chosenFont?.fontName, forKey: "supak")
    }
    
    @IBAction func bckBtn2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func but1(_ sender: Any) {
        chosenFont = font1.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)
        
    }
    @IBAction func but2(_ sender: Any) {
        chosenFont = font2.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)

    }
    @IBAction func but3(_ sender: Any) {
        chosenFont = font3.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)

    }
    @IBAction func but4(_ sender: Any) {
        chosenFont = font4.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)

    }
    @IBAction func but5(_ sender: Any) {
        chosenFont = font5.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)

    }
    @IBAction func but6(_ sender: Any) {
        chosenFont = font6.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)

    }
    @IBAction func but7(_ sender: Any) {
        chosenFont = font7.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)

    }
    @IBAction func but8(_ sender: Any) {
        chosenFont = font8.font
        UserDefaults.standard.set(stringName, forKey: "myName")
        performSegue(withIdentifier: "retardo", sender: nil)

    }
    
    
    


}
