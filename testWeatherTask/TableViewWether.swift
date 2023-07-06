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
        initialize()
        NetworkWeatherManager().fetchWeather()
    }
    
    func initialize(){
        tableView.register( TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
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
