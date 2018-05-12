//
//  nameUser.swift
//  Shutter 3
//
//  Created by Mario Kardum on 07/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class nameUser: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var backButton2: UIButton!
    @IBOutlet weak var sigText: UITextField!
    @IBOutlet weak var selfvote: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sigText.delegate = self

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sigText.resignFirstResponder()
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var subt = segue.destination as! fontViewController
        subt.stringText = sigText.text!
    }
    
    @IBAction func backButton2Action(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selfVoteAction(_ sender: Any) {
        performSegue(withIdentifier: "fontsseg", sender: nil)

    }
    
    
    

  

}
