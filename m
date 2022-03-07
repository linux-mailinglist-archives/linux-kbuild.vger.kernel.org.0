Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11B834D0B74
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Mar 2022 23:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbiCGWvO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Mar 2022 17:51:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiCGWvO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Mar 2022 17:51:14 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74BF6FA21
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Mar 2022 14:50:18 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id p8so15709182pfh.8
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Mar 2022 14:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=x8qeC2zI78QkV0iOc0kFVEM5kYnlER6W3oUFiIDGDEs=;
        b=i/TXCb+l8ln3qHT5i3SwHu9AX0kYz4HXLGYil7g4xo5apIXwSl1RCcdu8RFLgs50CS
         WrA/YN4kQrjL6ZD7eQ0mlFUb9CBvJA1k1CCaKHSHB/nQoxtglkcp2ZTf5xKj5w6rzJK1
         Zn1f1kSK3K+Qnuwj4DEqFmXiRr3mAiZGPh805CUon5fhh2BR+ebGa2QlZ1DzlWZFlLGd
         smskrm9GJu68f6IDlMCXUtiKDv2OUWDKKc5onWRb0dYlqCrx6XN/sQ0nj/YruO6Aaz3K
         jx0EoROxB8SzdxIdbJbs6ufhWZokrMRDYFz1vA2MTbxNmuEzNATQltUS3wc3bOEGEmuU
         LUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x8qeC2zI78QkV0iOc0kFVEM5kYnlER6W3oUFiIDGDEs=;
        b=3diCjAMOuuli3P/fhjZg0ufxFQI1aWM8zsU4nGrttvLGE4O1ifeDR/Z1XBTfXEUUKG
         4CVpDxOtaP/m5X33XlHchiSRMFtIOavf4v0PtMcpAkgxDcAfKL3HifrFh4GXvfJz6jQi
         um0jQLoiraC3SvaljIIjOxSCm3ZA9cLrN6XgLCJu0oeW/24iGko9z5exoPrtkCfhJl2e
         7yW7OW48HAJyFtd17qSgx9exYybkAPUkkCg1Jiq4GyJ6SxOi7dfJ36a0ZbU8hfQpIQax
         LtLPdRewTOV0rPSNgMqqfvSl8pPYm+nfUVZAfdCXvz4h4s7igHoVh2liFpztGH5Bwf7f
         c/Bg==
X-Gm-Message-State: AOAM533AgVw4CSgctFnejZB3DlG8UsMOwqC7AwgT1VB3ScQXSKDhx2qQ
        Ixq50rgwh7Sacz6e2flWC8m7fg==
X-Google-Smtp-Source: ABdhPJxMPWfLDRnDPpYHtkaWDUFwTjnzSm5l6I/7NlFTw+Jp8nXDbk7jK33/9GYdl/WAqL3un2CBvA==
X-Received: by 2002:a65:6741:0:b0:380:5b69:cbc5 with SMTP id c1-20020a656741000000b003805b69cbc5mr5094086pgu.89.1646693417769;
        Mon, 07 Mar 2022 14:50:17 -0800 (PST)
Received: from google.com (223.103.125.34.bc.googleusercontent.com. [34.125.103.223])
        by smtp.gmail.com with ESMTPSA id oj2-20020a17090b4d8200b001bef79ea006sm375344pjb.29.2022.03.07.14.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:50:17 -0800 (PST)
Date:   Mon, 7 Mar 2022 22:50:12 +0000
From:   Chun-Tse Shao <ctshao@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, rostedt@goodmis.org,
        nicolas@fjasle.eu, robh+dt@kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] config: Allow kernel installation packaging to
 override pkg-config
Message-ID: <YiaMJCHOOuujHwiK@google.com>
References: <20220306223016.2239094-1-ctshao@google.com>
 <CAKwvOdnmtRYnSx3VvG=PEnzpzWa8f=0bn1xDymjER5EShS2tmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnmtRYnSx3VvG=PEnzpzWa8f=0bn1xDymjER5EShS2tmw@mail.gmail.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 07, 2022 at 10:17:17AM -0800, Nick Desaulniers wrote:
