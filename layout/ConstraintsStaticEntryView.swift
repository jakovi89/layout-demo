//
//  ConstraintsStaticEntryView.swift
//  layout
//
//  Created by Jakob Vinther-Larsen on 13/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import UIKit

class ConstraintsStaticEntryView: UIView {
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
        
        firstGuide.heightAnchor.constraintEqualToAnchor(secondGuide.heightAnchor).active = true
        secondGuide.heightAnchor.constraintEqualToAnchor(thirdGuide.heightAnchor).active = true
        
        imageView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        imageView.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        imageView.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor).active = true
        imageView.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor).active = true
        imageView.bottomAnchor.constraintEqualToAnchor(firstGuide.topAnchor).active = true
        
        precipitation.topAnchor.constraintEqualToAnchor(firstGuide.bottomAnchor).active = true
        precipitation.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        precipitation.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor).active = true
        precipitation.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor).active = true
        precipitation.bottomAnchor.constraintEqualToAnchor(secondGuide.topAnchor).active = true
        
        wind.topAnchor.constraintEqualToAnchor(secondGuide.bottomAnchor).active = true
        wind.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        wind.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor).active = true
        wind.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor).active = true
        wind.bottomAnchor.constraintEqualToAnchor(thirdGuide.topAnchor).active = true
        
        temperature.topAnchor.constraintEqualToAnchor(thirdGuide.bottomAnchor).active = true
        temperature.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        temperature.leadingAnchor.constraintGreaterThanOrEqualToAnchor(self.leadingAnchor).active = true
        temperature.trailingAnchor.constraintLessThanOrEqualToAnchor(self.trailingAnchor).active = true
        temperature.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

