import SwiftUI

struct AIView: View {
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("أهلاً بك في المساعد الذكي")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Text("كيف أقدر أساعدك في وازن؟")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 10) // نزل النص شوي

                VStack(spacing: 20) {
                    Button(action: {
                        // فعلية "كيف أوفر؟"
                    }) {
                        Text("كيف أوفر؟")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("bt"))
                            .cornerRadius(12)
                    }

                    Button(action: {
                        // فعلية "توصيات"
                    }) {
                        Text("توصيات")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("bt"))
                            .cornerRadius(12)
                    }

                    Button(action: {
                        // فعلية "ماهو رصيد مدخراتي؟"
                    }) {
                        Text("ماهو رصيد مدخراتي؟")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("bt"))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal, 30)

                Spacer()
            }
            .padding(.top, 100)
        }
    }
}

#Preview {
    AIView()
}
