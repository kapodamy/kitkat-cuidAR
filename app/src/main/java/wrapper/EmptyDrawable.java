/*
 * Copyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package wrapper;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;

import androidx.annotation.NonNull;

import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

import java.io.IOException;

public class EmptyDrawable extends LayerDrawable {
    public static final int RADIUS_AUTO = -1;
    private final Rect mHotspotBounds = new Rect();
    private int mMaxRadius = 0;

    EmptyDrawable() {
        super(new Drawable[]{});
    }

    public EmptyDrawable(ColorStateList color, Drawable content, Drawable mask) {
        super(new Drawable[]{});
        setColor(color);
        android.util.Size a;
    }

    public EmptyDrawable(@NonNull Drawable[] layers) {
        super(layers);
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }

    @Override
    public boolean isProjected() {
        return getNumberOfLayers() == 0;
    }
    @Override
    public boolean isStateful() {
        return true;
    }

    public void setColor(ColorStateList color) {
        invalidateSelf();
    }

    @Override
    public void inflate(Resources r, XmlPullParser parser, AttributeSet attrs, Resources.Theme theme)
            throws XmlPullParserException, IOException {
    }

    @Override
    public void draw(Canvas canvas) {
    }

    @Override
    public Rect getDirtyBounds() {
        return getBounds();
    }

    public void setMaxRadius(int maxRadius) {
        mMaxRadius = maxRadius;
    }

    public int getMaxRadius() {
        return mMaxRadius;
    }

}
