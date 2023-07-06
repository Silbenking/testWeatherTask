//
//  NetworkWeatherManager.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 04.07.2023.
//

import Foundation // отвечавет за всю работу с сетью

struct NetworkWeatherManager {
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393") else {return}
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }.resume()
    }
}
