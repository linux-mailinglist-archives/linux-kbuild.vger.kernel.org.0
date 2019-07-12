Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2AA674C0
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 19:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfGLRzh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 13:55:37 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53748 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbfGLRzh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 13:55:37 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x6CHtICg005544;
        Sat, 13 Jul 2019 02:55:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6CHtICg005544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562954119;
        bh=IqGdaw89NC7jQA6glFwg1SOlN6jr5TBH9OPP0NUcrgs=;
        h=From:Date:Subject:To:Cc:From;
        b=fDTf9SdCdtHNvdYuc/HShR54dtSJTSTIukOBwZdfnbTjjq6B0siqUixlVznX0oUK+
         VbKV9Kcc6MMxYU9sk+nyEkYfaH7WVcP5y4QeGacjdR/PxlTxFzQSYI0iB/k7SWoZx1
         hc0q7dNVHgRvkKnq3ZFYSStsnEe07Zq6s2Q7nWx440Unsr49eJ/Smh2DjJDpYYkKDY
         HkjPwuUoHG/3xAeBfQfqhhCL0oedGykCIdw4r18yZ6P5+RLC/qytk6DpcgCERPBWtG
         NAOn73JtNIU3P+TiJ63RX57LP668aUwF1E1RqGuiKU3AObcqajEcYIgjZYgIYUSw2P
         +GUH9MsQq8w9g==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id r3so7218608vsr.13;
        Fri, 12 Jul 2019 10:55:19 -0700 (PDT)
X-Gm-Message-State: APjAAAW253gfNWbs5Up7+T0OUzRLU5NGddCZSDSZVDF7e27ni29YGZjC
        XGFyV5oKSXjhLLecepBPgXu8TYi6lVdRJT3iOoE=
X-Google-Smtp-Source: APXvYqxAlVhm4OOqGeiqd6G0bfZAoHjbLi3LnJsOtLT1hggv01bQTt8pVbIyda4TFW6uV5xap2z3kvkl3m9fkXT2GVs=
X-Received: by 2002:a67:f495:: with SMTP id o21mr9295098vsn.54.1562954118286;
 Fri, 12 Jul 2019 10:55:18 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 13 Jul 2019 02:54:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQAs0fGSXnv_Un7bL1PbtbRtu2tTUrCsQv-jt_o_1R3VA@mail.gmail.com>
Message-ID: <CAK7LNAQAs0fGSXnv_Un7bL1PbtbRtu2tTUrCsQv-jt_o_1R3VA@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.3-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     masahiroy@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.3-rc1.
Thanks!


The following changes since commit d1fdb6d8f6a4109a4263176c84b899076a5f8008:

  Linux 5.2-rc4 (2019-06-08 20:24:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.3

for you to fetch changes up to e3cd5136a4ecece6a7599a07add0dfb811a7f49d:

  kconfig: remove meaningless if-conditional in conf_read()
(2019-07-11 23:37:55 +0900)

----------------------------------------------------------------
Kconfig updates for v5.3

- always require argument for --defconfig and remove the hard-coded
  arch/$(ARCH)/defconfig path

- make arch/$(SRCARCH)/configs/defconfig the new default of defconfig

- some code cleanups

----------------------------------------------------------------
Marco Ammon (1):
      kconfig: Fix spelling of sym_is_changable

Masahiro Yamada (6):
      kconfig: remove always false ifeq ($(KBUILD_DEFCONFIG,) conditional
      kconfig: require the argument of --defconfig
      kconfig: add static qualifier to expand_string()
      kconfig: make arch/*/configs/defconfig the default of KBUILD_DEFCONFIG
      unicore32: rename unicore32_defconfig to defconfig
      kconfig: remove meaningless if-conditional in conf_read()

 arch/alpha/Makefile                                    |  2 --
 arch/arm64/Makefile                                    |  2 --
 arch/csky/Makefile                                     |  1 -
 arch/nds32/Makefile                                    |  2 --
 arch/riscv/Makefile                                    |  2 --
 arch/s390/Makefile                                     |  2 --
 arch/unicore32/Makefile                                |  3 +--
 .../configs/{unicore32_defconfig => defconfig}         |  0
 scripts/kconfig/Makefile                               |  8 +++++---
 scripts/kconfig/conf.c                                 | 10 ++++------
 scripts/kconfig/confdata.c                             | 25
+++---------------------
 scripts/kconfig/lkc.h                                  |  1 -
 scripts/kconfig/lkc_proto.h                            |  3 +--
 scripts/kconfig/mconf.c                                | 10 +++++-----
 scripts/kconfig/nconf.c                                | 10 +++++-----
 scripts/kconfig/preprocess.c                           |  3 ++-
 scripts/kconfig/qconf.cc                               |  2 +-
 scripts/kconfig/symbol.c                               |  2 +-
 18 files changed, 28 insertions(+), 60 deletions(-)
 rename arch/unicore32/configs/{unicore32_defconfig => defconfig} (100%)

-- 
Best Regards
Masahiro Yamada
