package app.wachu.forzar_4g

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import androidx.annotation.NonNull
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.widget.Toast

class MainActivity: FlutterActivity() {
    private val CHANNEL = "force4g"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getforce4g") {
                val forceSuccess = gerForce4G()
                result.success(forceSuccess)
            } else {
                result.notImplemented()
            }
        }
    }
    private fun gerForce4G(): String {
            val androidOS = Build.VERSION.SDK_INT
            try {
                val intent = Intent(Intent.ACTION_MAIN)
                if(androidOS >= 30 ){// https://stackoverflow.com/a/66165805
                    intent.setClassName("com.android.phone", "com.android.phone.settings.RadioInfo") //https://stackoverflow.com/a/50409322

                }else{
                    intent.setClassName("com.android.settings", "com.android.settings.RadioInfo")
                }
                startActivity(intent)
                return "Dispositivo Modificado Correctamente"
            } catch (e: Exception) {
                return "Dipositivo no Soportado"
            }
    }
}
