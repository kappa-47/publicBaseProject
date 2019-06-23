//
//  SKPreloadingView.swift
//  WalkAndTalk
//
//  Created by Moayad Al kouz on 9/25/18.
//  Copyright © 2018 Dopravo. All rights reserved.
//

import UIKit

/**
 Custom animation view used for preloading lists.
 */
class SKPreloadingView: UIView{
    
    var spinnerColors: [UIColor]{
        return [
            
            
            UIColor(red: 0.63, green: 0.15, blue: 0.46, alpha:1),
            UIColor(red: 0.44, green: 0.15, blue: 0.46, alpha:1),
            UIColor(red: 0.41, green: 0.15, blue: 0.46, alpha:1),
            UIColor(red: 0.44, green: 0.15, blue: 0.46, alpha:1),
            UIColor(red: 0.63, green: 0.15, blue: 0.46, alpha:1),
            UIColor(red: 0.84, green: 0.25, blue: 0.42, alpha:1),
            UIColor(red: 0.87, green: 0.35, blue: 0.36, alpha:1),
            UIColor(red: 0.84, green: 0.22, blue: 0.44, alpha:1)
        ]
    }
    
    private let spinnerView = SKActivityIndicator(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override var frame: CGRect{
        didSet{
            spinnerView.center = self.center
        }
    }
    open class var shared: SKPreloadingView {
        struct Singleton {
            static let instance = SKPreloadingView(frame: UIApplication.shared.windows.first!.bounds)
        }
        return Singleton.instance
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure(){

        let backView = UIView(frame: self.bounds)
        backView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backView.backgroundColor = .clear
        self.addSubview(backView)
        
        let blurEffect = UIBlurEffect(style: .prominent)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        blurEffectView.center = self.center
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.75
        blurEffectView.layer.cornerRadius = 50
        blurEffectView.layer.masksToBounds = true
        self.addSubview(blurEffectView)
        
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 55
        self.layer.shadowOpacity = 0.9
        
        spinnerView.center = self.center
        
        spinnerView.colors = self.spinnerColors
        spinnerView.style = .spinningFadeCircle
        
        
        
        self.addSubview(spinnerView)
    }
    
    open class func show(inView view: UIView) -> SKPreloadingView {
        
        let spinner = SKPreloadingView.shared
        spinner.removeFromSuperview()
        if spinner.superview == nil {
            //show the spinner
            view.addSubview(spinner)
            spinner.frame = view.bounds//CGRect(x: 0, y: 0, width: 100, height: 100)
            spinner.center = view.center
        }
        return spinner
    }
    
    open class func show() -> SKPreloadingView? {
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else{
            return nil
        }
        guard let window = appDel.window else{
            return nil
        }
        
        let spinner = SKPreloadingView.shared
        
        spinner.removeFromSuperview()
        if spinner.superview == nil {
            //show the spinner
            spinner.alpha = 0.0
            spinner.frame = window.bounds
            spinner.center = window.center
            window.addSubview(spinner)
            //            UIView.animate(withDuration: 0.33, delay: 0.0, options: .curveEaseOut, animations: {
            spinner.alpha = 1.0
            window.bringSubviewToFront(spinner)
            //            }, completion: nil)
            
        }
        return spinner
    }
    
    //
    // Hide the spinner
    //
    open class func hide(_ completion: (() -> Void)? = nil) {
        
        let spinner = SKPreloadingView.shared
        
        NotificationCenter.default.removeObserver(spinner)
        
        DispatchQueue.main.async(execute: {
            if spinner.superview == nil {
                return
            }
            UIView.animate(withDuration: 0.33, delay: 0.0, options: .curveEaseOut, animations: {
                spinner.alpha = 0.0
            }, completion: {_ in
                spinner.alpha = 1.0
                spinner.removeFromSuperview()
                completion?()
            })
            
        })
    }
    
}
