//
//  ViewController.swift
//  AnimatedWorld
//
//  Created by Анастасия Булдакова on 09.12.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    
    @IBOutlet var animationView: SpringView!
    
    @IBOutlet var labelSettings: UILabel!
    @IBOutlet var buttonSettings: SpringButton!
    
    
    let presets: [String] = AnimationPreset.allCases.map { $0.rawValue }
    let curves: [String] = AnimationCurve.allCases.map { $0.rawValue }
    let randomForce = [0, 0.5, 0.7, 1, 1.25, 1.5]
    let randomDuration = [0, 0.5, 0.7, 1, 1.25, 1.5]
    let randomDelay = [0.3, 0.5, 0.7, 1]
    
    var randomPreset: String?
    
    
    override func viewDidLoad () {
        super.viewDidLoad ()
        buttonSettings.setTitle("Run", for: .normal)
        settingsPreset()
        labelText()
    }
    
    @IBAction func changeAnimation(_ sender: SpringButton) {
        
        settingsPreset()
        labelText()
        randomPreset = presets.randomElement ()
        buttonSettings.setTitle("Run \(randomPreset ?? "")", for: .normal)
        
    }
    
    func settingsPreset() {
        animationView.animation = "\(randomPreset ?? "pop")"
        animationView.curve = "\(curves.randomElement () ?? "spring")"
        animationView.force = randomForce.randomElement () ?? 0
        animationView.duration = randomDuration.randomElement () ?? 0
        animationView.delay = randomDelay.randomElement () ?? 0

        animationView.animate ()
    }
    
   private func labelText() {
        labelSettings.text = """
        preset: \(animationView.animation)
        curve: \(animationView.curve)
        force: \(animationView.force)
        duration: \(animationView.duration)
        delay: \(animationView.delay)
"""
    }
    
    
}

