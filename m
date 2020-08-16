Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D499724578A
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Aug 2020 14:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgHPMOY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Aug 2020 08:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgHPMOQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Aug 2020 08:14:16 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8446AC061786
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Aug 2020 05:14:16 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id b22so12398709oic.8
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Aug 2020 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc;
        bh=dePSLKsu+YCWcQIX7wvlYCR7MFq4XN12gBiIPCD2giI=;
        b=tVKZPu4RGZCM733zT3krVxSaJ/kBBLGHF54lzQH9Bt2FEsQJ46AW0UXtBFgzUhLFL0
         RroznuIjAtMTbMcqrJoJ2dSuSGD9CBrAVjAHnCUUUGin7sUgvQm2qZjYcqx8Ac5kG1qh
         kAPo8Nke8hzqXcGgl+SkdBDNfkTcO8ieR6uqMI0laOMvXaB9a8tyYAjGsDm9lPHpB5Xg
         ciaYGDzUMGz/vTrEO2Ntq0tV4flXCIzV1eNeN4+u5Y2n38wgLqcx0Sfvo3xC77AQtzTV
         dZk1Hp00Zaj2Zj2bNmjxMQJ9CUQk8YuBnoWYToSpQeZycsmyPA/JhEmFLpWqWWvyfJay
         IWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc;
        bh=dePSLKsu+YCWcQIX7wvlYCR7MFq4XN12gBiIPCD2giI=;
        b=pWUvInGtz9268lmUAN//4pUaYPuPGCNeLTt2eZ6/wTcdI/2vtd9MQOICrYPb7FvwDr
         8Apj2pnq+IcLgG18F+PpT6tuMRjTdKuvezr4vksJEx+VunvE+rSMy8kcvDMzYDebtRZB
         o5s4pR5CANOxYb8tv2c+Xo1Ds2sFkzWzlVljEzqlmDGLJv/fdbrInW23WWwi16u1Z3mv
         T0h0axVnGOSdlB++6uPo0tb394PFF05iqoYNnjj0TGb8zzFum5CCyt1F8QViOkhYoyWK
         a6PGCqZ9lgpNYbFni34tzyTqyxgF5NmymSEVCvngz+cC9g8PWpMY5+X/PPQI9kuhjmAQ
         etBQ==
X-Gm-Message-State: AOAM530UnjARnC54Atu3GeS5dsGhTtPKmVN3Z7aY5gIVgOxSKzrwP5eM
        BYoPot+lL1ZzyFdv0sg4yMk7ySdQj0yMy8QlsOU=
X-Google-Smtp-Source: ABdhPJyhqzxAkY+SdMO6hzC8zvEmTamAcDzA4anBm6gwobGMn5WpKkk/tiWSRxjOKFkgJKoudG+4o0Wc5+nv4cGeDjU=
X-Received: by 2002:a05:6808:311:: with SMTP id i17mr6903127oie.72.1597580055929;
 Sun, 16 Aug 2020 05:14:15 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 16 Aug 2020 14:14:04 +0200
Message-ID: <CA+icZUV85LS08Y2qJ-mheecCrzZmCTV4B5x9kh=BGCUzQVOKaA@mail.gmail.com>
Subject: Introduce CONFIG_DEBUG_INFO_AS_DWARF2 and CONFIG_DEBUG_INFO_AS_DWARF4
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

I wondered why my generated linux-image-db Debian packages were so big
when I use GCC toolchain instead of LLVM toolchain.

It turned out I mixed both...

   KBUILD_AFLAGS += -Wa,-gdwarf-2

...together with...

   DEBUG_CFLAGS += -gdwarf-4

...when CONFIG_DEBUG_INFO_DWARF4=y is set.

So I hacked up something like the following to prevent this:

diff --git a/Makefile b/Makefile
index 24a4c1b97bb0..e7a8e47b0e34 100644
--- a/Makefile
+++ b/Makefile
@@ -815,7 +815,11 @@ DEBUG_CFLAGS       += -gsplit-dwarf
 else
 DEBUG_CFLAGS   += -g
 endif
+ifdef CONFIG_DEBUG_INFO_AS_DWARF2
 KBUILD_AFLAGS  += -Wa,-gdwarf-2
+else ifdef CONFIG_DEBUG_INFO_AS_DWARF4
+KBUILD_AFLAGS  += -Wa,-gdwarf-4
+endif
 endif
 ifdef CONFIG_DEBUG_INFO_DWARF4
 DEBUG_CFLAGS   += -gdwarf-4
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ad9210d70a1..9f11fc71462c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -257,10 +257,23 @@ config DEBUG_INFO_SPLIT
          to know about the .dwo files and include them.
          Incompatible with older versions of ccache.

+config DEBUG_INFO_AS_DWARF2
+       bool "Use DWARF-2 assembler option with debuginfo"
+       depends on $(cc-option,-Wa$(comma)-gdwarf-2)
+       help
+         Set DWARF-2 assembler option with debuginfo
+
+config DEBUG_INFO_AS_DWARF4
+       bool "Use DWARF-4 assembler option with debuginfo"
+       depends on $(cc-option,-Wa$(comma)-gdwarf-4)
+       help
+         Set DWARF-4 assembler option with debuginfo
+
 config DEBUG_INFO_DWARF4
        bool "Generate dwarf4 debuginfo"
        depends on DEBUG_INFO
        depends on $(cc-option,-gdwarf-4)
+       select DEBUG_INFO_AS_DWARF4
        help
          Generate dwarf4 debug info. This requires recent versions
          of gcc and gdb. It makes the debug information larger.

NOTE: This is on top of Linux v5.8 vanilla.

NOTE-2: When building with LLVM toolchain v11.0.0-rc1+ and especially
with LLVM_IAS=1 (and LLVM=1) DWARF version 4 is a good choice.

For details see below links.

Thoughts?

Regards,
- Sedat -

[1] https://github.com/ClangBuiltLinux/linux/issues/1086
[2] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674503335
[3] https://github.com/ClangBuiltLinux/linux/issues/1086#issuecomment-674517876
