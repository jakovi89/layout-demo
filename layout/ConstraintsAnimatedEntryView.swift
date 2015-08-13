//
//  ConstraintsAnimatedEntryView.swift
//  layout
//
//  Created by Jakob Vinther-Larsen on 13/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import UIKit

class ConstraintsAnimatedEntryView: UIView {
    let model: WeatherEntry
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
        }()
    
    lazy var precipitation: UILabel = {
        let label = UILabel()
        return label
        }()
    
    lazy var wind: UILabel = {
        let label = UILabel()
        return label
        }()
    
    lazy var temperature: UILabel = {
        let label = UILabel()
        return label
        }()
    
    lazy var firstGuide: UILayoutGuide = {return UILayoutGuide()}()
    lazy var secondGuide: UILayoutGuide = {return UILayoutGuide()}()
    lazy var thirdGuide: UILayoutGuide = {return UILayoutGuide()}()
    
    var verticalLayout = [NSLayoutConstraint]()
    var todayLayout = [NSLayoutConstraint]()
    
    init(weatherEntry: WeatherEntry){
        model = weatherEntry
        super.init(frame: CGRectNull)
        
        makeSubViews()
        defineLayout()
        changeModel(weatherEntry)
    }
    
    internal func changeModel(model:WeatherEntry){
        imageView.image = UIImage(named: model.type.rawValue)
        precipitation.text = "\(model.precipitation) mm"
        wind.text = "\(model.wind) m/s"
        temperature.text = "\(model.temp) deg"
    }
    
    private func makeSubViews(){
        self.addLayoutGuide(firstGuide)
        self.addLayoutGuide(secondGuide)
        self.addLayoutGuide(thirdGuide)
        
        self.addSubview(imageView)
        self.addSubview(precipitation)
        self.addSubview(wind)
        self.addSubview(temperature)
    }
    
    private func defineLayout(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        precipitation.translatesAutoresizingMaskIntoConstraints = false
        wind.translatesAutoresizingMaskIntoConstraints = false
        temperature.translatesAutoresizingMaskIntoConstraints = false
        
        self.todayLayout = defineTodayLayout()
        self.verticalLayout = defineVerticalLayout()
    }
    
    internal func makeVertical(){
        NSLayoutConstraint.deactivateConstraints(todayLayout)
        NSLayoutConstraint.activateConstraints(verticalLayout)
    }
    
    internal func makeToday(){
        NSLayoutConstraint.deactivateConstraints(verticalLayout)
        NSLayoutConstraint.activateConstraints(todayLayout)
    }
    
    private func defineVerticalLayout()-> [NSLayoutConstraint] {
        return [
            firstGuide.heightAnchor.constraintEqualToAnchor(secondGuide.heightAnchor),
            secondGuide.heightAnchor.constraintEqualToAnchor(thirdGuide.heightAnchor),
            
            imageView.topAnchor.constraintEqualToAnchor(self.topAnchor),
            imageView.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            imageView.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor),
            imageView.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor),
            imageView.bottomAnchor.constraintEqualToAnchor(firstGuide.topAnchor),
            
            precipitation.topAnchor.constraintEqualToAnchor(firstGuide.bottomAnchor),
            precipitation.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            precipitation.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor),
            precipitation.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor),
            precipitation.bottomAnchor.constraintEqualToAnchor(secondGuide.topAnchor),
            
            wind.topAnchor.constraintEqualToAnchor(secondGuide.bottomAnchor),
            wind.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            wind.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor),
            wind.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor),
            wind.bottomAnchor.constraintEqualToAnchor(thirdGuide.topAnchor),
            
            temperature.topAnchor.constraintEqualToAnchor(thirdGuide.bottomAnchor),
            temperature.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            temperature.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor),
            temperature.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor),
            temperature.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor)
        ]
    }
    
    private func defineTodayLayout()-> [NSLayoutConstraint] {
        return [
            imageView.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor),
            imageView.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor),
            
            precipitation.leftAnchor.constraintEqualToAnchor(self.leftAnchor),
            precipitation.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor),
            
            wind.rightAnchor.constraintEqualToAnchor(self.rightAnchor),
            wind.centerYAnchor.constraintEqualToAnchor(self.centerYAnchor),
            
            temperature.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 30),
            temperature.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor)
        ]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

