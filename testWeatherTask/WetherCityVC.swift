//
//  WetherCityVC.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 03.07.2023.
//

import UIKit
import SnapKit
import SwiftSVG
import SVGKit

class WetherCityVC: UIViewController {

//    var weatherModel: Weather? // создаю экземпляр модели, через который буду передавать данные о погоде
    
    let nameCityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Назван города"
        return label
    }()
    let conditionImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    let conditionWeatherLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Сотсояние погоды"
        return label
    }()
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "88"
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Давление"
        return label
    }()
    let speedLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Скорость ветра"
        return label
    }()
    let minTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Min температура днем"
        return label
    }()
    let maxTemperatureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Max температура днем"
        return label
    }()
    let pressureValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    let speedValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    let minTemperatureValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    let maxTemperatureValueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize(){
        view.backgroundColor = .white
        let topStack = UIStackView()
        view.addSubview(topStack)
        topStack.addArrangedSubview(nameCityLabel)
        conditionImage.snp.makeConstraints { make in
            make.size.equalTo(250)
        }
        topStack.addArrangedSubview(conditionImage)
        topStack.addArrangedSubview(conditionWeatherLabel)
        topStack.addArrangedSubview(temperatureLabel)
        topStack.axis = .vertical
        topStack.spacing = 10
        topStack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
        }
        let leftStack = UIStackView()
        view.addSubview(leftStack)
        leftStack.addArrangedSubview(pressureLabel)
        leftStack.addArrangedSubview(speedLabel)
        leftStack.addArrangedSubview(minTemperatureLabel)
        leftStack.addArrangedSubview(maxTemperatureLabel)
        leftStack.axis = .vertical
        leftStack.spacing = 10
        leftStack.snp.makeConstraints { make in
            make.top.equalTo(topStack.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(20)
        }
        let righttStack = UIStackView()
        view.addSubview(righttStack)
        righttStack.addArrangedSubview(pressureValueLabel)
        righttStack.addArrangedSubview(speedValueLabel)
        righttStack.addArrangedSubview(minTemperatureValueLabel)
        righttStack.addArrangedSubview(maxTemperatureValueLabel)
        righttStack.axis = .vertical
        righttStack.spacing = 10
        righttStack.snp.makeConstraints { make in
            make.top.equalTo(topStack.snp.bottom).offset(30)
            make.trailing.equalToSuperview().inset(20)
        }
    }

    func refreshLabel(weather: Weather) {
//        nameCityLabel.text = weatherModel?.name
//        conditionWeatherLabel.text = weatherModel?.conditionString
//        temperatureLabel.text = (weatherModel?.temperatureString ?? "nil") + "°C"
//        pressureValueLabel.text = "\(weatherModel?.pressureMm ?? 0)" + "мм.рт.ст"
//        speedValueLabel.text = "\(weatherModel?.windSpeed ?? 0)" + "м/c"
//        minTemperatureValueLabel.text = "\(weatherModel?.tempMin ?? 0)" + "°C"
//        maxTemperatureValueLabel.text = "\(weatherModel?.tempMax ?? 0)" + "°C"
        
        
            self.nameCityLabel.text = weather.name
            guard let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weather.conditionCode).svg") else {return}
//            let weatherImage = UIView(SVGURL: url) {(image) in
//                image.resizeToFit(self.conditionImage.bounds)
//            }
            let weatherImage = SVGKImage(contentsOf: url)
            self.conditionImage.image = weatherImage?.uiImage
        
      
        conditionWeatherLabel.text = weather.conditionString
        temperatureLabel.text = weather.temperatureString + "°C"
        pressureValueLabel.text = "\(weather.pressureMm)" + "мм.рт.ст"
        speedValueLabel.text = "\(weather.windSpeed)" + "м/c"
        minTemperatureValueLabel.text = "\(weather.tempMin)" + "°C"
        maxTemperatureValueLabel.text = "\(weather.tempMax)" + "°C"
    }

}
