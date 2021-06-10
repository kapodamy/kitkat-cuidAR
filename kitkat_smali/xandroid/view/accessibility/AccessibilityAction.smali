.class public Lxandroid/view/accessibility/AccessibilityAction;
.super Ljava/lang/Object;
.source "AccessibilityAction.java"


# static fields
.field public static final ACTION_ACCESSIBILITY_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_CLEAR_ACCESSIBILITY_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_CLEAR_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_CLEAR_SELECTION:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_CLICK:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_COLLAPSE:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_COPY:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_CUT:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_DISMISS:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_EXPAND:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_IME_ENTER:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_LONG_CLICK:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_NEXT_AT_MOVEMENT_GRANULARITY:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_NEXT_HTML_ELEMENT:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_PASTE:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_PRESS_AND_HOLD:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_PREVIOUS_HTML_ELEMENT:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_SCROLL_BACKWARD:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_SCROLL_FORWARD:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_SELECT:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_SET_SELECTION:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final ACTION_SET_TEXT:Lxandroid/view/accessibility/AccessibilityAction;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lxandroid/view/accessibility/AccessibilityAction;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final actionId:I

.field private final label:Ljava/lang/CharSequence;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 62
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

    .line 63
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_CLEAR_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

    .line 64
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_SELECT:Lxandroid/view/accessibility/AccessibilityAction;

    .line 65
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_CLEAR_SELECTION:Lxandroid/view/accessibility/AccessibilityAction;

    .line 66
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_CLICK:Lxandroid/view/accessibility/AccessibilityAction;

    .line 67
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_LONG_CLICK:Lxandroid/view/accessibility/AccessibilityAction;

    .line 68
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_ACCESSIBILITY_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

    .line 69
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_CLEAR_ACCESSIBILITY_FOCUS:Lxandroid/view/accessibility/AccessibilityAction;

    .line 70
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_NEXT_AT_MOVEMENT_GRANULARITY:Lxandroid/view/accessibility/AccessibilityAction;

    .line 71
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x200

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_PREVIOUS_AT_MOVEMENT_GRANULARITY:Lxandroid/view/accessibility/AccessibilityAction;

    .line 72
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x400

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_NEXT_HTML_ELEMENT:Lxandroid/view/accessibility/AccessibilityAction;

    .line 73
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x800

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_PREVIOUS_HTML_ELEMENT:Lxandroid/view/accessibility/AccessibilityAction;

    .line 74
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x1000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_SCROLL_FORWARD:Lxandroid/view/accessibility/AccessibilityAction;

    .line 75
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x2000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_SCROLL_BACKWARD:Lxandroid/view/accessibility/AccessibilityAction;

    .line 76
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/16 v1, 0x4000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_COPY:Lxandroid/view/accessibility/AccessibilityAction;

    .line 77
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const v1, 0x8000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_PASTE:Lxandroid/view/accessibility/AccessibilityAction;

    .line 78
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/high16 v1, 0x10000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_CUT:Lxandroid/view/accessibility/AccessibilityAction;

    .line 79
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/high16 v1, 0x20000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_SET_SELECTION:Lxandroid/view/accessibility/AccessibilityAction;

    .line 80
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/high16 v1, 0x40000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_EXPAND:Lxandroid/view/accessibility/AccessibilityAction;

    .line 81
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/high16 v1, 0x80000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_COLLAPSE:Lxandroid/view/accessibility/AccessibilityAction;

    .line 82
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/high16 v1, 0x100000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_DISMISS:Lxandroid/view/accessibility/AccessibilityAction;

    .line 83
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const/high16 v1, 0x200000

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_SET_TEXT:Lxandroid/view/accessibility/AccessibilityAction;

    .line 84
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const v1, 0x102004a

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_PRESS_AND_HOLD:Lxandroid/view/accessibility/AccessibilityAction;

    .line 85
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction;

    const v1, 0x1020054

    invoke-direct {v0, v1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(I)V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->ACTION_IME_ENTER:Lxandroid/view/accessibility/AccessibilityAction;

    .line 88
    new-instance v0, Lxandroid/view/accessibility/AccessibilityAction$1;

    invoke-direct {v0}, Lxandroid/view/accessibility/AccessibilityAction$1;-><init>()V

    sput-object v0, Lxandroid/view/accessibility/AccessibilityAction;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(I)V
    .registers 3
    .param p1, "standardActionId"    # I

    .line 14
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 15
    return-void
.end method

.method public constructor <init>(ILjava/lang/CharSequence;)V
    .registers 3
    .param p1, "actionId"    # I
    .param p2, "label"    # Ljava/lang/CharSequence;

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    .line 19
    iput-object p2, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    .line 20
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-nez v0, :cond_20

    .line 101
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    goto :goto_26

    .line 103
    :cond_20
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    .line 105
    :goto_26
    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lxandroid/view/accessibility/AccessibilityAction$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lxandroid/view/accessibility/AccessibilityAction$1;

    .line 8
    invoke-direct {p0, p1}, Lxandroid/view/accessibility/AccessibilityAction;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public addAction(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "accessibilityNodeInfo"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 29
    iget v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(I)V

    .line 30
    return-void
.end method

.method public describeContents()I
    .registers 2

    .line 108
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "other"    # Ljava/lang/Object;

    .line 45
    instance-of v0, p1, Lxandroid/view/accessibility/AccessibilityAction;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    .line 46
    move-object v0, p1

    check-cast v0, Lxandroid/view/accessibility/AccessibilityAction;

    .line 47
    .local v0, "instance":Lxandroid/view/accessibility/AccessibilityAction;
    iget v2, v0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    iget v3, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    if-ne v2, v3, :cond_19

    iget-object v2, v0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    iget-object v3, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    const/4 v1, 0x1

    :cond_19
    return v1

    .line 49
    .end local v0    # "instance":Lxandroid/view/accessibility/AccessibilityAction;
    :cond_1a
    return v1
.end method

.method public getId()I
    .registers 2

    .line 34
    iget v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    return v0
.end method

.method public getLabel()Ljava/lang/CharSequence;
    .registers 2

    .line 38
    iget-object v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .line 54
    iget v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    return v0
.end method

.method public removeAction(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 3
    .param p1, "accessibilityNodeInfo"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 25
    iget v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->removeAction(I)V

    .line 26
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .line 112
    iget v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->actionId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 113
    iget-object v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    instance-of v0, v0, Landroid/os/Parcelable;

    if-eqz v0, :cond_17

    .line 114
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 115
    iget-object v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    check-cast v0, Landroid/os/Parcelable;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    goto :goto_22

    .line 117
    :cond_17
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 118
    iget-object v0, p0, Lxandroid/view/accessibility/AccessibilityAction;->label:Ljava/lang/CharSequence;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 120
    :goto_22
    return-void
.end method
