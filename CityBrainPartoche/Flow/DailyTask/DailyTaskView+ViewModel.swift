import SwiftUI

extension DailyTaskView {
    
    final class DailyTaskViewModel: ObservableObject {
        
        @Published var task: TaskItem
        
        private let router: Router
        
        init(router: Router) {
            self.router = router
            
            let tasks: [TaskItem] = LoadFileService().loadItems(file: .tasks)

            var taskId = Storage.shared.taskId
            let taskLastDate = Storage.shared.taskLastDate
            
            let dateNow = Date.now.add(.day, value: 4).formatted(date: .long, time: .omitted)
            
            if taskLastDate != dateNow {
                taskId += 1
                if taskId > tasks.count {
                    taskId = 1
                }
                Storage.shared.taskLastDate = dateNow
                Storage.shared.taskId = taskId
            }
            
            self.task = tasks.first(where: { $0.id == taskId }) ?? tasks.first!
        }
    }
}
