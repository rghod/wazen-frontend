import SwiftUI

struct ExpensesScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedMonth = "فبراير"
    @State private var selectedTab = "الفئات"

    let months = ["يناير", "فبراير", "مارس", "ابريل", "مايو"]
    let tabs = ["Type", "الفئات", "الأحدث"]
    let categories: [(name: String, icon: String)] = [
        ("تسوق", "cart"),
        ("خدمات", "wrench"),
        ("ترفيه", "gamecontroller"),
        ("مطاعم", "fork.knife")
    ]

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer().frame(height: 70) // يترك مساحة لزر الرجوع

                // Title
                Text("المصروفات")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                    .padding(.top, -10)
                // Month Selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(months, id: \.self) { month in
                            Button(action: {
                                selectedMonth = month
                            }) {
                                Text(month)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(selectedMonth == month ? Color("bt") : Color.clear)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Circle Total
                ZStack {
                    Circle()
                        .fill(Color("bt"))
                        .frame(width: 240, height: 240)

                    Circle()
                        .fill(Color("ic"))
                        .frame(width: 200, height: 200)

                    VStack(spacing: 10) {
                        Text("المصروف حتى الان")
                            .foregroundColor(.white)
                        Text("١٣٣ رس")
                            .foregroundColor(.white)
                            .font(.title2.bold())
                    }
                }

                // Tabs
                HStack(spacing: 20) {
                    ForEach(tabs, id: \.self) { tab in
                        Button(action: {
                            selectedTab = tab
                        }) {
                            Text(tab)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(selectedTab == tab ? Color("bt") : Color.clear)
                                .cornerRadius(12)
                        }
                    }
                }

                // Content
                if selectedTab == "الفئات" {
                    ScrollView {
                        VStack(spacing: 30) {
                            ForEach(categories, id: \.name) { item in
                                HStack(spacing: 12) {
                                    Capsule()
                                        .fill(Color("ic"))
                                        .frame(width: 4, height: 45)
                                    Image(systemName: item.icon)
                                        .foregroundColor(.white)
                                        .font(.system(size: 18))
                                    Text(item.name)
                                        .foregroundColor(.white)
                                        .font(.body)
                                    Spacer()
                                }
                                .padding(.horizontal)

                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                                    .frame(height: 1)
                                    .padding(.horizontal)
                            }
                        }
                        .padding()
                        .background(Color("ic"))
                        .cornerRadius(25)
                        .padding(.horizontal)
                    }
                } else {
                    Spacer()
                    Text("لا توجد بيانات")
                        .foregroundColor(.gray)
                    Spacer()
                }

                Spacer()
            }

            // زر الرجوع فوق كل شيء
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                
            }
        }
    }
}

#Preview {
    ExpensesScreen()
}
