//
//  ViewController.swift
//  AnimatedWorld
//
//  Created by Анастасия Булдакова on 09.12.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var animationLabel: UILabel! {
        didSet {
            animationLabel.text = animation.description
        }
    }
    
    
    // MARK: - Private properties
    private var animation = Animation.getRandomAnimation()
    
    // MARK: - IB Actions
    @IBAction func changeAnimation(_ sender: SpringButton) {
        animationLabel.text = animation.description
        
        animationView.animation = animation.name
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
        animationView.curve = animation.curve
        animationView.animate()
        
        animation = Animation.getRandomAnimation()
        sender.setTitle("Run \(animation.name)", for: .normal)
    }
}

