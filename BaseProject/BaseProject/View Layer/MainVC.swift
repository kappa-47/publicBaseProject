//
//  MainVC.swift
//  BaseProject
//
//  Created by Qais Alnammari on 2/3/19.
//  Copyright © 2019 Qais Alnammari. All rights reserved.
//

import UIKit
import Toast_Swift
import UserNotifications

class MainVC: UIViewController {
    
    //Outlets:-
    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var subAnimatedView: UIView!
    
    //Variables:-
    private var viewModel = MainViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedView.backgroundColor = UIColor(red: 122/255, green: 145/255, blue: 241/255, alpha: 0.6)
        subAnimatedView.backgroundColor = UIColor(red: 149/255, green: 232/255, blue: 253/255, alpha: 1)
        
        let widthProb = UIScreen.main.bounds.width * 0.3
        animatedView.layer.cornerRadius = (widthProb) / 2
        subAnimatedView.layer.cornerRadius = (widthProb * 0.8) / 2
        
        animatedView.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
        animatedView.layer.shadowOpacity = 0.3
        animatedView.layer.shadowRadius = 2
        
        subAnimatedView.layer.shadowOffset = CGSize(width: 0.3, height: 0.3)
        subAnimatedView.layer.shadowOpacity = 0.3
        subAnimatedView.layer.shadowRadius = 2
        
        
    }
    
    
    
    
    @IBAction func animateAction(_ sender: UIButton) {
       
        let duration = 0.5
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .repeat, animations:  { [weak self] in
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: duration, animations: {
                self?.animatedView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                self?.subAnimatedView.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: duration, animations: {
                self?.animatedView.transform = .identity
                self?.subAnimatedView.transform = .identity
            })
            
           
        }) { (completed) in
            
        }
    }
}

