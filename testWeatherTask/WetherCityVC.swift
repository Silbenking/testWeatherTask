//
//  WetherCityVC.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 03.07.2023.
//

import UIKit
import SnapKit

class WetherCityVC: UIViewController {

    let nameCityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Назван города"
        return label
    }()
    let conditionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "no")
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
    }


}
