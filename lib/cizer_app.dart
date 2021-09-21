part of cizer;

class CizerApp extends StatelessWidget {
  final Widget Function(BuildContext ctx) builder;
  final double? phoneBreakPoint;
  final double? tabletBreakPoint;
  final double? maximumBreakPoint;
  const CizerApp(
      {
        required this.builder,
        this.phoneBreakPoint,
      this.tabletBreakPoint,
      this.maximumBreakPoint,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints){

        Cizer.init(
          constraints.maxHeight,
          constraints.maxWidth,
          phoneBreakPoint: phoneBreakPoint,
          tabletBreakPoint: tabletBreakPoint,
          maximumBreakPoint: maximumBreakPoint
        );
        return builder(ctx);
      },
    );
  }
}
