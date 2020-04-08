Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A509C1A1EB2
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 12:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgDHKWr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 06:22:47 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54122 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDHKWr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 06:22:47 -0400
Received: by mail-wm1-f66.google.com with SMTP id d77so4588913wmd.3;
        Wed, 08 Apr 2020 03:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=hFUWuQvfH3+RvUKxsWJsL4BSP/idRCjudICth1NHT3s=;
        b=AqIGPXCIgW1/5FB/ZbeAyzB79NjkwCut6ixK0yfS3fcsN1Y/9ngitz5v2e0tfZUv/T
         kM8SraoVcdy8x92oySI6CM8Fvgk1Y5fLQGBM9S3HLIrIKXjHv+EdYQHO2/4MpIZP6wh2
         UtkZKpV4YoEMzOPBJa3LtVF8C02RtZCKe/sjL3J8qJwficoCs4BuYBgw7TsiByXgWgMc
         XfjmYXaPuQ4rx1UE0QtYdntllX/OhMNtz/yELqxEwUls+j6I4M3UHnUWeeXBeCsnacGr
         /9vTX6xDhx0ItfsRCdpAVxyvthh627L+6rxT8/PCzRoRPRXEDUBcZl2EmWMvM+1u1q2o
         du1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=hFUWuQvfH3+RvUKxsWJsL4BSP/idRCjudICth1NHT3s=;
        b=IYfLycAZC3WTCsbb8g8y06jd3MsFVXk5T/IjbjMde0RdN3CU+uw7UfVvW9mGTAFrwH
         9phF8VzvavuL5+zeRxUoXy9wl8J1ZxO3f2Ecbc2cbDwwRBRMBliH5HnpGVWgZmpUwzd9
         uTFoeIhhkyC17rLVyRqFh8sZU/U2VCE+s75Ji0Y10xJaCnzbDpyiCWx4M+kKtSG2ySda
         jt3uMOfb2lMQsz+NVExK80s+nB6lq4WFphjPkGf2gf11f3rtIEu0RaSKYq02+GvnyRTZ
         2/CmOfaCpOllvagcovIkfqrV30qDG+S6ULThGupjtJVEjJ7jjI8DInryo2H5A3tb03l1
         0GZQ==
X-Gm-Message-State: AGi0Pub5XphOhsGANMf8RbOBv8ajtvbZUmKAqYeFtKRkWTHcTVILtCGk
        WFyiU9eyhS2QOLiaDmTf94h0GFk3/c3y6dWM910=
X-Google-Smtp-Source: APiQypIe9kUdMfWA55DLGYV342EE3+WfeHshekJxpSz8oqI50v7AM54oekxjyfH+929hbllKRIrZEUzMK5PrJDxY9NA=
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr3740892wmi.64.1586341365114;
 Wed, 08 Apr 2020 03:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook>
In-Reply-To: <202004020117.6E434C035@keescook>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 8 Apr 2020 12:22:33 +0200
Message-ID: <CA+icZUU_5St7Z31_vSb_57YSm=u9NCKW=MJ2gZUGXnQ8Wx9Mbg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kbuild@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
>
> When doing Clang builds of the kernel, it is possible to link with
> either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> discover this from a running kernel. Add the "$LD -v" output to
> /proc/version.
>

What about also having the linker and its version in the generated
linux-config file?

$ git diff
diff --git a/Kconfig b/Kconfig
index e10b3ee084d4..98fd210786e5 100644
--- a/Kconfig
+++ b/Kconfig
@@ -5,7 +5,7 @@
 #
 mainmenu "Linux/$(ARCH) $(KERNELVERSION) Kernel Configuration"

-comment "Compiler: $(CC_VERSION_TEXT)"
+comment "Compiler: $(CC_VERSION_TEXT) Linker: $(LD_VERSION_TEXT)"

 source "scripts/Kconfig.include"

diff --git a/Makefile b/Makefile
index 91b90ec1737c..42d6834b2255 100644
--- a/Makefile
+++ b/Makefile
@@ -553,6 +553,9 @@ endif
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
 CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)

+# LD_VERSION_TEXT is referenced from Kconfig (so it needs export).
+LD_VERSION_TEXT = $(shell $(LD) --version 2>/dev/null | head -n 1)
+
 ifdef config-build
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
@@ -562,7 +565,7 @@ ifdef config-build
 # KBUILD_DEFCONFIG may point out an alternative default configuration
 # used for 'make defconfig'
 include arch/$(SRCARCH)/Makefile
-export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
+export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT LD_VERSION_TEXT

 config: outputmakefile scripts_basic FORCE
        $(Q)$(MAKE) $(build)=scripts/kconfig $@

This generates here:

--- /boot/config-5.6.0-3-amd64-clang    2020-04-01 13:18:13.000000000 +0200
+++ .config     2020-04-08 12:16:43.477674201 +0200
@@ -1,10 +1,10 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Linux/x86 5.6.0 Kernel Configuration
+# Linux/x86 5.6.3 Kernel Configuration
 #

 #
-# Compiler: clang version 10.0.0-1
+# Compiler: clang version 10.0.0-2  Linker: LLD 10.0.0 (compatible
with GNU linkers)

- Sedat -
