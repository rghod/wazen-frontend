import SwiftUI

struct PhoneNumberView: View {
    @State private var phoneNumber: String = ""

    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("أدخل رقم جوالك")
                    .font(.title2)
                    .fontWeight(.bold)
                
                    .foregroundColor(.white)

                TextField("05xxxxxxxx", text: $phoneNumber)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)
                
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)

                Button(action: {
                    // هنا مستقبلاً راح يتم إرسال OTP
                }) {
                    Text("إرسال رمز التحقق")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("bt"))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 30)

                Spacer()
            }
            .padding(.top, 100)
        }
    }
}

#Preview {
    PhoneNumberView()
}
