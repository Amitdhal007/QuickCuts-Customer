//
//  ManageServiceComponent.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 15/09/24.
//

import SwiftUI

struct ManageServiceComponent: View {
    var body: some View {
        HStack (spacing: 20) {
            Image("Haircut")
                .resizable()
                .frame(width: 100, height: 110)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            
            VStack (alignment: .leading, spacing: 15) {
                VStack {
                    Text("Haircut")
                        .font(.custom("Poppins-Semibold", size: 18))
                        .foregroundStyle(Color("textColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Rs 100")
                        .font(.custom("Poppins-Light", size: 14))
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack (spacing: 14) {
                    Button(action: {}, label: {
                        Text("Update")
                            .font(.custom("Poppins-Regular", size: 16))
                            .padding([.top, .bottom], 6)
                            .padding(.horizontal)
                            .background(Color("buttonColor"))
                            .foregroundStyle(.white)
                            .cornerRadius(8)
                    })
                    
                    Button(action: {}, label: {
                        Text("Remove")
                            .font(.custom("Poppins-Regular", size: 16))
                            .padding([.top, .bottom], 6)
                            .padding(.horizontal)
                            .background(Color("buttonColor"))
                            .foregroundStyle(.white)
                            .cornerRadius(8)
                    })
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6).opacity(0.6))
        .cornerRadius(10)
    }
}

#Preview {
    ManageServiceComponent()
}
