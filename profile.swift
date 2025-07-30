import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()

            VStack {
                // سهم الرجوع في الزاوية العلوية اليسرى
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundColor(.white)
                            .padding()
                    }

                    Spacer()
                }
                .padding(.top, 4)
                .padding(.horizontal)

                VStack(spacing: 30) {
                    // صورة البروفايل
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color("bt"))
                        .clipShape(Circle())
                        .padding(.top, 20)

                    // رقم الجوال
                    Text("05xxxxxxxx")
                        .font(.headline)
                        .foregroundColor(.white)

                    // خيارات الإعدادات
                    VStack(spacing: 20) {
                        // تغيير اللغة
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(.white)
                            Text("تغيير اللغة")
                                .foregroundColor(.white)
                            Spacer()
                            Picker("", selection: .constant("ar")) {
                                Text("العربية").tag("ar")
                                Text("English").tag("en")
                            }
                            .pickerStyle(MenuPickerStyle())
                            .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)

                        // التنبيهات
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.white)
                            Text("التنبيهات")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)

                        // تسجيل الخروج
                        Button(action: {
                            // فعلية تسجيل الخروج
                        }) {
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .foregroundColor(.white)
                                Text("تسجيل الخروج")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(Color("bt"))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal, 30)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
