import SwiftUI

struct RatingView: View {
    
    @StateObject var viewModel: RatingViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.ratings.indexedItems, id: \.offset) { _, rating in
                    HStack {
                        Text(rating.name)
                            .fontSystem(rating.isCurrent ? .accent : .subtext)
                            .foregroundStyle(rating.isCurrent ? Color.accent : Color.tint)
                        Spacer()
                        Text(rating.score.description)
                            .fontSystem(rating.isCurrent ? .title : .text)
                            .foregroundStyle(Color.accent)
                    }
                }
            }
            .padding(12)
        }
        .onAppear {
            viewModel.relaod()
        }
        .navigationTitle("Rating")
    }
}

struct RatingView_Previews: PreviewProvider {
    
    static var previews: some View {
        RatingView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
