//
//  ViewControllerWrapper.swift
//  Scholarship
//
//  Created by João Victor  on 06/04/22.
//

import UIKit
import SwiftUI

struct ViewControllerWrapper: UIViewControllerRepresentable {
    let vc: UIViewController?
    typealias UIViewControllerType = UIViewController
    
    func makeUIViewController(context: UIViewControllerRepresentableContext <ViewControllerWrapper>) -> UIViewController {
        
        guard let vc = vc else {
            return UIViewController()
        }
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext <ViewControllerWrapper>) {
        
    }
    
    
    
}
