import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';
import '../../providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final discoverProvider = context.watch<DisconverProvider>();
    // final otroProvider = Provider.of<DisconverProvider>(context, listen: false);

    return Scaffold(
      body: discoverProvider.initialLoading
        ? const Center(child: CircularProgressIndicator( strokeWidth: 2,),)
        : VideoScrollableView(videos: discoverProvider.videos,)

    );
  }
}