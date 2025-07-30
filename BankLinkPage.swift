import SwiftUI

struct BankLinkPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showAccounts = false
    @State private var nationalID = ""
    @State private var selectedAccount: String? = nil

    // وهمية - افترضنا 3 حسابات تظهر بعد إدخال الهوية
    let accounts = [
        "حسابي في بنك الرياض",
        "حسابي في بنك البلاد",
        "حسابي في STC Pay"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color("bg"), .black]),
                startPoint: .center,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                
                // زر الرجوع في أعلى الصفحة
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(.system(size: 30, weight: .medium))
                            .foregroundColor(.white)
                            .font(.title2)
                            .padding()
                          
                    }
                    Spacer()
                }
                .padding(.top, -10)
                .padding(.horizontal)

                Text("الربط البنكي")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Text("اربط حسابك البنكي لسحب بياناتك تلقائيًا")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Button(action: {
                    withAnimation {
                        showAccounts = true
                    }
                }) {
                    Text("ربط حساب")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("bt"))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                if showAccounts {
                    VStack(spacing: 16) {
                        // إدخال رقم الهوية
                        TextField("أدخل رقم الهوية", text: $nationalID)
                            .padding()
                            .background(Color("ic"))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        // قائمة الحسابات البنكية
                        VStack(alignment: .trailing, spacing: 12) {
                            ForEach(accounts, id: \.self) { account in
                                Button(action: {
                                    selectedAccount = account
                                }) {
                                    HStack {
                                        Spacer()
                                        Text(account)
                                            .foregroundColor(.white)
                                            .padding()
                                        Image(systemName: selectedAccount == account ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(Color("ic"))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                }
                            }
                        }

                        // زر موافق
                        Button(action: {
                            // تنفيذ عملية الربط هنا
                        }) {
                            Text("موافق")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("bt"))
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                    .transition(.opacity)
                }

                Spacer()
            }
            .padding(.top)
        }
    }
}

struct BankLinkPage_Previews: PreviewProvider {
    static var previews: some View {
        BankLinkPage()
            .previewDevice("iPhone 14 Pro")
    }
}
