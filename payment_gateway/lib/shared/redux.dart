import 'package:redux/redux.dart';

import '../features/card_capture/models/card_details.dart';

class AddCardAction {
  final CardDetails cardDetails;

  AddCardAction(this.cardDetails);
}

// Define reducers
AppState appReducer(AppState state, dynamic action) {
  if (action is AddCardAction) {
    return state.copyWith(
      cardDetails: action.cardDetails,
      // TODO: Save the card in storage here
    );
  }
  return state;
}

// Define state
class AppState {
  final CardDetails cardDetails;

  AppState({required this.cardDetails});

  AppState copyWith({required CardDetails cardDetails}) {
    return AppState(
      cardDetails: cardDetails ?? this.cardDetails,
    );
  }
}

// Create Redux store
final store = Store<AppState>(
  appReducer,
  initialState: AppState(cardDetails: CardDetails('', '', '', '')),
);
