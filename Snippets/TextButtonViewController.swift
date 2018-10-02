//
//  TextButtonViewController.swift
//  Snippets
//
//  Created by Aritro Paul on 02/10/18.
//  Copyright © 2018 NotACoder. All rights reserved.
//

import UIKit

class TextButtonViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textButton: UIButton!
    var Text = ""
    var Syms:[String] = []
    
    func textFieldShouldReturn(_ textField: UITextField)-> Bool{
        self.view.endEditing(true)
        textField.resignFirstResponder()
        textField.alpha = 0
        textField.isUserInteractionEnabled = false
        textButton.alpha = 1
        textButton.isUserInteractionEnabled = true
        Text = textField.text ?? ""
        print(symptomFinder(Text: Text))
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -350, up: true)
    }
    
    // Finish Editing The Text Field
    func textFieldDidEndEditing(_ textField: UITextField) {
        moveTextField(textField, moveDistance: -350, up: false)
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        DispatchQueue.main.async {
            self.textField.becomeFirstResponder()
        }
        textField.alpha = 1
        textField.isUserInteractionEnabled = true
        textField.text = ""
        textButton.alpha = 0
        textButton.isUserInteractionEnabled = false
    }
    
    @objc func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    func setupButton(){
        textField.alpha = 0
        textField.isUserInteractionEnabled = false
        textField.delegate = self
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.textField.frame.height))
        textField.layer.cornerRadius = 15
        textField.leftView = paddingView
        textField.leftViewMode = UITextField.ViewMode.always
        textField.layer.backgroundColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1).cgColor
    }
    
    func symptomFinder(Text:String)->[String]{
        Syms.removeAll()
        for sym in symptoms{
            if (Text.contains(sym)){
                Syms.append(sym)
            }
        }
        return Syms
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
