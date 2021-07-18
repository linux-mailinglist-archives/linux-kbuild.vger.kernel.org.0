Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D7A3CC9BC
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jul 2021 17:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbhGRPYe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 18 Jul 2021 11:24:34 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:18272 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbhGRPYe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Jul 2021 11:24:34 -0400
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 16IFLJKS001749;
        Mon, 19 Jul 2021 00:21:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 16IFLJKS001749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626621679;
        bh=94bI8XIbdkrYTDoJTP2YnBc4d8x/+TbzJfHfFZEdmDw=;
        h=From:Date:Subject:To:Cc:From;
        b=2INYdstQDj8MpApo+ss4CPLbbtUg9q//bko+nJFUK+uINY+mlD/QSOjsFRkk0Axit
         ILZr0Ebu9MbsScTgfwjE2fsVKt5myOS5cvvi+2q607uUj3rNxGUioNvGmYSWxYnnx7
         AMewQLG8nuYMlL83LhMhCiUnMWw1cnMXTSg4mNhZf9AzlALFr5OylAIvhSzG1vyb3i
         5WJ02+gyj7308Mz061NZROgjPheIseqMXCbbOA0Eg2b+K3wjp3VGsz8x8go1f8taAb
         fezpYgfvY0zX8axrpgTr+5iJwHLZOnDlS5Sas9ma7S6t5MRzWoVP9Pbqx5sFNGHJYB
         RHVFRVjOLyRMA==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id o201so13889568pfd.1;
        Sun, 18 Jul 2021 08:21:19 -0700 (PDT)
X-Gm-Message-State: AOAM5326/+eFoBj6FxoXEachEaTqxEYQpczh6Bo3yFUDGbIlC8G9aIDn
        XNO3dOGPOrpYhsi8fENFeZu00bFDUY3Eqvs9Ju4=
X-Google-Smtp-Source: ABdhPJylFtMhyWkA1Weq9xdjXS5tJitlTouANQK8hvs0urvGqJneYaN6ABGr44k3K9oSCx8qO8qggji16UhNFHKSe7M=
X-Received: by 2002:a65:498a:: with SMTP id r10mr20974249pgs.7.1626621678842;
 Sun, 18 Jul 2021 08:21:18 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 19 Jul 2021 00:20:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDiO4fsn8W11qoLMvryJadsgoHm6HeXFvqOz5Mzzb1Jw@mail.gmail.com>
Message-ID: <CAK7LNAQDiO4fsn8W11qoLMvryJadsgoHm6HeXFvqOz5Mzzb1Jw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.14-rc2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks.



The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.14

for you to fetch changes up to 5e60f363b38fd40e4d8838b5d6f4d4ecee92c777:

  Documentation: Fix intiramfs script name (2021-07-18 23:48:14 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.14

 - Restore the original behavior of scripts/setlocalversion when
   LOCALVERSION is set to empty.

 - Show Kconfig prompts even for 'make -s'

 - Fix the combination of COFNIG_LTO_CLANG=y and CONFIG_MODVERSIONS=y
   for older GNU Make versions

----------------------------------------------------------------
Lecopzer Chen (1):
      Kbuild: lto: fix module versionings mismatch in GNU make 3.X

Masahiro Yamada (1):
      kbuild: do not suppress Kconfig prompts for silent build

Mikulas Patocka (1):
      scripts/setlocalversion: fix a bug when LOCALVERSION is empty

Robert Richter (1):
      Documentation: Fix intiramfs script name

 Documentation/driver-api/early-userspace/early_userspace_support.rst
|  8 ++++----
 Documentation/filesystems/ramfs-rootfs-initramfs.rst                 |  2 +-
 Makefile
|  9 +++++----
 scripts/Makefile.build                                               |  2 +-
 scripts/setlocalversion
| 13 ++++++++-----
 5 files changed, 19 insertions(+), 15 deletions(-)


-- 
Best Regards
Masahiro Yamada
