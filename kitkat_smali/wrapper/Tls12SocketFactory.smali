.class public Lwrapper/Tls12SocketFactory;
.super Ljavax/net/ssl/SSLSocketFactory;
.source "Tls12SocketFactory.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Tls12SocketFactory"

.field private static final TLS_VERSIONS:[Ljava/lang/String;


# instance fields
.field final delegate:Ljavax/net/ssl/SSLSocketFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 42
    const-string v0, "TLSv1.2"

    const-string v1, "TLSv1"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lwrapper/Tls12SocketFactory;->TLS_VERSIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljavax/net/ssl/SSLSocketFactory;)V
    .registers 2
    .param p1, "base"    # Ljavax/net/ssl/SSLSocketFactory;

    .line 46
    invoke-direct {p0}, Ljavax/net/ssl/SSLSocketFactory;-><init>()V

    .line 47
    iput-object p1, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    .line 48
    return-void
.end method

.method public static enableTls12OnPreLollipop(Lokhttp3/OkHttpClient$Builder;)V
    .registers 6
    .param p0, "client"    # Lokhttp3/OkHttpClient$Builder;

    .line 93
    const-string v0, "Tls12SocketFactory"

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_65

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x16

    if-ge v1, v2, :cond_65

    .line 96
    const/4 v1, 0x0

    :try_start_f
    invoke-static {v1}, Lwrapper/Tls12SocketFactory;->getInstance(Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    invoke-virtual {p0, v1}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Lokhttp3/OkHttpClient$Builder;
    :try_end_16
    .catch Ljava/lang/IllegalStateException; {:try_start_f .. :try_end_16} :catch_19
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_16} :catch_17

    .line 102
    goto :goto_32

    .line 114
    :catch_17
    move-exception v1

    goto :goto_60

    .line 97
    :catch_19
    move-exception v1

    .line 98
    .local v1, "e":Ljava/lang/IllegalStateException;
    :try_start_1a
    const-string v2, "sslSocketFactory() \u00bfmissing SSLContextImpl class?"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 99
    invoke-static {}, Lwrapper/Tls12SocketFactory;->getSystemTrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object v2

    .line 100
    .local v2, "trustManager":Ljavax/net/ssl/X509TrustManager;
    if-nez v2, :cond_2b

    new-instance v3, Lwrapper/SelfX509TrustManager;

    invoke-direct {v3}, Lwrapper/SelfX509TrustManager;-><init>()V

    move-object v2, v3

    .line 101
    :cond_2b
    invoke-static {v2}, Lwrapper/Tls12SocketFactory;->getInstance(Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Lokhttp3/OkHttpClient$Builder;->sslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;Ljavax/net/ssl/X509TrustManager;)Lokhttp3/OkHttpClient$Builder;

    .line 104
    .end local v1    # "e":Ljava/lang/IllegalStateException;
    .end local v2    # "trustManager":Ljavax/net/ssl/X509TrustManager;
    :goto_32
    new-instance v1, Lokhttp3/ConnectionSpec$Builder;

    sget-object v2, Lokhttp3/ConnectionSpec;->MODERN_TLS:Lokhttp3/ConnectionSpec;

    invoke-direct {v1, v2}, Lokhttp3/ConnectionSpec$Builder;-><init>(Lokhttp3/ConnectionSpec;)V

    const/4 v2, 0x1

    new-array v2, v2, [Lokhttp3/TlsVersion;

    const/4 v3, 0x0

    sget-object v4, Lokhttp3/TlsVersion;->TLS_1_2:Lokhttp3/TlsVersion;

    aput-object v4, v2, v3

    .line 105
    invoke-virtual {v1, v2}, Lokhttp3/ConnectionSpec$Builder;->tlsVersions([Lokhttp3/TlsVersion;)Lokhttp3/ConnectionSpec$Builder;

    move-result-object v1

    .line 106
    invoke-virtual {v1}, Lokhttp3/ConnectionSpec$Builder;->build()Lokhttp3/ConnectionSpec;

    move-result-object v1

    .line 108
    .local v1, "cs":Lokhttp3/ConnectionSpec;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .local v2, "specs":Ljava/util/List;, "Ljava/util/List<Lokhttp3/ConnectionSpec;>;"
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    sget-object v3, Lokhttp3/ConnectionSpec;->COMPATIBLE_TLS:Lokhttp3/ConnectionSpec;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    sget-object v3, Lokhttp3/ConnectionSpec;->CLEARTEXT:Lokhttp3/ConnectionSpec;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    invoke-virtual {p0, v2}, Lokhttp3/OkHttpClient$Builder;->connectionSpecs(Ljava/util/List;)Lokhttp3/OkHttpClient$Builder;
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_5e} :catch_17

    .line 116
    nop

    .end local v1    # "cs":Lokhttp3/ConnectionSpec;
    .end local v2    # "specs":Ljava/util/List;, "Ljava/util/List<Lokhttp3/ConnectionSpec;>;"
    goto :goto_65

    .line 115
    .local v1, "exc":Ljava/lang/Exception;
    :goto_60
    const-string v2, "Error while setting TLS 1.2"

    invoke-static {v0, v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 118
    .end local v1    # "exc":Ljava/lang/Exception;
    :cond_65
    :goto_65
    return-void
.end method

.method private static getInstance(Ljavax/net/ssl/TrustManager;)Ljavax/net/ssl/SSLSocketFactory;
    .registers 5
    .param p0, "tm"    # Ljavax/net/ssl/TrustManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/KeyManagementException;
        }
    .end annotation

    .line 121
    const-string v0, "TLSv1.2"

    invoke-static {v0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 122
    .local v0, "sc":Ljavax/net/ssl/SSLContext;
    const/4 v1, 0x0

    if-nez p0, :cond_b

    move-object v2, v1

    goto :goto_11

    :cond_b
    const/4 v2, 0x1

    new-array v2, v2, [Ljavax/net/ssl/TrustManager;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    .line 123
    .local v2, "tm_list":[Ljavax/net/ssl/TrustManager;
    :goto_11
    invoke-virtual {v0, v1, v2, v1}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 124
    new-instance v1, Lwrapper/Tls12SocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    invoke-direct {v1, v3}, Lwrapper/Tls12SocketFactory;-><init>(Ljavax/net/ssl/SSLSocketFactory;)V

    return-object v1
.end method

.method private static getSystemTrustManager()Ljavax/net/ssl/X509TrustManager;
    .registers 7

    .line 129
    const/4 v0, 0x0

    :try_start_1
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v1

    .line 130
    .local v1, "algorithm":Ljava/lang/String;
    invoke-static {v1}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v2

    .line 131
    .local v2, "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    move-object v3, v0

    check-cast v3, Ljava/security/KeyStore;

    invoke-virtual {v2, v3}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 132
    invoke-virtual {v2}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v3

    .line 133
    .local v3, "trustManagers":[Ljavax/net/ssl/TrustManager;
    array-length v4, v3

    const/4 v5, 0x1

    if-ne v4, v5, :cond_23

    const/4 v4, 0x0

    aget-object v5, v3, v4

    instance-of v5, v5, Ljavax/net/ssl/X509TrustManager;

    if-eqz v5, :cond_23

    .line 136
    aget-object v4, v3, v4

    check-cast v4, Ljavax/net/ssl/X509TrustManager;

    return-object v4

    .line 134
    :cond_23
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected default trust managers:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_3e
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_3e} :catch_40
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_3e} :catch_3e

    .line 137
    .end local v1    # "algorithm":Ljava/lang/String;
    .end local v2    # "trustManagerFactory":Ljavax/net/ssl/TrustManagerFactory;
    .end local v3    # "trustManagers":[Ljavax/net/ssl/TrustManager;
    :catch_3e
    move-exception v1

    goto :goto_41

    :catch_40
    move-exception v1

    .line 138
    .local v1, "e":Ljava/security/GeneralSecurityException;
    :goto_41
    const-string v2, "Tls12SocketFactory"

    const-string v3, "getSystemTrustManager() failed"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 139
    return-object v0
.end method

.method private patch(Ljava/net/Socket;)Ljava/net/Socket;
    .registers 4
    .param p1, "s"    # Ljava/net/Socket;

    .line 86
    instance-of v0, p1, Ljavax/net/ssl/SSLSocket;

    if-eqz v0, :cond_c

    .line 87
    move-object v0, p1

    check-cast v0, Ljavax/net/ssl/SSLSocket;

    sget-object v1, Lwrapper/Tls12SocketFactory;->TLS_VERSIONS:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljavax/net/ssl/SSLSocket;->setEnabledProtocols([Ljava/lang/String;)V

    .line 89
    :cond_c
    return-object p1
.end method


# virtual methods
.method public createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    .registers 4
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Lwrapper/Tls12SocketFactory;->patch(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "localHost"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 72
    iget-object v0, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Lwrapper/Tls12SocketFactory;->patch(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;
    .registers 4
    .param p1, "host"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Lwrapper/Tls12SocketFactory;->patch(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
    .registers 6
    .param p1, "address"    # Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "localAddress"    # Ljava/net/InetAddress;
    .param p4, "localPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Lwrapper/Tls12SocketFactory;->patch(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
    .registers 6
    .param p1, "s"    # Ljava/net/Socket;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I
    .param p4, "autoClose"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    iget-object v0, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;

    move-result-object v0

    invoke-direct {p0, v0}, Lwrapper/Tls12SocketFactory;->patch(Ljava/net/Socket;)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultCipherSuites()[Ljava/lang/String;
    .registers 2

    .line 52
    iget-object v0, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->getDefaultCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSupportedCipherSuites()[Ljava/lang/String;
    .registers 2

    .line 57
    iget-object v0, p0, Lwrapper/Tls12SocketFactory;->delegate:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0}, Ljavax/net/ssl/SSLSocketFactory;->getSupportedCipherSuites()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
