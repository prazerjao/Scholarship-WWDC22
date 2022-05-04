//
//  File.swift
//  Scholarship
//
//  Created by João Victor  on 05/04/22.
//
import UIKit
import Foundation
import AVFoundation

public class MainViewController: UIViewController{
    
    //Declaring and creating the elements for the screen
    
    var music: AVAudioPlayer?
    var isOver:Bool = false
    
    override public var prefersStatusBarHidden: Bool{
        return true
    }
    
    public lazy var window01: UIImageView = {
        var image = UIImageView(image: .init(#imageLiteral(resourceName: "JanelaVerao.png")))
        image.layer.zPosition = 1
        image.frame = CGRect(x:view.frame.width * 0.08 , y: view.frame.height * 0.0, width: view.frame.width * 0.48, height: view.frame.height * 0.55)
        image.contentMode = .scaleAspectFit
        return image
    }()
    public lazy var background: UIImageView = {
        let image = UIImageView(image: .init(#imageLiteral(resourceName: "FundoBase02")))
        image.layer.zPosition = 3
        image.frame = CGRect(x: 0, y: 0, width: view.frame.width * 1, height: view.frame.height * 1)
        image.contentMode = .scaleToFill
        return image
    }()

    public lazy var plant01Button: UIButton = {
        let button = UIButton()
        let image: UIImage = #imageLiteral(resourceName: "Flor01Botao.png")
        button.layer.zPosition = 6
        button.frame = CGRect(x:view.frame.width * 0.342 , y: view.frame.height * 0.3818, width: view.frame.width * 0.074, height: view.frame.height * 0.089)
        button.backgroundColor = .clear
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(plant01ButtonAction), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        button.isEnabled = true
        button.isUserInteractionEnabled = true
        return button
    }()
    public lazy var plant02: UIImageView = {
        let image = UIImageView()
        let name: UIImage = #imageLiteral(resourceName: "Flor02Botao.png")
        image.layer.zPosition = 7
        image.image = name
        image.frame = CGRect(x:view.frame.width * 0.143 , y: view.frame.height * 0.684, width: view.frame.width * 0.064, height: view.frame.height * 0.095)
        image.contentMode = .scaleAspectFit
        return image
    }()
    public lazy var plant03: UIImageView = {
        let image = UIImageView()
        let name: UIImage = #imageLiteral(resourceName: "Flor03Botao.png")
        image.layer.zPosition = 8
        image.image = name
        image.frame = CGRect(x:view.frame.width * 0.10 , y: view.frame.height * 0.673, width: view.frame.width * 0.027, height: view.frame.height * 0.038)
        image.contentMode = .scaleAspectFit
        return image
    }()
    public lazy var plant04: UIImageView = {
        let image = UIImageView()
        let name: UIImage = #imageLiteral(resourceName: "Flor03Botao.png")
        image.layer.zPosition = 9
        image.image = name
        image.frame = CGRect(x:view.frame.width * 0.822 , y: view.frame.height * 0.11, width: view.frame.width * 0.071, height: view.frame.height * 0.051)
        image.contentMode = .scaleAspectFit
        return image
    }()
    public lazy var clockTime: UIImageView = {
        let image = UIImageView(image: .init(#imageLiteral(resourceName: "Text")))
        image.layer.zPosition = 10
        image.frame = CGRect(x:view.frame.width * 0.629 , y: view.frame.height * 0.50, width: view.frame.width * 0.03, height: view.frame.height * 0.012)
        image.contentMode = .scaleAspectFit
        return image
    }()
    public lazy var clickablePlant01: UIButton = {
        let button = UIButton()
        let image: UIImage = #imageLiteral(resourceName: "FinalPlant")
        button.layer.zPosition = 5
        button.setImage(image, for: .normal)
        button.frame = CGRect(x:view.frame.width * 0.2686 , y: view.frame.height * 0.575, width: view.frame.width * 0.0402, height: view.frame.height * 0.0673)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(clickablePlant01Action), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        return button
    }()
    public lazy var clickablePlant02: UIButton = {
        let button = UIButton()
        button.layer.zPosition = 3
        button.frame = CGRect(x:view.frame.width * 0.3587 , y: view.frame.height * 0.1035, width: view.frame.width * 0.114, height: view.frame.height * 0.148)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(clickablePlant02Action), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        button.isUserInteractionEnabled = false
        return button
    }()
    
    public lazy var shine: UIImageView = {
        let image = UIImageView()
        let name: UIImage = #imageLiteral(resourceName: "Brilho.png")
        image.image = name
        image.frame = CGRect(x:view.frame.width * 0.335 , y: view.frame.height * 0.3618, width: view.frame.width * 0.084, height: view.frame.height * 0.099)
        image.contentMode = .scaleAspectFit
        image.layer.zPosition = 2
        return image
    }()
    
    public lazy var seasonLabel: UILabel = {
        let label = UILabel()
        var text = "Summer"
        label.layer.zPosition = 11
        label.frame = CGRect(x: 0, y: 0, width: view.frame.width * 1, height: view.frame.height * 1)
        label.text = ("\(text)")
        label.font = UIFont.systemFont(ofSize: 280, weight: .ultraLight)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    //Calling the elements and position in the screen
    public override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapHandle(_:)))
        music = AudioLoader.load(filename: "music", fileType: ".mp3")
        
        view.backgroundColor = UIColor(named: "bgColor")
        view.addSubview(window01)
        view.addSubview(shine)
        view.addSubview(background)
        view.addSubview(plant02)
        view.addSubview(plant03)
        view.addSubview(plant04)
        view.addSubview(plant01Button)
        view.addSubview(clickablePlant01)
        view.addSubview(clockTime)
        view.addSubview(clickablePlant02)
        view.addSubview(seasonLabel)
        view.addGestureRecognizer(gesture)
        startLights()
        startWatch()
        music?.play()
        shine.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            seasonLabel.isHidden = true
            shine.isHidden = false
            startShine()
        }
    }
    
    //Function to add action to the buttons
    @objc func plant01ButtonAction() {
        let vc = TextSummerViewController()
        vc.vc = self
        shine.isHidden = true
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
        
    }
    
    @objc func clickablePlant01Action() {
        let vc = TextWinterViewController()
        vc.vc = self
        shine.isHidden = true
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @objc func clickablePlant02Action() {
        let vc = TextAutumnViewController()
        vc.vc = self
        shine.isHidden = true
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @objc public func tapHandle(_ sender: UITapGestureRecognizer) {
    }
    
    
    var animator: UIViewPropertyAnimator!
        
    func startLights(_ reversed: Bool = false) {
        let name: UIImage = #imageLiteral(resourceName: "FundoBase02.png")
        let name02: UIImage = #imageLiteral(resourceName: "FundoBase01.png")
        
        animator = UIViewPropertyAnimator()
        animator.addAnimations { [self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.background.image = name
            }
        }
        
        
        animator.addCompletion { [self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.background.image = name02
                self.startLights()
            }
            
        }
        animator.startAnimation()
    }
    
    func startShine(_ reversed: Bool = false) {
        
        animator = UIViewPropertyAnimator()
        animator.addAnimations { [self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                self.shine.alpha = 0.3
            }
        }
        
        
        animator.addCompletion { [self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.shine.alpha = 1.0
                self.startShine()
            }
         
        }
        animator.startAnimation()
    }
    
    func startWatch(_ reversed: Bool = false) {
        
        animator = UIViewPropertyAnimator()
        animator.addAnimations { [self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.clockTime.alpha = 0.3
            }
        }
        
        
        animator.addCompletion { [self] _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.clockTime.alpha = 1.0
                self.startWatch()
            }
            
        }
        animator.startAnimation()
    }
    
    func finale (){
        let vc = FinaleViewController()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    
        func stop() {
            animator.stopAnimation(true)
        }
}

