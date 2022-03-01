Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 493764C98CC
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Mar 2022 00:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232166AbiCAXHs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Mar 2022 18:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiCAXHr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Mar 2022 18:07:47 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B9090FD8
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Mar 2022 15:07:05 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2dbf52cc4b9so19656177b3.18
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Mar 2022 15:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Gphaz8yRmmQrIgPvoKCS1z/czEcFXqMqBlv+2jwkLbU=;
        b=IUqL9eaFqp69S0y/rjgH5In3o9ObULAP5VkGmkE+p3N2nzchDtJIlQzt0Q1SH+Ghwm
         61ULqzEeEyk8qAoAnPaByoOigrDmIpWCtI8nNLmSq9o2cQUjLnYGHMVkJEJYyPoCYdGT
         89sV8m+BKO1UQUlEQszbPzAKwztjXcXTcy933SW5M8l70MccjZjZAaDDiXaz0InG/jBw
         4clW0PAYz055ErW5p9CTKgFcn4X0QwxcfDtcU/HYLzRPqTLS0bQcxfFIvVqeZ/21R/pU
         wus5/a38CMKNLPKDRqdxjV0GHRXrcB9M8V+ap1n/QEemtCpugus5A0agFcqz8Yza2ept
         hUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Gphaz8yRmmQrIgPvoKCS1z/czEcFXqMqBlv+2jwkLbU=;
        b=OipqJVIbbwS2AlV9m8DgvbWz/OK2lvO45UVk/3IJjZGAEqPYAW0vD0SuN3AUnPNJen
         sVJlGb1GsfQK9qhpoEFKGeUS5h8NqUJHS80qn3yMTsQvc88K0Lzee81fdSMiqf3Yiah5
         HUF7h1bGVc9Rpkp1YO2Y3l9WByUYB4Lzlt2Z8TkEO+BrHS3Jgn5MpX7V9ol5xR8J+5m2
         Wc3FOy6Wv3Ir0tZ602K2cxtgHdnOpzb0NXYE+XGB3I83rn8JRueHS11jrUl+kqTmyWpx
         WA9n/f3lWP74ykyxAiQ7JHurjNE7xCEp/X9Hy9eO0mnDkF2mjUgliRCJ08MJloYm8QSD
         4EnQ==
X-Gm-Message-State: AOAM531kGPgtraHr7maht+7+HCg9YmFmM5EX27J/A8qcqGZzqf2jffsZ
        1IwIXTGLrjCBiE5IjD8nHO1kc2k85mE=
X-Google-Smtp-Source: ABdhPJzRzFU6Sqba4/dwmyfmPshaGSeD1OBzy2Hy4vhU7KEbBICJzNC7A76mwOrqOppk477fe9wTUl+/gCk=
X-Received: from colette.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:306])
 (user=ctshao job=sendgmr) by 2002:a25:a342:0:b0:622:7818:7374 with SMTP id
 d60-20020a25a342000000b0062278187374mr26565207ybi.251.1646176024654; Tue, 01
 Mar 2022 15:07:04 -0800 (PST)
Date:   Tue,  1 Mar 2022 23:06:28 +0000
Message-Id: <20220301230629.1892828-1-ctshao@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
Subject: [PATCH] config: Using HOSTPKG_CONFIG prefix for pkg-config
From:   Chun-Tse Shao <ctshao@google.com>
To:     linux-kernel@vger.kernel.org
Cc:     ctshao@google.com, rostedt@goodmis.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-10.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In some parts, pkg-config does not use appropriate $BUILDROOT prefix.
The patch adds HOSTPKG_CONFIG prefix for pkg-config to fix the issue.

Signed-off-by: Chun-Tse Shao <ctshao@google.com>
---
 Makefile               | 3 ++-
 scripts/Makefile       | 4 ++--
 scripts/dtc/Makefile   | 6 +++---
 tools/objtool/Makefile | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index daeb5c88b50b..f6c5bef7e141 100644
--- a/Makefile
+++ b/Makefile
@@ -430,6 +430,7 @@ else
 HOSTCC	= gcc
 HOSTCXX	= g++
 endif
+HOSTPKG_CONFIG	= pkg-config
 
 export KBUILD_USERCFLAGS := -Wall -Wmissing-prototypes -Wstrict-prototypes \
 			      -O2 -fomit-frame-pointer -std=gnu89
@@ -525,7 +526,7 @@ KBUILD_LDFLAGS_MODULE :=
 KBUILD_LDFLAGS :=
 CLANG_FLAGS :=
 
-export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
+export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
diff --git a/scripts/Makefile b/scripts/Makefile
index ce5aa9030b74..f084f08ed176 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -14,8 +14,8 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTLDLIBS_sorttable = -lpthread
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
-HOSTCFLAGS_sign-file.o = $(shell pkg-config --cflags libcrypto 2> /dev/null)
-HOSTLDLIBS_sign-file = $(shell pkg-config --libs libcrypto 2> /dev/null || echo -lcrypto)
+HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
+HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
 
 ifdef CONFIG_UNWINDER_ORC
 ifeq ($(ARCH),x86_64)
diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 95aaf7431bff..743fc08827ea 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -18,7 +18,7 @@ fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
 
-ifeq ($(shell pkg-config --exists yaml-0.1 2>/dev/null && echo yes),)
+ifeq ($(shell $(HOSTPKG_CONFIG) --exists yaml-0.1 2>/dev/null && echo yes),)
 ifneq ($(CHECK_DT_BINDING)$(CHECK_DTBS),)
 $(error dtc needs libyaml for DT schema validation support. \
 	Install the necessary libyaml development package.)
@@ -27,9 +27,9 @@ HOST_EXTRACFLAGS += -DNO_YAML
 else
 dtc-objs	+= yamltree.o
 # To include <yaml.h> installed in a non-default path
-HOSTCFLAGS_yamltree.o := $(shell pkg-config --cflags yaml-0.1)
+HOSTCFLAGS_yamltree.o := $(shell $(HOSTPKG_CONFIG) --cflags yaml-0.1)
 # To link libyaml installed in a non-default path
-HOSTLDLIBS_dtc	:= $(shell pkg-config yaml-0.1 --libs)
+HOSTLDLIBS_dtc	:= $(shell $(HOSTPKG_CONFIG) yaml-0.1 --libs)
 endif
 
 # Generated files need one more search path to include headers in source tree
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 92ce4fce7bc7..549acc5859e9 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -19,8 +19,8 @@ LIBSUBCMD		= $(LIBSUBCMD_OUTPUT)libsubcmd.a
 OBJTOOL    := $(OUTPUT)objtool
 OBJTOOL_IN := $(OBJTOOL)-in.o
 
-LIBELF_FLAGS := $(shell pkg-config libelf --cflags 2>/dev/null)
-LIBELF_LIBS  := $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
+LIBELF_FLAGS := $(shell $(HOSTPKG_CONFIG) libelf --cflags 2>/dev/null)
+LIBELF_LIBS  := $(shell $(HOSTPKG_CONFIG) libelf --libs 2>/dev/null || echo -lelf)
 
 all: $(OBJTOOL)
 
-- 
2.35.1.574.g5d30c73bfb-goog

