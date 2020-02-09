Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9C6156929
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Feb 2020 06:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgBIFqD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 9 Feb 2020 00:46:03 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49457 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgBIFqD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 9 Feb 2020 00:46:03 -0500
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0195jte6009169;
        Sun, 9 Feb 2020 14:45:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0195jte6009169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581227156;
        bh=MQbOWzCfU6bAvHmKbMsUof+abja+C08OG99RX4SPQ0A=;
        h=From:Date:Subject:To:Cc:From;
        b=l1J3oLNMgC9UOrgBC2TERgFJB9r2z+Ajhp/gUzbGTgimvahoQVEpq0jxVehYfkIBD
         MoHOgw6Hw32nq3Ql9cF6n5IWISiLuWtLdQ8wmxTZL5yWgnNfAtANO5iKB3rwB56Ncd
         I0qBwTohRndESyF41pXutfaFWmIaT9PrnReNTqtsrzdemlQ0EL6mn24lQkxFLLhe7S
         ng9FsFIB+Azr3KmWVd5FzjPlkN/nkBGPM3u0mebh4asR7aTdQxmbx8ZKoGH+evfkVB
         J+uAVgds9krdrJGDTfL1yAPGZ94glwXtWsbVmu0NZCBD9rMjk1OaieTpbdCiByXXza
         bgjxtFMBio3zQ==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id a33so1319077uad.11;
        Sat, 08 Feb 2020 21:45:55 -0800 (PST)
X-Gm-Message-State: APjAAAUxUQxiDpXk4OIPoEF53z3uT8Re2NhNPvcW5ysJpIbcAnkherDc
        UH9QKRIIhhwlmpt4/ARaJPoXBwXsC5EqERA51Rc=
X-Google-Smtp-Source: APXvYqxf7jq7E5P5yzeoGunqwAI+9VM3J8uS3cDiYCoCpiXmyixDmyOmV5TycxFy1M/TUon8iVZwbagw6AHhndwhrCE=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr3179828uau.109.1581227154524;
 Sat, 08 Feb 2020 21:45:54 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 9 Feb 2020 06:45:18 +0100
X-Gmail-Original-Message-ID: <CAK7LNAQs-KVCM7xXqJchQrMG+nnajPFRMB2Z+RJ9VTsg7XGRAQ@mail.gmail.com>
Message-ID: <CAK7LNAQs-KVCM7xXqJchQrMG+nnajPFRMB2Z+RJ9VTsg7XGRAQ@mail.gmail.com>
Subject: [GIT PULL] more Kbuild updates for v5.6-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull more Kbuild updates.
(I touched Makefiles around due to some syntax renaming,
but it is trivial.)

Thanks.




The following changes since commit 754beeec1d9024eef0db8dc4be2636331dd413c6:

  Merge tag 'char-misc-5.6-rc1-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
(2020-02-03 14:57:33 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.6-2

for you to fetch changes up to f566e1fbadb686e28f1c307e356114b2865ef588:

  kbuild: make multiple directory targets work (2020-02-06 06:31:51 +0900)

----------------------------------------------------------------
Kbuild updates for v5.6 (2nd)

 - fix randconfig to generate a sane .config

 - rename hostprogs-y / always to hostprogs / always-y, which are
   more natual syntax.

 - optimize scripts/kallsyms

 - fix yes2modconfig and mod2yesconfig

 - make multiple directory targets ('make foo/ bar/') work

----------------------------------------------------------------
Masahiro Yamada (7):
      kconfig: fix broken dependency in randconfig-generated .config
      kbuild: fix the document to use extra-y for vmlinux.lds
      kbuild: rename hostprogs-y/always to hostprogs/always-y
      scripts/kallsyms: rename local variables in read_symbol()
      scripts/kallsyms: change table to store (strcut sym_entry *)
      kallsyms: fix type of kallsyms_token_table[]
      kbuild: make multiple directory targets work

Tetsuo Handa (1):
      kconfig: Invalidate all symbols after changing to y or m.

 Documentation/kbuild/makefiles.rst  |  53 ++++------
 Kbuild                              |   8 +-
 Makefile                            |   2 +-
 arch/alpha/boot/Makefile            |   2 +-
 arch/arm/vdso/Makefile              |   2 +-
 arch/arm64/kernel/vdso32/Makefile   |   4 +-
 arch/mips/boot/Makefile             |   2 +-
 arch/mips/boot/compressed/Makefile  |   4 +-
 arch/mips/boot/tools/Makefile       |   2 +-
 arch/mips/tools/Makefile            |   4 +-
 arch/mips/vdso/Makefile             |   2 +-
 arch/powerpc/boot/Makefile          |   4 +-
 arch/s390/tools/Makefile            |   4 +-
 arch/sparc/boot/Makefile            |   2 +-
 arch/sparc/vdso/Makefile            |   2 +-
 arch/x86/boot/Makefile              |   4 +-
 arch/x86/boot/compressed/Makefile   |   2 +-
 arch/x86/entry/vdso/Makefile        |   2 +-
 arch/x86/realmode/rm/Makefile       |   2 +-
 arch/x86/tools/Makefile             |   4 +-
 drivers/gpu/drm/radeon/Makefile     |   2 +-
 drivers/tty/vt/Makefile             |   2 +-
 drivers/video/logo/Makefile         |   2 +-
 drivers/zorro/Makefile              |   2 +-
 fs/unicode/Makefile                 |   2 +-
 kernel/kallsyms.c                   |   5 +-
 lib/Makefile                        |   4 +-
 lib/raid6/Makefile                  |   2 +-
 net/bpfilter/Makefile               |   2 +-
 samples/bpf/Makefile                | 118 +++++++++++-----------
 samples/connector/Makefile          |   8 +-
 samples/hidraw/Makefile             |   6 +-
 samples/mei/Makefile                |   4 +-
 samples/pidfd/Makefile              |   4 +-
 samples/seccomp/Makefile            |   4 +-
 samples/uhid/Makefile               |   4 +-
 samples/vfs/Makefile                |   5 +-
 scripts/Makefile                    |  22 ++--
 scripts/Makefile.build              |   8 +-
 scripts/Makefile.clean              |   4 +-
 scripts/Makefile.host               |   8 +-
 scripts/Makefile.lib                |   6 +-
 scripts/basic/Makefile              |   4 +-
 scripts/dtc/Makefile                |   4 +-
 scripts/gcc-plugins/Makefile        |   2 +-
 scripts/genksyms/Makefile           |   4 +-
 scripts/kallsyms.c                  | 133 +++++++++++++------------
 scripts/kconfig/Makefile            |  10 +-
 scripts/kconfig/confdata.c          |   7 +-
 scripts/mod/Makefile                |   4 +-
 scripts/selinux/genheaders/Makefile |   4 +-
 scripts/selinux/mdp/Makefile        |   4 +-
 usr/Makefile                        |   2 +-
 53 files changed, 252 insertions(+), 261 deletions(-)


--
Best Regards
Masahiro Yamada
