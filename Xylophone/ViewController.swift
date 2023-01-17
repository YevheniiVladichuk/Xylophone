//
//  ViewController.swift
//  Xylophone
//
//  Created by Yevhenii Vladichuk on 11/01/2023.
//
import UIKit
import AVFoundation

var player: AVAudioPlayer!

let stackView = UIStackView()
let keyC = UIButton()
let keyD = UIButton()
let keyE = UIButton()
let keyF = UIButton()
let keyG = UIButton()
let keyA = UIButton()
let keyB = UIButton()

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configStackView()
        
        configButton(button: keyC, background: UIColor(red: 255/255.0, green: 62/255.0, blue: 70/255.0, alpha: 1), title: "C", leadingAnchor: 5, trailingAnchor: -5)
        configButton(button: keyD, background: UIColor(red: 255/255.0, green: 149/255.0, blue: 0/255.0, alpha: 1), title: "D", leadingAnchor: 10, trailingAnchor: -10)
        configButton(button: keyE, background: UIColor(red: 255/255.0, green: 204/255.0, blue: 1/255.0, alpha: 1), title: "E", leadingAnchor: 15, trailingAnchor: -15)
        configButton(button: keyF, background: UIColor(red: 53/255.0, green: 199/255.0, blue: 89/255.0, alpha: 1), title: "F", leadingAnchor: 25, trailingAnchor: -25)
        configButton(button: keyG, background: UIColor(red: 88/255.0, green: 86/255.0, blue: 213/255.0, alpha: 1), title: "G", leadingAnchor: 30, trailingAnchor: -30)
        configButton(button: keyA, background: UIColor(red: 1/255.0, green: 122/255.0, blue: 255/255.0, alpha: 1), title: "A", leadingAnchor: 35, trailingAnchor: -35)
        configButton(button: keyB, background: UIColor(red: 174/255.0, green: 82/255.0, blue: 222/255.0, alpha: 1), title: "B", leadingAnchor: 45, trailingAnchor: -45)
    }
    
    func configStackView(){
        self.view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        //constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func configButton(button: UIButton, background: UIColor, title: String, leadingAnchor: CGFloat, trailingAnchor: CGFloat){
        stackView.addArrangedSubview(button)
        button.backgroundColor = background
        button.layer.cornerRadius = 25
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        //constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: trailingAnchor).isActive = true
    }
    
    @objc func buttonTapped(sender: UIButton!) {
        print("Start")
        playSound(soundName: sender.currentTitle!)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
            print("End")
        }
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player  = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
