hspoon_list = {
    "AClock","AllBrightness","AppLauncher","ArrangeDesktop","Asana","BingDaily","BonjourLauncher",--[["BonjourLauncher.recipes",--]]"BrewInfo","Caffeine","Calendar","Cherry","CircleClock","ClipboardTool","ClipShow","ColorPicker","Commander","CountDown","DeepLTranslate","EjectMenu","Emojis","EvernoteOpenAndTag","FadeLogo","FnMate","HCalendar","HeadphoneAutoPause","HighSierraiTunesMediaFix","HoldToQuit","HSaria2","HSearch","HSKeybindings","Keychain","KSheet","Leanpub","LookupSelection","MenubarFlag","MicMute","MiroWindowsManager","ModalMgr","MountedVolumes","MouseCircle","MouseFollowsFocus", --[["MoveSpaces",--]] "MusicAppMediaFix","PasswordGenerator","Pastebin","PersonalHotspot","PopupTranslateSelection","PushToTalk","RecursiveBinder","ReloadConfiguration","RoundedCorners","Seal",--[["Seal.plugins","Seal.plugins.apps","Seal.plugins.pasteboard","Seal.plugins.safari_bookmarks","Seal.plugins.screencapture","Seal.plugins.urlformats","Seal.plugins.useractions",--]]"SendToOmniFocus","Shade","SleepCorners","SpeedMenu","SpoonInstall","TextClipboardHistory","TimeFlow","TimeMachineProgress","ToggleScreenRotation","ToggleSkypeMute","Token","Tunnelblick","UniversalArchive","UnsplashRandom","UnsplashZ","URLDispatcher","USBDeviceActions","VolumeScroll","WifiNotifier","WiFiTransitions","WindowGrid","WindowHalfsAndThirds","WindowScreenLeftAndRight","WindowSigils","WinWin"
}

for _, v in pairs(hspoon_list) do
    hs.loadSpoon(v)
end

require("plugin.clipboard")
require("plugin.reload")

-- HSearch.init()
