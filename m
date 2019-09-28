Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E83BC11CB
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2019 20:41:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbfI1SlS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Sep 2019 14:41:18 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:24430 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726581AbfI1SlS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Sep 2019 14:41:18 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x8SIf5OY018467;
        Sun, 29 Sep 2019 03:41:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x8SIf5OY018467
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569696066;
        bh=7ECRhsrVXAAar5qcH/YLtKtZCVs/Y0z4AqNehyRGS5E=;
        h=From:Date:Subject:To:Cc:From;
        b=sDvBwBzWwdBh1pRwc9Y5RdtHYtPSjvoUnb8gFxV2ys7dXpcLd9aBL1ClN226g9oC2
         /AepTPbwV84c7GXCZ7zMlDkepB8VViM1QY7izOvLQ76x5HXx8OsFwNa9eDvMoxasUJ
         3dlW62B33vSC8AZ/zoXd73Hf9R7K/n6qe8hM6FyZ6N5mLUOsI2mSsqudNkl6lnYi32
         G2IWXvo0S4C3mDtyq8W19/3RkZ7gIlVItjtWw5oo/Yi9iKlJNVfJGLBCMAgg8sfoDs
         sToW3q4GjUcvE+VQ38C5YawxZV7wYOLi0BdhtGmEGu1nRg/40FBAqVLssgguBdzlhp
         C1MTMiARVsBSA==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id s7so4116934vsl.2;
        Sat, 28 Sep 2019 11:41:06 -0700 (PDT)
X-Gm-Message-State: APjAAAVPwfCKgD6qjd3Lq9Es90ZzxhFJuxCvd4Q2dpuMvdN6g3IrBKdX
        qQ1utfqaqse0xJgw4EeriI5XRNC6vkndyN+iOZs=
X-Google-Smtp-Source: APXvYqzkWAoZ1/52eE9I9NOWLu9GWcDATwqWXa1E4zWov04UYDu9ULiEOQwOdLO0hP9knbFNjjgxs97rlXdzKu8pU70=
X-Received: by 2002:a67:7c03:: with SMTP id x3mr5889924vsc.155.1569696064796;
 Sat, 28 Sep 2019 11:41:04 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 29 Sep 2019 03:40:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
Message-ID: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
Subject: [GIT PULL] More Kbuild updates for v5.4-rc1
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

Please pull some more updates for v5.4-rc1

Thanks.



The following changes since commit 351c8a09b00b5c51c8f58b016fffe51f87e2d820:

  Merge branch 'i2c/for-5.4' of
