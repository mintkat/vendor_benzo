#!/sbin/sh
# 
# /system/addon.d/95-v4a.sh
# This script backs up /system/priv-app/ViPER4Android_FX_A4.x/ViPER4Android_FX_A4.x.apk
# /system is formatted and reinstalled, then the file is restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
priv-app/ViPER4Android_FX_A4.x/ViPER4Android_FX_A4.x.apk
lib/soundfx/libv4a_fx_ics.so
etc/audio_effects.conf
etc/audio_policy.conf
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
		rm /system/priv-app/AudioFX.apk
		rm /system/priv-app/AudioFX/AudioFX.apk
		rm /system/app/DSPManager.apk
		rm /system/app/DSPManager/DSPManager.apk
		rm /system/priv-app/MusicFX.apk
		rm /system/priv-app/MusicFX/MusicFX.apk
		;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
	# audio_policy.conf edits for V4A compatibility
sed -i '/deep_buffer {/,/}/s/^/#/' /system/etc/audio_policy.conf
  ;;
esac
