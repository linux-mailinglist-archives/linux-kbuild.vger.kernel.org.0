Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3989647D58A
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Dec 2021 17:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344064AbhLVQ7u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Dec 2021 11:59:50 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46802 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbhLVQ7u (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Dec 2021 11:59:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E5FF361B1C
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 16:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38B7C36AE5
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 16:59:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="KwRKitXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1640192387;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0943SKiYXbHRPNZHCyQlDG0CzU8SDpFSGsW7x/V0izw=;
        b=KwRKitXSDDgS7OnRiNLBsyCW27TtRCr90FU1JQLNNdvgcSS6JdB5hczhaTCvYTHDqVZ0Ck
        KY3h/O9nZ16B20zEchWGbYigEiY7wsvUMPSSJUJssAgNOlFfU9kslG2si0O5DVmAJI/A1d
        8R/jVvKELMFsX4OP5pGjKefB85sz3LY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1ca8c9a (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-kbuild@vger.kernel.org>;
        Wed, 22 Dec 2021 16:59:47 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id d10so8683182ybn.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 08:59:46 -0800 (PST)
X-Gm-Message-State: AOAM531Jj1zpjQ/gqOsKaq/bR+WAz1NGw+YS55W1dxqgxxZI/DBFiR6u
        uTcT/VvEoYkKTn7LFcHLupZXEmd5lGXpPGFQOas=
X-Google-Smtp-Source: ABdhPJxqdDVyHfaCjUfLvU1BRnB9CZppaZ2GIxLP3LbB54EC5jvMJ75kyIadZYuDURd+fckHhMVqRNrPQLy5/HGGUiM=
X-Received: by 2002:a25:3456:: with SMTP id b83mr5481133yba.121.1640192385791;
 Wed, 22 Dec 2021 08:59:45 -0800 (PST)
MIME-Version: 1.0
References: <20211222143628.618436-1-Jason@zx2c4.com>
In-Reply-To: <20211222143628.618436-1-Jason@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 22 Dec 2021 17:59:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9qJ-JgaJqfKCMeLkzv0ihaH_8ajUuxgCmdiOABke4t39A@mail.gmail.com>
Message-ID: <CAHmME9qJ-JgaJqfKCMeLkzv0ihaH_8ajUuxgCmdiOABke4t39A@mail.gmail.com>
Subject: Re: [PATCH RFC kbuild] lib/crypto: blake2s: include as built-in
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hey Masahiro,

On Wed, Dec 22, 2021 at 3:36 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Masahiro,
>
> This is a commit I'm working on as part of a change to the RNG, which
> got broken out into something standalone because it wound up being a bit
> more involved than originally conceived. With Ard's help, this is using
> weak symbols with the generic code in lib-y, but the only way we figured
> to actually include the lib.a file was via this unseemly
> KBUILD_VMLINUX_LIBS line below, which doesn't seem very okay. I tried
> adding `libs-y += lib/crypto/` to lib/Makefile, but it seemed like the
> build system ignored it. I figure there's probably a right way to do
> this, so thought I should send you this RFC to look at first.
> Alternatively, if the KBUILD_VMLINUX_LIBS trick is somehow okay, that'd
> be useful to know too.
>
> Thanks,
> Jason

I found something else that works. Here's the original (bad) idea:

> diff --git a/Makefile b/Makefile
> index d85f1ff79f5c..4b4a2bec020c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1120,6 +1120,7 @@ else
>  KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
>  endif
>  KBUILD_VMLINUX_OBJS += $(patsubst %/,%/built-in.a, $(drivers-y))
> +KBUILD_VMLINUX_LIBS += lib/crypto/lib.a
>
>  export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds

Here's a new idea:

diff --git a/Makefile b/Makefile
index d85f1ff79f5c..235a3b712d7b 100644
--- a/Makefile
+++ b/Makefile
@@ -700,6 +700,7 @@ export RETPOLINE_CFLAGS
export RETPOLINE_VDSO_CFLAGS

include $(srctree)/arch/$(SRCARCH)/Makefile
+libs-y += lib/crypto/

ifdef need-config
ifdef may-sync-config

diff --git a/lib/Makefile b/lib/Makefile
index 364c23f15578..bb57b2e466fa 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -139,7 +139,7 @@ endif
obj-$(CONFIG_DEBUG_INFO_REDUCED) += debug_info.o
CFLAGS_debug_info.o += $(call cc-option, -femit-struct-debug-detailed=any)

-obj-y += math/ crypto/
+obj-y += math/

obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
obj-$(CONFIG_GENERIC_PCI_IOMAP) += pci_iomap.o

Perhaps there's yet a third way that you see.

Thanks,
Jason
