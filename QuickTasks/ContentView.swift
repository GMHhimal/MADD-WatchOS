// SE4041 Practical 05 – Main Apple Watch screen
// G M H Himal | IT23152632
import SwiftUI

struct ContentView: View {
    @State private var tasks: [TaskItem] = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false),
        TaskItem(title: "Call Home", completed: true)
    ]

    // Exercise 08: only completed tasks contribute to the count.
    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    // Additional feature (Option B): progress percentage.
    private var completionPercentage: Int {
        guard !tasks.isEmpty else { return 0 }
        return completedCount * 100 / tasks.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 4) {
                VStack(spacing: 4) {
                    Text("Quick Tasks")
                        .font(.headline)
                        .bold()

                    Text("\(completedCount) / \(tasks.count) Completed")
                        .font(.caption2)

                    ProgressView(value: Double(completedCount), total: Double(tasks.count))
                        .tint(.green)
                        .accessibilityLabel("Task completion progress")

                    Text("\(completionPercentage)% Complete")
                        .font(.caption2)
                        .foregroundStyle(.green)
                }
                .padding(.horizontal, 8)
                .padding(.top, 3)
                .padding(.bottom, 3)

                List {
                    ForEach(tasks.indices, id: \.self) { index in
                        HStack(spacing: 7) {
                            // Action 1: tap the round icon to toggle status.
                            Button {
                                tasks[index].completed.toggle()
                            } label: {
                                Image(systemName: tasks[index].completed
                                      ? "checkmark.circle.fill" : "circle")
                                    .font(.title3)
                                    .foregroundStyle(tasks[index].completed
                                                     ? Color.green : Color.secondary)
                                    .frame(minWidth: 28, minHeight: 30)
                            }
                            .buttonStyle(.plain)
                            .accessibilityLabel(tasks[index].completed
                                                ? "Mark \(tasks[index].title) incomplete"
                                                : "Mark \(tasks[index].title) complete")

                            Text(tasks[index].title)
                                .font(.caption)
                                .lineLimit(2)
                                .minimumScaleFactor(0.8)

                            Spacer(minLength: 0)

                            // Action 2: separate details link (NOT inside a button).
                            NavigationLink {
                                TaskDetailView(task: tasks[index])
                            } label: {
                                Image(systemName: "info.circle")
                                    .font(.caption)
                                    .frame(minWidth: 28, minHeight: 30)
                            }
                            .buttonStyle(.plain)
                            .accessibilityLabel("Details for \(tasks[index].title)")
                        }
                        .padding(.vertical, 2)
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}
