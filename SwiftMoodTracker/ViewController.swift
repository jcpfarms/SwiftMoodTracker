//
//  ViewController.swift
//  SwiftMoodTracker
//
//  Created by Jacob Parker on 28/1/2026.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var currentFeeling: UILabel!
    
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var moodOfDate: UILabel!
    
    var selectedDate = Date()
    var formattedDate = Date().formatted(date: .abbreviated, time: .omitted)
    
    //Save date in array... based on index corresponding mood will be found at same index in mood array
    var dates: [Date] = []
    var mood: [Int] = []
    var slider: Int = 0
    var emoji: [String] = ["😢", "🙁", "😐", "😐", "😄"]
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getMood()
        moodOfDate.text = ""
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        getMood()
        print(moodSlider.value)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
        var found : Bool = false
        for date in dates {
            if (date == selectedDate) {
                found = true
                index = dates.firstIndex(of: date)!
                if (mood[index] >= 0 && mood[index] <= 20) {
                    index = 0
                } else if (mood[index] >= 21 && mood[index] <= 40) {
                    index = 1
                } else if (mood[index] >= 41 && mood[index] <= 60) {
                    index = 2
                } else if (mood[index] >= 61 && mood[index] <= 80) {
                    index = 3
                } else if (mood[index] >= 81 && mood[index] <= 100) {
                    index = 4
                }
                formattedDate = selectedDate.formatted(date: .abbreviated, time: .omitted)
                moodOfDate.text = "On \(formattedDate), you felt \(emoji[index])"
            }
        }
        if (!found) {
            print("No match")
        }
    }

    @IBAction func saveMood(_ sender: UIButton) {
        var found : Bool = false
        for date in dates {
            if (date == selectedDate) {
                index = dates.firstIndex(of: date)!
                mood[index] = Int(moodSlider.value)
                found = true
            }
        }
        if (!found) {
            dates.append(selectedDate)
            mood.append(Int(moodSlider.value))
        }
        
        if (moodSlider.value >= 0 && moodSlider.value <= 20) {
            index = 0
        } else if (moodSlider.value >= 21 && moodSlider.value <= 40) {
            index = 1
        } else if (moodSlider.value >= 41 && moodSlider.value <= 60) {
            index = 2
        } else if (moodSlider.value >= 61 && moodSlider.value <= 80) {
            index = 3
        } else if (moodSlider.value >= 81 && moodSlider.value <= 100) {
            index = 4
        }
        formattedDate = selectedDate.formatted(date: .abbreviated, time: .omitted)
        moodOfDate.text = "On \(formattedDate), you felt \(emoji[index])"
    }
    
    func getMood() {
        if (moodSlider.value >= 0 && moodSlider.value <= 20) {
            currentFeeling.text = "Feeling: Very Sad 😢"
        } else if (moodSlider.value >= 21 && moodSlider.value <= 40) {
            currentFeeling.text = "Feeling: Sad 🙁"
        } else if (moodSlider.value >= 41 && moodSlider.value <= 60) {
            currentFeeling.text = "Feeling: Neutral 😐"
        } else if (moodSlider.value >= 61 && moodSlider.value <= 80) {
            currentFeeling.text = "Feeling: Happy 😐"
        } else if (moodSlider.value >= 81 && moodSlider.value <= 100) {
            currentFeeling.text = "Feeling: Very Happy 😄"
        }
    }
}

