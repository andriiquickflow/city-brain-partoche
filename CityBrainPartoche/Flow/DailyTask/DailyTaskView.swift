import SwiftUI

struct DailyTaskView: View {
    
    @StateObject var viewModel: DailyTaskViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Today task:")
                .fontSystem(.title)
            Text(viewModel.task.text)
                .multilineTextAlignment(.center)
                .fontSystem(.accent)
            Spacer()
        }
        .foregroundStyle(Color.tint)
        .padding(20)
        .background(
            ZStack {
                Image("task")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.2)
                Color.black.opacity(0.3)
            }
        )
        .navigationTitle("Daily Task")
    }
}

struct DailyTaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        DailyTaskView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
