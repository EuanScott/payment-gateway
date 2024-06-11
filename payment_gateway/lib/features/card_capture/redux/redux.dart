import '../models/card_details.dart';

// TODO: Explore this more and how to integrate it into my app

class AddCardAction {
  final CardDetails cardDetails;

  AddCardAction(this.cardDetails);
}

// Define reducers
AppState appReducer(AppState state, dynamic action) {
  if (action is AddCardAction) {
    return state.copyWith(
      cardDetails: action.cardDetails,
    );
  }
  return state;
}

// Define state
class AppState {
  final CardDetails cardDetails;

  AppState({this.cardDetails});

  AppState copyWith({CardDetails cardDetails}) {
    return AppState(
      cardDetails: cardDetails ?? this.cardDetails,
    );
  }
}

// Create Redux store
final store = Store<AppState>(
  appReducer,
  initialState: AppState(cardDetails: null),
);
