//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Aleksander Makedonski on 1/24/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    enum VCError: Error{
        case NoName
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
                
                    
            } catch{
                
            }
        }
    }


}

