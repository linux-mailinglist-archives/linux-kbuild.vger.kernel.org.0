Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5DE44CB191
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Mar 2022 22:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245421AbiCBVtB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Mar 2022 16:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240111AbiCBVtA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Mar 2022 16:49:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69503206E
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Mar 2022 13:48:15 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id i11so5130100lfu.3
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Mar 2022 13:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OmEHlpCk9+kT+4UG18motyIrJrBLGArcs0YNOn66F5M=;
        b=pdf0eNr+XEEhx6I7NBLOlzOXh63+Tgzj57OoXc2xEiLr52dDN2Iezc0x/79HwdlArL
         AcPgvTMday3W8ntpZQMzdo9lUHcaPlEjl/B6Xb9hJYZqLtiAK1IN25puSG2r4LbVR6S5
         kv2w6KiQuWddK6b30orD+iPZd5SFWrnaaHl7LW+arNb7MkCbjCFaTL05LJNKMKpz2rIx
         utYiKKPWQtXPFVIh8tbe/uOIB+X91M5E47jJ/A0oTBzLODRri8QD6or/+GeyrbulYhUU
         IqSEPbkEDhA/StOHjj8xs9elHvB2uXJgeRHStnGW2GMm8o260oE3K/8be+6+ISPmAmWF
         dITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OmEHlpCk9+kT+4UG18motyIrJrBLGArcs0YNOn66F5M=;
        b=xLKxc9DDTb/hyNVCmZUurr//bQr7+LNXsXIgqiVAqgEW+rsYnTQkyAywCU0XonnZCQ
         8I5ApTCTXH574SxdSioO6U0E83hpO/wxpRFmLfH903xXv49akGzPQkK1FlhKj6NHfXmr
         +7jSB9atrljttLxSIdbNcSczp2Mf6yv2zAH/BWaF9xlCE6kKzY9uJGuqxJo7mU/oVNWo
         LhxoEMvlvxpfCDioNcnH3Md2IW7UDB2j3H8cYXLbM+kDsw/WihVjqe0uU1acUI40hIzq
         Vk3LfqiVQDjM2cVlVVnikN/IaAaX5mbn6rj5fL5l/0ibZiVAAUMnMgKUMJb/a9ea6Q6J
         A83Q==
X-Gm-Message-State: AOAM530JKb3UBWx96TDoPdWaR/1hXGxdo0UUeOspBWsvBO5SQZmOweoP
        nhoA81P2PB0kzwC6F2ao8xf+kxWbLIQCyS/trFQm7g==
X-Google-Smtp-Source: ABdhPJyrQGT67+E2Q0B8IWs/wD6tmHwf9aFFsYLSMb5RypgEguFXNl8rPDiBdZE24YYwgR7k2i2T5YU4Gl16CkxuhVY=
X-Received: by 2002:a05:6512:490:b0:443:d65a:2bc8 with SMTP id
 v16-20020a056512049000b00443d65a2bc8mr19232653lfq.579.1646257693378; Wed, 02
 Mar 2022 13:48:13 -0800 (PST)
MIME-Version: 1.0
References: <20220302102705.15c32822@gandalf.local.home> <20220302193638.11034-1-ctshao@google.com>
In-Reply-To: <20220302193638.11034-1-ctshao@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Mar 2022 13:48:01 -0800
Message-ID: <CAKwvOdkWcu5ZPADGieb1Vb+kTbfHNzFAa3FXTWC98xXtzuLwqQ@mail.gmail.com>
Subject: Re: [PATCH v2] config: Allow kernel installation packaging to
 override pkg-config
To:     Chun-Tse Shao <ctshao@google.com>
Cc:     rostedt@goodmis.org, devicetree@vger.kernel.org,
        frowand.list@gmail.com, jpoimboe@redhat.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        peterz@infradead.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-18.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 2, 2022 at 11:36 AM Chun-Tse Shao <ctshao@google.com> wrote:
>
> Add HOSTPKG_CONFIG to allow tooling that builds the kernel to override
> what pkg-config and parameters are used.
>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>

