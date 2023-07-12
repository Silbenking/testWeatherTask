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
    var filterscityesArray = [Weather]() // for search bar сюда попадают отфильтрованные города

    var nameCityArray = ["Москва","Воронеж","Петребург","Адлер","Махачкала","Дербент","Иркутск","Новосибирск","Калининград","Красноярск"]
    let searchController = UISearchController(searchResultsController: nil) // ставим nil  чтобы поиск отображался в этом же вью
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    } // если какой то текст введен в бар, то преме5ная бул будет менятся
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    } // для того чтобы понимали что произошла фильтрация по имени либо нет
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if cityesArray.isEmpty {
            cityesArray = Array(repeating: emptyCity, count: nameCityArray.count)
        }
        navCon()
        initialize()
        addCityes()
        searchCont()
    }
    func searchCont(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func navCon(){
        title = "WeaherJun"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
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
        if isFiltering { //условие - если ровно тру, тогда возвоащаем другой массив
            return filterscityesArray.count
        }
        return cityesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {fatalError()}
        var weather = Weather()
        
        if isFiltering  {
            weather = filterscityesArray[indexPath.row]
        } else {
            weather = cityesArray[indexPath.row]
        }
        
        cell.configure(weather: weather)
    
        return cell
    }
    //удаление ячейк
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, complition in
            let editingRow = self.nameCityArray[indexPath.row] // выбираем индекс
            if let index = self.nameCityArray.firstIndex(of: editingRow) { // вычисляем индекс ячейки которой будем удалять
                if self.isFiltering {
                    self.filterscityesArray.remove(at: index)
                } else {
                    self.cityesArray.remove(at: index) // удаляем ячейку

                }
            }
            tableView.reloadData() // перезагружаем таблицу
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WetherCityVC()
        navigationController?.pushViewController(vc, animated: true)
            if self.isFiltering{
                vc.refreshLabel(weather: self.filterscityesArray[indexPath.row])

            } else {
                vc.refreshLabel(weather: self.cityesArray[indexPath.row])
            }
    }
    @objc func addCity(){
        alertAddCiry(name: "Город", placholder: "Введите название города") { (city) in
            self.nameCityArray.append(city)
            self.cityesArray.append(self.emptyCity)
            self.addCityes()
        }
    }
}
extension TableViewWether: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    private func filterContentForSearchText(_ searchText: String){
        filterscityesArray = cityesArray.filter({  //попадают отфильтрованные города по имени
            $0.name.contains(searchText)
        })
        tableView.reloadData()
    } // текст который будет вводится в поисковую строку, мы по нему и будем искать
     
}
