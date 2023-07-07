//
//  NetworkWeatherManager.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 04.07.2023.
//

import Foundation // отвечавет за всю работу с сетью

struct NetworkWeatherManager {
    
    func fetchWeather(latitude: Double, longitude: Double, complition: @escaping (Weather)->Void) {// когда можем парсить и получать модель передаем ее через complitionGandler
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude )") else {return}
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
                }
            if let weater = self.parthJson(withData: data){ // запускаем функцию, которую написали ниже
                complition(weater) 
            }
        }.resume()
    }
    func parthJson(withData data: Data) -> Weather? { // используем дата которую полуили выше
        let decoder = JSONDecoder()
        do { //пробуем из дата преобразовать в формат Weather, если получаеться то получаем структуру weather, если нетто появляется предупреддение об ощибке
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else {
                return nil
            }
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
