//
//  GetCityWeather.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 06.07.2023.
//

import Foundation
import CoreLocation

// метод, который будет перебирать массив и записывать данные в новый массив
func getCityWeather(cityesArray: [String], complition: @escaping (Int, Weather)-> Void) {  // компллишен передает индекс и погоду, которую будем получать
    for (index, item) in cityesArray.enumerated() { //index -  индекс каждого элемента в массиве, item - значение каждого элемента массива, индекс у Москвы 0, item будем Москва
        getCoordinaterom(city: item ) { coordinate, error in // item переходит Москва и по ней мы получаем координаты
            guard let coordinate = coordinate, error == nil else {return}
            // после того как получили координаты, должны их подставить в fetchWeather()
            NetworkWeatherManager().fetchWeather(latitude:  coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                complition(index, weather) // передаем два входных параметра Int, Weather
            }
        }
    }
}

// метод, который будет определять локацию городов
func getCoordinaterom(city: String, complition: @escaping(_ coordinate: CLLocationCoordinate2D?,_ error: Error?)->()) {
    CLGeocoder().geocodeAddressString(city) { (placemark, error) in
        complition(placemark?.first?.location?.coordinate, error)
    }
}