git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux (2019-09-24
16:48:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.4-2

for you to fetch changes up to 69305e9506cc5513862421ae31111f27de1f28a5:

  namespace: fix namespace.pl script to support relative paths
(2019-09-29 03:07:44 +0900)

----------------------------------------------------------------
Kbuild updates for v5.4 (2nd)

 - remove unneeded asm headers for hexagon and ia64

 - remove unneeded ar-option and KBUILD_ARFLAGS

 - remove long-deprecated SUBDIRS

 - fix false-positive "static EXPORT_SYMBOL" modpost warnings for UML

 - detect missing include guard by header compile-test

 - stop using wildcard patterns for in-kernel header test

 - fix scripts/namespace.pl to handle relative ${objtree}, ${srctree}

 - misc Makefile fixes and cleanups

----------------------------------------------------------------
Alex Gaynor (1):
      Corrected formatting of header in kbuild module docs

Jacob Keller (1):
      namespace: fix namespace.pl script to support relative paths

Masahiro Yamada (15):
      hexagon: remove asm/bitsperlong.h
      ia64: remove unneeded uapi asm-generic wrappers
      integrity: remove unneeded, broken attempt to add -fshort-wchar
      integrity: remove pointless subdir-$(CONFIG_...)
      video/logo: remove unneeded *.o pattern from clean-files
      video/logo: do not generate unneeded logo C files
      video/logo: simplify cmd_logo
      video/logo: move pnmtologo tool to drivers/video/logo/ from scripts/
      kconfig: split util.c out of parser.y
      kbuild: remove ar-option and KBUILD_ARFLAGS
      kbuild: remove SUBDIRS support
      modpost: fix static EXPORT_SYMBOL warnings for UML build
      kbuild: update compile-test header list for v5.4-rc1
      kbuild: detect missing header include guard
      kbuild: stop using wildcard patterns for in-kernel header test

 Documentation/kbuild/makefiles.rst          |    5 -
 Documentation/kbuild/modules.rst            |    3 +-
 Makefile                                    |   24 +-
 arch/hexagon/include/uapi/asm/bitsperlong.h |   27 -
 arch/ia64/include/uapi/asm/errno.h          |    2 -
 arch/ia64/include/uapi/asm/ioctl.h          |    2 -
 arch/ia64/include/uapi/asm/ioctls.h         |    7 -
 arch/powerpc/boot/Makefile                  |    2 +-
 drivers/video/logo/.gitignore               |    1 +
 drivers/video/logo/Makefile                 |   36 +-
 {scripts => drivers/video/logo}/pnmtologo.c |    0
 include/Kbuild                              | 1205 +---------------------
 include/acpi/Kbuild                         |   18 +
 include/clocksource/Kbuild                  |    8 +
 include/crypto/Kbuild                       |   63 ++
 include/drm/Kbuild                          |   89 ++
 include/keys/Kbuild                         |   10 +
 include/kvm/Kbuild                          |    5 +
 include/linux/Kbuild                        | 1175 +++++++++++++++++++++
 include/linux/byteorder/Kbuild              |    4 +
 include/linux/ceph/Kbuild                   |   19 +
 include/linux/i3c/Kbuild                    |    5 +
 include/linux/iio/Kbuild                    |   22 +
 include/linux/mfd/Kbuild                    |  154 +++
 include/linux/mmc/Kbuild                    |   14 +
 include/linux/mtd/Kbuild                    |   31 +
 include/linux/pinctrl/Kbuild                |   10 +
 include/linux/platform_data/Kbuild          |  148 +++
 include/linux/regulator/Kbuild              |   26 +
 include/linux/sched/Kbuild                  |   28 +
 include/linux/spi/Kbuild                    |   18 +
 include/linux/sunrpc/Kbuild                 |   28 +
 include/linux/usb/Kbuild                    |   41 +
 include/math-emu/Kbuild                     |    6 +
 include/media/Kbuild                        |  100 ++
 include/misc/Kbuild                         |    5 +
 include/net/Kbuild                          |  239 +++++
 include/pcmcia/Kbuild                       |    6 +
 include/ras/Kbuild                          |    3 +
 include/rdma/Kbuild                         |   38 +
 include/scsi/Kbuild                         |   19 +
 include/soc/Kbuild                          |   26 +
 include/sound/Kbuild                        |   93 ++
 include/target/Kbuild                       |    6 +
 include/trace/Kbuild                        |   85 ++
 include/vdso/Kbuild                         |    4 +
 include/video/Kbuild                        |   32 +
 include/xen/Kbuild                          |    9 +
 scripts/.gitignore                          |    1 -
 scripts/Kbuild.include                      |    5 -
 scripts/Makefile                            |    2 -
 scripts/Makefile.build                      |    5 +-
 scripts/Makefile.lib                        |    2 +-
 scripts/kconfig/Makefile                    |    2 +-
 scripts/kconfig/parser.y                    |    1 -
 scripts/mod/modpost.c                       |   13 +-
 scripts/namespace.pl                        |   13 +-
 security/integrity/Makefile                 |    3 -
 usr/include/Makefile                        |   12 +-
 59 files changed, 2646 insertions(+), 1314 deletions(-)
 delete mode 100644 arch/hexagon/include/uapi/asm/bitsperlong.h
 delete mode 100644 arch/ia64/include/uapi/asm/errno.h
 delete mode 100644 arch/ia64/include/uapi/asm/ioctl.h
 delete mode 100644 arch/ia64/include/uapi/asm/ioctls.h
 rename {scripts => drivers/video/logo}/pnmtologo.c (100%)
 create mode 100644 include/acpi/Kbuild
 create mode 100644 include/clocksource/Kbuild
 create mode 100644 include/crypto/Kbuild
 create mode 100644 include/drm/Kbuild
 create mode 100644 include/keys/Kbuild
 create mode 100644 include/kvm/Kbuild
 create mode 100644 include/linux/Kbuild
 create mode 100644 include/linux/byteorder/Kbuild
 create mode 100644 include/linux/ceph/Kbuild
 create mode 100644 include/linux/i3c/Kbuild
 create mode 100644 include/linux/iio/Kbuild
 create mode 100644 include/linux/mfd/Kbuild
 create mode 100644 include/linux/mmc/Kbuild
 create mode 100644 include/linux/mtd/Kbuild
 create mode 100644 include/linux/pinctrl/Kbuild
 create mode 100644 include/linux/platform_data/Kbuild
 create mode 100644 include/linux/regulator/Kbuild
 create mode 100644 include/linux/sched/Kbuild
 create mode 100644 include/linux/spi/Kbuild
 create mode 100644 include/linux/sunrpc/Kbuild
 create mode 100644 include/linux/usb/Kbuild
 create mode 100644 include/math-emu/Kbuild
 create mode 100644 include/media/Kbuild
 create mode 100644 include/misc/Kbuild
 create mode 100644 include/net/Kbuild
 create mode 100644 include/pcmcia/Kbuild
 create mode 100644 include/ras/Kbuild
 create mode 100644 include/rdma/Kbuild
 create mode 100644 include/scsi/Kbuild
 create mode 100644 include/soc/Kbuild
 create mode 100644 include/sound/Kbuild
 create mode 100644 include/target/Kbuild
 create mode 100644 include/trace/Kbuild
 create mode 100644 include/vdso/Kbuild
 create mode 100644 include/video/Kbuild
 create mode 100644 include/xen/Kbuild


-- 
Best Regards
Masahiro Yamada
