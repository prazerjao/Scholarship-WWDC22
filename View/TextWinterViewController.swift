//
//  File.swift
//  
//
//  Created by João Victor  on 05/04/22.
//
import UIKit
import Foundation
import AVFoundation

public class TextWinterViewController: UIViewController{
    
    var dirt: AVAudioPlayer?
    public weak var vc: MainViewController?
    
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
        label.text = "Fertilize the Plants"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 40, weight: .light)
        label.frame = CGRect(x: view.frame.width * 0.05 , y: view.frame.height * 0.54, width: view.frame.width * 0.468, height: view.frame.height * 0.2152)
        return label
    }()
    @IBOutlet public lazy var bodyTextField: UITextView? = {
        let text = """
        Fertilizing plants is an essential part, thanks to it we can guarantee the quality of leaves and flowers, to begin understand we need to see the types of fertilizer, they are:
        Organic: They have a great nutritional value coming from organic matter of animal or vegetable origin, being composed of animal waste or remains of flowers and fruits.
        Inorganic: They are compounds originating from the refinement of petroleum or the extraction of minerals.
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
    @IBOutlet public lazy var doneButton: UIButton? = {
        let image01: UIImage = #imageLiteral(resourceName: "NextButton")
        let button = UIButton()
        button.frame = CGRect(x: view.frame.width * 0.8484 , y: view.frame.height * 0.8466, width: view.frame.width * 0.103, height: view.frame.height * 0.106)
        button.setImage(image01, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        dirt = AudioLoader.load(filename: "dirt", fileType: ".wav")
        dirt?.play()
        dirt?.numberOfLoops = 8
        view.addSubview(opacityView)
        view.addSubview(squareView)
        view.addSubview(titleLabel)
        view.addSubview(bodyTextField!)
        view.addSubview(doneButton!)
        //view.contentMode = .scaleAspectFit

    }
    @objc func nextButtonAction() {
        let text = """
            Taking care of plants is always about looking and analyzing, so if your plant is not flowering or has cracks or changes opacity in the leaves, it is a sign that it is time to fertilize and for that, some tips that I use are always reading labels
            """
        let image: UIImage = #imageLiteral(resourceName: "NextButton")
        
        bodyTextField?.text = "\(text)"
        doneButton!.setImage(image, for: .normal)
        doneButton!.addTarget(self, action: #selector(nextButton02Action), for: .touchUpInside)
    }
    @objc func nextButton02Action() {
        let text = """
            There are different types of concentration of each inorganic matter, and together they serve for different functions such as flowering, fruiting or simply stimulating the growth of the plant and leaving the foliage more beautiful, another tip is to always prefer organic fertilizers, they are absorbed slower, but they are more ecological because they are renewable.
            """
        let image: UIImage = #imageLiteral(resourceName: "Button.png")
        
        bodyTextField?.text = "\(text)"
        doneButton!.setImage(image, for: .normal)
        doneButton!.addTarget(self, action: #selector(doneButtonAction), for: .touchUpInside)
    }
    @objc func doneButtonAction() {
        let image: UIImage = #imageLiteral(resourceName: "JanelaPrimavera")
        
        let flower01: UIImage = #imageLiteral(resourceName: "Flor01.png")
        let flower02: UIImage = #imageLiteral(resourceName: "Flor02.png")
        let flower03: UIImage = #imageLiteral(resourceName: "Flor03.png")
        
        view.addSubview(squareView)
        let text = "Spring"
        vc?.seasonLabel.text = "\(text)"
        vc?.seasonLabel.isHidden = false
        vc?.window01.image = image
        vc?.clickablePlant01.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
            vc?.seasonLabel.isHidden = true
            vc?.plant01Button.setImage(flower01, for: .normal)
            vc?.plant02.image = flower02
            vc?.plant03.image = flower03
            vc?.plant04.image = flower03
            vc?.isOver = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [self] in
            vc?.finale()
        }
        dirt?.pause()
        dismiss(animated: true, completion: nil)
    }
}