> On Sun, Mar 6, 2022 at 2:39 PM Chun-Tse Shao <ctshao@google.com> wrote:
> >
> > Add HOSTPKG_CONFIG to allow tooling that builds the kernel to override
> > what pkg-config and parameters are used.
>
> Sorry, kind a late thought here for v4, but we don't seem to prefix
> many other host side tools with HOST_, i.e. LEX, YACC, AWK, PERL,
> PYTHON3, etc.  Maybe just having the variable identifier be simply
> PKGCONFIG rather than HOSTPKG_CONFIG then put it at the end of the
> list in the top level Makefile after ZSTD (i.e. the list of host
> tools)?  There's HOST_ prefixes when there's more than one tool
> involved (i.e. host compiler vs target compiler), but I suspect
> there's no such distinction for the existing uses of pkg-config?
>
Thanks for your suggestion, Nick! Yes I think it makes sense with PKGCONFIG
instead of HOSTPKG_CONFIG since there is only one tool involved. I will
work on it and submit a new patch.

-CT
> Otherwise, sorry for opening a bikeshed so late; this patch still LGTM.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> >
> > Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> > ---
> > Changes from v3: https://lore.kernel.org/all/20220304041449.939308-1-ctshao@google.com
> >   - Dereference variables using {} instead of () in shell scripts
> >   - Tested with make allmodconfig
> >
> > Changes from v2: https://lore.kernel.org/all/20220302193638.11034-1-ctshao@google.com/
> >   - Fix more open coded instance of pkg-config in scripts and certs
> >   - Tested with make allmodconfig
> >
> > Changes from v1: https://lore.kernel.org/all/20220301230629.1892828-1-ctshao@google.com/
> >   - Make the commit message more clearer.
> > ---
> >  Makefile                     |  3 ++-
> >  certs/Makefile               |  4 ++--
> >  scripts/Makefile             |  4 ++--
> >  scripts/dtc/Makefile         |  6 +++---
> >  scripts/kconfig/gconf-cfg.sh | 10 +++++-----
> >  scripts/kconfig/mconf-cfg.sh | 14 +++++++-------
> >  scripts/kconfig/nconf-cfg.sh | 14 +++++++-------
> >  scripts/kconfig/qconf-cfg.sh | 14 +++++++-------
> >  tools/objtool/Makefile       |  4 ++--
> >  9 files changed, 37 insertions(+), 36 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index daeb5c88b50b..f6c5bef7e141 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -430,6 +430,7 @@ else
> >  HOSTCC = gcc
> >  HOSTCXX        = g++
> >  endif
> > +HOSTPKG_CONFIG = pkg-config
> >
> >  export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
> >                               -O2 -fomit-frame-pointer -std=gnu89
> > @@ -525,7 +526,7 @@ KBUILD_LDFLAGS_MODULE :=
> >  KBUILD_LDFLAGS :=
> >  CLANG_FLAGS :=
> >
> > -export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> > +export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> >  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> >  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> >  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> > diff --git a/certs/Makefile b/certs/Makefile
> > index 3ea7fe60823f..fa540d14ef2d 100644
> > --- a/certs/Makefile
> > +++ b/certs/Makefile
> > @@ -89,5 +89,5 @@ targets += x509_revocation_list
> >
> >  hostprogs := extract-cert
> >
> > -HOSTCFLAGS_extract-cert.o = $(shell pkg-config --cflags libcrypto 2> /dev/null)
> > -HOSTLDLIBS_extract-cert = $(shell pkg-config --libs libcrypto 2> /dev/null || echo -lcrypto)
> > +HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
> > +HOSTLDLIBS_extract-cert = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
> > diff --git a/scripts/Makefile b/scripts/Makefile
> > index ce5aa9030b74..f084f08ed176 100644
> > --- a/scripts/Makefile
> > +++ b/scripts/Makefile
> > @@ -14,8 +14,8 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)   += insert-sys-cert
> >  HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
> >  HOSTLDLIBS_sorttable = -lpthread
> >  HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
> > -HOSTCFLAGS_sign-file.o = $(shell pkg-config --cflags libcrypto 2> /dev/null)
> > -HOSTLDLIBS_sign-file = $(shell pkg-config --libs libcrypto 2> /dev/null || echo -lcrypto)
> > +HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
> > +HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
> >
> >  ifdef CONFIG_UNWINDER_ORC
> >  ifeq ($(ARCH),x86_64)
> > diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> > index 95aaf7431bff..743fc08827ea 100644
> > --- a/scripts/dtc/Makefile
> > +++ b/scripts/dtc/Makefile
> > @@ -18,7 +18,7 @@ fdtoverlay-objs       := $(libfdt) fdtoverlay.o util.o
> >  # Source files need to get at the userspace version of libfdt_env.h to compile
> >  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
> >
> > -ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
> > +ifeq ($(shell $(HOSTPKG_CONFIG) --exists yaml-0.1 2>/dev/null && echo yes),)
> >  ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
> >  $(error dtc needs libyaml for DT schema validation support. \
> >         Install the necessary libyaml development package.)
> > @@ -27,9 +27,9 @@ HOST_EXTRACFLAGS += -DNO_YAML
> >  else
> >  dtc-objs       += yamltree.o
> >  # To include <yaml.h> installed in a non-default path
> > -HOSTCFLAGS_yamltree.o := $(shell pkg-config --cflags yaml-0.1)
> > +HOSTCFLAGS_yamltree.o := $(shell $(HOSTPKG_CONFIG) --cflags yaml-0.1)
> >  # To link libyaml installed in a non-default path
> > -HOSTLDLIBS_dtc := $(shell pkg-config yaml-0.1 --libs)
> > +HOSTLDLIBS_dtc := $(shell $(HOSTPKG_CONFIG) yaml-0.1 --libs)
> >  endif
> >
> >  # Generated files need one more search path to include headers in source tree
> > diff --git a/scripts/kconfig/gconf-cfg.sh b/scripts/kconfig/gconf-cfg.sh
> > index 480ecd8b9f41..4da4e39dcb53 100755
> > --- a/scripts/kconfig/gconf-cfg.sh
> > +++ b/scripts/kconfig/gconf-cfg.sh
> > @@ -3,14 +3,14 @@
> >
> >  PKG="gtk+-2.0 gmodule-2.0 libglade-2.0"
> >
> > -if [ -z "$(command -v pkg-config)" ]; then
> > +if [ -z "$(command -v ${HOSTPKG_CONFIG})" ]; then
> >         echo >&2 "*"
> >         echo >&2 "* 'make gconfig' requires 'pkg-config'. Please install it."
> >         echo >&2 "*"
> >         exit 1
> >  fi
> >
> > -if ! pkg-config --exists $PKG; then
> > +if ! ${HOSTPKG_CONFIG} --exists $PKG; then
> >         echo >&2 "*"
> >         echo >&2 "* Unable to find the GTK+ installation. Please make sure that"
> >         echo >&2 "* the GTK+ 2.0 development package is correctly installed."
> > @@ -19,12 +19,12 @@ if ! pkg-config --exists $PKG; then
> >         exit 1
> >  fi
> >
> > -if ! pkg-config --atleast-version=2.0.0 gtk+-2.0; then
> > +if ! ${HOSTPKG_CONFIG} --atleast-version=2.0.0 gtk+-2.0; then
> >         echo >&2 "*"
> >         echo >&2 "* GTK+ is present but version >= 2.0.0 is required."
> >         echo >&2 "*"
> >         exit 1
> >  fi
> >
> > -echo cflags=\"$(pkg-config --cflags $PKG)\"
> > -echo libs=\"$(pkg-config --libs $PKG)\"
> > +echo cflags=\"$(${HOSTPKG_CONFIG} --cflags $PKG)\"
> > +echo libs=\"$(${HOSTPKG_CONFIG} --libs $PKG)\"
> > diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> > index b520e407a8eb..05837ed07fbd 100755
> > --- a/scripts/kconfig/mconf-cfg.sh
> > +++ b/scripts/kconfig/mconf-cfg.sh
> > @@ -4,16 +4,16 @@
> >  PKG="ncursesw"
> >  PKG2="ncurses"
> >
> > -if [ -n "$(command -v pkg-config)" ]; then
> > -       if pkg-config --exists $PKG; then
> > -               echo cflags=\"$(pkg-config --cflags $PKG)\"
> > -               echo libs=\"$(pkg-config --libs $PKG)\"
> > +if [ -n "$(command -v ${HOSTPKG_CONFIG})" ]; then
> > +       if ${HOSTPKG_CONFIG} --exists $PKG; then
> > +               echo cflags=\"$(${HOSTPKG_CONFIG} --cflags $PKG)\"
> > +               echo libs=\"$(${HOSTPKG_CONFIG} --libs $PKG)\"
> >                 exit 0
> >         fi
> >
> > -       if pkg-config --exists $PKG2; then
> > -               echo cflags=\"$(pkg-config --cflags $PKG2)\"
> > -               echo libs=\"$(pkg-config --libs $PKG2)\"
> > +       if ${HOSTPKG_CONFIG} --exists $PKG2; then
> > +               echo cflags=\"$(${HOSTPKG_CONFIG} --cflags $PKG2)\"
> > +               echo libs=\"$(${HOSTPKG_CONFIG} --libs $PKG2)\"
> >                 exit 0
> >         fi
> >  fi
> > diff --git a/scripts/kconfig/nconf-cfg.sh b/scripts/kconfig/nconf-cfg.sh
> > index c212255070c0..e8d8f12d93ac 100755
> > --- a/scripts/kconfig/nconf-cfg.sh
> > +++ b/scripts/kconfig/nconf-cfg.sh
> > @@ -4,16 +4,16 @@
> >  PKG="ncursesw menuw panelw"
> >  PKG2="ncurses menu panel"
> >
> > -if [ -n "$(command -v pkg-config)" ]; then
> > -       if pkg-config --exists $PKG; then
> > -               echo cflags=\"$(pkg-config --cflags $PKG)\"
> > -               echo libs=\"$(pkg-config --libs $PKG)\"
> > +if [ -n "$(command -v ${HOSTPKG_CONFIG})" ]; then
> > +       if ${HOSTPKG_CONFIG} --exists $PKG; then
> > +               echo cflags=\"$(${HOSTPKG_CONFIG} --cflags $PKG)\"
> > +               echo libs=\"$(${HOSTPKG_CONFIG} --libs $PKG)\"
> >                 exit 0
> >         fi
> >
> > -       if pkg-config --exists $PKG2; then
> > -               echo cflags=\"$(pkg-config --cflags $PKG2)\"
> > -               echo libs=\"$(pkg-config --libs $PKG2)\"
> > +       if ${HOSTPKG_CONFIG} --exists $PKG2; then
> > +               echo cflags=\"$(${HOSTPKG_CONFIG} --cflags $PKG2)\"
> > +               echo libs=\"$(${HOSTPKG_CONFIG} --libs $PKG2)\"
> >                 exit 0
> >         fi
> >  fi
> > diff --git a/scripts/kconfig/qconf-cfg.sh b/scripts/kconfig/qconf-cfg.sh
> > index fa564cd795b7..9b695e5cd9b3 100755
> > --- a/scripts/kconfig/qconf-cfg.sh
> > +++ b/scripts/kconfig/qconf-cfg.sh
> > @@ -3,22 +3,22 @@
> >
> >  PKG="Qt5Core Qt5Gui Qt5Widgets"
> >
> > -if [ -z "$(command -v pkg-config)" ]; then
> > +if [ -z "$(command -v ${HOSTPKG_CONFIG})" ]; then
> >         echo >&2 "*"
> > -       echo >&2 "* 'make xconfig' requires 'pkg-config'. Please install it."
> > +       echo >&2 "* 'make xconfig' requires '${HOSTPKG_CONFIG}'. Please install it."
> >         echo >&2 "*"
> >         exit 1
> >  fi
> >
> > -if pkg-config --exists $PKG; then
> > -       echo cflags=\"-std=c++11 -fPIC $(pkg-config --cflags $PKG)\"
> > -       echo libs=\"$(pkg-config --libs $PKG)\"
> > -       echo moc=\"$(pkg-config --variable=host_bins Qt5Core)/moc\"
> > +if ${HOSTPKG_CONFIG} --exists $PKG; then
> > +       echo cflags=\"-std=c++11 -fPIC $(${HOSTPKG_CONFIG} --cflags $PKG)\"
> > +       echo libs=\"$(${HOSTPKG_CONFIG} --libs $PKG)\"
> > +       echo moc=\"$(${HOSTPKG_CONFIG} --variable=host_bins Qt5Core)/moc\"
> >         exit 0
> >  fi
> >
> >  echo >&2 "*"
> > -echo >&2 "* Could not find Qt5 via pkg-config."
> > +echo >&2 "* Could not find Qt5 via ${HOSTPKG_CONFIG}."
> >  echo >&2 "* Please install Qt5 and make sure it's in PKG_CONFIG_PATH"
> >  echo >&2 "*"
> >  exit 1
> > diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> > index 92ce4fce7bc7..549acc5859e9 100644
> > --- a/tools/objtool/Makefile
> > +++ b/tools/objtool/Makefile
> > @@ -19,8 +19,8 @@ LIBSUBCMD             = $(LIBSUBCMD_OUTPUT)libsubcmd.a
> >  OBJTOOL    := $(OUTPUT)objtool
> >  OBJTOOL_IN := $(OBJTOOL)-in.o
> >
> > -LIBELF_FLAGS := $(shell pkg-config libelf --cflags 2>/dev/null)
> > -LIBELF_LIBS  := $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
> > +LIBELF_FLAGS := $(shell $(HOSTPKG_CONFIG) libelf --cflags 2>/dev/null)
> > +LIBELF_LIBS  := $(shell $(HOSTPKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
> >
> >  all: $(OBJTOOL)
> >
> > --
> > 2.35.1.616.g0bdcbb4464-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
