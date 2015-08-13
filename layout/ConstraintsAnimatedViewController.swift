//
//  ConstraintsAnimatedViewController.swift
//  layout
//
//  Created by Jakob Vinther-Larsen on 13/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import UIKit

class ConstraintsAnimatedViewController: UIViewController {
    var guides = [UILayoutGuide]()
    var entryViews = [ConstraintsAnimatedEntryView]()
    
    let todayWeather = ConstraintsAnimatedEntryView(weatherEntry: randomWheather())
    
    let flipTopLayoutButton = UIButton(type: .Custom)
    var layoutFlipped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.whiteColor()
        makeSubviews()
        defineLayout()
    }
    
    private func makeSubviews(){
        
        for _ in 1...5 {
            let entry = randomWheather()
            let entryView = ConstraintsAnimatedEntryView(weatherEntry: entry)
            self.view.addSubview(entryView)
            entryView.makeVertical()
            self.entryViews.append(entryView)
        }
        
        self.view.addSubview(todayWeather)
        
        
        self.view.addSubview(flipTopLayoutButton)
        flipTopLayoutButton.setTitle("Flip top layout", forState: .Normal)
        flipTopLayoutButton.addTarget(self, action: Selector("flipLayout"), forControlEvents: .TouchUpInside)
        flipTopLayoutButton.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
    }
    
    private func defineLayout(){
        let centerGuide = UILayoutGuide()
        self.view.addLayoutGuide(centerGuide)
        centerGuide.heightAnchor.constraintEqualToConstant(100).active = true
        centerGuide.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor).active = true
        centerGuide.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor).active = true
        centerGuide.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true
        
        for _ in 1...(entryViews.count + 1) {
            let guide = UILayoutGuide()
            self.view.addLayoutGuide(guide)
            self.guides.append(guide)
        }
        
        for var i = 0; i < entryViews.count; i++ {
            let entryView = entryViews[i]
            entryView.translatesAutoresizingMaskIntoConstraints = false
            entryView.topAnchor.constraintEqualToAnchor(centerGuide.topAnchor).active = true
            entryView.bottomAnchor.constraintEqualToAnchor(centerGuide.bottomAnchor).active = true
        }
        
        for var i = 0; i < guides.count; i++ {
            let guide = guides[i]
            let leadingAnchor = i == 0 ? self.view.leadingAnchor : self.entryViews[i - 1].trailingAnchor
            let trailingAnchor = i == guides.count - 1 ? self.view.trailingAnchor : self.entryViews[i].leadingAnchor
            
            guide.leadingAnchor.constraintEqualToAnchor(leadingAnchor).active = true
            guide.trailingAnchor.constraintEqualToAnchor(trailingAnchor).active = true
            if i > 0 {
                guide.widthAnchor.constraintEqualToAnchor(guides[i - 1].widthAnchor).active = true
            }
        }
        
        todayWeather.translatesAutoresizingMaskIntoConstraints = false
        todayWeather.topAnchor.constraintEqualToAnchor(self.view.topAnchor, constant: 30).active = true
        todayWeather.leadingAnchor.constraintEqualToAnchor(self.view.leadingAnchor).active = true
        todayWeather.trailingAnchor.constraintEqualToAnchor(self.view.trailingAnchor).active = true
        todayWeather.bottomAnchor.constraintEqualToAnchor(centerGuide.topAnchor, constant: -30).active = true
        
        todayWeather.makeVertical()
        
        flipTopLayoutButton.translatesAutoresizingMaskIntoConstraints = false
        flipTopLayoutButton.bottomAnchor.constraintEqualToAnchor(self.view.bottomAnchor).active = true
        flipTopLayoutButton.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
    }
    
    func flipLayout(){
        UIView.animateWithDuration(1) { () -> Void in
            if self.layoutFlipped {
                self.todayWeather.makeToday()
            }else{
                self.todayWeather.makeVertical()
            }
            self.layoutFlipped = !self.layoutFlipped
            self.view.layoutIfNeeded()
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


