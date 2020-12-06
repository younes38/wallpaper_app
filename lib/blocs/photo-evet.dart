abstract class PhotoEvent {}

// class GetPhotosEvent extends PhotoEvent {

//   String category;
//   GetPhotosEvent({
//     this.category,

//   });
// }

class GetNewPhotosEvent extends PhotoEvent {
  String category;
  GetNewPhotosEvent({
    this.category,
  });
}

class GetInitialPhotosEvent extends PhotoEvent {
  String category;
  GetInitialPhotosEvent({
    this.category,
  });
}
