
part of cizer;

class ResponsiveItem<T> {

  final T mobileBody;
  final T? tabletBody;
  final T? desktopBody;


  ResponsiveItem({
    required this.mobileBody, this.tabletBody, required this.desktopBody
  }) ;

  T item() {

    if(Cizer.width < Cizer.phone){
      return mobileBody;
    }else if(Cizer.width >= Cizer.phone && Cizer.width < Cizer.tablet){
      return tabletBody ?? mobileBody;
    }
    return desktopBody ?? mobileBody;
  }
}

