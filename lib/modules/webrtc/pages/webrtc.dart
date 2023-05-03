import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class WebRtcPage extends StatefulWidget {
  const WebRtcPage({super.key});

  @override
  State<WebRtcPage> createState() => _WebRtcPageState();
}

class _WebRtcPageState extends State<WebRtcPage> {
  // Declara dois obj, um para o usuario remoto e outra para o usuário local
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  static const Map<String, dynamic> _configuration = {
    'iceServers': [
      {
        'urls': [
          'stun:stun1.l.google.com:19302',
          'stun:stun2.l.google.com:19302',
        ],
      },
    ],
  };

  // Habilitando cam
  Future<void> enableUserMediaStream() async {
    var stream = await navigator.mediaDevices.getUserMedia(
      {
        'video': true,
        //  'audio': true
      },
    );
    // emit(state.copyWith(localStream: stream));
    print("========= STREAM ========");
    print(stream);
  }

  Future<void> _createPeerConnection() async {
    final peerConnection = await createPeerConnection(_configuration);
    // emit(state.copyWith(peerConnection: peerConnection));
    print("========= PEER CONNECTION ========");
    print(peerConnection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
