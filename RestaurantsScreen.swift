// RestaurantsScreen.swift
import SwiftUI

struct RestaurantsScreen: View {
    @State private var selectedTab = "الأحدث"

    let tabs = ["الأحدث", "الكل"]
    let restaurants = ["ستاربكس", "شاورمر", "بيتزاهت", "ماكدونالدز"]

    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(.white)
                    Spacer()
                    Text("مطاعم")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 30)

                Spacer().frame(height: 30)

                // Total Card
                VStack(spacing: 10) {
                    Text("المصروف حتى الان")
                        .foregroundColor(.white)
                        .font(.title3)
                    Text("SAR1,137")
                        .foregroundColor(.white)
                        .font(.title.bold())
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("ic"))
                .cornerRadius(20)
                .padding(.horizontal, 30)

                Spacer().frame(height: 40)

                // Tabs
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                        }) {
                            Text(tab)
                                .foregroundColor(.white)
                                .font(.body)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(selectedTab == tab ? Color("bt") : Color.clear)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 30)

                Spacer().frame(height: 40)

                // Scrollable List
                ScrollView {
                    VStack(spacing: 25) {
                        ForEach(restaurants, id: \.self) { name in
                            VStack(spacing: 10) {
                                HStack {
                                    Circle()
                                        .fill(Color("ic"))
                                        .frame(width: 40, height: 40)
                                    Text(name)
                                        .foregroundColor(.white)
                                        .font(.title3)
                                    Spacer()
                                }
                                .padding(.horizontal, 30)

                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                                    .padding(.horizontal, 30)
                            }
                        }
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color("ic"))
                    .cornerRadius(25)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

#Preview {
    RestaurantsScreen()
}

