//
//  ServiceView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 15/09/24.
//

import SwiftUI

struct AdminManageServicesView: View {
    @State var isAddServicePresented: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView (showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(spacing: 16) {
                        Text("Manage Service")
                            .font(.custom("Poppins-Regular", size: 24).bold())
                            .foregroundColor(.init("textColor"))
                    }
                    .padding(.top, 10)
                    
                    ForEach(0...5, id: \.self) { _ in
                        ManageServiceComponent()
                    }
                }
                .padding(.horizontal, 16)
            }
            .clipped()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isAddServicePresented = true
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 28))
                            .frame(width: 56, height: 56)
                            .foregroundColor(.white)
                            .background(Color("buttonColor"))
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding(.horizontal, 16)
                    .sheet(isPresented: $isAddServicePresented, content: {
                        AddNewServiceView(isAddServicePresented: $isAddServicePresented)
                    })
                }
            }
        }
    }
}

struct ManageServicesView_Previews: PreviewProvider {
    static var previews: some View {
        AdminManageServicesView()
    }
}
