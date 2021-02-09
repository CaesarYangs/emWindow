//
//  BooksTap.swift
//  Intro
//
//  Created by 杨业卿 on 2021/2/8.
//

import SwiftUI

struct BooksTap: View {
    @StateObject var noteData = bookContentData()
    @State var showModal = false
    var body: some View {
        NavigationView{
            ScrollView() {
                List(noteData.books){ note in
                    VStack{
                        Text(note.name)
                            .font(.title)
                        Text(note.content)
                    }.padding()  
                }
                
            }
            .navigationBarTitle("Hello",displayMode:.automatic)
            .toolbar(content: {
                Button(action:{
                    showModal.toggle()
                    Vibration.soft.virbrate()
                }){
                    Image(systemName: "pencil.tip.crop.circle.badge.plus")
                        .font(.system(size: 80))
                }.sheet(isPresented: $showModal) {
                    addBook(noteData: noteData, showModal: $showModal)
                }
            })
        }
    }
}

struct BooksTap_Previews: PreviewProvider {
    static var previews: some View {
        BooksTap()
    }
}
