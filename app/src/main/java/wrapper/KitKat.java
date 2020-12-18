package wrapper;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;

import xandroid.os.PersistableBundle;

import android.util.Log;
import android.util.TypedValue;
import android.view.View;

import androidx.annotation.ColorRes;
import androidx.annotation.DrawableRes;
import androidx.annotation.RequiresApi;

import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.security.ProviderInstaller;

import java.security.KeyStore;
import java.util.Arrays;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.TrustManagerFactory;
import javax.net.ssl.X509TrustManager;

public final class KitKat {

    @SuppressLint("UseCompatLoadingForDrawables")
    public static Drawable getDrawable(Context ctx, @DrawableRes int id) {
        //if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
        //    return ctx.getDrawable(id);
        //return  ctx.getResources().getDrawable(id);*/
        //return ResourcesCompat.getDrawable(ctx.getResources(), id, null);
        return ctx.getResources().getDrawable(id);

    }

    public static int getColor(Context ctx, @ColorRes int id) {
        return ctx.getResources().getColor(id);
    }

    @SuppressLint("UseCompatLoadingForColorStateLists")
    public static ColorStateList getColorStateList(Context ctx, @ColorRes int id) {
        return ctx.getResources().getColorStateList(id);
    }

    @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
    public static boolean isNestedScrollingEnabled(View view) {
        try {
            return view.isNestedScrollingEnabled();
        } catch (NoSuchMethodError e) {
            return false;
        }
    }

    /**
     * Return a mask of the configuration parameters for which the values in
     * this typed array may change.
     * Designed for API >=21
     *
     * @return Returns a mask of the changing configuration parameters, as
     * defined by {@link android.content.pm.ActivityInfo}.
     * @see android.content.pm.ActivityInfo
     */
    public static int getChangingConfigurations(TypedArray typedArray) {
        int changingConfig = 0;
        final int N = typedArray.length();

        for (int i = 0; i < N; i++) {
            final TypedValue value = typedArray.peekValue(i);

            if (value == null || value.type == TypedValue.TYPE_NULL) {
                continue;
            }

            changingConfig |= value.changingConfigurations;
        }

        return changingConfig;
    }


    /**
     * Flatten a PersistableBundle into the parcel at the current dataPosition(),
     * growing dataCapacity() if needed.
     */
    public static void writePersistableBundle(Parcel parcel, PersistableBundle val) {
        if (val == null) {
            parcel.writeInt(-1);
            return;
        }
        val.writeToParcel(parcel, 0);
    }

    /**
     * Read and return a new Bundle object from the parcel at the current
     * dataPosition(), using the default class loader to initialize the class
     * loader of the Bundle for later retrieval of Parcelable objects.
     * Returns null if the previously written Bundle object was null.
     */
    public static PersistableBundle readPersistableBundle(Parcel parcel) {
        return readPersistableBundle(parcel, null);
    }

    /**
     * Read and return a new Bundle object from the parcel at the current
     * dataPosition(), using the given class loader to initialize the class
     * loader of the Bundle for later retrieval of Parcelable objects.
     * Returns null if the previously written Bundle object was null.
     */
    public static PersistableBundle readPersistableBundle(Parcel parcel, ClassLoader loader) {
        int length = parcel.readInt();
        if (length < 0) {
            return null;
        }
        final PersistableBundle bundle = new PersistableBundle(parcel, length);
        if (loader != null) {
            bundle.setClassLoader(loader);
        }
        return bundle;
    }

    public static void installTls12FromGooglePlayServices(Context ctx) {
        try {
            ProviderInstaller.installIfNeeded(ctx);
        } catch (GooglePlayServicesRepairableException | GooglePlayServicesNotAvailableException err) {
            Log.e("KiKat", "ProviderInstaller.installIfNeeded() failed", err);
        }
    }

    /*public static void setupHttpLogging(OkHttpClient.Builder builder) {
        HttpLoggingInterceptor interceptor = new HttpLoggingInterceptor();
        interceptor.setLevel(HttpLoggingInterceptor.Level.BODY);
        builder.addNetworkInterceptor(interceptor);
    }*/
}
