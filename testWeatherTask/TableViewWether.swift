//
//  TableViewWether.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 02.07.2023.
//

import UIKit
import CoreLocation
class TableViewWether: UITableViewController {

    let emptyCity = Weather() // есть пустой эземпляр и им будем заполнять массив cityesArray, если он будет пустой
    var cityesArray = [Weather]()
    let nameCityArray = ["Москва","Воронеж","Петребург","Адлер","Махачкала","Дербент","Иркутск","Новосибирск","Калининград","Красноярск"]
    let networkManager = NetworkWeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        if cityesArray.isEmpty {
            cityesArray = Array(repeating: emptyCity, count: nameCityArray.count)
        }
        initialize()
        addCityes()
    }
    // метод, который будет заполнять массив cityesArray/ добавлять города с именем и необходимой погодой
    func addCityes(){
        getCityWeather(cityesArray: self.nameCityArray) { index, weather in
            self.cityesArray[index] = weather // по полученному индекму записываем данные о погоде
            self.cityesArray[index].name = self.nameCityArray[index] // заменяем название по индексу
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    func initialize(){
        tableView.register( TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cityesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {fatalError()}
        
        cell.configure(weather: cityesArray[indexPath.row])
    
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WetherCityVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
