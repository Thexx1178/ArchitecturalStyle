#!/bin/bash
# ======== Android Emulator Auto Wipe & Boot ========
AVD_NAME="Pixel_7_API_34"   # ← เปลี่ยนชื่อ emulator ตรงนี้ตามของคุณ

echo "🧹 Wiping data for $AVD_NAME..."
$ANDROID_HOME/emulator/emulator -avd $AVD_NAME -wipe-data -no-snapshot-load &

echo "⏳ Waiting for emulator to start..."
adb wait-for-device

echo "🌐 Network test (ping 8.8.8.8)..."
adb shell ping -c 3 8.8.8.8

echo "✅ Done! Emulator is up and fresh."