I'm ok with this patch; a quick grep though shows a few more open
coded instances of pkg-config.  Should we fix those up, too? i.e.

certs/Makefile:92:HOSTCFLAGS_extract-cert.o = $(shell pkg-config
--cflags libcrypto 2> /dev/null)
certs/Makefile:93:HOSTLDLIBS_extract-cert = $(shell pkg-config --libs
libcrypto 2> /dev/null || echo -lcrypto)
scripts/kconfig/gconf-cfg.sh
tools/perf/Makefile.perf
tools/ in general


> ---
>  Makefile               | 3 ++-
>  scripts/Makefile       | 4 ++--
>  scripts/dtc/Makefile   | 6 +++---
>  tools/objtool/Makefile | 4 ++--
>  4 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index daeb5c88b50b..f6c5bef7e141 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -430,6 +430,7 @@ else
>  HOSTCC = gcc
>  HOSTCXX        = g++
>  endif
> +HOSTPKG_CONFIG = pkg-config
>
>  export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
>                               -O2 -fomit-frame-pointer -std=gnu89
> @@ -525,7 +526,7 @@ KBUILD_LDFLAGS_MODULE :=
>  KBUILD_LDFLAGS :=
>  CLANG_FLAGS :=
>
> -export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> +export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> diff --git a/scripts/Makefile b/scripts/Makefile
> index ce5aa9030b74..f084f08ed176 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -14,8 +14,8 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)   += insert-sys-cert
>  HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
>  HOSTLDLIBS_sorttable = -lpthread
>  HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
> -HOSTCFLAGS_sign-file.o = $(shell pkg-config --cflags libcrypto 2> /dev/null)
> -HOSTLDLIBS_sign-file = $(shell pkg-config --libs libcrypto 2> /dev/null || echo -lcrypto)
> +HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
> +HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
>
>  ifdef CONFIG_UNWINDER_ORC
>  ifeq ($(ARCH),x86_64)
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 95aaf7431bff..743fc08827ea 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -18,7 +18,7 @@ fdtoverlay-objs       := $(libfdt) fdtoverlay.o util.o
>  # Source files need to get at the userspace version of libfdt_env.h to compile
>  HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
>
> -ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
> +ifeq ($(shell $(HOSTPKG_CONFIG) --exists yaml-0.1 2>/dev/null && echo yes),)
>  ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
>  $(error dtc needs libyaml for DT schema validation support. \
>         Install the necessary libyaml development package.)
> @@ -27,9 +27,9 @@ HOST_EXTRACFLAGS += -DNO_YAML
>  else
>  dtc-objs       += yamltree.o
>  # To include <yaml.h> installed in a non-default path
> -HOSTCFLAGS_yamltree.o := $(shell pkg-config --cflags yaml-0.1)
> +HOSTCFLAGS_yamltree.o := $(shell $(HOSTPKG_CONFIG) --cflags yaml-0.1)
>  # To link libyaml installed in a non-default path
> -HOSTLDLIBS_dtc := $(shell pkg-config yaml-0.1 --libs)
> +HOSTLDLIBS_dtc := $(shell $(HOSTPKG_CONFIG) yaml-0.1 --libs)
>  endif
>
>  # Generated files need one more search path to include headers in source tree
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 92ce4fce7bc7..549acc5859e9 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -19,8 +19,8 @@ LIBSUBCMD             = $(LIBSUBCMD_OUTPUT)libsubcmd.a
>  OBJTOOL    := $(OUTPUT)objtool
>  OBJTOOL_IN := $(OBJTOOL)-in.o
>
> -LIBELF_FLAGS := $(shell pkg-config libelf --cflags 2>/dev/null)
> -LIBELF_LIBS  := $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
> +LIBELF_FLAGS := $(shell $(HOSTPKG_CONFIG) libelf --cflags 2>/dev/null)
> +LIBELF_LIBS  := $(shell $(HOSTPKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
>
>  all: $(OBJTOOL)
>
> --
> 2.35.1.574.g5d30c73bfb-goog
>


-- 
Thanks,
~Nick Desaulniers
