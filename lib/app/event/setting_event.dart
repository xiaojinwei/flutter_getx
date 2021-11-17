class SettingEvent {
  static final int TYPE_MODE_TITLE = 0x01;
  int type;
  String? modeTitle;
  SettingEvent(this.type,{this.modeTitle});

  static SettingEvent createRefreshModeEvent(String? modeTitle){
    return SettingEvent(TYPE_MODE_TITLE,modeTitle: modeTitle);
  }
}