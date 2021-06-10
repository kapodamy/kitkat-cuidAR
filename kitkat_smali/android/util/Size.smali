.class public final Landroid/util/Size;
.super Ljava/lang/Object;
.source "Size.java"


# instance fields
.field private final mHeight:I

.field private final mWidth:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput p1, p0, Landroid/util/Size;->mWidth:I

    .line 29
    iput p2, p0, Landroid/util/Size;->mHeight:I

    .line 30
    return-void
.end method

.method private static invalidSize(Ljava/lang/String;)Ljava/lang/NumberFormatException;
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .line 81
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid Size: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static parseSize(Ljava/lang/String;)Landroid/util/Size;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 114
    if-eqz p0, :cond_36

    .line 115
    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 116
    .local v0, "sep_ix":I
    if-gez v0, :cond_10

    .line 117
    const/16 v1, 0x78

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 119
    :cond_10
    if-ltz v0, :cond_31

    .line 123
    :try_start_12
    new-instance v1, Landroid/util/Size;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v3, v0, 0x1

    .line 124
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/Size;-><init>(II)V
    :try_end_2a
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_2a} :catch_2b

    .line 123
    return-object v1

    .line 125
    :catch_2b
    move-exception v1

    .line 126
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-static {p0}, Landroid/util/Size;->invalidSize(Ljava/lang/String;)Ljava/lang/NumberFormatException;

    move-result-object v2

    throw v2

    .line 120
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_31
    invoke-static {p0}, Landroid/util/Size;->invalidSize(Ljava/lang/String;)Ljava/lang/NumberFormatException;

    move-result-object v1

    throw v1

    .line 114
    .end local v0    # "sep_ix":I
    :cond_36
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "string must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 59
    const/4 v0, 0x0

    if-nez p1, :cond_4

    .line 60
    return v0

    .line 62
    :cond_4
    const/4 v1, 0x1

    if-ne p0, p1, :cond_8

    .line 63
    return v1

    .line 65
    :cond_8
    instance-of v2, p1, Landroid/util/Size;

    if-eqz v2, :cond_1d

    .line 66
    move-object v2, p1

    check-cast v2, Landroid/util/Size;

    .line 67
    .local v2, "other":Landroid/util/Size;
    iget v3, p0, Landroid/util/Size;->mWidth:I

    iget v4, v2, Landroid/util/Size;->mWidth:I

    if-ne v3, v4, :cond_1c

    iget v3, p0, Landroid/util/Size;->mHeight:I

    iget v4, v2, Landroid/util/Size;->mHeight:I

    if-ne v3, v4, :cond_1c

    const/4 v0, 0x1

    :cond_1c
    return v0

    .line 69
    .end local v2    # "other":Landroid/util/Size;
    :cond_1d
    return v0
.end method

.method public getHeight()I
    .registers 2

    .line 43
    iget v0, p0, Landroid/util/Size;->mHeight:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    .line 36
    iget v0, p0, Landroid/util/Size;->mWidth:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .line 135
    iget v0, p0, Landroid/util/Size;->mHeight:I

    iget v1, p0, Landroid/util/Size;->mWidth:I

    shl-int/lit8 v2, v1, 0x10

    ushr-int/lit8 v1, v1, 0x10

    or-int/2addr v1, v2

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Landroid/util/Size;->mWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/util/Size;->mHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
