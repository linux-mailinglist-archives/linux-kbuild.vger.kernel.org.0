Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDC8407DC2
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Sep 2021 16:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhILOSe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 Sep 2021 10:18:34 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:21470 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhILOSd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Sep 2021 10:18:33 -0400
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 18CEGol4006440;
        Sun, 12 Sep 2021 23:16:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 18CEGol4006440
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631456210;
        bh=mUE5TZhSM6+EnO03EYazo5pvOxxyFpUDsSyvSAqRKFQ=;
        h=From:Date:Subject:To:Cc:From;
        b=FvGSBScnFjLv7wFZbe0JM8FGb17KuS/fanmQ/g0kgoUFRiLIGdNKUK2C8VSmqKOvo
         Lz3HrxXu8CJwtnZWB+WbWPjKXSNQ7/5xwOxPaIDm4G8Tvz0lI7g6g+96Cyq4ely+WZ
         c0vJ/yplCsKHxgrsrNwBXgjwBNNMaZJ0o3ZWkRCtCxRbV3iMWUdDfwVB/30M5NrU+6
         zonWfqW7/lJIKwiA1p0RGa+prJyY1ToF5CaL2JE7JJl3IKR4q+PAuANuLJ2+dizttL
         jVcOowCx6eoLoUhA0mbcrwmhXdTceQUSYGz32C66oVaEeIhfSpNQaBIuLBrB6W8rx7
         GaSGrsN/vOngA==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id q22so6449443pfu.0;
        Sun, 12 Sep 2021 07:16:50 -0700 (PDT)
X-Gm-Message-State: AOAM533Db/bIMpVv62g4+4xRdMpbFkL5kgrEgy/AfKnppHk5wDnWMIWm
        q90PMtjHOk3KEC5ikRBZW+/1g19BUM+DLCKrFgw=
X-Google-Smtp-Source: ABdhPJygPtrF/m4AyVCF2kV3PP4uDllCLLXkRbbAQGuijqmnXnW0Ln1ad0zjjQZPoQD01+FQw5NYbCPIb5SFId4cjDo=
X-Received: by 2002:a65:40c4:: with SMTP id u4mr6872951pgp.186.1631456209429;
 Sun, 12 Sep 2021 07:16:49 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 12 Sep 2021 23:16:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNATSGpfQNZ+0V7NeSzMkDp4wsb9PUXSUyDbxpMfDvLaBxA@mail.gmail.com>
Message-ID: <CAK7LNATSGpfQNZ+0V7NeSzMkDp4wsb9PUXSUyDbxpMfDvLaBxA@mail.gmail.com>
Subject: [GIT PULL] more Kbuild updates for v5.15-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some more Kbuild updates.

One remarkable change might be
"isystem: delete global -isystem compile option".

This is related to the <linux/stdarg.h> introduction, which
some people were opposed to.
Since you were positive about the <linux/stdarg.h> addition,
I hope the -isystem removal is OK as well.

The rest are clean-ups and fixes.

Thanks.




The following changes since commit 926de8c4326c14fcf35f1de142019043597a4fac:

  Merge tag 'acpi-5.15-rc1-3' of
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
(2021-09-10 13:29:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.15-2

for you to fetch changes up to a9086b878b7fd65894eb8cb1fa395dd469970566:

  gen_compile_commands: fix missing 'sys' package (2021-09-12 19:45:00 +0900)

----------------------------------------------------------------
Kbuild updates for v5.15 (2nd)

 - Remove -isystem from the global compiler flag (except nds32) so
   nobody will accidentally include unintended headers.

 - Clean up the build dependencies on objtool.

 - Fix bugs in checkkconfigsymbols.py.

 - Fix missing sys import in gen_compile_commands.py.

----------------------------------------------------------------
Alexey Dobriyan (1):
      isystem: delete global -isystem compile option

Ariel Marcovitch (2):
      checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
      checkkconfigsymbols.py: Remove skipping of help lines in
parse_kconfig_file

Kortan (1):
      gen_compile_commands: fix missing 'sys' package

Masahiro Yamada (7):
      nios2: move the install rule to arch/nios2/Makefile
      kbuild: move objtool_args back to scripts/Makefile.build
      kbuild: rename __objtool_obj and reuse it for cmd_cc_lto_link_modules
      kbuild: store the objtool command in *.cmd files
      kbuild: factor out OBJECT_FILES_NON_STANDARD check into a macro
      kbuild: detect objtool update without using .SECONDEXPANSION
      kbuild: reuse $(cmd_objtool) for cmd_cc_lto_link_modules

 Makefile                                    |  2 +-
 arch/arm64/lib/Makefile                     |  2 ++
 arch/nds32/Makefile                         |  2 ++
 arch/nios2/Makefile                         |  3 ++-
 arch/nios2/boot/Makefile                    |  3 ---
 arch/powerpc/lib/Makefile                   |  2 ++
 crypto/Makefile                             |  2 ++
 lib/raid6/Makefile                          |  4 +++
 scripts/Makefile.build                      | 63
++++++++++++++++++++++++-------------------
 scripts/Makefile.lib                        | 11 --------
 scripts/checkkconfigsymbols.py              | 11 +++-----
 scripts/clang-tools/gen_compile_commands.py |  1 +
 12 files changed, 55 insertions(+), 51 deletions(-)


-- 
Best Regards
Masahiro Yamada
