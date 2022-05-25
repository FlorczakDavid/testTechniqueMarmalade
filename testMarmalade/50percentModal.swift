//
//  50percentModal.swift
//  testMarmalade
//
//  Created by david florczak on 25/05/2022.
//

import SwiftUI

struct _0percentModal: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var onDismiss: ((_ model: Bool) -> Void)?
    @Binding var showEnd: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
            VStack {
                Text("Tu es à 50% des citations")
                    .font(.headline)
                    .foregroundColor(Color.orange)
                Text("Tu a bientôt finis!")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                HStack {
                    Button {
                        showEnd = true
                        onDismiss?(showEnd)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Arrêter")
                    }.buttonStyle(.bordered)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Continuer")
                    }.buttonStyle(.bordered)
                }
            }
        }
        .padding()
        .background(Color.clear)
    }
}

struct _0percentModal_Previews: PreviewProvider {
    static var previews: some View {
        _0percentModal(showEnd: .constant(false))
    }
}
