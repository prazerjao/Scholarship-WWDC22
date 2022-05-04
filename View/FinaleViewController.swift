//
//  File.swift
//  
//
//  Created by João Victor  on 20/04/22.
//
import UIKit
import Foundation
import AVFoundation

public class FinaleViewController: UIViewController{
    
    var scissors: AVAudioPlayer?
    
    public weak var vc: MainViewController?
    
    override public var prefersStatusBarHidden: Bool{
        return true
    }

   
    public lazy var bodyTextField: UITextView = {
        let text = """
        When I was little, my grandmother loved gardening, and she taught me everything she knew, like fertilizing, watering and pruning, making me start to admire and appreciate nature, as well as she taught me about patience, waiting for plants to grow and develop, and so I ended up falling in love with plants like her, becoming a hobby of mine. Sadly, she passed away in September of last year, and since then I've been connecting even more with gardening, as a way to be close to her and keep her memory alive, this scene is in honor of her.
        Credits to:
        "Scissors, A.wav" by Inspector
        Rose (Prod. by Lukrembo) Link : https://youtu.be/XIhyti2Qa74
        """
        let textView = UITextView()
        textView.text = "\(text)"
        textView.textColor = .darkGray
        textView.isEditable = false
        //textView.font = UIFont.systemFont(ofSize: 26, weight: .thin)
        textView.adjustsFontForContentSizeCategory = true
        textView.font = .preferredFont(forTextStyle: .title2)
        textView.backgroundColor = .clear
        textView.frame = CGRect(x: view.frame.width * 0.0683 , y: view.frame.height * 0.1281, width: view.frame.width * 0.3738, height: view.frame.height * 0.8575)
        return textView
    }()
    
    public lazy var photo: UIImageView = {
        var image = UIImageView(image: .init(#imageLiteral(resourceName: "grandma")))
        image.layer.zPosition = 1
        image.frame = CGRect(x:view.frame.width * 0.4738 , y: view.frame.height * 0.1171, width: view.frame.width * 0.5117, height: view.frame.height * 0.7517)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.778354823589325, green: 0.7457711696624756, blue: 0.6779860854148865, alpha: 1.0)
        view.addSubview(bodyTextField)
        view.addSubview(photo)

    }

}
