import 'package:flutter/material.dart';

class FromMenuRoute extends PageRouteBuilder {
  final Widget nextPage;
  final Widget prevPage;

  FromMenuRoute({required this.prevPage, required this.nextPage})
      : super(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return nextPage;
          },
          maintainState: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return Material(
              child: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(-0.3, 0.0),
                    ).animate(animation),
                    child: prevPage,
                  ),
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: AnimatedBuilder(
                      animation: animation,
                      builder: (c, w) {
                        return Material(
                          shadowColor: Colors.black,
                          elevation: 30.0 * animation.value,
                          child: nextPage,
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          },
        );
}
