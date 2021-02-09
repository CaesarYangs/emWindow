//
//  bookContentFile.swift
//  Intro
//
//  Created by 杨业卿 on 2021/2/8.
//

import Foundation

//book data model
struct bookContent:Codable,Identifiable {
    var id: UUID
    var name: String
    var writer: String
    var content: String
    var date: String
    //var pic:pic
    
    
}


class bookContentData: ObservableObject{
    @Published var books: [bookContent]=[]
    
    static let SandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let booksDataURL = SandboxURL.appendingPathComponent("booksData.json")
    
    init() {
        books = getBookData()
    }
    
    
    func getBookData() -> [bookContent]{
        var results: [bookContent] = []
        
        if FileManager.default.fileExists(atPath: booksDataURL.path) {
            let data = try! Data(contentsOf: booksDataURL)
            results = try! JSONDecoder().decode([bookContent].self, from: data)
        }
        return results
    }
    
    func saveBookData(){
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.booksDataURL)
            try? data?.write(to: self.booksDataURL)
        }
        
    }
}
