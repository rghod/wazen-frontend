// FamilyProgramScreen.swift
import SwiftUI

struct Goal: Identifiable {
    let id = UUID()
    var name: String
    var duration: Date
    var amount: String
}
struct FamilyProgramScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var goals: [Goal] = []
    @State private var showAddGoal = false
    @State private var name = ""
    @State private var duration = Date()
    @State private var amount = ""

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 25) {
                // مسافة تضمن أن المحتوى يبدأ تحت زر الرجوع
                Spacer().frame(height: 70)

                // Header Title (العنوان فقط)
                HStack {
                    Spacer()
                    Text("برنامج العائلة")
                        .foregroundColor(.white)
                        .bold()
                        .font(.largeTitle)
                    Spacer()
                }

                // No Goals Placeholder or List
                if goals.isEmpty {
                    VStack(spacing: 20) {
                        Image("fam")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 190)

                        Text("لا توجد أهداف، قم بإضافة أهدافك")
                            .foregroundColor(.white)
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(goals.indices, id: \.self) { index in
                                let goal = goals[index]

                                VStack(spacing: 16) {
                                    if index == 0 {
                                        Image("fam")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                    }

                                    VStack(spacing: 50) {
                                        Text(goal.name)
                                            .foregroundColor(.white)
                                            .font(.body)

                                        ZStack(alignment: .leading) {
                                            Capsule()
                                                .fill(Color.gray.opacity(0.3))
                                                .frame(height: 8)

                                            Capsule()
                                                .fill(Color("bt"))
                                                .frame(width: 130, height: 8)
                                        }

                                        HStack {
                                            Text("0")
                                                .foregroundColor(.white)
                                            Spacer()
                                            Text(goal.amount)
                                                .foregroundColor(.white)
                                        }
                                        .font(.caption)
                                    }
                                    .padding()
                                    .background(Color("ic"))
                                    .cornerRadius(20)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }

                Spacer()

                VStack(spacing: 25) {
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("الأعضاء")
                            .foregroundColor(.white)
                            .font(.body.bold())
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal)

                        Circle()
                            .fill(Color("ic"))
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                            )
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.horizontal)
                    }

                    Button(action: {
                        showAddGoal = true
                    }) {
                        Text("اضف هدف")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("bt"))
                            .cornerRadius(15)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 40)
            }

            // زر الرجوع مثبت في الأعلى
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "chevron.backward")
                    .font(.system(size: 30, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .sheet(isPresented: $showAddGoal) {
            ZStack {
                Color("bg")
                    .ignoresSafeArea()

                VStack(spacing: 25) {
                    Text("إضافة هدف جديد")
                        .font(.title2.bold())
                        .foregroundColor(.white)

                    TextField("اسم الهدف", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.default)
                        .padding(.horizontal)

                    DatePicker("اختر المدة", selection: $duration, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .padding(.horizontal)

                    TextField("المبلغ", text: $amount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .padding(.horizontal)
                        .onChange(of: amount) { newValue in
                            let filtered = newValue.filter { $0.isNumber || $0 == "." }
                            if filtered != newValue {
                                amount = filtered
                            }
                        }

                    Button("حفظ الهدف") {
                        let newGoal = Goal(name: name, duration: duration, amount: amount)
                        goals.append(newGoal)
                        name = ""
                        amount = ""
                        showAddGoal = false
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("bt"))
                    .cornerRadius(15)
                    .padding(.horizontal)

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    FamilyProgramScreen()
}
