Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2A964D0859
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Mar 2022 21:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241469AbiCGUch (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Mar 2022 15:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234979AbiCGUch (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Mar 2022 15:32:37 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D7A580D7;
        Mon,  7 Mar 2022 12:31:33 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.48.249]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MwQw1-1oHMkY04NZ-00sNLz; Mon, 07 Mar 2022 21:28:03 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id D43483C092; Mon,  7 Mar 2022 21:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1646684881; bh=2GqYEnWAhlFGnBFmpTswah2anL2T7B/Q0ZAYyhsx6A0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M44MLFcMyfLv78bMq4nudo3eEgAHXmp5wy+ssAkT/XW68kLUgEu8qjEw4O0aV9UBI
         nCLbPj9osDifGrA5tU3kT+C5M1I1X+EDAcshJHsyyvtUMnAYJYd7ygIw36FfZcPIDA
         5tXanKwkwxANTQi7l7YioRIXDnRIoiuO1LzBPK+o=
Date:   Mon, 7 Mar 2022 21:28:00 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Chun-Tse Shao <ctshao@google.com>
Cc:     rostedt@goodmis.org, ndesaulniers@google.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] config: Allow kernel installation packaging to
 override pkg-config
Message-ID: <YiZq0CMK2GUCkt4e@fjasle.eu>
References: <20220304041449.939308-1-ctshao@google.com>
 <YiPUp2KDmlnzv0MR@fjasle.eu>
 <YiU6qJ9EIspJfnto@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YiU6qJ9EIspJfnto@google.com>
X-Provags-ID: V03:K1:3P2vwG85fiWojFSYQ4ges4jlIKLOGEqkmB6t6R+hyAzfDnD7eqj
 xW9DiFnTQlAXfjVPCNtHuLm774iyTBXfyBiHeUyKuR+2hTYDdJ/vy3IHXWXtDizQcYamEIq
 KNemQV9Ln7FUF6rWFiwBuRE+eqmGHTAE9SqRFdtAM0EDCB+RU2z/eRL/StKaSq4h74IoqX+
 7pkL1ByS/o2fkaXTUqIaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pBgHgMzBdUY=:UMnwiUyJ5aE0RatGg/eXkP
 bKlhVbHcqGfrSiobw9L2qbPUhcTSj6GCnVIzq2Nix7avfurouC5k8WeOjg8iQXrFCzFjdvuIc
 /5KEIzUV85pctV9INrOFDbev9NE/PyCHcF+ThkuIv/OJ3sBLSQ5LqcdZDM/lUlcgIxGEwGIE0
 BxfBnYRT8jCW7Kx/y+4tqex30d8O0rjteKjRDGJ0730PGwiO4FCFyXJvMJeOOi28Ixv1pi3nv
 +wVCOWxo0wR44JUcC1viGERVQnB0GC8gzKOBpgLIshHt2IB8ZFLkNF//hT5HJUXOw4Gv2vkYW
 3GQE/mB41q1nRh2QzpGeoT+wok+HidZwn1iGeQV52LrmSK6pwjvpE2MqeoiHaajzP7U5u6tHI
 ZKf7jt09W4aW8ytcBJ4nwFEgKNVbO6PYWO42OSTvF9PQELhbNPUOMx2Hq5BvWLpFCc0lv3ApP
 8bz82ep0pjXHR8WmZk2UlvE4jJ+l+3kStw8zbwMmIisFwObdK+/TfaxHuMeiFjSYQtRJZNcBG
 jKHEwZ/459dNWUI8qIVHwQDZD4MdzNlT4ouyHY2dp+DVtbB5r0yADiOu4WouzbgdTiBEOVueg
 CXpr6LzcXkJLpIaoqDnfpBeNR7m5u22Ouq7hStrcrSkGxe3nfuHm24YyYSV3JNrutSzUNyZX9
 49vxpB4vUxzKJMZreyp7ns8JHo4Znq6aRtXmo1int58visRh/ruCBnWFy7aBMM8puNgk=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 06, 2022 at 10:50:16PM +0000 Chun-Tse Shao wrote:
