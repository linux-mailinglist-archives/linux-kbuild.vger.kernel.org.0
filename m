Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E67D168BF6
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 03:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgBVCIH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 21:08:07 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36492 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbgBVCIH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 21:08:07 -0500
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01M27pq0019695;
        Sat, 22 Feb 2020 11:07:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01M27pq0019695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582337272;
        bh=TYeg4Bu2Cm4zg+SosHfJhXDl9NaBkIe9vTu10xXiyPY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=siBi6422Adl4HyJFo6ewKwOUC7vv5+/KDzMJ27mMmcDRzcp/pXJ9cJFZhP/MkfcwG
         ADTyFeI6bBNqEVcQ+fxVnsuJdRr86WSfv0CaOkj7oKh9unZ754Xs948LPk3vTjmy8O
         ZHCJ+eTaRZ3bPxVp2sSWWKZtwU3MbxzQzXY2qkpSFMNxTJiz9pKjZpEqRhHXOyT4Z7
         mUtrFUBKiX35d81vaYtzrata8Z3T7c/qYTTdX/1RdDyOvSW+hX8lj2gVyeGeFbpTlz
         TMRkI3QK8gsTsU4qpK9CrDU5vltT9uc5s7BsT8efaRsN3muLh+tkVAuBxOorB3xULL
         vmpLFciOtq7iw==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id l6so1372325uap.13;
        Fri, 21 Feb 2020 18:07:51 -0800 (PST)
X-Gm-Message-State: APjAAAWOjKhjRf4/GWkEtGsJ3NTpbSdtbZx96deCbe46u+x4OOTQLlOa
        xwpZe8jgQpWdNq07jddAspgOSu6Rn3kVtH5ByK4=
X-Google-Smtp-Source: APXvYqy64BDtpJM6tCLKq1UaIlD4WE9x1BFzkNuYwRDuIYfuA4OQm5/DVZnxw4VhIskXXReLLHCvVmI6Fe+cQGDuKCY=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr20800352uay.25.1582337270650;
 Fri, 21 Feb 2020 18:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca> <20200222003820.220854-1-alex_y_xu@yahoo.ca>
In-Reply-To: <20200222003820.220854-1-alex_y_xu@yahoo.ca>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 Feb 2020 11:07:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNARNEu2gVBVDpRtbha_n=RWWfcQu57LtO=CbLBXLU9Ds-g@mail.gmail.com>
Message-ID: <CAK7LNARNEu2gVBVDpRtbha_n=RWWfcQu57LtO=CbLBXLU9Ds-g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 22, 2020 at 9:40 AM Alex Xu (Hello71) <alex_y_xu@yahoo.ca> wrote:
>
> -pipe reduces unnecessary disk wear for systems where /tmp is not a
> tmpfs, slightly increases compilation speed, and avoids leaving behind
> files when gcc crashes.
>
> According to the gcc manual, "this fails to work on some systems where
> the assembler is unable to read from a pipe; but the GNU assembler has
> no trouble". We already require GNU ld on all platforms, so this is not
> an additional dependency. LLVM as also supports pipes.
>
> -pipe has always been used for most architectures, this change
> standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
> affected.
>
> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

<snip>

> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 20e9ab6cc521..b6a2f553771c 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
>  CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
>  endif
>
> -cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
> +cflags-y       += -fno-common -fno-builtin -mmedium-calls -D__linux__
>  cflags-$(CONFIG_ISA_ARCOMPACT) += -mA7
>  cflags-$(CONFIG_ISA_ARCV2)     += -mcpu=hs38
>
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index db857d07114f..7711467e0797 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -21,7 +21,6 @@ KBUILD_LDS_MODULE     += $(srctree)/arch/arm/kernel/module.lds
>  endif
>
>  GZFLAGS                :=-9
> -#KBUILD_CFLAGS +=-pipe


This was commented out by a very old commit,
which is available in the historical git tree.

https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=ce20ed858a20f6f04de475cae79e40d3697f4776

But, I could not parse the reason from the commit message.
Russell, do you remember why?


If arch maintainers are fine with this change,
I can pick up it.

Thanks.



--
Best Regards

Masahiro Yamada
