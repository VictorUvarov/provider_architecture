import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/core/view_models/home_view_model.dart';
import 'package:provider_start/ui/widgets/loading_animation.dart';
import 'package:provider_start/ui/widgets/post_tile.dart';
import 'package:provider_start/ui/widgets/state_responsive.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(local.homeViewTitle),
          ios: (_) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: StateResponsive(
          state: model.state,
          idleWidget: _Posts(),
          busyWidget: _LoadingAnimation(),
          noDataAvailableWidget: _NoPosts(),
        ),
      ),
    );
  }
}

class _Posts extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return ListView.builder(
      itemCount: model.posts.length,
      itemBuilder: (context, index) => PostTile(
        key: Key('${model.posts[index].id}'),
        post: model.posts[index],
      ),
    );
  }
}

class _LoadingAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimation(),
    );
  }
}

class _NoPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Center(
      child: Text(local.homeViewNoPosts),
    );
  }
}
