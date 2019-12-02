Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF8E510ED5E
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2019 17:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfLBQmL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Dec 2019 11:42:11 -0500
Received: from condef-02.nifty.com ([202.248.20.67]:56029 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727455AbfLBQmK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Dec 2019 11:42:10 -0500
X-Greylist: delayed 722 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Dec 2019 11:42:08 EST
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-02.nifty.com with ESMTP id xB2GOgMN031239;
        Tue, 3 Dec 2019 01:24:42 +0900
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xB2GOduR012428;
        Tue, 3 Dec 2019 01:24:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xB2GOduR012428
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1575303880;
        bh=rm3ZK7yhiq4FZDdHluzZykagSvCfF8C1lx7K2GP6vG0=;
        h=From:Date:Subject:To:Cc:From;
        b=ptGFI9grRK6usirFR6+BSc5OGy5NquniEtLGC0KJ8vQ2RYUZOk4HbZKonUfppA027
         1St7hynnD2atkF9TcI+7SwuBzPbxF/cXnMlY2naaepaYDrteanPwEmH7mPiKo1POHS
         53vMx+VbTc+riT4l36nA+lj2AKT2xQxT4mygCnvpduUqSNaoYr6PTIxf5vin4vgWST
         i6uGv9Kp+VU3lR35DKUVRtbUHhN0LUWfJbSrIRPz+yWVhyEj24eeifv/PjwD/TRuZH
         i8cW7mJZVhR8lYaalRRhcvBWuSqhDJAIXrifmnOjIuskxoQraGFvnNP+QP1Cy6PqR/
         5xAb8myFPPhaA==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id g23so212655vsr.7;
        Mon, 02 Dec 2019 08:24:39 -0800 (PST)
X-Gm-Message-State: APjAAAUBTV3sSRsHZx0mEzw9JVubzGz0De+BbOjW+naI3Dhr/zJhT9rt
        iKVK62tSXvVkyNolXecd2yiVj5M3tpujhTfElys=
X-Google-Smtp-Source: APXvYqy5QEmkCbvFQme0P5Qi7i5tG5bxFowJIv7zFdC13WbWqqPF9gUA8pn8MMzQqHMLL7YaZ8VoDMznaxjROPH9WuA=
X-Received: by 2002:a67:30c3:: with SMTP id w186mr1355880vsw.179.1575303878334;
 Mon, 02 Dec 2019 08:24:38 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 3 Dec 2019 01:24:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNATG5bPOn5qD8=NAJP8LwicV0hO4W8WBE8LFgOczEePBKg@mail.gmail.com>
Message-ID: <CAK7LNATG5bPOn5qD8=NAJP8LwicV0hO4W8WBE8LFgOczEePBKg@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.5-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.5-rc1.

You will see merge conflicts in two files
when pulling it.


[1] Just delete include/Kbuild, please.
[2] The fix-up for drivers/gpu/drm/i915/Kconfig.debug
    is available in linux-next.

Thanks.



The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:

  Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.5

for you to fetch changes up to d21b7e6b985c15ff75e8668b0282ec5104391901:

  MAINTAINERS: update Kbuild/Kconfig maintainer's email address
(2019-12-01 16:13:01 +0900)

----------------------------------------------------------------
Kbuild updates for v5.5

 - remove unneeded asm headers from hexagon, ia64

 - add 'dir-pkg' target, which works like 'tar-pkg' but skips archiving

 - add 'helpnewconfig' target, which shows help for new CONFIG options

 - support 'make nsdeps' for external modules

 - make rebuilds faster by deleting $(wildcard $^) checks

 - remove compile tests for kernel-space headers

 - refactor modpost to simplify modversion handling

 - make single target builds faster

 - optimize and clean up scripts/kallsyms.c

 - refactor various Makefiles and scripts

----------------------------------------------------------------
Alyssa Ross (1):
      kconfig: be more helpful if pkg-config is missing

Bhaskar Chowdhury (2):
      scripts: setlocalversion: replace backquote to dollar parenthesis
      scripts/ver_linux: add Bison and Flex to the checklist

Geert Uytterhoeven (2):
      kbuild: Wrap long "make help" text lines
      kbuild: Extend defconfig field size from 24 to 27

Laura Abbott (1):
      kconfig: Add option to get the full help text with listnewconfig

Masahiro Yamada (52):
      hexagon: remove asm/bitsperlong.h
      ia64: remove unneeded uapi asm-generic wrappers
      video/logo: simplify cmd_logo
      video/logo: move pnmtologo tool to drivers/video/logo/ from scripts/
      kconfig: split util.c out of parser.y
      kbuild: update comments in scripts/Makefile.modpost
      modpost: do not parse vmlinux for external module builds
      kbuild: do not read $(KBUILD_EXTMOD)/Module.symvers
      kheaders: remove unneeded 'cat' command piped to 'head' / 'tail'
      kheaders: optimize md5sum calculation for in-tree builds
      kheaders: optimize header copy for in-tree builds
      kheaders: remove the last bashism to allow sh to run it
      kheaders: explain why include/config/autoconf.h is excluded from md5sum
      kbuild: remove unneeded variable, single-all
      kbuild: reduce KBUILD_SINGLE_TARGETS as descending into subdirectories
      kbuild: make single target builds much faster
      asm-generic/export.h: make __ksymtab_* local symbols
      asm-generic/export.h: remove unneeded __kcrctab_* symbols
      modpost: do not invoke extra modpost for nsdeps
      modpost: free ns_deps_buf.p after writing ns_deps files
      modpost: dump missing namespaces into a single modules.nsdeps file
      scripts/nsdeps: support nsdeps for external module builds
      modpost: remove unneeded local variable in contains_namespace()
      kbuild: update compile-test header list for v5.5-rc1
      kbuild: drop $(wildcard $^) check in if_changed* for faster rebuild
      kbuild: rename any-prereq to newer-prereqs
      kbuild: remove header compile test
      kbuild: move headers_check rule to usr/include/Makefile
      modpost: add a helper to get data pointed by a symbol
      modpost: refactor namespace_from_kstrtabns() to not hard-code section name
      modpost: rename handle_modversions() to handle_symbol()
      modpost: stop symbol preloading for modversion CRC
      modpost: do not set ->preloaded for symbols from Module.symvers
      modpost: respect the previous export when 'exported twice' is warned
      kbuild: make single target builds even faster
      scripts/kallsyms: remove unneeded #ifndef ARRAY_SIZE
      scripts/kallsyms: fix definitely-lost memory leak
      scripts/kallsyms: shrink table before sorting it
      scripts/kallsyms: set relative_base more effectively
      scripts/kallsyms: remove redundant is_arm_mapping_symbol()
      scripts/kallsyms: remove unneeded length check for prefix matching
      scripts/kallsyms: add sym_name() to mitigate cast ugliness
      scripts/kallsyms: replace prefix_underscores_count() with strspn()
      scripts/kallsyms: make find_token() return (unsigned char *)
      scripts/kallsyms: add const qualifiers where possible
      scripts/kallsyms: skip ignored symbols very early
      scripts/kallsyms: move more patterns to the ignored_prefixes array
      scripts/kallsyms: move ignored symbol types to is_ignored_symbol()
      scripts/kallsyms: make check_symbol_range() void function
      scripts/kallsyms: put check_symbol_range() calls close together
      scripts/kallsyms: remove redundant initializers
      MAINTAINERS: update Kbuild/Kconfig maintainer's email address

Matteo Croce (1):
      kbuild: Add make dir-pkg build option

 .gitignore                                   |    2 +-
 Documentation/Makefile                       |    6 +-
 Documentation/core-api/symbol-namespaces.rst |    3 +
 Documentation/dontdiff                       |    1 +
 Documentation/kbuild/makefiles.rst           |   17 -
 Documentation/kbuild/modules.rst             |   13 +-
 MAINTAINERS                                  |    4 +-
 Makefile                                     |  121 ++-
 arch/hexagon/include/uapi/asm/bitsperlong.h  |   27 -
 arch/ia64/include/uapi/asm/errno.h           |    2 -
 arch/ia64/include/uapi/asm/ioctl.h           |    2 -
 arch/ia64/include/uapi/asm/ioctls.h          |    7 -
 drivers/gpu/drm/i915/Kconfig.debug           |    1 -
 drivers/video/logo/.gitignore                |    1 +
 drivers/video/logo/Makefile                  |   15 +-
 {scripts => drivers/video/logo}/pnmtologo.c  |    0
 include/Kbuild                               | 1185
-----------------------------
 include/asm-generic/export.h                 |    2 -
 init/Kconfig                                 |   22 +-
 kernel/Makefile                              |    2 +-
 kernel/gen_kheaders.sh                       |   64 +-
 lib/Kconfig.debug                            |   11 -
 scripts/.gitignore                           |    1 -
 scripts/Kbuild.include                       |   15 +-
 scripts/Makefile                             |    2 -
 scripts/Makefile.build                       |   20 +-
 scripts/Makefile.headersinst                 |   18 -
 scripts/Makefile.lib                         |   14 -
 scripts/Makefile.modpost                     |   18 +-
 scripts/Makefile.package                     |    6 +-
 scripts/kallsyms.c                           |  287 ++++---
 scripts/kconfig/Makefile                     |   10 +-
 scripts/kconfig/conf.c                       |   13 +-
 scripts/kconfig/mconf-cfg.sh                 |    3 +
 scripts/kconfig/nconf-cfg.sh                 |    3 +
 scripts/kconfig/parser.y                     |    1 -
 scripts/mod/modpost.c                        |  188 +++--
 scripts/mod/modpost.h                        |    5 +-
 scripts/nsdeps                               |   29 +-
 scripts/package/buildtar                     |    8 +-
 scripts/setlocalversion                      |   22 +-
 scripts/ver_linux                            |    2 +
 usr/include/Makefile                         |   19 +-
 43 files changed, 452 insertions(+), 1740 deletions(-)
 delete mode 100644 arch/hexagon/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/ia64/include/uapi/asm/errno.h
 delete mode 100644 arch/ia64/include/uapi/asm/ioctl.h
 delete mode 100644 arch/ia64/include/uapi/asm/ioctls.h
 rename {scripts => drivers/video/logo}/pnmtologo.c (100%)
 delete mode 100644 include/Kbuild


-- 
Best Regards
Masahiro Yamada
