// SavingChallengesScreen.swift
import SwiftUI

struct SavingChallengesScreen: View {
    var challenges: [String] = [
        "ادخر ١٠٠ ريال\nفي اسبوع",
        "امنع القهوه\nلمده اسبوع",
        "اطبخ في البيت\n٣ مرات هذا الاسبوع",
        "لا تطلب اونلاين\nلمده ٥ ايام",
        "استخدم كوبون خصم\nمرتين في الاسبوع",
        "امشي بدال التاكسي\nمرتين هذا الاسبوع"
    ]

    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 25) {
                // Header
                HStack {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    Text("تحدي الادخار")
                        .foregroundColor(.white)
                        .font(.title2.bold())
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 30)

                // Cards
                ScrollView {
                    VStack(spacing: 30) {
                        ForEach(challenges, id: \.self) { challenge in
                            HStack(alignment: .center) {
                                VStack(alignment: .leading, spacing: 15) {
                                    Text(challenge)
                                        .foregroundColor(.white)
                                        .font(.body)

                                    Spacer()
                                }

                                Spacer()

                                VStack(spacing: 10) {
                                    Image("win")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)

                                    Button(action: {}) {
                                        Text("انضم الآن")
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 30)
                                            .padding(.vertical, 6)
                                            .background(Color("bt"))
                                            .cornerRadius(10)
                                    }
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("ic"))
                            .cornerRadius(25)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top)
                }

                Spacer()
            }
        }
    }
}

#Preview {
    SavingChallengesScreen()
}

