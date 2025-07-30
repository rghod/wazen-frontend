//
//  SignupView.swift
//  wazn
//
//  Created by Raghad  on 05/02/1447 AH.
//


import SwiftUI

struct SignupView: View {
    @State private var phoneNumber: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 25) {
                Text("إنشاء حساب جديد")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Group {
                    TextField("رقم الجوال", text: $phoneNumber)
                        .keyboardType(.numberPad)
                    TextField("الاسم", text: $name)
                    SecureField("كلمة المرور", text: $password)
                    SecureField("تأكيد كلمة المرور", text: $confirmPassword)
                }
                .padding()
                .background(Color("ic"))
                .cornerRadius(12)
                .foregroundColor(.white)

                Button(action: {
                    // التحقق من البيانات أو الانتقال
                }) {
                    Text("إنشاء الحساب")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("bt"))
                        .cornerRadius(12)
                }

                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 80)
        }
    }
}

#Preview {
    SignupView()
}