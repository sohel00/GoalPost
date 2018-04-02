//
//  CreateGoalsVC.swift
//  GoalPost
//
//  Created by Sohel Dhengre on 29/03/18.
//  Copyright © 2018 Sohel Dhengre. All rights reserved.
//

import UIKit

class CreateGoalsVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalPostTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    
    var status: GoalType = .ShortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalPostTextView.delegate = self
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.deselectedColor()
    }
    
    
    @IBAction func longTermPressed(_ sender: Any) {
        status = .LongTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.deselectedColor()
        
    }
    
    @IBAction func shortTermPressed(_ sender: Any) {
        status = .ShortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.deselectedColor()
        
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if goalPostTextView.text != "" && goalPostTextView.text != "What is your goal?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "finishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalPostTextView.text!, type: status)
            presentVC(finishGoalVC)
        }
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismissVC()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalPostTextView.text = ""
        goalPostTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
