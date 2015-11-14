//
//  StoryVC.swift
//  madlibs2
//
//  Created by Kasper Peulen on 11/14/15.
//  Copyright © 2015 Kasper Peulen. All rights reserved.
//


import UIKit

class StoryVC: UIViewController {
    var story: Story = Story.shared
    
    @IBOutlet weak var storyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        storyLabel.text = story.renderStory()
    }
    
}