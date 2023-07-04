//
//  TableViewWether.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 02.07.2023.
//

import UIKit

class TableViewWether: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather()
        tableView.register( TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchWeather() {
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393") else {return}
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("d05cf56d-a117-4997-8ad8-ec1b9d6adbda", forHTTPHeaderField: "X-Yandex-API-Key")
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
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {fatalError()}
        cell.nameCityLabel.text = "cyty"
        cell.temperatureLabel.text = "20"
        cell.weatherConditionsLabel.text = "oblachno"
    
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WetherCityVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
