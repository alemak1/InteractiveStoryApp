//
//  PageController.swift
//  InteractiveStory
//
//  Created by Aleksander Makedonski on 1/24/17.
//  Copyright © 2017 Changzhou Panda. All rights reserved.
//

import Foundation
import UIKit

class PageController: UIViewController{
    
    var page: Page?
    
    
    let artwork = UIImageView()
    let storyLabel = UILabel()
    let firstChoiceButton = UIButton(type: UIButtonType.system)
    let secondChoiceButton = UIButton(type: UIButtonType.system)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(page: Page){
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
        
        if let page = self.page{
            print(page.story.text)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  
}
