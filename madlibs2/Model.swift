//
//  Model.swift
//  madlibs2
//
//  Created by Kasper Peulen on 11/14/15.
//  Copyright © 2015 Kasper Peulen. All rights reserved.
//

import Foundation

class Story {
    static let shared = Story()
    
    var noun: String = ""
    var pluralNoun: String = ""
    var adjective: String = ""
    var place: String = ""
    var funnyNoise: String = ""
    var personsName: String = ""
    var job: String = ""
    
    var storyCounter: Int = 1 //randomInt(0, max: 4)
    
    func renderStory() -> String {
        let storyPath = storyDict[storyCounter]!
        var story = loadText(storyPath)
        print(story)
        story.replace("\r\n", withString: " ")
        story.replace("<noun>", withString: noun)
        story.replace("<plural-noun>", withString: pluralNoun)
        story.replace("<adjective>", withString: adjective)
        story.replace("<place>", withString: place)
        story.replace("<funny-noise>", withString: funnyNoise)
        story.replace("<person-name>", withString: personsName)
        
        // storyCounter = (storyCounter + 1) % 5
        return story
    }
    
    let storyDict = [
        0: "madlib0_simple",
        1: "madlib1_tarzan",
        2: "madlib2_university",
        3: "madlib3_clothes",
        4: "madlib4_dance"
    ]
}

func loadText(path: String) -> String {
    let path = NSBundle.mainBundle().pathForResource(path, ofType: "txt")
    
    var mytext: String
    do {
        mytext = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        mytext.replace("<job>", withString: "hello")
    } catch {
        mytext = ""
    }
    
    return mytext
}

extension String
{
    mutating func replace(target: String, withString: String)
    {
        self = self.stringByReplacingOccurrencesOfString(target, withString: withString, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
}

func randomInt(min: Int, max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}