//
//  Game.swift
//  Word Game
//
//  Created by Amina Qureshi on 21/3/18.
//  Copyright © 2018 Amina Qureshi. All rights reserved.
//

import Foundation


struct Game {
    //Variable to keep user's current score
    var currentScore: Int
    //Variable to keep the shuffled list of words
    var listOfWords: [String]


    
    //Function to shuffle words
    func shuffle(stringArray:[String]) -> [String] {
        //create a copy of the input array
        var items = stringArray
        
        //our new shuffled array
        var shuffled = [String]();
        
        //iterate through the item array
        for _ in items.enumerated()
        {
            //choose a random number
            let rand = Int(arc4random_uniform(UInt32(items.count)))
            //using that random number, select a random item
            let randomItem = items[rand]
            //append that random item to our new shuffled array
            shuffled.append(randomItem)
            //make sure to remove that item, so we don't pick it again
            items.remove(at: rand)
        }
        return shuffled
    }
    
    

}
