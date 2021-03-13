Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD19339DF3
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Mar 2021 12:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhCMLyW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Mar 2021 06:54:22 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:49115 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230349AbhCMLyM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Mar 2021 06:54:12 -0500
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 12DBrdfe012530;
        Sat, 13 Mar 2021 20:53:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 12DBrdfe012530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615636419;
        bh=UsbgXShxta9Fb/uiVHXrhCHY1/IMnaOpCflVSeL+MgE=;
        h=From:Date:Subject:To:Cc:From;
        b=O2CGeWQV9FiH25lMWe6VKJySU4M4qK/MwfMgJtsqyqVmgiOzvHXn3aLQmV6vhXO6Y
         zf9GcXb0pk+jiF6c8G0G92oZMs+LwO+fyeadvjaEEGDBjPRq5L4T9bBjQi/3B/7pon
         bGaP3ytT5rBU+hq99C/kjiSEQtKnFaf2zC5trPnyOs5gOMj1xGXCgM2cDS6KF2iGMS
         HVRjNTnk2RgwuVo21TSvxLtOdCuYTwGeaKL6HB6+8Ir+idyV01TwbsVl907Gmh4OXu
         Y7sztd2bTW+JweyZne6nFM+hE3POhIAtIeKkspcYvgwCRTyA+TW7j0Hn2nKvd0qWiH
         GoaVz/h5FkG0A==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id t37so6767928pga.11;
        Sat, 13 Mar 2021 03:53:39 -0800 (PST)
X-Gm-Message-State: AOAM5319V2FYtksRcCTcaP8lsvIRawxEATx3ZAbPelzbJwJkfY8o7Hsb
        pHvDmIm27sGpD66P2qpeXM/1wz0v1QJUMS3iPl8=
X-Google-Smtp-Source: ABdhPJwE3Ogz52Abg8ZsfVKn7qjTcySSnmNZ/GZvlbthwU1ctsNhqdOoDMmuaTtN7nlCe2FGBV0APb06vDDIrqNNAuI=
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id
 h22-20020a62b4160000b02901e4fb5a55bbmr2548330pfn.80.1615636418698; Sat, 13
 Mar 2021 03:53:38 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 13 Mar 2021 20:53:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqcLBbLVn5Ft+1-m_uC5WC=9HAx2orbopsOJnZ7SRgqQ@mail.gmail.com>
Message-ID: <CAK7LNATqcLBbLVn5Ft+1-m_uC5WC=9HAx2orbopsOJnZ7SRgqQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.12-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes.
Thanks.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15=
:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.12-2

for you to fetch changes up to bcbcf50f521843445c9ea320a0569874f88c4b7a:

  kbuild: fix ld-version.sh to not be affected by locale (2021-03-13
11:12:13 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.12 (2nd)

 - avoid 'make image_name' invoking syncconfig

 - fix a couple of bugs in scripts/dummy-tools.

 - fix LLD_VENDOR and locale issues in scripts/ld-version.sh

 - rebuild GCC plugins when the compiler is upgraded

 - allow LTO to be enabled with KASAN_HW_TAGS

 - allow LTO to be enabled without LLVM=3D1

----------------------------------------------------------------
Bernhard Rosenkr=C3=A4nzer (1):
      kbuild: Fix ld-version.sh script if LLD was built with LLD_VENDOR

Jiri Slaby (2):
      kbuild: dummy-tools: fix inverted tests for gcc
      kbuild: dummy-tools: support MPROFILE_KERNEL checks for ppc

Masahiro Yamada (7):
      kbuild: add image_name to no-sync-config-targets
      kbuild: rebuild GCC plugins when the compiler is upgraded
      kbuild: dummy-tools: adjust to scripts/cc-version.sh
      kbuild: remove unneeded -O option to dtc
      kbuild: remove LLVM=3D1 test from HAS_LTO_CLANG
      kbuild: remove meaningless parameter to $(call if_changed_rule,dtc)
      kbuild: fix ld-version.sh to not be affected by locale

Sami Tolvanen (1):
      kbuild: Allow LTO to be selected with KASAN_HW_TAGS

 Makefile                         |  4 +++-
 arch/Kconfig                     |  3 +--
 include/linux/compiler-version.h | 14 ++++++++++++++
 include/linux/kconfig.h          |  2 --
 init/Kconfig                     |  8 ++++----
 scripts/Makefile.lib             |  4 ++--
 scripts/dummy-tools/gcc          | 18 ++++++++++++++++--
 scripts/gcc-plugins/Makefile     |  1 +
 scripts/ld-version.sh            | 22 ++++++++++++++--------
 9 files changed, 55 insertions(+), 21 deletions(-)
 create mode 100644 include/linux/compiler-version.h

--=20
Best Regards
Masahiro Yamada
