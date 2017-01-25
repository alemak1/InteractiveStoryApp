//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Aleksander Makedonski on 1/24/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
    
    
    enum VCError: Error{
        case NoName
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyBoardWillHide), name: .UIKeyboardWillHide, object: nil)
    }

    func keyBoardWillHide(notification: NSNotification){
        if let userInfoDict = notification.userInfo, let keyBoardFrameValue = userInfoDict[UIKeyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardFrame = keyBoardFrameValue.cgRectValue
            
            UIView.animate(withDuration: 0.8){
                self.textFieldBottomConstraint.constant -= 10 + keyboardFrame.size.height
            }
        }
    }
    
    func keyBoardWillShow(notification: NSNotification){
        if let userInfoDict = notification.userInfo, let keyBoardFrameValue = userInfoDict[UIKeyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardFrame = keyBoardFrameValue.cgRectValue
            
            UIView.animate(withDuration: 0.8){
                
                self.textFieldBottomConstraint.constant = 10 + keyboardFrame.size.height
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
 
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure"{

            do{
                if let name = nameField.text{
                    if name == ""{
                        throw VCError.NoName
                    }
                    
                    if let pageController = segue.destination as? PageController{
                        pageController.page = Adventure.story(name: name)
                    }
                }
                
                    
            } catch VCError.NoName{
                let alertController = UIAlertController(title: "Name Not Provided", message: "Provide a name to start your story", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            } catch let error {
                fatalError("\(error)")
            }
        }
    }
    
    //MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

