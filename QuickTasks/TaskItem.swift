// SE4041 Practical 05 – Task data model
// G M H Himal | IT23152632
import Foundation

struct TaskItem: Identifiable {
    let id: UUID
    var title: String
    var completed: Bool

    init(id: UUID = UUID(), title: String, completed: Bool = false) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}
