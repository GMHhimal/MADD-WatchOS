// SE4041 Practical 05 – Task detail screen
// G M H Himal | IT23152632
import SwiftUI

struct TaskDetailView: View {
    let task: TaskItem

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(systemName: task.completed
                      ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 36))
                    .foregroundStyle(task.completed ? Color.green : Color.orange)
                    .accessibilityHidden(true)

                Text(task.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text(task.completed ? "Completed" : "Not Completed")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
        }
        .navigationTitle("Task Details")
    }
}
