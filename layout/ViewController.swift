//  ViewController.swift stackFlip
//  layout
//
//  Created by Jakob Vinther-Larsen on 11/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import UIKit

//class ViewController: UIViewController {
//    lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .Horizontal
//        stackView.alignment = .Fill
//        stackView.distribution = .FillEqually
//        return stackView
//        }()
//    
//    let todayWeather = weatherEntryView(weatherEntry: randomWheather())
//    let flipTopLayoutButton = UIButton(type: .Custom)
//    var layoutFlipped = false
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        view.backgroundColor = UIColor.whiteColor()
//        makeSubviews()
//        defineLayout()
//    }
//    
//    private func makeSubviews(){
//        self.view.addSubview(stackView)
//        
//        for _ in 1...5 {
//            let entry = randomWheather()
//            let entryView = weatherEntryView(weatherEntry: entry)
//            stackView.addArrangedSubview(entryView)
//        }
//        self.view.addSubview(todayWeather)
//        self.view.addSubview(flipTopLayoutButton)
//        flipTopLayoutButton.setTitle("Flip top layout", forState: .Normal)
//        flipTopLayoutButton.addTarget(self, action: Selector("flipLayout"), forControlEvents: .TouchUpInside)
//        flipTopLayoutButton.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
//    }
//    
//    private func defineLayout(){
//        stackView.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
//        stackView.heightAnchor.constraintEqualToConstant(200).active = true
//        stackView.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor).active = true
//        stackView.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true
//        
//        todayWeather.translatesAutoresizingMaskIntoConstraints = false
//        todayWeather.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 30).active = true
//        todayWeather.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor).active = true
//        todayWeather.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true
//        todayWeather.bottomAnchor.constraintEqualToAnchor(stackView.topAnchor, constant: -30).active = true
//        
//        flipTopLayoutButton.translatesAutoresizingMaskIntoConstraints = false
//        flipTopLayoutButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
//        flipTopLayoutButton.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
//    }
//    
//    func flipLayout(){
//        UIView.animateWithDuration(1) { () -> Void in
//            if self.layoutFlipped {
//                self.todayWeather.makeHorizontal()
//            }else{
//                self.todayWeather.makeVertical()
//            }
//            self.layoutFlipped = !self.layoutFlipped
//            self.view.layoutIfNeeded()
//            
//        }
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//}
//