> On Sat, Mar 05, 2022 at 10:22:47PM +0100, Nicolas Schier wrote:
> > On Fri, Mar 04, 2022 at 04:14:51AM +0000 Chun-Tse Shao wrote:
> > > [ Resending as a separate thread ]
> > >
> > > Add HOSTPKG_CONFIG to allow tooling that builds the kernel to override
> > > what pkg-config and parameters are used.
> > >
> > > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > > ---
> > > Changes from v2: https://lore.kernel.org/all/20220302193638.11034-1-ctshao@google.com/
> > >   - Fix more open coded instance of pkg-config in scripts and certs
> > >   - Tested with make allmodconfig
> > >
> > > Changes from v1: https://lore.kernel.org/all/20220301230629.1892828-1-ctshao@google.com/
> > >   - Make the commit message more clearer.
> > > ---
> > >
> > >  Makefile                     |  3 ++-
> > >  certs/Makefile               |  4 ++--
> > >  scripts/Makefile             |  4 ++--
> > >  scripts/dtc/Makefile         |  6 +++---
> > >  scripts/kconfig/gconf-cfg.sh | 10 +++++-----
> > >  scripts/kconfig/mconf-cfg.sh | 14 +++++++-------
> > >  scripts/kconfig/nconf-cfg.sh | 14 +++++++-------
> > >  scripts/kconfig/qconf-cfg.sh | 14 +++++++-------
> > >  tools/objtool/Makefile       |  4 ++--
> > >  9 files changed, 37 insertions(+), 36 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index daeb5c88b50b..f6c5bef7e141 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -430,6 +430,7 @@ else
> > >  HOSTCC	= gcc
> > >  HOSTCXX	= g++
> > >  endif
> > > +HOSTPKG_CONFIG	= pkg-config
> > >
> > >  export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> > >  			      -O2 -fomit-frame-pointer -std=gnu89
> > > @@ -525,7 +526,7 @@ KBUILD_LDFLAGS_MODULE :=
> > >  KBUILD_LDFLAGS :=
> > >  CLANG_FLAGS :=
> > >
> > > -export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> > > +export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> > >  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> > >  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> > >  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> > > diff --git a/certs/Makefile b/certs/Makefile
> > > index 3ea7fe60823f..fa540d14ef2d 100644
> > > --- a/certs/Makefile
> > > +++ b/certs/Makefile
> > > @@ -89,5 +89,5 @@ targets += x509_revocation_list
> > >
> > >  hostprogs := extract-cert
> > >
> > > -HOSTCFLAGS_extract-cert.o = $(shell pkg-config --cflags libcrypto 2> /dev/null)
> > > -HOSTLDLIBS_extract-cert = $(shell pkg-config --libs libcrypto 2> /dev/null || echo -lcrypto)
> > > +HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
> > > +HOSTLDLIBS_extract-cert = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
> > > diff --git a/scripts/Makefile b/scripts/Makefile
> > > index ce5aa9030b74..f084f08ed176 100644
> > > --- a/scripts/Makefile
> > > +++ b/scripts/Makefile
> > > @@ -14,8 +14,8 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
> > >  HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
> > >  HOSTLDLIBS_sorttable = -lpthread
> > >  HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
> > > -HOSTCFLAGS_sign-file.o = $(shell pkg-config --cflags libcrypto 2> /dev/null)
> > > -HOSTLDLIBS_sign-file = $(shell pkg-config --libs libcrypto 2> /dev/null || echo -lcrypto)
> > > +HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
> > > +HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
> > >
> > >  ifdef CONFIG_UNWINDER_ORC
> > >  ifeq ($(ARCH),x86_64)
> > > diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> > > index 95aaf7431bff..743fc08827ea 100644
> > > --- a/scripts/dtc/Makefile
> > > +++ b/scripts/dtc/Makefile
> > > @@ -18,7 +18,7 @@ fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
> > >  # Source files need to get at the userspace version of libfdt_env.h to compile
> > >  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
> > >
> > > -ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
> > > +ifeq ($(shell $(HOSTPKG_CONFIG) --exists yaml-0.1 2>/dev/null && echo yes),)
> > >  ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
> > >  $(error dtc needs libyaml for DT schema validation support. \
> > >  	Install the necessary libyaml development package.)
> > > @@ -27,9 +27,9 @@ HOST_EXTRACFLAGS += -DNO_YAML
> > >  else
> > >  dtc-objs	+= yamltree.o
> > >  # To include <yaml.h> installed in a non-default path
> > > -HOSTCFLAGS_yamltree.o := $(shell pkg-config --cflags yaml-0.1)
> > > +HOSTCFLAGS_yamltree.o := $(shell $(HOSTPKG_CONFIG) --cflags yaml-0.1)
> > >  # To link libyaml installed in a non-default path
> > > -HOSTLDLIBS_dtc	:= $(shell pkg-config yaml-0.1 --libs)
> > > +HOSTLDLIBS_dtc	:= $(shell $(HOSTPKG_CONFIG) yaml-0.1 --libs)
> > >  endif
> > >
> > >  # Generated files need one more search path to include headers in source tree
> > > diff --git a/scripts/kconfig/gconf-cfg.sh b/scripts/kconfig/gconf-cfg.sh
> > > index 480ecd8b9f41..267ef6012203 100755
> > > --- a/scripts/kconfig/gconf-cfg.sh
> > > +++ b/scripts/kconfig/gconf-cfg.sh
> > > @@ -3,14 +3,14 @@
> > >
> > >  PKG="gtk+-2.0 gmodule-2.0 libglade-2.0"
> > >
> > > -if [ -z "$(command -v pkg-config)" ]; then
> > > +if [ -z "$(command -v $(HOSTPKG_CONFIG))" ]; then
> >
> > Dereferencing variables in shell scripts has to be done by using "${var}" or
> > "$var".  "$(var)" starts a sub-shell and executes "var", which is not your
> > intention.  Thus, better try something like:
> >
> >     if [ -z "$(command -v "${HOSTPKG_CONFIG}")" ]; then
> >
> > (and all other shell script replacements in need to be revised, too.)
> >
> > Kind regards,
> > Nicolas
> 
> Thanks Nicolas! I submitted another patch with your suggestions:
> https://lore.kernel.org/all/20220306223016.2239094-1-ctshao@google.com/
> 
> A question: Would it be good if I also add {} for other variables (for exmaple: $PKG
> and $PKG2) in these scripts along with my change?
> 
> -CT

No, I would not recommend restyling the shell scripts within your patch.

Using braces for variable dereferencing helps the shell to determine the end of
the variable name, if it is followed by some non-control character; thus, such
a change alone will not make the changed shell scripts more robust.  Putting
dereferences inside of double qoutes helps to handle variables containing
multiple words.  But I think. this is a topic for a different patch set.

Kind regards,
Nicolas
