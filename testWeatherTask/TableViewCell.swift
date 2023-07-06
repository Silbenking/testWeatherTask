//
//  TableViewCell.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 02.07.2023.
//

import UIKit
import SnapKit
class TableViewCell: UITableViewCell {

    let nameCityLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    let temperatureLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    let weatherConditionsLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    enum UIConstant {
        static let nameCityLeadingOfset: CGFloat = 10
        static let temperatureTreilingOfset: CGFloat = 10
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initilize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initilize(){
        contentView.addSubview(nameCityLabel)
        nameCityLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstant.nameCityLeadingOfset)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        contentView.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(UIConstant.temperatureTreilingOfset)
            make.centerY.equalTo(nameCityLabel)
        }
        contentView.addSubview(weatherConditionsLabel)
        weatherConditionsLabel.snp.makeConstraints { make in
//            make.leading.equalToSuperview().inset(UIConstant.temperatureTreilingOfset)
            make.centerY.equalTo(nameCityLabel)
            make.centerX.equalToSuperview()
        }
    }
}
