.class public final Lwrapper/KitKat;
.super Ljava/lang/Object;
.source "KitKat.java"


# static fields
.field public static final FLAG_CLIP_TO_PADDING:I
.field public static final Field_mGroupFlags:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    :try_start_0
    const-class v0, Landroid/view/ViewGroup;

    const-string v1, "mGroupFlags"

    const/4 v2, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    sput-object v1, Lwrapper/KitKat;->Field_mGroupFlags:Ljava/lang/reflect/Field;

    const-string v1, "FLAG_CLIP_TO_PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->isAccessible()Z
    
    move-result v1
    
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v2, 0x0
    
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    sput v2, Lwrapper/KitKat;->FLAG_CLIP_TO_PADDING:I

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Cannot obtain the fields from ViewGroup"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 1

    if-nez p1, :cond_0

    const-string v0, "getDrawable() called with ID zero"

    invoke-static {v0}, Lwrapper/KitKat;->Log(Ljava/lang/String;)V

    new-instance v0, Lwrapper/EmptyDrawable;

    invoke-direct {v0}, Lwrapper/EmptyDrawable;-><init>()V

    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public static getColor(Landroid/content/Context;I)I
    .locals 2

    if-nez p1, :cond_0

    const-string v1, "getColor() called with ID zero"

    invoke-static {v1}, Lwrapper/KitKat;->Log(Ljava/lang/String;)V

    sget v0, Landroid/graphics/Color;->TRANSPARENT:I

    return v0

    .line 43
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    return v0
.end method

.method public static getColorStateList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public static isNestedScrollingEnabled(Landroid/view/View;)Z
    .locals 1
 
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->isNestedScrollingEnabled()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return v0
.end method

.method public static getChangingConfigurations(Landroid/content/res/TypedArray;)I
    .locals 5

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 59
    invoke-virtual {p0, v2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v3

    if-eqz v3, :cond_1

    iget v4, v3, Landroid/util/TypedValue;->type:I

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    iget v4, v3, Landroid/util/TypedValue;->changingConfigurations:I

    or-int/2addr v0, v4

    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public static stopNestedScroll(Landroid/view/View;)V
    .locals 1

    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->stopNestedScroll()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :goto_0
    return-void
.end method

.method public static getClipToPadding(Landroid/view/ViewGroup;)Z
    .locals 2

    sget-object v0, Lwrapper/KitKat;->Field_mGroupFlags:Ljava/lang/reflect/Field;

    :try_start_0

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->isAccessible()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    sget v1, Lwrapper/KitKat;->FLAG_CLIP_TO_PADDING:I

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    return v0

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static Log(Ljava/lang/String;)V
    .locals 3
    
    const-string v0, "KitKat"

    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "stacktrace was:"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 116
    return-void
.end method


