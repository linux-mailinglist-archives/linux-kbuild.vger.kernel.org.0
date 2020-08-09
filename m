Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F8D23FF50
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Aug 2020 18:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgHIQpV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 9 Aug 2020 12:45:21 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57832 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgHIQpS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Aug 2020 12:45:18 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 079GixTM028732;
        Mon, 10 Aug 2020 01:45:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 079GixTM028732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596991500;
        bh=4/Wuc/SZmcBLjxjCab/4kWn1GAKRas6rkaBR2EHWo20=;
        h=From:Date:Subject:To:Cc:From;
        b=fXe5iqgEsZZNZOomxBIqwTx2ZpqZ0c2DwWZO7dBnUdO4hPRH1OPigz3cAVRNurY8y
         clfvDuhM0ntIqNCs8JfNqTiH8Vu+qbGDLW8h2WnThIu8z5Avqg6Ufs48strU48F+W/
         FOeBZJNr+WTA2nrKooBvjvJJQqKxLHBD8CiKAiJyHR9bA6NTlTcYY7w1aFDlWcnyCP
         nlCBMJF3KhMjdMaSdXBgVv972N63E0HG0ZTmg06sJtiNZsXr4CMyiixzt+K6ppGhPT
         Fn9v5tDeXxYQKTZc/JKO51ExqbbahqHAmnQMUf0DJzAwWVS5AauvQnKgvObzuKuuKP
         5RKrp2J4TuzCg==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id i129so3129589vsi.3;
        Sun, 09 Aug 2020 09:45:00 -0700 (PDT)
X-Gm-Message-State: AOAM530xo3yOb+t5ZZFMO/C1Hb4t9M/AlTNzyFJONdlImQp7tAbyoMdv
        hwKsRI/6btemzSMTXKbeBu7sGCGwfhKWIg9JO4Q=
X-Google-Smtp-Source: ABdhPJzmegxrhBUJkpqQlxlRB6LMHJWnb2qh+gXiiLgEY5iHTAm8kJYLhuDU2AlNZBxL8OXAxsDf5A54WI/UKy740Ac=
X-Received: by 2002:a05:6102:2247:: with SMTP id e7mr16099231vsb.181.1596991498725;
 Sun, 09 Aug 2020 09:44:58 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 10 Aug 2020 01:44:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMCg0vPjZL0o-sFr+vMu17-nFcV4v4pbLazLK8iTSQWQ@mail.gmail.com>
Message-ID: <CAK7LNARMCg0vPjZL0o-sFr+vMu17-nFcV4v4pbLazLK8iTSQWQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.9-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.9-rc1
Thanks.


The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.9

for you to fetch changes up to 132305b3b474a85152302ceda4551384cce3904e:

  kbuild: stop filtering out $(GCC_PLUGINS_CFLAGS) from cc-option base
(2020-08-10 01:32:59 +0900)

----------------------------------------------------------------
Kbuild updates for v5.9

 - run the checker (e.g. sparse) after the compiler

 - remove unneeded cc-option tests for old compiler flags

 - fix tar-pkg to install dtbs

 - introduce ccflags-remove-y and asflags-remove-y syntax

 - allow to trace functions in sub-directories of lib/

 - introduce hostprogs-always-y and userprogs-always-y syntax

 - various Makefile cleanups

----------------------------------------------------------------
Alexander A. Klimov (1):
      kbuild: Replace HTTP links with HTTPS ones

Domenico Andreoli (1):
      kbuild: buildtar: add dtbs support

Luc Van Oostenryck (1):
      kbuild: run the checker after the compiler

Masahiro Yamada (13):
      Revert "kbuild: Create directory for target DTB"
      kbuild: remove cc-option test of -fno-stack-protector
      kbuild: remove cc-option test of -ffreestanding
      powerpc/boot: add DTB to 'targets'
      kbuild: always create directories of targets
      kbuild: do not export LDFLAGS_vmlinux
      kbuild: introduce ccflags-remove-y and asflags-remove-y
      kbuild: trace functions in subdirectories of lib/
      kbuild: move host .so build rules to scripts/gcc-plugins/Makefile
      kbuild: sort hostprogs before passing it to ifneq
      kbuild: introduce hostprogs-always-y and userprogs-always-y
      kbuild: include scripts/Makefile.* only when relevant CONFIG is enabled
      kbuild: stop filtering out $(GCC_PLUGINS_CFLAGS) from cc-option base

 Documentation/kbuild/Kconfig.recursion-issue-02 |  2 +-
 Documentation/kbuild/kconfig-language.rst       | 18 +++++++-------
 Documentation/kbuild/llvm.rst                   |  2 +-
 Documentation/kbuild/makefiles.rst              | 45
