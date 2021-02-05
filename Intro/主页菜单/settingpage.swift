//
//  settingpage.swift
//  Intro
//
//  Created by 杨业卿 on 2021/1/28.
//

import SwiftUI

struct settingpage: View {
    @State var showSettingModal = false
    @State var colorPicker = 0
    var colorPickerOptions = ["跟随系统", "浅色", "深色"]
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("应用设置")){
                    Text("1.")
                    Text("2.")
                    Text("3.")
                    Text("4.")
                }
                
                Section(header: Text("帮助与反馈")){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("帮助指南")
                            //.bold()
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("反馈")
                            //.bold()
                    })
                }
                
                Section(header: Text("关于")){
                    Button(action: {
                            //Vibration.selection.virbrate()
                            Vibration.success.virbrate()
                            //Vibration.light.virbrate()
                            showSettingModal.toggle()}, label: {
                        Text("关于开发者")
                            //.bold()
                            .foregroundColor(.accentColor)
                    })
                    .sheet(isPresented: $showSettingModal, content: {
                        Text("Developed by YYQ")
                            .font(.headline)
                        Text("2021")
                    })
                    
                    
                    Button(action: {
                            Vibration.selection.virbrate()
                            showSettingModal.toggle()}, label: {
                        Text("关于空窗")
                            //.bold()
                            .foregroundColor(.accentColor)
                    })
                    .sheet(isPresented: $showSettingModal, content: {
                        Text("檐前数片无人扫，又得书窗一夜明。")
                            .font(.custom("HYShangWeiShouShuW", size: 20))
                          
                    })
                }
                
            }
            
            
            .navigationBarTitle("设置",displayMode:.automatic)
        }
        
        
        
    }
}

struct settingpage_Previews: PreviewProvider {
    static var previews: some View {
        settingpage()
    }
}
