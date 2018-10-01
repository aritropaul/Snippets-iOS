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
    
    func textFieldReturn(textField:UITextField)-> Bool{
        self.view.endEditing(true)
        textField.resignFirstResponder()
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        textField.alpha = 0
        textField.isUserInteractionEnabled = false
        textButton.alpha = 1
        textButton.isUserInteractionEnabled = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
