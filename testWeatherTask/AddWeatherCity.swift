//
//  AddWeatherCity.swift
//  testWeatherTask
//
//  Created by Сергей Сырбу on 08.07.2023.
//

import UIKit

extension UIViewController {
    func alertAddCiry(name: String, placholder: String, complition: @escaping (String)->Void){
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default) { _ in
            let tftext = alert.textFields?.first // берем введеныый текст
            guard let text = tftext?.text else {return}
            complition(text )
        }
        alert.addTextField{(tf) in
            tf.placeholder = placholder
        }
        let alertCancel = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(alertCancel)
        alert.addAction(alertOk)
        present(alert, animated: true)
    }
}
