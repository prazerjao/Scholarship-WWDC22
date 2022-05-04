//
//  File.swift
//  
//
//  Created by João Victor  on 05/04/22.
//
import UIKit
import Foundation
import AVFoundation
import SwiftUI

public class TextSummerViewController: UIViewController{
    
    public weak var vc: MainViewController?
    var watering: AVAudioPlayer?
    
    override public var prefersStatusBarHidden: Bool{
        return true
    }

    public lazy var opacityView: UIView = {
        let base = UIView()
        base.frame = CGRect(x: 0, y: 0, width: view.frame.width * 1, height: view.frame.height * 1)
        base.backgroundColor = .gray
        base.alpha = 0.35
        return base
    }()
    public lazy var squareView: UIView = {
        let square = UIView()
        square.backgroundColor = #colorLiteral(red: 0.778354823589325, green: 0.7457711696624756, blue: 0.6779860854148865, alpha: 1.0)
        square.frame = CGRect(x:0 , y: view.frame.height * 0.6, width: view.frame.width, height: view.frame.height * 0.40)
        return square
    }()
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Water the Plants"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.frame = CGRect(x: view.frame.width * 0.05 , y: view.frame.height * 0.54, width: view.frame.width * 0.468, height: view.frame.height * 0.2152)
        return label
    }()
    public lazy var bodyTextField: UITextView = {
        let text = """
        Somehing that is overated in plant care is the watering process, every plant has \
        its own needs, if you water too much the roots will rot. The trick that I use is to \
        stick my finger in the dirt, if it comes out damp you don't need to water the plant \
        that day.
        """
        let textView = UITextView()
        textView.text = "\(text)"
        textView.textColor = .darkGray
        textView.isEditable = false
        //textView.font = UIFont.systemFont(ofSize: 32, weight: .thin)
        textView.adjustsFontForContentSizeCategory = true
        textView.font = .preferredFont(forTextStyle: .title2)
    
        textView.backgroundColor = .clear
        textView.frame = CGRect(x: view.frame.width * 0.05 , y: view.frame.height * 0.68, width: view.frame.width * 0.909, height: view.frame.height * 0.292)
        return textView
    }()
    public lazy var doneButton: UIButton = {
        let image: UIImage = #imageLiteral(resourceName: "Button")
        let button = UIButton()
        button.frame = CGRect(x: view.frame.width * 0.8484 , y: view.frame.height * 0.8066, width: view.frame.width * 0.103, height: view.frame.height * 0.106)
        button.setImage(image, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        watering = AudioLoader.load(filename: "watering", fileType: ".mp3")
        watering?.play()
        watering?.numberOfLoops = 8
        view.addSubview(opacityView)
        view.addSubview(squareView)
        view.addSubview(titleLabel)
        view.addSubview(bodyTextField)
        view.addSubview(doneButton)
        //view.contentMode = .scaleAspectFit

    }
    
    @objc func doneButtonAction() {
        //let vc = MainViewController()
        let image: UIImage = #imageLiteral(resourceName: "JanelaOutono")
        let text = "Autumn"
        vc?.seasonLabel.text = "\(text)"
        vc?.seasonLabel.isHidden = false
        vc?.shine.frame = CGRect(x:view.frame.width * 0.3577 , y: view.frame.height * 0.1032, width: view.frame.width * 0.114, height: view.frame.height * 0.148)
        vc?.window01.image = image
        vc?.clickablePlant02.isUserInteractionEnabled = true
        vc?.plant01Button.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            vc?.seasonLabel.isHidden = true
            vc?.shine.isHidden = false
            vc?.startShine()
        }
        watering?.pause()
        dismiss(animated: true, completion: nil)
    }
}
