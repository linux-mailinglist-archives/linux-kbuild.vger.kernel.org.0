Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82D4F3B8F22
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Jul 2021 10:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbhGAIzD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Jul 2021 04:55:03 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:55451 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S235444AbhGAIzD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Jul 2021 04:55:03 -0400
X-UUID: 6c2bb18e6e534c00ad876bd29950ce95-20210701
X-UUID: 6c2bb18e6e534c00ad876bd29950ce95-20210701
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 873094388; Thu, 01 Jul 2021 16:52:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 16:52:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 16:52:29 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <nathan@kernel.org>
CC:     <clang-built-linux@googlegroups.com>, <keescook@chromium.org>,
        <lecopzer.chen@mediatek.com>, <linux-kbuild@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <masahiroy@kernel.org>,
        <michal.lkml@markovi.net>, <samitolvanen@google.com>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH 1/2] Kbuild: lto: add make-version macros
Date:   Thu, 1 Jul 2021 16:52:29 +0800
Message-ID: <20210701085229.32761-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fdcb8b80-00dd-dd59-1283-836736d4a773@kernel.org>
References: <fdcb8b80-00dd-dd59-1283-836736d4a773@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> Hi Lecopzer,
> 
> On 6/30/2021 5:14 AM, Lecopzer Chen wrote:
> > To check the GNU make version. Used by the LTO Kconfig.
> > 
> > LTO with MODVERSION will fail in generating correct CRC because
> > the makefile rule doesn't work for make with version 3.8X.[1]
> > 
> > Thus we need to check make version during selecting on LTO Kconfig.
> > The MAKE_VERSION_INT means MAKE_VERSION in canonical digits integer and
> > implemnted by imitating CLANG_VERSION.
> 
> implemented

Thanks!
> 
> > 
> > [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> > Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> > ---
> >   Makefile                |  2 +-
> >   init/Kconfig            |  4 ++++
> >   scripts/Kconfig.include |  3 +++
> >   scripts/make-version.sh | 13 +++++++++++++
> >   4 files changed, 21 insertions(+), 1 deletion(-)
> >   create mode 100755 scripts/make-version.sh
> > 
> > diff --git a/Makefile b/Makefile
> > index 88888fff4c62..2402745b2ba9 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -516,7 +516,7 @@ CLANG_FLAGS :=
> >   
> >   export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> >   export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> > -export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> > +export PERL PYTHON3 CHECK CHECKFLAGS MAKE MAKE_VERSION UTS_MACHINE HOSTCXX
> >   export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> >   export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> >   
> > diff --git a/init/Kconfig b/init/Kconfig
> > index a61c92066c2e..9f2b71fdf23e 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -83,6 +83,10 @@ config TOOLS_SUPPORT_RELR
> >   config CC_HAS_ASM_INLINE
> >   	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
> >   
> > +config MAKE_VERSION_INT
> 
> It might be cleaner to make this "config MAKE_VERSION". It will not 
> conflict with the builtin MAKE_VERSION because this is really 
> CONFIG_MAKE_VERSION, which is how MAKE_VERSION will be handled in Kconfig.

Okat, thanks, I'll try and fix it in patch v2.
> 
> > +	int
> > +	default $(make-version)
> > +
> >   config CONSTRUCTORS
> >   	bool
> >   
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index 0496efd6e117..f956953d0236 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -63,3 +63,6 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
> >   cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
> >   m32-flag := $(cc-option-bit,-m32)
> >   m64-flag := $(cc-option-bit,-m64)
> > +
> > +# Get the GNU make version with a canonical digit.
> > +make-version := $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))
> 
> It might be better for this to just be used directly by "config 
> MAKE_VERSION":
> 
> config MAKE_VERSION
> 	int
> 	default $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))

Sure, I'll fix in patch v2, thank you.

> 
> > diff --git a/scripts/make-version.sh b/scripts/make-version.sh
> > new file mode 100755
> > index 000000000000..ce5af96696cc
> > --- /dev/null
> > +++ b/scripts/make-version.sh
> > @@ -0,0 +1,13 @@
> > +#!/bin/sh
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Print the linker name and its version in a 5 or 6-digit form.
> > +
> > +set -e
> > +
> > +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> > +IFS=.
> > +set -- $1
> > +
> > +# If the 2nd or 3rd field is missing, fill it with a zero.
> > +echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> > 
