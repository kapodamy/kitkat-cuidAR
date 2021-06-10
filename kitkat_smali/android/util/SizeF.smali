.class public final Landroid/util/SizeF;
.super Ljava/lang/Object;
.source "SizeF.java"


# instance fields
.field private final mHeight:F

.field private final mWidth:F


# direct methods
.method public constructor <init>(FF)V
    .registers 7
    .param p1, "width"    # F
    .param p2, "height"    # F

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    const/high16 v1, -0x800000    # Float.NEGATIVE_INFINITY

    cmpl-float v2, p1, v1

    if-eqz v2, :cond_f

    cmpl-float v2, p1, v0

    if-nez v2, :cond_16

    :cond_f
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "width is infinite"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    .line 39
    :cond_16
    cmpl-float v1, p2, v1

    if-eqz v1, :cond_1e

    cmpl-float v0, p2, v0

    if-nez v0, :cond_25

    :cond_1e
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "height is infinite"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    .line 40
    :cond_25
    iput p1, p0, Landroid/util/SizeF;->mWidth:F

    .line 41
    iput p2, p0, Landroid/util/SizeF;->mHeight:F

    .line 42
    return-void
.end method

.method private static invalidSizeF(Ljava/lang/String;)Ljava/lang/NumberFormatException;
    .registers 4
    .param p0, "s"    # Ljava/lang/String;

    .line 92
    new-instance v0, Ljava/lang/NumberFormatException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid SizeF: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static parseSizeF(Ljava/lang/String;)Landroid/util/SizeF;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .line 126
    if-eqz p0, :cond_3c

    .line 127
    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 128
    .local v0, "sep_ix":I
    if-gez v0, :cond_10

    .line 129
    const/16 v1, 0x78

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 131
    :cond_10
    if-ltz v0, :cond_37

    .line 135
    :try_start_12
    new-instance v1, Landroid/util/SizeF;

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    add-int/lit8 v3, v0, 0x1

    .line 136
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/util/SizeF;-><init>(FF)V
    :try_end_2a
    .catch Ljava/lang/NumberFormatException; {:try_start_12 .. :try_end_2a} :catch_31
    .catch Ljava/lang/IllegalArgumentException; {:try_start_12 .. :try_end_2a} :catch_2b

    .line 135
    return-object v1

    .line 139
    :catch_2b
    move-exception v1

    .line 140
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    invoke-static {p0}, Landroid/util/SizeF;->invalidSizeF(Ljava/lang/String;)Ljava/lang/NumberFormatException;

    move-result-object v2

    throw v2

    .line 137
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_31
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-static {p0}, Landroid/util/SizeF;->invalidSizeF(Ljava/lang/String;)Ljava/lang/NumberFormatException;

    move-result-object v2

    throw v2

    .line 132
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_37
    invoke-static {p0}, Landroid/util/SizeF;->invalidSizeF(Ljava/lang/String;)Ljava/lang/NumberFormatException;

    move-result-object v1

    throw v1

    .line 126
    .end local v0    # "sep_ix":I
    :cond_3c
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "string must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .line 70
    const/4 v0, 0x0

    if-nez p1, :cond_4

    .line 71
    return v0

    .line 73
    :cond_4
    const/4 v1, 0x1

    if-ne p0, p1, :cond_8

    .line 74
    return v1

    .line 76
    :cond_8
    instance-of v2, p1, Landroid/util/SizeF;

    if-eqz v2, :cond_21

    .line 77
    move-object v2, p1

    check-cast v2, Landroid/util/SizeF;

    .line 78
    .local v2, "other":Landroid/util/SizeF;
    iget v3, p0, Landroid/util/SizeF;->mWidth:F

    iget v4, v2, Landroid/util/SizeF;->mWidth:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_20

    iget v3, p0, Landroid/util/SizeF;->mHeight:F

    iget v4, v2, Landroid/util/SizeF;->mHeight:F

    cmpl-float v3, v3, v4

    if-nez v3, :cond_20

    const/4 v0, 0x1

    :cond_20
    return v0

    .line 80
    .end local v2    # "other":Landroid/util/SizeF;
    :cond_21
    return v0
.end method

.method public getHeight()F
    .registers 2

    .line 55
    iget v0, p0, Landroid/util/SizeF;->mHeight:F

    return v0
.end method

.method public getWidth()F
    .registers 2

    .line 48
    iget v0, p0, Landroid/util/SizeF;->mWidth:F

    return v0
.end method

.method public hashCode()I
    .registers 3

    .line 148
    iget v0, p0, Landroid/util/SizeF;->mWidth:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    iget v1, p0, Landroid/util/SizeF;->mHeight:F

    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Landroid/util/SizeF;->mWidth:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/util/SizeF;->mHeight:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
