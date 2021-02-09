//
//  addBook.swift
//  Intro
//
//  Created by 杨业卿 on 2021/2/8.
//

import SwiftUI

struct addBook: View {
    
    @StateObject var noteData:bookContentData
    @Binding var showModal: Bool
    @State var nameinput: String = ""
    @State var writerinput:String = ""
    @State var contentinput:String = ""
    @State var timeinput:String = ""
    
    var body: some View {
        VStack{
            Text("添加")
                .font(.title)
            
            HStack{
                Image(systemName: "text.book.closed")
                    .font(.system(size: 25))
                    .foregroundColor(.accentColor)
                Spacer()
                TextField("书名",text: $nameinput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            HStack{
                Image(systemName: "pencil")
                    .font(.system(size: 25))
                    .foregroundColor(.accentColor)
                Spacer()
                TextField("作者",text: $writerinput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            HStack{
                Image(systemName: "newspaper")
                    .font(.system(size: 20))
                    .foregroundColor(.accentColor)
                Spacer()
                TextField("内容",text: $contentinput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            HStack{
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 20))
                    .foregroundColor(.accentColor)
                Spacer()
                TextField("阅读时间",text: $timeinput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            
            Button(action: {
                let id = UUID()
                let newBook = bookContent(id: id, name: nameinput, writer: writerinput, content: contentinput, date: timeinput)
                noteData.books.append(newBook)
                noteData.saveBookData()
                
                showModal.toggle()
                Vibration.medium.virbrate()
            }, label: {
                Text("                                完成                                ")
                    .foregroundColor(.white)
            })
            .padding(13)
            .background(Color("AccentColor"))
            .cornerRadius(15)
            
            Button(action: {
                showModal.toggle()
                Vibration.medium.virbrate()
            }, label: {
                Text("                                取消                                ")
                    .foregroundColor(.white)
            })
            .padding(13)
            .background(Color("Button"))
            .cornerRadius(15)
            
            
            
        }.padding()
        .background(Color.init(.sRGB,white: 0.9,opacity: 0.2))
        .cornerRadius(10)
        .shadow(radius:1 )
        .padding()
    }
}

struct addBook_Previews: PreviewProvider {
  static var previews: some View {
    addBook(noteData: .init(),showModal: .constant(true))
    }
}
