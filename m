Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDBE446E5F
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Nov 2021 15:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234417AbhKFOtb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Nov 2021 10:49:31 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:43184 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbhKFOtb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Nov 2021 10:49:31 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 1A6EkLhQ029762;
        Sat, 6 Nov 2021 23:46:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 1A6EkLhQ029762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636209982;
        bh=EFEnwvx3tsRer3leh74zzdTZB8FG8KrRilIkmekbhwQ=;
        h=From:Date:Subject:To:Cc:From;
        b=LxQNNa6R+d3qdYC8TfTIJLomlUVbifSxsqvhKJ75roOmQkCj4smY53NArFHupuhfT
         qyibpD6oH0b7PvJXNp9IH2+CegHcLXrig5YXx6tfEo9p4+tA0293fNxC9+rLERpqV+
         toD42HJaR8+L9sGrhx9bR6YYxAX7KmmLWTwrEvPQjqPJz7krTlfoLvm2FVLw18GNUY
         lYsjYyTkxygvg/iAQLWMAzKE8LpMFW43yZCquSfn5DScBAo0LT6Ab+4vcmyxTebnhU
         XEx6XRtNIL2IYGCHbaI+PKRhMptFxLjyr2O88pC4QKQ3CdrhJT9LQFu9iBXakaiYrG
         iRuFTWj2E1ncA==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id y1so12852612plk.10;
        Sat, 06 Nov 2021 07:46:21 -0700 (PDT)
X-Gm-Message-State: AOAM53224/Sa7gJ3Jmrg2NAkL7bbpbpIn95jidN20F1IhOsN85NUvlhc
        f8Wixaf7w6a30CowmUJ5yR77ZVzp6/rCUuPcVIs=
X-Google-Smtp-Source: ABdhPJySTlOtyCQ86nmxJl28BK11GUz021KLB4vL4oIsYLC0CO7sF0bebD8wbYnoQIGaiHxdQc6cTNScqvNNJHETthE=
X-Received: by 2002:a17:90b:1d0f:: with SMTP id on15mr26679974pjb.144.1636209981014;
 Sat, 06 Nov 2021 07:46:21 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Nov 2021 23:45:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARr1q9YfXRZy+uo9WRA6iNj2kkA9=ba0N1CtMc8NFtVvA@mail.gmail.com>
Message-ID: <CAK7LNARr1q9YfXRZy+uo9WRA6iNj2kkA9=ba0N1CtMc8NFtVvA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.16-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates.
Thanks.




