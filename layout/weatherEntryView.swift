//  weatherEntryView.swift stackFlip
//  layout
//
//  Created by Jakob Vinther-Larsen on 11/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import UIKit

//class weatherEntryView: UIView {
//    let model: WeatherEntry
//    
//    lazy var imageView: UIImageView = {
//        let imageView = UIImageView()
//        return imageView
//        }()
//    
//    lazy var precipitation: UILabel = {
//        let label = UILabel()
//        return label
//        }()
//    
//    lazy var wind: UILabel = {
//        let label = UILabel()
//        return label
//        }()
//    
//    lazy var temperature: UILabel = {
//        let label = UILabel()
//        return label
//        }()
//    
//    lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.alignment = .Center
//        stackView.distribution = .EqualSpacing
//        stackView.axis = .Vertical
//        return stackView
//        }()
//    
//    init(weatherEntry: WeatherEntry){
//        model = weatherEntry
//        super.init(frame: CGRectNull)
//        
//        makeSubViews()
//        defineLayout()
//        changeModel(weatherEntry)
//    }
//    
//    internal func changeModel(model:WeatherEntry){
//        imageView.image = UIImage(named: model.type.rawValue)
//        precipitation.text = "\(model.precipitation) mm"
//        wind.text = "\(model.wind) m/s"
//        temperature.text = "\(model.temp) deg"
//    }
//    
//    private func makeSubViews(){
//
//        stackView.addArrangedSubview(imageView)
//        stackView.addArrangedSubview(precipitation)
//        stackView.addArrangedSubview(wind)
//        stackView.addArrangedSubview(temperature)
//                self.addSubview(stackView)
//    }
//    
//    private func defineLayout(){
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
//        stackView.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor).active = true
//        stackView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
//        stackView.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor).active = true
//    }
//    
//    internal func makeVertical(){
//        stackView.axis = .Vertical
//        stackView.alignment = UIStackViewAlignment.Leading
//    }
//    
//    internal func makeHorizontal(){
//        stackView.axis = .Horizontal
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
