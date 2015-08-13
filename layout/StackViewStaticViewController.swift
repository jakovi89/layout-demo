//
//  StackViewStaticViewController.swift
//  layout
//
//  Created by Jakob Vinther-Larsen on 13/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import UIKit

class StackViewStaticViewController: UIViewController {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .Horizontal
        stackView.alignment = .Fill
        stackView.distribution = .FillEqually
        return stackView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.whiteColor()
        makeSubviews()
        defineLayout()
    }
    
    private func makeSubviews(){
        self.view.addSubview(stackView)
        
        for _ in 1...5 {
            let entry = randomWheather()
            let entryView = StackViewStaticEntryView(weatherEntry: entry)
            stackView.addArrangedSubview(entryView)
        }
    }
    
    private func defineLayout(){
        stackView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        stackView.heightAnchor.constraintEqualToConstant(200).active = true
        stackView.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor).active = true
        stackView.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


