Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0943120EF
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Feb 2021 03:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhBGCer (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 21:34:47 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63615 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhBGCen (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 21:34:43 -0500
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 1172XUn8025107;
        Sun, 7 Feb 2021 11:33:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 1172XUn8025107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612665210;
        bh=Wsx9AjZ8nfSMi43+AlZogOVqS+tL0gpCUD7h/QNUJ/M=;
        h=From:Date:Subject:To:Cc:From;
        b=XzZ00G/mcr47bY71E3O39Djt6YEjhDDLpY0CVbR9Nziunb3beXu78MKuQjFoHMzDk
         vW0AyYtb9vNdrJ1Nyz4sG7pe8f95JKJP6L+Chjvh+1RX9dUYttPKSeIOYFJNoyTsV5
         La7sTFWFtYpP8r85frByjCQZK9Vy72NtqeFtVgmftWZNBJKbyaJX1LV5XsS8QaL5mj
         eiB16wXHlmZpqACGO5BTrTUz5yx+KeXmxMFRPsEDavigQycwF4eBEx3dmWsnAJpXCm
         YcPZzelELAFUJZTRiRbAB37i9kv3MLO6L+RZ9EBqA1uYS4ybKhb868rVu+c4hCtVHR
         1dQHxZwYJCopw==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id m6so7449547pfk.1;
        Sat, 06 Feb 2021 18:33:30 -0800 (PST)
X-Gm-Message-State: AOAM531PIWKtqiPehS126BtHt1DYKu7yKHO5ffVV2YE194wd+gBYSU77
        1rw7i3wPtpTtY1ZOVbq8dWJnY+QiV6OSlOal7Bw=
X-Google-Smtp-Source: ABdhPJwQOBxrbyVC3jCZJxaWVnN/ukJqTQUeOdznL0JUiTI37q5X9BTw/KPLSLp3feqCm7ifpZJhGco9MBuMb7shfRE=
X-Received: by 2002:aa7:8602:0:b029:1bb:4dfd:92fc with SMTP id
 p2-20020aa786020000b02901bb4dfd92fcmr12018363pfn.63.1612665209611; Sat, 06
 Feb 2021 18:33:29 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 7 Feb 2021 11:32:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsGyFpJcXYoeH7_vAzsw+9K1w0tDdHN=vxKDO+a-v70A@mail.gmail.com>
Message-ID: <CAK7LNAQsGyFpJcXYoeH7_vAzsw+9K1w0tDdHN=vxKDO+a-v70A@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.11-rc7
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks.






The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.11-2

for you to fetch changes up to efe6e3068067212b85c2d0474b5ee3b2d0c7adab:

  kallsyms: fix nonconverging kallsyms table with lld (2021-02-05
17:53:28 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.11 (2nd)

 - Use the 'python3' command to invoke python scripts because some
   distributions do not provide the 'python' command any more.

 - Clean-up and update documents

 - Use pkg-config to search libcrypto

 - Fix duplicated debug flags

 - Ignore some more stubs in scripts/kallsyms.c

----------------------------------------------------------------
Andy Shevchenko (1):
      scripts: switch explicitly to Python 3

Arnd Bergmann (1):
      kallsyms: fix nonconverging kallsyms table with lld

Enrico Weigelt, metux IT consult (1):
      kconfig: mconf: fix HOSTCC call

Masahiro Yamada (6):
      kbuild: simplify GCC_PLUGINS enablement in dummy-tools/gcc
      doc: gcc-plugins: update gcc-plugins.rst
      Revert "checkpatch: add check for keyword 'boolean' in Kconfig
definitions"
      kbuild: remove PYTHON variable
      scripts/clang-tools: switch explicitly to Python 3
      kbuild: fix duplicated flags in DEBUG_CFLAGS

Nathan Chancellor (1):
      Documentation/llvm: Add a section about supported architectures

Robert Karszniewicz (1):
      Documentation/Kbuild: Remove references to gcc-plugin.sh

Rolf Eike Beer (1):
      scripts: use pkg-config to locate libcrypto

 Documentation/Makefile                      |  2 +-
 Documentation/kbuild/gcc-plugins.rst        | 47
+++++++++++++++++---------------------
 Documentation/kbuild/llvm.rst               | 44
+++++++++++++++++++++++++++++++++++
 Documentation/kbuild/makefiles.rst          |  2 +-
 Makefile                                    |  7 +++---
 arch/ia64/Makefile                          |  2 +-
 arch/ia64/scripts/unwcheck.py               |  2 +-
 scripts/Makefile                            |  8 +++++--
 scripts/bloat-o-meter                       |  2 +-
 scripts/checkpatch.pl                       |  7 ------
 scripts/clang-tools/gen_compile_commands.py |  2 +-
 scripts/clang-tools/run-clang-tools.py      |  2 +-
 scripts/diffconfig                          |  2 +-
 scripts/dummy-tools/gcc                     | 10 +++-----
 scripts/jobserver-exec                      |  2 +-
 scripts/kallsyms.c                          |  6 +++++
 scripts/kconfig/mconf-cfg.sh                |  2 +-
 17 files changed, 94 insertions(+), 55 deletions(-)


--
Best Regards
Masahiro Yamada
