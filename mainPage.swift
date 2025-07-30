import SwiftUI

struct MainPage: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                // الخلفية المتدرجة
                LinearGradient(
                    gradient: Gradient(colors: [Color("bg"), .black]),
                    startPoint: .center,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // صف المستخدم
                    HStack {
                        Spacer()
                        NavigationLink(destination: ProfileView()) {
                    HStack(spacing: 8) {
                        Text("User")
                        .foregroundColor(.white)
                        .font(.headline)
                        Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    Spacer().frame(height: 10)
                    
                    // مستطيل الرصيد الإجمالي
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color("ic"), Color("bt")]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(height: 120)
                        .overlay(
                            VStack(alignment: .trailing, spacing: 8) {
                                HStack {
                                    Spacer()
                                    Text("الرصيد الإجمالي")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(.trailing)
                                }
                                Spacer()
                                Text("0 ر.س")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding(.trailing)
                            }
                            .padding(.vertical, 12)
                        )
                        .padding(.horizontal)
                    
                    // الأزرار المربعة
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), spacing: 16) {
                        ForEach(buttonItems, id: \.title) { item in
                            NavigationLink(destination: destinationView(for: item.title)) {
                                CustomBox(icon: item.icon, title: item.title)
                            }
                        }
                    }
                    .padding(.horizontal)

                    // زر حساب العائلة والمكافآت
                    NavigationLink(destination: FamilyProgramScreen()) {
                        FullWidthBox(icon: "person.3.sequence", title: "حساب العائلة والمكافآت")
                    }
                    .padding(.horizontal)

                    Spacer()
                }
            }
        }
    }
    
    // دالة ترجع الصفحة المناسبة لكل عنوان
    @ViewBuilder
    func destinationView(for title: String) -> some View {
        switch title {
        case "المصروفات":
            ExpensesScreen()
        case "المدخرات":
            SetSavingGoalView()
        case "ربط البنك":
            BankLinkPage()
        case "المساعد الذكي":
            AIView()
        default:
            EmptyView()
        }
    }
}

// MARK: - بيانات الأزرار
struct ButtonItem {
    let icon: String
    let title: String
}

let buttonItems: [ButtonItem] = [
    ButtonItem(icon: "creditcard", title: "المصروفات"),
    ButtonItem(icon: "banknote", title: "المدخرات"),
    ButtonItem(icon: "link", title: "ربط البنك"),
    ButtonItem(icon: "lightbulb", title: "المساعد الذكي")
]

// MARK: - صندوق مربع
struct CustomBox: View {
    let icon: String
    let title: String

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color("ic"), Color("bt")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(height: 100)
            .overlay(
                VStack(spacing: 8) {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(.white)
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding()
            )
    }
}

// MARK: - صندوق عريض
struct FullWidthBox: View {
    let icon: String
    let title: String

    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color("ic"), Color("bt")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(height: 100)
            .overlay(
                HStack(spacing: 12) {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(.white)
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
            )
    }
}

// MARK: - Preview
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
            .previewDevice("iPhone 14 Pro")
    }
}
