//
//  bookData.swift
//  Intro
//
//  Created by 杨业卿 on 2021/1/29.
//

import SwiftUI

struct Article: Codable,Identifiable{
    var id: Int
    var title: String
    var body: String
    var cat: String
}

class bookData: ObservableObject{
    @Published var articles = [Article]()
    
    init(){
        let url = URL(string: "http://47.97.194.162:9936/down/Ylf3MFdpoguU")!
        
        URLSession.shared.dataTask(with:url) { (data,responce,error) in
            DispatchQueue.main.async {
                self.articles = try! JSONDecoder().decode([Article].self, from: data!)
            }
        }.resume()
    }
}
