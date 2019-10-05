Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37DF6CC8BB
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Oct 2019 10:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbfJEIWT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Oct 2019 04:22:19 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47221 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfJEIWT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Oct 2019 04:22:19 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x958Lq9j003393;
        Sat, 5 Oct 2019 17:21:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x958Lq9j003393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570263713;
        bh=ahNX28eQh15M5M5GRg0L87a3bdEVJYZPnUJtAsPiDAM=;
        h=From:Date:Subject:To:Cc:From;
        b=KjMk2UAnrp0FtJLCi99ymFgaT/w/ZYeJ/9yjfTYdEQAXWQoAZrgCbDWsBaYw9sHS5
         c2UoIF1WCOhhZAY9q0bzDzaw7dRr0cyXYOH8c8nX38mSyyvzIwh7c7mDoxiNPZDDPz
         HN+9gMy8o50mXPnRM/OaXMBaaDTLMXv0Bajwu8QTyO7rVqt49j5M7SBPZ+NglrVSQL
         m0h3f7Novr41qK12i8xzaEq7evNPgsqYajkxwiexueXIvU+bg4BYklwbu1njFaWrMA
         fPbM7ySq31onZeO4FpkQPAsFpjQucUBLmScBK1mfl2c9Rz6qP/OSfN6dSHHkYjVlWx
         HZykREIPawKDQ==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id q11so2740908uao.1;
        Sat, 05 Oct 2019 01:21:53 -0700 (PDT)
X-Gm-Message-State: APjAAAWvlt+qmfMH2bocb/ey4RoDk6E0svkymskJrGZq6WTNHoF4D+aL
        O0q1aZFDMlpnhamvpIM0NVsuI0T54w/PJtrzP+M=
X-Google-Smtp-Source: APXvYqxXl13p0OLGQLg79BpS+L7p9BMoMbMf5pOv2MJB8PEadVrhk/x1d1QzhVSI4ZFYyDoV4ZCDMnkkYNp2IvZQAsE=
X-Received: by 2002:ab0:6355:: with SMTP id f21mr10094017uap.40.1570263712238;
 Sat, 05 Oct 2019 01:21:52 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 5 Oct 2019 17:21:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNATpmqt57w9m1keLKu4Y0zbvWjJX8SWqKC6b6mj-23Y0xg@mail.gmail.com>
Message-ID: <CAK7LNATpmqt57w9m1keLKu4Y0zbvWjJX8SWqKC6b6mj-23Y0xg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.4-rc2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes for v5.4-rc2.
Thanks.



The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.4

for you to fetch changes up to 86cdd2fdc4e39c388d39c7ba2396d1a9dfd66226:

  kheaders: make headers archive reproducible (2019-10-05 15:29:49 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.4

 - remove unneeded ar-option and KBUILD_ARFLAGS

 - remove long-deprecated SUBDIRS

 - fix modpost to suppress false-positive warnings for UML builds

 - fix namespace.pl to handle relative paths to ${objtree}, ${srctree}

 - make setlocalversion work for /bin/sh

 - make header archive reproducible

 - fix some Makefiles and documents

----------------------------------------------------------------
Alex Gaynor (1):
      kbuild: correct formatting of header in kbuild module docs

Dmitry Goldin (1):
      kheaders: make headers archive reproducible

Jacob Keller (1):
      namespace: fix namespace.pl script to support relative paths

Masahiro Yamada (10):
      kbuild: remove ar-option and KBUILD_ARFLAGS
      kbuild: remove SUBDIRS support
      modpost: fix static EXPORT_SYMBOL warnings for UML build
      integrity: remove unneeded, broken attempt to add -fshort-wchar
      integrity: remove pointless subdir-$(CONFIG_...)
      video/logo: remove unneeded *.o pattern from clean-files
      video/logo: do not generate unneeded logo C files
      scripts/setlocalversion: clear local variable to make it work for sh
      kbuild: two minor updates for Documentation/kbuild/modules.rst
      kbuild: update compile-test header list for v5.4-rc2

 Documentation/kbuild/makefiles.rst           |  5 -----
 Documentation/kbuild/modules.rst             |  7 +++---
 Documentation/kbuild/reproducible-builds.rst | 13 +++++++----
 Makefile                                     | 24 ++-------------------
 arch/powerpc/boot/Makefile                   |  2 +-
 drivers/video/logo/Makefile                  | 21 ++----------------
 kernel/gen_kheaders.sh                       |  5 ++++-
 scripts/Kbuild.include                       |  5 -----
 scripts/Makefile.build                       |  2 +-
 scripts/Makefile.lib                         |  2 +-
 scripts/mod/modpost.c                        | 13 +++++++----
 scripts/namespace.pl                         | 13 +++++------
 scripts/setlocalversion                      |  2 +-
 security/integrity/Makefile                  |  3 ---
 usr/include/Makefile                         | 10 ---------
 15 files changed, 41 insertions(+), 86 deletions(-)


-- 
Best Regards
Masahiro Yamada
