//
//  SavingGoal.swift
//  wazn
//
//  Created by Raghad  on 04/02/1447 AH.
//
import SwiftUI

struct SavingGoal: Identifiable {
    let id = UUID()
    var name: String
    var amount: Double
    var saved: Double
}

struct SetSavingGoalView: View {
    @State private var goalName = ""
    @State private var goalAmount = ""
    @State private var selectedAccount: String? = nil
    @State private var showAccountOptions = false
    @State private var goals: [SavingGoal] = []
    @State private var navigateToMainPage = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                LinearGradient(colors: [Color("bg"), Color("bg").opacity(0.8)],
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(alignment: .trailing, spacing: 20) {
                    Spacer().frame(height: 70)

                    HStack {
                        Spacer()
                        Text("ضع هدف الادخار")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.top, -10)

                    VStack(alignment: .trailing, spacing: 10) {
                        Text("اسم الهدف")
                            .foregroundColor(.white)

                        TextField("اكتب اسم الهدف", text: $goalName)
                            .padding()
                            .background(Color("ic"))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .padding(.horizontal)

                        Text("المبلغ المطلوب")
                            .foregroundColor(.white)

                        HStack {
                            Text("ريال")
                                .foregroundColor(.white)
                            TextField("0", text: $goalAmount)
                                .keyboardType(.numberPad)
                        }
                        .padding()
                        .background(Color("ic"))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .padding(.horizontal)

                        Text("الادخار من حساب")
                            .foregroundColor(.white)

                        Button(action: {
                            showAccountOptions.toggle()
                        }) {
                            Text(selectedAccount ?? "اختر حساب")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("ic"))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)

                        if showAccountOptions {
                            HStack(spacing: 20) {
                                Button("اضافة") {
                                    if let amount = Double(goalAmount) {
                                        let newGoal = SavingGoal(name: goalName, amount: amount, saved: 0)
                                        goals.append(newGoal)
                                    }
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("bt"))
                                .cornerRadius(10)

                                Button("الغاء") {
                                    navigateToMainPage = true
                                }
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("bt"))
                                .cornerRadius(10)
                            }
                            .padding(.horizontal)
                        }
                    }

                    Spacer()

                    NavigationLink(destination: SavingsGoalsView(goals: goals).navigationBarBackButtonHidden(true)) {
                        Text("اهدافي")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color("bt"))
                            .cornerRadius(12)
                    }
                }
                .padding()

                // زر الرجوع → يرجع للمين بيج
                Button(action: {
                    navigateToMainPage = true
                }) {
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 30, weight: .medium))
                        .foregroundColor(.white)
                        .padding()
                }

                // NavigationLink خفي للمين بيج
                NavigationLink(
                    destination: MainPage().navigationBarBackButtonHidden(true),
                    isActive: $navigateToMainPage
                ) {
                    EmptyView()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct SetSavingGoalView_Previews: PreviewProvider {
    static var previews: some View {
        SetSavingGoalView()
    }
}

struct SavingsGoalsView: View {
    var goals: [SavingGoal]

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("bg"), Color("bg").opacity(0.8)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("اهداف الادخار")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 40)

                ScrollView {
                    ForEach(goals) { goal in
                        VStack(alignment: .leading) {
                            Text(goal.name)
                                .foregroundColor(.white)
                                .bold()

                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .fill(Color("ic"))
                                    .frame(height: 20)
                                    .cornerRadius(10)

                                Rectangle()
                                    .fill(Color("bt"))
                                    .frame(width: progressWidth(for: goal), height: 20)
                                    .cornerRadius(10)
                            }
                            Text("\(Int(goal.saved))/\(Int(goal.amount))")
                                .foregroundColor(.white)
                                .font(.caption)
                        }
                        .padding()
                    }
                }

                HStack(spacing: 16) {
                    NavigationLink(destination: SetSavingGoalView().navigationBarBackButtonHidden(true)) {
                        Text("اضافة هدف")
                            .padding()
                            .background(Color("bt"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: MainPage().navigationBarBackButtonHidden(true)) {
                        Text("العودة للرئيسية")
                            .padding()
                            .background(Color("bt"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 30)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }

    func progressWidth(for goal: SavingGoal) -> CGFloat {
        let progress = goal.saved / goal.amount
        return (UIScreen.main.bounds.width - 80) * CGFloat(progress)
    }
}

struct SavingsGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        SavingsGoalsView(goals: [
            SavingGoal(name: "رحلة", amount: 5000, saved: 2000),
            SavingGoal(name: "جهاز جديد", amount: 3000, saved: 1500)
        ])
    }
}
