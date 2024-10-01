//
//  ContentView.swift
//  Clase5FocusTextField
//
//  Created by Escurra Colquis on 1/10/24.
//

import SwiftUI

enum Field {
    case email
    case password
}

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .padding()
                        .focused($focusedField, equals: .email)
                        .frame(height: 50)
                        .submitLabel(.continue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                        )
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .focused($focusedField, equals: .password)
                        .submitLabel(.done)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 2)
                        )
                    Spacer()
                }
                    .onSubmit {
                        if focusedField == .email {
                            focusedField = .password
                        } else if focusedField == .password {
                            focusedField = nil
                        }
                    }
                VStack {
                    Button {
                        
                    } label: {
                        Text("Botón")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 80)
                            .background(
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(.indigo)
                            )
                    }
                }
            }
            .padding()
            .navigationTitle("Focus TextField")
        }
    }
}

#Preview {
    ContentView()
}
