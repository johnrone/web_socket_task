package com.example.websocket

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.example.websocket/device_security"

    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine
    ) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "checkRoot" -> {
                    result.success(isRooted())
                }

                else -> result.notImplemented()
            }
        }
    }

    private fun isRooted(): Boolean {
        return hasSuBinary() ||
                hasDangerousApps() ||
                hasRootAccess()
    }

    private fun hasSuBinary(): Boolean {
        val paths = arrayOf(
            "/system/bin/su",
            "/system/xbin/su",
            "/sbin/su",
            "/vendor/bin/su"
        )

        return paths.any { File(it).exists() }
    }

    private fun hasDangerousApps(): Boolean {
        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/system/app/Magisk.apk"
        )

        return paths.any { File(it).exists() }
    }

    private fun hasRootAccess(): Boolean {
        return try {
            val process = Runtime.getRuntime().exec("which su")
            process.inputStream.bufferedReader().readLine() != null
        } catch (e: Exception) {
            false
        }
    }
}