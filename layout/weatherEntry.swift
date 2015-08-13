//
//  weatherEntry.swift
//  layout
//
//  Created by Jakob Vinther-Larsen on 11/08/15.
//  Copyright © 2015 Vinther-moen. All rights reserved.
//

import Foundation

enum WeatherType: String {
    case Cloudy = "weather_cloud"
    case Sunny = "weather_sun"
    case OverCast = "weather_sun_cloud"
    case Thunder = "weather_thunder"
}

func randomWheather()->WeatherEntry {
    let typeNo = Int(arc4random()) % 4;
    let type: WeatherType
    if typeNo == 0 {
        type = .Cloudy
    }
    else if typeNo == 1 {
        type = .Sunny
    }
    else if typeNo == 2 {
        type = .OverCast
    }
    else {
        type = .Thunder
    }
    let predication = Int(arc4random()) % 20
    let wind = Int(arc4random()) % 20
    let temp = Int(arc4random()) % 20
    
    return WeatherEntry(name: "", type: type, precipitation: Float(predication), wind: UInt(wind), temp: temp)
}

struct WeatherEntry {
    var name: String = ""
    var type: WeatherType = .Sunny
    var precipitation: Float = 0
    var wind: UInt = 0
    var temp: Int = 0
}