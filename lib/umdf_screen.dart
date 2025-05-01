import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validform/bloc/app_bloc.dart';

import 'bloc/app_events.dart';
import 'bloc/app_state.dart';

class UmdfScreen extends StatelessWidget {
  const UmdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => AppBloc(),
        child: Column(
          spacing: 30,
          children: [
            BlocConsumer<AppBloc, AppState>(
              listenWhen:
                  (previous, current) =>
                      previous.uploadStatus != current.uploadStatus,
              listener: (context, state) {
                if (state.isUploadError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              buildWhen:
                  (previous, current) =>
                      previous.uploadStatus != current.uploadStatus,
              builder: (context, state) {
                final bloc = context.read<AppBloc>();
                return state.isUploadLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () {
                        bloc.add(const UploadFileEvent());
                      },
                      child: const Text('Upload File'),
                    );
              },
            ),

            BlocConsumer<AppBloc, AppState>(
              listenWhen:
                  (previous, current) =>
                      previous.downloadStatus != current.downloadStatus,
              listener: (context, state) {
                if (state.isDownloadError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              buildWhen:
                  (previous, current) =>
                      previous.downloadStatus != current.downloadStatus,
              builder: (context, state) {
                final bloc = context.read<AppBloc>();
                return state.isDownloadLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                      onPressed: () {
                        bloc.add(const DownloadFileEvent());
                      },
                      child: const Text('Download File'),
                    );
              },
            ),

            BlocBuilder<AppBloc, AppState>(
              buildWhen:
                  (previous, current) => previous.filepath != current.filepath,
              builder: (context, state) {
                final bloc = context.read<AppBloc>();
                return state.filepath != null
                    ? Container(
                  color: Colors.grey,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              state.filepath!.split('/').last,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              bloc.add(const ClearFileEvent());
                              print(state.filepath);
                              print('llllllllllllllllllllll');
                            },
                            child: const Text('Clear File'),
                          ),
                        ],
                      ),
                    )
                    : ElevatedButton(
                      onPressed: () {
                        bloc.add(const PickFileEvent());
                      },
                      child: const Text('Pick File'),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
