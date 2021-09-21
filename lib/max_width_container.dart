part of cizer;

class MaxWidthContainer extends StatelessWidget {

  final Widget child;

  const MaxWidthContainer({Key? key , required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Cizer.maximum),
        child: child,
      ),
    );
  }
}
