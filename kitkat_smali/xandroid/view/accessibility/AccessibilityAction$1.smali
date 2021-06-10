.class final Lxandroid/view/accessibility/AccessibilityAction$1;
.super Ljava/lang/Object;
.source "AccessibilityAction.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lxandroid/view/accessibility/AccessibilityAction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lxandroid/view/accessibility/AccessibilityAction;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 2

    .line 88
    invoke-virtual {p0, p1}, Lxandroid/view/accessibility/AccessibilityAction$1;->createFromParcel(Landroid/os/Parcel;)Lxandroid/view/accessibility/AccessibilityAction;

    move-result-object p1

    return-object p1
.end method

.method public createFromParcel(Landroid/os/Parcel;)Lxandroid/view/accessibility/AccessibilityAction;
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .line 90
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(Landroid/os/Parcel;Lxandroid/view/accessibility/AccessibilityAction$1;)V

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 2

    .line 88
    invoke-virtual {p0, p1}, Lxandroid/view/accessibility/AccessibilityAction$1;->newArray(I)[Lxandroid/view/accessibility/AccessibilityAction;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lxandroid/view/accessibility/AccessibilityAction;
    .registers 3
    .param p1, "size"    # I

    .line 94
    new-array v0, p1, [Lxandroid/view/accessibility/AccessibilityAction;

    return-object v0
.end method
