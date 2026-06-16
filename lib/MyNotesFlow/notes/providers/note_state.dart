class NoteState {
  String error;
  bool isLoading;

  NoteState({required this.error, required this.isLoading});

  NoteState copyWith({String? error, bool? isLoading}) {
    return NoteState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
