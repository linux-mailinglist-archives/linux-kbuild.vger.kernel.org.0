Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 459AB674B3
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 19:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbfGLRuv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 13:50:51 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:38904 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfGLRuu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 13:50:50 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x6CHogQ0009227;
        Sat, 13 Jul 2019 02:50:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x6CHogQ0009227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562953843;
        bh=OH/1XHi/4PVTAwRaCENy+VQu4fQM/LkcnjSGBushwcg=;
        h=From:Date:Subject:To:Cc:From;
        b=kabTbhuEwcunOEgguptQiSz9NADJKSg3yoB4jApmeWMup0ObUlwGIGJ70d1vVRv/K
         cGQcDVWcYGs46zClCiTl5ZYWJjEY8bk8Oo74nuqIko7exmxj5jRXfC32XQrPDdxdXt
         obW1ODZIzpXJ6xAihGIf24S8y4gD8Xe5N4Tg6SUaZ37+44HmH9Jv12pAYs2TOYtzpD
         UoKo8aFEWUD6c9e0aRKUKr3FGTfsRJvLQ7PCSUKa40SzNJPO/ul9Da6s0JNhP6vihF
         S20uAY4SjoTDaCHV3YKW6UcH85Jg821WEx1ZC1brGYMnNSsIUlI+k8tX1zUzGWGV9+
         x80V5/i+6DiOw==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id r3so7210373vsr.13;
        Fri, 12 Jul 2019 10:50:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVQ0SERhYhZXCCQ+cMloGjqMwnijwm7nbFgbg4p6e04UJ0JhXGt
        ibMtgnACZpsfzrKyCfBtTNCzmUHTQ18/cHQOPTg=
X-Google-Smtp-Source: APXvYqxH4ooWxLT5E/g7bppW27lQ9kxdLNWMTj7vpxXMTeXrRbvjpGXnIvDR+lvrzRd4eKaeraINAVom0UiQIp4uoaA=
X-Received: by 2002:a67:d46:: with SMTP id 67mr9553951vsn.181.1562953841419;
 Fri, 12 Jul 2019 10:50:41 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 13 Jul 2019 02:50:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyxi5pjwi6zviW+kyZDWaYdt3tQNu+wFmyNeRDryGEKg@mail.gmail.com>
Message-ID: <CAK7LNATyxi5pjwi6zviW+kyZDWaYdt3tQNu+wFmyNeRDryGEKg@mail.gmail.com>
Subject: [GIT PULL 1/2] Kbuild updates for v5.3-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     masahiroy@kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.3
Thanks!


The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:

  Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.3

for you to fetch changes up to d4a74bbfee03acf7bbddc77b9c9236462c744fc7:

  kbuild: use -- separater intead of $(filter-out ...) for
cc-cross-prefix (2019-07-11 23:34:52 +0900)

----------------------------------------------------------------
Kbuild updates for v5.3

- remove headers_{install,check}_all targets

- remove unreasonable 'depends on !UML' from CONFIG_SAMPLES

- re-implement 'make headers_install' more cleanly

- add new header-test-y syntax to compile-test headers

- compile-test exported headers to ensure they are compilable in
  user-space

- compile-test headers under include/ to ensure they are self-contained

- remove -Waggregate-return, -Wno-uninitialized, -Wno-unused-value flags

- add -Werror=unknown-warning-option for Clang

- add 128-bit built-in types support to genksyms

- fix missed rebuild of modules.builtin

- propagate 'No space left on device' error in fixdep to Make

- allow Clang to use its integrated assembler

- improve some coccinelle scripts

- add a new flag KBUILD_ABS_SRCTREE to request Kbuild to use absolute
  path for $(srctree).

- do not ignore errors when compression utility is missing

- misc cleanups

----------------------------------------------------------------
Geert Uytterhoeven (1):
      kbuild: Inform user to pass ARCH= for make mrproper

Harald Seiler (1):
      kbuild: fix compression errors getting ignored

Jani Nikula (1):
      kbuild: add support for ensuring headers are self-contained

Kirill Smelkov (1):
      coccinelle: api/stream_open: treat all wait_.*() calls as blocking

Markus Elfring (2):
      coccinelle: put_device: Adjust a message construction
      coccinelle: put_device: Add a cast to an expression for an assignment

