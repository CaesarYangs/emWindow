//
//  ContentView.swift
//  Intro
//
//  Created by 杨业卿 on 2021/1/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    
    var body: some View{
        
        TabView{
            firstTap_2()
                .tabItem {
                    
                    Image(systemName: "seal")
                    Text("Main")
                    
                        
                }
            
            firstTap()
                .tabItem {
                    Image(systemName: "book")
                    Text("Books")
                        
                }
            Text("3.电影")
                .tabItem {
                    Image(systemName: "film")
                    Text("Films")
                        
                }
            
            settingpage()
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
                        
                }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//apple
