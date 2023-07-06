//
//  WeatherData.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 04.07.2023.
//

import Foundation
 //модель, которую мы преобзащуем на JSON
struct WeatherData: Decodable {
    let info: Info?
    let fact: Fact?
    let forecasts: [Forecast]?
}

struct Info: Decodable {
    let url: String?
}

struct Fact: Decodable {
    let temp: Int?
    let icon: String?
    let condition: String?
    let windSpeed: Double?
    let pressureMm: Int?
    
    enum CodingKeys: String, CodingKey {
        case condition
        case icon
        case temp
        case windSpeed = "wind_speed"
        case pressureMm = "pressure_mm"
    }
}

struct Forecast: Decodable {
    let parts: Parts?
}

struct Parts: Decodable {
    let day: Day?
}

struct Day: Decodable {
    let tempMin: Int?
    let tempMax: Int?
    // переводим в из snake_keys в camelKeys
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
