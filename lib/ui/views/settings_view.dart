import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:provider_start/core/localization/localization.dart';
import 'package:provider_start/core/view_models/settings_view_model.dart';

/// An example settings view that uses platform adaptive widgets
/// and builds widgets using the `functional_widget` package,
/// which avoids the inefficiencies that comes with writing
/// functions that return Widgets. e.g. Widget buildWidget();
///   - To add/change a functional_widget look at README.md - installation section
class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelProvider<SettingsViewModel>.withoutConsumer(
      viewModel: SettingsViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(local.settingsViewTitle),
          ios: (_) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: ListView(
          children: <Widget>[
            _AppSettingsListTile(),
            _NotificationsListTile(),
            _ShowSnackBarListTile(),
            _SignOutListTile()
          ],
        ),
      ),
    );
  }
}

class _AppSettingsListTile extends ProviderWidget<SettingsViewModel> {
  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return PlatformWidget(
      android: (_) => ListTile(
        title: Text(local.settingsViewAppSettings),
        subtitle: Text(local.settingsViewAppSettingsDesc),
        trailing: PlatformWidget(
          android: (_) => Icon(Icons.launch),
          ios: (_) => Icon(CupertinoIcons.share_up),
        ),
        onTap: model.openAppSettings,
      ),
      ios: (_) => CupertinoButton(
        onPressed: model.openAppSettings,
        child: Row(
          children: <Widget>[
            Text(
              local.settingsViewAppSettings,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Spacer(),
            PlatformWidget(
              android: (_) => Icon(Icons.launch),
              ios: (_) => Icon(CupertinoIcons.share_up),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationsListTile extends ProviderWidget<SettingsViewModel> {
  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return PlatformWidget(
      android: (_) => ListTile(
        onTap: model.toggleNotificationsEnabled,
        title: Text(local.settingsViewNotifications),
        subtitle: Text(local.settingsViewNotificationsDesc),
        trailing: Switch.adaptive(
          value: model.notificationsEnabled,
          onChanged: (_) => model.toggleNotificationsEnabled(),
        ),
      ),
      ios: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Text(
              local.settingsViewNotifications,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Spacer(),
            Switch.adaptive(
              value: model.notificationsEnabled,
              onChanged: (_) => model.toggleNotificationsEnabled(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignOutListTile extends ProviderWidget<SettingsViewModel> {
  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return PlatformWidget(
      android: (_) => ListTile(
        title: Text(local.settingsViewSignOut),
        subtitle: Text(local.settingsViewSignOutDesc),
        trailing: PlatformWidget(
          android: (_) => Icon(Icons.exit_to_app),
          ios: (_) => Icon(CupertinoIcons.right_chevron),
        ),
        onTap: () => model.signOut(
          title: local.settingsViewSignOut,
          desc: local.settingsViewSignOutDesc,
          buttonConfirmText: local.buttonTextConfirm,
        ),
      ),
      ios: (_) => CupertinoButton(
        onPressed: () => model.signOut(
          title: local.settingsViewSignOut,
          desc: local.settingsViewSignOutDesc,
          buttonConfirmText: local.buttonTextConfirm,
        ),
        child: Row(
          children: <Widget>[
            Text(
              local.settingsViewSignOut,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Spacer(),
            PlatformWidget(
              android: (_) => Icon(Icons.exit_to_app),
              ios: (_) => Icon(CupertinoIcons.right_chevron),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowSnackBarListTile extends ProviderWidget<SettingsViewModel> {
  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return ListTile(
      title: Text(local.settingsViewSnackBar),
      subtitle: Text(local.settingsViewSnackBarDesc),
      trailing: PlatformWidget(
        android: (_) => Icon(Icons.announcement),
        ios: (_) => Icon(CupertinoIcons.conversation_bubble),
      ),
      onTap: () => model.showSnackbar(
        message: 'some message',
        childText: 'okay',
        colorCode: 0xffb74093,
        duration: 2,
      ),
    );
  }
}
