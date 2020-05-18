Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780771D7DA9
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2020 18:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbgERQBB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 May 2020 12:01:01 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37417 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727006AbgERQBB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 May 2020 12:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589817659;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uGfWaxhY+jU5M2XGBqXdmB1wFIx1369hpMAG9rZmmys=;
        b=X+1avSNLUE8YRAkfGKF/iQbVTE1uDk2wyFlzylAWi20PRx46Wyz3gdlRFvx/HanOltlAhJ
        AuCrcD5D5pRe3Wy+uEA1SozfaMqmyBoUKF0R+02lcrRrf4tZqt/j0dI7mB9e6i5ICigeG/
        TOgYxAy4L9SSV9Alsg/YiCXFtuvr+do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-HK4e_NAUO26FMqQqHNcGgg-1; Mon, 18 May 2020 12:00:56 -0400
X-MC-Unique: HK4e_NAUO26FMqQqHNcGgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 759A9835BC4;
        Mon, 18 May 2020 16:00:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com [10.10.112.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D36507958F;
        Mon, 18 May 2020 16:00:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20200518145723.65b89375@canb.auug.org.au>
References: <20200518145723.65b89375@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     dhowells@redhat.com, torvalds@linux-foundation.org,
        linux-kbuild@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: How should we handle a bool depending on a tristate?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <968393.1589817650.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Mon, 18 May 2020 17:00:50 +0100
Message-ID: <968394.1589817650@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the keys tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> =

> x86_64-linux-gnu-ld: security/keys/big_key.o: in function `big_key_read'=
:
> big_key.c:(.text+0x562): undefined reference to `chacha20poly1305_decryp=
t'
> x86_64-linux-gnu-ld: security/keys/big_key.o: in function `big_key_prepa=
rse':
> big_key.c:(.text+0x825): undefined reference to `chacha20poly1305_encryp=
t'
> =

> Caused by commit
> =

>   e0a715753a88 ("security/keys: rewrite big_key crypto to use library in=
terface")
> =

> I have used the version from next-20200512 again tdoay.

Blech.  Yeah.  "depends on" doesn't work either.  The problem actually lie=
s
within the Kconfig framework.  It doesn't know how to handle a bool depend=
ing
on a tristate.

So the issue is that with Jason's patch, we now have:

	config BIG_KEYS
		bool "Large payload keys"
		depends on KEYS
		depends on TMPFS
		depends on CRYPTO_LIB_CHACHA20POLY1305

	...

	config CRYPTO_LIB_CHACHA20POLY1305
		tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
		depends on CRYPTO_ARCH_HAVE_LIB_CHACHA || !CRYPTO_ARCH_HAVE_LIB_CHACHA
		depends on CRYPTO_ARCH_HAVE_LIB_POLY1305 || !CRYPTO_ARCH_HAVE_LIB_POLY13=
05
		select CRYPTO_LIB_CHACHA
		select CRYPTO_LIB_POLY1305

But you're allowed to set CONFIG_CRYPTO_LIB_CHACHA20POLY1305=3Dm.

Using "select" instead can lead to warnings about circular dependencies an=
d,
in any case, doesn't propagate the selection up the tree.

Also, in this case, having BIG_KEYS select everything isn't practical as
CRYPTO_LIB_CHACHA20POLY1305 has a logical-XOR in its depends on.

I think one or more of the following things need to happen:

 (1) The configurator needs to give an error if it detects this.

 (2) The configurator needs to propagate select rootwards.

 (3) The configurator needs to propagate "=3Dy" rootwards over depends on,
     prohibiting "=3Dm".

 (4) The BIG_KEYS config needs to switch to a tristate.[*]

Do we have a preference?

David

[*] Note there have been situations where switching to a tristate isn't
    technically an option because the dependency target was required durin=
g
    boot (crypto used by module checking, for example), but we've just had=
 to
    work around it and hope whoever was configuring the kernel built
    everything in.