++++++++++++++++++++++++++++++++++-
 Makefile                                        | 26 ++++++++++++---------
 arch/Kconfig                                    |  3 ---
 arch/arm/boot/compressed/Makefile               |  9 ++-----
 arch/mips/vdso/Makefile                         |  3 +--
 arch/powerpc/boot/Makefile                      |  2 ++
 arch/powerpc/kernel/Makefile                    |  2 +-
 arch/powerpc/platforms/powermac/Makefile        |  2 +-
 arch/powerpc/xmon/Makefile                      |  3 +--
 arch/s390/Makefile                              |  2 +-
 arch/sh/boot/compressed/Makefile                |  5 +---
 arch/sparc/vdso/Makefile                        |  4 ++--
 arch/um/Makefile                                |  3 +--
 arch/x86/Makefile                               |  4 ++--
 arch/x86/boot/compressed/Makefile               |  4 ++--
 arch/x86/entry/vdso/Makefile                    |  4 ++--
 arch/x86/kernel/cpu/Makefile                    |  3 +--
 arch/x86/lib/Makefile                           |  2 +-
 arch/x86/mm/Makefile                            |  7 +++---
 arch/x86/power/Makefile                         |  3 +--
 arch/x86/purgatory/Makefile                     |  2 +-
 arch/x86/um/vdso/Makefile                       |  2 +-
 arch/x86/xen/Makefile                           |  5 ++--
 arch/xtensa/boot/boot-elf/Makefile              |  2 +-
 drivers/firmware/efi/libstub/Makefile           |  4 ++--
 drivers/xen/Makefile                            |  3 +--
 kernel/trace/Makefile                           |  4 ++--
 lib/Makefile                                    |  9 +++----
 lib/livepatch/Makefile                          |  4 ----
 mm/kasan/Makefile                               |  2 +-
 samples/auxdisplay/Makefile                     |  3 +--
 samples/binderfs/Makefile                       |  3 +--
 samples/connector/Makefile                      |  3 +--
 samples/hidraw/Makefile                         |  3 +--
 samples/mei/Makefile                            |  4 +---
 samples/pidfd/Makefile                          |  4 +---
 samples/seccomp/Makefile                        |  4 +---
 samples/timers/Makefile                         |  3 +--
 samples/uhid/Makefile                           |  3 +--
 samples/vfs/Makefile                            |  3 +--
 samples/watch_queue/Makefile                    |  3 +--
 samples/watchdog/Makefile                       |  3 +--
 scripts/Kbuild.include                          | 10 +++-----
 scripts/Makefile                                | 18 +++++++-------
 scripts/Makefile.build                          | 15 ++++++------
 scripts/Makefile.clean                          | 13 +++++++----
 scripts/Makefile.host                           | 40
+++++--------------------------
 scripts/Makefile.kcov                           |  4 ----
 scripts/Makefile.kcsan                          |  4 ----
 scripts/Makefile.lib                            | 28 +++++++++++++++-------
 scripts/Makefile.ubsan                          |  3 ---
 scripts/basic/Makefile                          |  3 +--
 scripts/dtc/Makefile                            |  5 ++--
 scripts/gcc-plugins/Makefile                    | 61
+++++++++++++++++++++++++++++++++++++++---------
 scripts/genksyms/Makefile                       |  3 +--
 scripts/link-vmlinux.sh                         |  4 ++++
 scripts/mod/Makefile                            |  4 ++--
 scripts/package/buildtar                        | 12 ++++++++++
 scripts/package/mkdebian                        |  2 +-
 scripts/package/mkspec                          |  2 +-
 scripts/selinux/genheaders/Makefile             |  4 +---
 scripts/selinux/mdp/Makefile                    |  3 +--
 65 files changed, 251 insertions(+), 221 deletions(-)


-- 
Best Regards
Masahiro Yamada
