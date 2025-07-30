import SwiftUI
import AuthenticationServices

struct SigninView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()

                VStack {
                    Spacer() // يدز المحتوى لتحت شوي

                    VStack(spacing: 40) {
                        Text("مرحباً بك في وازن")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)

                        VStack(spacing: 20) {
                            // رابط لصفحة رقم الجوال
                            NavigationLink(destination: PhoneNumberView()) {
                                Text("تسجيل الدخول")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color("bt"))
                                    .cornerRadius(12)
                            }

                            SignInWithAppleButton(
                                onRequest: { request in },
                                onCompletion: { result in }
                            )
                            .signInWithAppleButtonStyle(.white)
                            .frame(height: 50)
                            .cornerRadius(12)
                        }
                        .padding(.horizontal, 30)
                    }

                    Spacer() // يخلي المحتوى يثبت في الوسط تقريبًا
                }
            }
        }
    }
}

#Preview {
    SigninView()
}
