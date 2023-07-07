//
//  Weather.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 04.07.2023.
//

import Foundation // структура погоды, используем когда будем передавать или рабоаттьь с ней
// модель, с которой будем рабоать в приложении 
struct Weather { // вводим все данные которые будут в погоде и которые нам необходимы
    var name: String = "Название"
    var temperature: Int = 0
    var temperatureString: String {
        return String(temperature)
    }
    var conditionCode: String = "" // картинка которая будет приходить ссылкой
    var url: String = ""
    var condition: String = "" // условия погоды
    var pressureMm: Int = 0
    var windSpeed: Int = 0
    var tempMax: Int = 0
    var tempMin: Int = 0
    
    var conditionString: String {
        switch condition {
        case "clear":               return "ясно"
        case "partly-cloudy":       return "малооблачно"
        case "cloudy":              return "облачно с прояснениями"
        case "overcast":            return "пасмурно"
        case "light-rain":          return "небольшой дождь"
        case "rain":                return "дождь"
        case "heavy-rain":          return "сильный дождь"
        case "showers":             return "ливень"
        case "wet-snow":            return "дождь со снегом"
        case "light-snow":          return "небольшой снег"
        case "snow":                return "снег"
        case "snow-showers":        return "снегопад"
        case "hail":                return "град"
        case "thunderstorm":        return "гроза"
        case "thunderstorm-with-rain": return "дождь с грозой"
        case "thunderstorm-with-hail": return "гроза с градом"
            
        default:                    return "Загрузка..."
        }
    }
    init?(weatherData: WeatherData) { // пишем инициализатор и инциализируем наши параметры
        temperature = weatherData.fact?.temp ?? 0 // присваиваем значения
        conditionCode = weatherData.fact?.icon ?? "nil"
        url = weatherData.info?.url ?? "nil"
        condition = weatherData.fact?.condition ?? "nil"
        pressureMm = weatherData.fact?.pressureMm ?? 0
        windSpeed = Int(weatherData.fact?.windSpeed ?? Double(0))
        tempMax = weatherData.forecasts?.first?.parts?.day?.tempMax ?? 0 // обращаемся через first так как массив
        tempMin = weatherData.forecasts?.first?.parts?.day?.tempMin ?? 0
    }
    init() {
    }
   
}
