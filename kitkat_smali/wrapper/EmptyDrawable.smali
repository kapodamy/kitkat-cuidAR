.class public Lwrapper/EmptyDrawable;
.super Landroid/graphics/drawable/LayerDrawable;
.source "EmptyDrawable.java"


# static fields
.field public static final RADIUS_AUTO:I = -0x1


# instance fields
.field private final mHotspotBounds:Landroid/graphics/Rect;

.field private mMaxRadius:I


# direct methods
.method constructor <init>()V
    .registers 3

    .line 40
    const/4 v0, 0x0

    new-array v1, v0, [Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 36
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lwrapper/EmptyDrawable;->mHotspotBounds:Landroid/graphics/Rect;

    .line 37
    iput v0, p0, Lwrapper/EmptyDrawable;->mMaxRadius:I

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "color"    # Landroid/content/res/ColorStateList;
    .param p2, "content"    # Landroid/graphics/drawable/Drawable;
    .param p3, "mask"    # Landroid/graphics/drawable/Drawable;

    .line 44
    const/4 v0, 0x0

    new-array v1, v0, [Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 36
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lwrapper/EmptyDrawable;->mHotspotBounds:Landroid/graphics/Rect;

    .line 37
    iput v0, p0, Lwrapper/EmptyDrawable;->mMaxRadius:I

    .line 45
    invoke-virtual {p0, p1}, Lwrapper/EmptyDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 46
    return-void
.end method

.method public constructor <init>([Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "layers"    # [Landroid/graphics/drawable/Drawable;

    .line 49
    invoke-direct {p0, p1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 36
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lwrapper/EmptyDrawable;->mHotspotBounds:Landroid/graphics/Rect;

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lwrapper/EmptyDrawable;->mMaxRadius:I

    .line 50
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 77
    return-void
.end method

.method public getDirtyBounds()Landroid/graphics/Rect;
    .registers 2

    .line 81
    invoke-virtual {p0}, Lwrapper/EmptyDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    return-object v0
.end method

.method public getMaxRadius()I
    .registers 2

    .line 89
    iget v0, p0, Lwrapper/EmptyDrawable;->mMaxRadius:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 54
    const/4 v0, -0x3

    return v0
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .registers 5
    .param p1, "r"    # Landroid/content/res/Resources;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "theme"    # Landroid/content/res/Resources$Theme;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    return-void
.end method

.method public isProjected()Z
    .registers 2

    .line 59
    invoke-virtual {p0}, Lwrapper/EmptyDrawable;->getNumberOfLayers()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public isStateful()Z
    .registers 2

    .line 63
    const/4 v0, 0x1

    return v0
.end method

.method public setColor(Landroid/content/res/ColorStateList;)V
    .registers 2
    .param p1, "color"    # Landroid/content/res/ColorStateList;

    .line 67
    invoke-virtual {p0}, Lwrapper/EmptyDrawable;->invalidateSelf()V

    .line 68
    return-void
.end method

.method public setMaxRadius(I)V
    .registers 2
    .param p1, "maxRadius"    # I

    .line 85
    iput p1, p0, Lwrapper/EmptyDrawable;->mMaxRadius:I

    .line 86
    return-void
.end method
