//
//  UIImageView.swift
//  MealsApp
//
//  Created by user247205 on 10/26/23.
//

import UIKit

extension UIImageView {
    
    func loadImage(from url: String){
        
        guard let url = URL(string: url) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }.resume()
        

    }
}
