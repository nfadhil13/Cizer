part of cizer;

class ResponsiveLayout extends StatelessWidget {

  final Widget Function() mobileBody;
  final Widget Function()? tabletBody;
  final Widget Function()? desktopBody;


  const ResponsiveLayout({
    required this.mobileBody, this.tabletBody, this.desktopBody,  Key? key
  }) : super(key: key);



  const ResponsiveLayout.freeBuild(Widget Function() builder, {Key? key}) :
        mobileBody = builder,
        tabletBody = null,
        desktopBody = null, super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, __) {
      if(Cizer.isMobile){
        return mobileBody();
      }else if(Cizer.isTablet){
        return tabletBody?.call() ?? mobileBody();
      }
      return desktopBody?.call() ?? mobileBody();
    });
  }
}