The following changes since commit e4e737bb5c170df6135a127739a9e6148ee3da82=
:

  Linux 5.15-rc2 (2021-09-19 17:28:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kbuild-v5.16

for you to fetch changes up to 8212f8986d311ccf6a72305e6bdbd814691701d6:

  kbuild: use more subdir- for visiting subdirectories while cleaning
(2021-10-24 13:49:46 +0900)

----------------------------------------------------------------
Kbuild updates for v5.16

 - Remove the global -isystem compiler flag, which was made possible by
   the introduction of <linux/stdarg.h>

 - Improve the Kconfig help to print the location in the top menu level

 - Fix "FORCE prerequisite is missing" build warning for sparc

 - Add new build targets, tarzst-pkg and perf-tarzst-src-pkg, which generat=
e
   a zstd-compressed tarball

 - Prevent gen_init_cpio tool from generating a corrupted cpio when
   KBUILD_BUILD_TIMESTAMP is set to 2106-02-07 or later

 - Misc cleanups

----------------------------------------------------------------
Alexey Dobriyan (1):
      isystem: delete global -isystem compile option

Ariel Marcovitch (1):
      kconfig: Create links to main menu items in search

Hui Su (1):
      scripts: update the comments of kallsyms support

Kees Cook (1):
      sparc: Add missing "FORCE" target when using if_changed

Masahiro Yamada (22):
      nios2: move the install rule to arch/nios2/Makefile
      kbuild: move objtool_args back to scripts/Makefile.build
      kbuild: rename __objtool_obj and reuse it for cmd_cc_lto_link_modules
      kbuild: store the objtool command in *.cmd files
      kbuild: factor out OBJECT_FILES_NON_STANDARD check into a macro
      kbuild: detect objtool update without using .SECONDEXPANSION
      kbuild: reuse $(cmd_objtool) for cmd_cc_lto_link_modules
      kconfig: narrow the scope of variables in the lexer
      kconfig: rename a variable in the lexer to a clearer name
      kconfig: remove 'const' from the return type of sym_escape_string_val=
ue()
      kconfig: refactor conf_write_heading()
      kconfig: refactor conf_write_symbol()
      kconfig: refactor listnewconfig code
      kconfig: move sym_escape_string_value() to confdata.c
      kconfig: add conf_get_autoheader_name()
      kconfig: refactor conf_write_autoconf()
      kconfig: refactor conf_write_dep()
      kconfig: refactor conf_touch_dep()
      gen_init_cpio: add static const qualifiers
      kbuild: split DEBUG_CFLAGS out to scripts/Makefile.debug
      sh: remove meaningless archclean line
      kbuild: use more subdir- for visiting subdirectories while cleaning

Nicolas Schier (1):
      initramfs: Check timestamp to prevent broken cpio archive

Pawe=C5=82 Jasiak (1):
      kbuild: Add make tarzst-pkg build option

 Documentation/kbuild/makefiles.rst |  17 +-
 Makefile                           |  41 +---
 arch/alpha/Kbuild                  |   3 +
 arch/alpha/Makefile                |   3 -
 arch/arc/Kbuild                    |   3 +
 arch/arc/Makefile                  |   3 -
 arch/arm/Kbuild                    |   3 +
 arch/arm/Makefile                  |   4 -
 arch/arm64/Kbuild                  |   3 +
 arch/arm64/Makefile                |   7 -
 arch/arm64/kernel/Makefile         |   3 +
 arch/arm64/lib/Makefile            |   2 +
 arch/csky/Kbuild                   |   3 +
 arch/csky/Makefile                 |   3 -
 arch/h8300/Kbuild                  |   3 +
 arch/h8300/Makefile                |   3 -
 arch/ia64/Makefile                 |   2 -
 arch/m68k/Makefile                 |   4 +-
 arch/microblaze/Kbuild             |   3 +
 arch/microblaze/Makefile           |   3 -
 arch/mips/Kbuild                   |   3 +
 arch/mips/Makefile                 |   8 +-
 arch/mips/boot/Makefile            |   3 +
 arch/nds32/Kbuild                  |   3 +
 arch/nds32/Makefile                |   5 +-
 arch/nios2/Kbuild                  |   3 +
 arch/nios2/Makefile                |   9 +-
 arch/nios2/boot/Makefile           |   3 -
 arch/openrisc/Kbuild               |   3 +
 arch/openrisc/Makefile             |   7 +-
 arch/parisc/Kbuild                 |   3 +
 arch/parisc/Makefile               |   7 +-
 arch/powerpc/Kbuild                |   3 +
 arch/powerpc/Makefile              |   7 +-
 arch/powerpc/lib/Makefile          |   2 +
 arch/riscv/Kbuild                  |   3 +
 arch/riscv/Makefile                |   7 +-
 arch/s390/Kbuild                   |   3 +
 arch/s390/Makefile                 |   8 +-
 arch/sh/Kbuild                     |   3 +
 arch/sh/Makefile                   |   4 -
 arch/sparc/Kbuild                  |   3 +
 arch/sparc/Makefile                |   3 -
 arch/sparc/boot/Makefile           |   8 +-
 arch/x86/Kbuild                    |   3 +
 arch/x86/Makefile                  |   2 -
 arch/xtensa/Makefile               |   4 +-
 crypto/Makefile                    |   2 +
 lib/raid6/Makefile                 |   4 +
 scripts/Makefile.build             |  63 +++---
 scripts/Makefile.debug             |  33 +++
 scripts/Makefile.lib               |  11 -
 scripts/Makefile.package           |  10 +-
 scripts/kconfig/conf.c             |  15 +-
 scripts/kconfig/confdata.c         | 441 ++++++++++++++++++++-------------=
----
 scripts/kconfig/lexer.l            |   9 +-
 scripts/kconfig/lkc_proto.h        |   2 +-
 scripts/kconfig/menu.c             |  33 +--
 scripts/kconfig/symbol.c           |  43 ----
 scripts/link-vmlinux.sh            |   6 +-
 scripts/package/buildtar           |   4 +
 usr/gen_init_cpio.c                |  20 +-
 62 files changed, 453 insertions(+), 479 deletions(-)
 create mode 100644 scripts/Makefile.debug


--=20
Best Regards
Masahiro Yamada