Masahiro Yamada (35):
      kbuild: remove headers_{install,check}_all
      kbuild: remove stale dependency between Documentation/ and headers_install
      kbuild: make gdb_script depend on prepare0 instead of prepare
      kbuild: fix Kconfig prompt of CONFIG_HEADERS_CHECK
      kbuild: add CONFIG_HEADERS_INSTALL and loosen the dependency of samples
      kbuild: remove build_unifdef target in scripts/Makefile
      kbuild: build all prerequisites of headers_install simultaneously
      kbuild: add 'headers' target to build up uapi headers in usr/include
      kbuild: re-implement Makefile.headersinst without recursion
      kbuild: move hdr-inst shorthand to top Makefile
      kbuild: simplify scripts/headers_install.sh
      kbuild: deb-pkg: do not run headers_check
      lib/raid6: remove duplicated CFLAGS_REMOVE_altivec8.o
      lib/raid6: refactor unroll rules with pattern rules
      kbuild: fix 'No such file or directory' warning for headers_install
      kbuild: rename arg-check to cmd-check
      kbuild: save $(strip ...) for calling any-prepreq
      kbuild: save $(strip ...) for calling if_changed and friends
      kbuild: fix missed rebuild of modules.builtin
      kbuild: split modules.order build rule out of 'modules' target
      fixdep: check return value of printf() and putchar()
      kbuild: add more hints about SUBDIRS replacement
      init/Kconfig: add CONFIG_CC_CAN_LINK
      kbuild: compile-test exported headers to ensure they are self-contained
      kbuild: do not create wrappers for header-test-y
      kbuild: support header-test-pattern-y
      kheaders: remove meaningless -R option of 'ls'
      kheaders: include only headers into kheaders_data.tar.xz
      kbuild: compile-test kernel headers to ensure they are self-contained
      scripts/tags.sh: drop SUBARCH support for ARM
      scripts/tags.sh: remove unused environment variables from comments
      kbuild: remove src and obj from the top Makefile
      kbuild: replace KBUILD_SRCTREE with boolean building_out_of_srctree
      kbuild: add a flag to force absolute path for srctree
      kbuild: use -- separater intead of $(filter-out ...) for cc-cross-prefix

Mathieu Malaterre (1):
      kbuild: Remove -Waggregate-return from scripts/Makefile.extrawarn

Nathan Chancellor (3):
      kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS
      kbuild: Enable -Wuninitialized
      kbuild: Add ability to test Clang's integrated assembler

Nathan Huckleberry (1):
      kbuild: Remove unnecessary -Wno-unused-value

Rikard Falkeborn (1):
      coccinelle: kstrdup: Fix typo in warning messages

Vasily Gorbik (1):
      kallsyms: exclude kasan local symbols on s390

Will Deacon (1):
      genksyms: Teach parser about 128-bit built-in types

 Documentation/kbuild/headers_install.txt  |    7 -
 Documentation/kbuild/kbuild.txt           |    9 +
 Documentation/kbuild/makefiles.txt        |   22 +-
 Makefile                                  |  117 ++--
 arch/arc/Makefile                         |    2 +-
 arch/arc/configs/tb10x_defconfig          |    1 +
 arch/nds32/configs/defconfig              |    1 +
 arch/parisc/Makefile                      |   12 +-
 arch/parisc/configs/a500_defconfig        |    1 +
 arch/parisc/configs/b180_defconfig        |    1 +
 arch/parisc/configs/c3000_defconfig       |    1 +
 arch/parisc/configs/default_defconfig     |    1 +
 arch/powerpc/configs/ppc6xx_defconfig     |    1 +
 arch/s390/configs/debug_defconfig         |    1 +
 arch/um/Makefile                          |    2 +-
 drivers/gpu/drm/i915/.gitignore           |    1 -
 drivers/gpu/drm/i915/Makefile.header-test |   12 +-
 include/Kbuild                            | 1270
+++++++++++++++++++++++++++++++++++
 include/uapi/{linux => }/Kbuild           |    6 +-
 init/Kconfig                              |   33 +
 kernel/gen_kheaders.sh                    |   51 +-
 lib/Kconfig.debug                         |   25 +-
 lib/raid6/Makefile                        |   98 +--
 net/bpfilter/Kconfig                      |    2 +-
 samples/Kconfig                           |   14 +-
 samples/Makefile                          |    4 +-
 scripts/Kbuild.include                    |   28 +-
 scripts/Makefile                          |    5 -
 scripts/Makefile.build                    |   11 +-
 scripts/Makefile.extrawarn                |    3 -
 scripts/Makefile.headersinst              |  134 ++--
 scripts/Makefile.host                     |    2 +-
 scripts/Makefile.lib                      |   26 +-
 scripts/Makefile.modbuiltin               |    2 +-
 scripts/basic/fixdep.c                    |   51 +-
 scripts/coccinelle/api/kstrdup.cocci      |    8 +-
 scripts/coccinelle/api/stream_open.cocci  |    8 +-
 scripts/coccinelle/free/put_device.cocci  |   11 +-
 scripts/gdb/linux/Makefile                |    2 +-
 scripts/genksyms/keywords.c               |    4 +
 scripts/genksyms/parse.y                  |    2 +
 scripts/headers.sh                        |   29 -
 scripts/headers_install.sh                |   48 +-
 scripts/kallsyms.c                        |    3 +
 scripts/package/builddeb                  |    2 +-
 scripts/package/mkspec                    |    2 +-
 scripts/tags.sh                           |   43 +-
 tools/testing/selftests/Makefile          |    2 +-
 tools/testing/selftests/lib.mk            |    4 +-
 usr/.gitignore                            |    1 -
 usr/Makefile                              |    2 +
 usr/include/.gitignore                    |    3 +
 usr/include/Makefile                      |  132 ++++
 53 files changed, 1805 insertions(+), 458 deletions(-)
 delete mode 100644 drivers/gpu/drm/i915/.gitignore
 create mode 100644 include/Kbuild
 rename include/uapi/{linux => }/Kbuild (77%)
 delete mode 100755 scripts/headers.sh
 create mode 100644 usr/include/.gitignore
 create mode 100644 usr/include/Makefile


-- 
Best Regards
Masahiro Yamada
