Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC8E3772DC
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 May 2021 18:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhEHQCg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 8 May 2021 12:02:36 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35066 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhEHQCf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 May 2021 12:02:35 -0400
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 148G1BfH012346;
        Sun, 9 May 2021 01:01:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 148G1BfH012346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620489672;
        bh=7FAXcHENEirgB4NEoX2IxqpESox0k/RH89TM9jyt5oc=;
        h=From:Date:Subject:To:Cc:From;
        b=TZ4A6ZOjOqOUGCiyeXeTS+OWPa0CvW3zyfjIRJLtJD73dUZmbHUS6BGw0OeEyQJJt
         AEvnOSX0ywQT//HujcWStEK2gpc4l+xBDzH+w3t3vfDdHOUtBylFqhQ3RL6BM7uWMK
         n9tfqHf7+KOhYyCAwBInhjxxDMfBkVAuAoJz9tzFGtVzJ7nHD6kSm3IKTju1wzGmf9
         o89erzBhE3IAj3KQi9F/sNp88LHBFy/PGdXUcuePA3FlkN7pO3sp5OHkYRX48TQZE3
         nCpZlpeGlwtGKUO0jIWBHUkkbQh3qOQxXwMw7X4G04aL2dw/43rloiIzRGrjzov6oj
         JaIKls/xOTLlw==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id h11so10293848pfn.0;
        Sat, 08 May 2021 09:01:11 -0700 (PDT)
X-Gm-Message-State: AOAM531vPj9e9jSHJn64JScQeWQM5+GBnusWCrXuHNEZ235pqNGKKhS4
        nD8TVQfF8yn5kdd7uPTTYDQRRBUj3US0YPXZxKY=
X-Google-Smtp-Source: ABdhPJx7D5sYrXl/lgP68Qxx8spg6pwoPqxLEf9nypX7gLdHhVdO5TdyZHPy09qASI674BVC0I6FENG2aUsldvuOAkQ=
X-Received: by 2002:aa7:99cb:0:b029:2b7:af1e:3b1 with SMTP id
 v11-20020aa799cb0000b02902b7af1e03b1mr682468pfi.76.1620489670879; Sat, 08 May
 2021 09:01:10 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 9 May 2021 01:00:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYmL1E9r7as1xGccKFUg0TiVMxe1jzDazfDO_V4rzDKA@mail.gmail.com>
Message-ID: <CAK7LNASYmL1E9r7as1xGccKFUg0TiVMxe1jzDazfDO_V4rzDKA@mail.gmail.com>
Subject: [GIT PULL] More Kbuild updates for v5.13-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull more Kbuild updates.
Thanks.


The following changes since commit 9f67672a817ec046f7554a885f0fe0d60e1bf99f:

  Merge tag 'ext4_for_linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4 (2021-04-30
15:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.13-2

for you to fetch changes up to 0ab1438bad43d95877f848b7df551bd431680270:

  linux/kconfig.h: replace IF_ENABLED() with PTR_IF() in
<linux/kernel.h> (2021-05-09 00:29:45 +0900)

----------------------------------------------------------------
Kbuild updates for v5.13 (2nd)

 - Convert sh and sparc to use generic shell scripts to generate the
   syscall headers

 - refactor .gitignore files

 - Update kernel/config_data.gz only when the content of the .config is
   really changed, which avoids the unneeded re-link of vmlinux

 - move "remove stale files" workarounds to scripts/remove-stale-files

 - suppress unused-but-set-variable warnings by default for Clang as well

 - fix locale setting LANG=C to LC_ALL=C

 - improve 'make distclean'

 - always keep intermediate objects from scripts/link-vmlinux.sh

 - move IF_ENABLED out of <linux/kconfig.h> to make it self-contained

 - misc cleanups

----------------------------------------------------------------
Andi Kleen (1):
      kbuild: Don't remove link-vmlinux temporary files on exit/signal

Masahiro Yamada (23):
      sh: syscalls: switch to generic syscalltbl.sh
      sh: syscalls: switch to generic syscallhdr.sh
      sparc: syscalls: switch to generic syscalltbl.sh
      sparc: syscalls: switch to generic syscallshdr.sh
      kbuild: add comment about why cmd_shipped uses 'cat'
      genksyms: fix stale comment
      usr/include: refactor .gitignore
      kernel/.gitgnore: remove stale timeconst.h and hz.bc
      .gitignore: move tags and TAGS close to other tag files
      .gitignore: ignore only top-level modules.builtin
      kbuild: update config_data.gz only when the content of .config is changed
      kbuild: add a script to remove stale generated files
      kbuild: replace LANG=C with LC_ALL=C
      .gitignore: prefix local generated files with a slash
      kbuild: remove ARCH=sh64 support from top Makefile
      arch: use cross_compiling to check whether it is a cross build or not
      kbuild: parameterize the .o part of suffix-search
      kbuild: refactor fdtoverlay rule
      kbuild: refactor modname-multi by using suffix-search
      kbuild: make distclean work against $(objtree) instead of $(srctree)
      kbuild: make distclean remove tag files in sub-directories
      kbuild: remove the unneeded comments for external module builds
      linux/kconfig.h: replace IF_ENABLED() with PTR_IF() in <linux/kernel.h>

