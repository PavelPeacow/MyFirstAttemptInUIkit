//
//  CatModel.swift
//  SomeUIKitTests
//
//  Created by Павел Кай on 10.08.2022.
//

import Foundation

// api 236f41a8-6771-45ae-a914-525927723464


func fetchJSON(onCompletion: @escaping ([HeroStats]) -> ()) {
    let urlString = "https://api.opendota.com/api/heroStats"
    let url = URL(string: urlString)!
    
    let task = URLSession.shared.dataTask(with: url) { data, resp, error in
        
        guard let data = data else {
            print("data nil loh")
            return
        }
        
        guard let heroList = try? JSONDecoder().decode([HeroStats].self, from: data) else {
            print("you are loh")
            return
        }
        
        onCompletion(heroList)
//        print(heroList)
        
    }
    task.resume()
    
}

struct HeroStats: Codable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
    let icon: String
}
