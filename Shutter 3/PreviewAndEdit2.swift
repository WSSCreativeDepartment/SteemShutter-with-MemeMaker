//
//  PreviewAndEdit2.swift
//  Shutter 3
//
//  Created by Mario Kardum on 09/05/2018.
//  Copyright © 2018 dumar022. All rights reserved.
//

import UIKit

class PreviewAndEdit2: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var bckBtn: UIButton!
    @IBOutlet weak var signatureText: UITextField!
    @IBOutlet weak var selfBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signatureText.delegate = self

    }
    
    // TextFieldFunctions

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        signatureText.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var fontText = segue.destination as! fontovi
        fontText.stringName = signatureText.text!
    }
    
    @IBAction func bckBtnAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selfAct(_ sender: Any) {
        performSegue(withIdentifier: "fonts_segue", sender: nil)
    }
    
    
    



}