Nathan Chancellor (1):
      Makefile: Move -Wno-unused-but-set-variable out of GCC only block

 .gitignore                                         |  8 ++++--
 Documentation/devicetree/bindings/.gitignore       |  4 +--
 Makefile                                           | 42
+++++++++------------------
 arch/.gitignore                                    |  4 +--
 arch/arm/boot/compressed/Makefile                  |  7 -----
 arch/m68k/Makefile                                 |  2 +-
 arch/mips/Makefile                                 |  2 +-
 arch/parisc/Makefile                               |  2 +-
 arch/powerpc/boot/wrapper                          |  2 +-
 arch/sh/Makefile                                   |  2 +-
 arch/sh/kernel/syscalls/Makefile                   | 14 +++------
 arch/sh/kernel/syscalls/syscallhdr.sh              | 36 -----------------------
 arch/sh/kernel/syscalls/syscalltbl.sh              | 32 ---------------------
 arch/sparc/include/asm/Kbuild                      |  1 -
 arch/sparc/kernel/syscalls/Makefile                | 30 ++++++-------------
 arch/sparc/kernel/syscalls/syscallhdr.sh           | 36 -----------------------
 arch/sparc/kernel/syscalls/syscalltbl.sh           | 36 -----------------------
 arch/sparc/kernel/systbls_32.S                     |  4 +--
 arch/sparc/kernel/systbls_64.S                     |  8 ++++--
 arch/xtensa/Makefile                               |  6 +---
 certs/.gitignore                                   |  4 +--
 drivers/memory/.gitignore                          |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c                  |  3 ++
 drivers/tty/vt/.gitignore                          |  6 ++--
 fs/unicode/.gitignore                              |  4 +--
 include/linux/kconfig.h                            |  6 ----
 include/linux/kernel.h                             |  2 ++
 kernel/.gitignore                                  |  5 ++--
 kernel/Makefile                                    |  9 ++++--
 lib/.gitignore                                     | 10 +++----
 samples/auxdisplay/.gitignore                      |  2 +-
 samples/binderfs/.gitignore                        |  3 +-
 samples/connector/.gitignore                       |  2 +-
 samples/hidraw/.gitignore                          |  2 +-
 samples/mei/.gitignore                             |  2 +-
 samples/nitro_enclaves/.gitignore                  |  2 +-
 samples/pidfd/.gitignore                           |  2 +-
 samples/seccomp/.gitignore                         |  8 +++---
 samples/timers/.gitignore                          |  2 +-
 samples/vfs/.gitignore                             |  4 +--
 samples/watch_queue/.gitignore                     |  3 +-
 samples/watchdog/.gitignore                        |  2 +-
 scripts/.gitignore                                 | 18 ++++++------
 scripts/Makefile.build                             |  2 +-
 scripts/Makefile.lib                               | 57
+++++++++++++++++++------------------
 scripts/basic/.gitignore                           |  2 +-
 scripts/dtc/.gitignore                             |  4 +--
 scripts/gcc-plugins/.gitignore                     |  2 +-
 scripts/genksyms/.gitignore                        |  2 +-
 scripts/genksyms/Makefile                          |  2 +-
 scripts/link-vmlinux.sh                            | 14 ---------
 scripts/mod/.gitignore                             |  8 +++---
 scripts/nsdeps                                     |  2 +-
 scripts/recordmcount.pl                            |  2 +-
 scripts/remove-stale-files                         | 31 ++++++++++++++++++++
 scripts/setlocalversion                            |  2 +-
 scripts/tags.sh                                    |  2 +-
 tools/testing/selftests/net/mptcp/mptcp_connect.sh |  2 +-
 usr/.gitignore                                     |  4 +--
 usr/gen_initramfs.sh                               |  2 +-
 usr/include/.gitignore                             |  4 +--
 61 files changed, 183 insertions(+), 342 deletions(-)
 delete mode 100644 arch/sh/kernel/syscalls/syscallhdr.sh
 delete mode 100644 arch/sh/kernel/syscalls/syscalltbl.sh
 delete mode 100644 arch/sparc/kernel/syscalls/syscallhdr.sh
 delete mode 100644 arch/sparc/kernel/syscalls/syscalltbl.sh
 create mode 100755 scripts/remove-stale-files


-- 
Best Regards
Masahiro Yamada
