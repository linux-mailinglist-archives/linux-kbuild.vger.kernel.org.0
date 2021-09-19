Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EA3410AC8
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Sep 2021 10:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbhISIr7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Sep 2021 04:47:59 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:52431 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhISIr7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Sep 2021 04:47:59 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 18J8kBBP002856;
        Sun, 19 Sep 2021 17:46:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 18J8kBBP002856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632041172;
        bh=DDEekkGaFqKBNjX3tPU/kaM28ZerJFBn4JmLGWfb5fo=;
        h=From:Date:Subject:To:Cc:From;
        b=y+RgXuE3hHF6rekMAESS+AHMoWjGgxdjNFtJXiH2DjfeXNanuCuu2LGDRIurxBI/g
         2vWftcGOMuem3wiDyI+HJmv48gQA4BcY35v/Ou/wJI8bO6Kge8vdO3ZNy7axr0tkSr
         wF4SG2FkykIoEXxOQHKC8DKERQMzRcYa6syXbG726LXFShzakPF6pWNIsZc/vQiK7l
         cOZJmLCemjXexnhJ8Ov5I3nWjMkXxf0/4sFg5zzfi5a9zylREoVzTYhJHHTsV9A/7V
         CUqgPbJep4QG1reTphziqSyqEUO/RUXUupt51z3soQsekNxs9ALeTm/mXaTDADARVz
         fh4lzOErgvdAw==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id k23so9904589pji.0;
        Sun, 19 Sep 2021 01:46:12 -0700 (PDT)
X-Gm-Message-State: AOAM531K6L9IZ4Y9ufLJ6RTvmKoOJWQTv+zUX148/psfMgAPwh2g5bpc
        pu/3d5rocNcUQma3BUPB5Ushk1Q+utTRqJbmnuk=
X-Google-Smtp-Source: ABdhPJwbmXLQmVEX0l7edcjAqfumbkkAKNIgOzsMnaOZmc/Opehl3inMVSdL8qt19YJrRd6EoXGnENDPuYTpP5u3pG0=
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id
 h3-20020a170902f703b029012c0982c9aemr17423998plo.20.1632041171415; Sun, 19
 Sep 2021 01:46:11 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 19 Sep 2021 17:45:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ88+q0xZXLCFyUOkhCyUShmryGBY9LWAOgw6Ly6Ec8iw@mail.gmail.com>
Message-ID: <CAK7LNAQ88+q0xZXLCFyUOkhCyUShmryGBY9LWAOgw6Ly6Ec8iw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.15-rc2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks.


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.15

for you to fetch changes up to 0664684e1ebd7875e120d0cecd525bac4805f8ed:

  kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS
(2021-09-19 10:55:18 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.15

 - Fix bugs in checkkconfigsymbols.py

 - Fix missing sys import in gen_compile_commands.py

 - Fix missing FORCE warning for ARCH=sh builds

 - Fix -Wignored-optimization-argument warnings for Clang builds

 - Turn -Wignored-optimization-argument into an error in order to stop
   building instead of sprinkling warnings

----------------------------------------------------------------
Ariel Marcovitch (2):
      checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
      checkkconfigsymbols.py: Remove skipping of help lines in
parse_kconfig_file

Geert Uytterhoeven (1):
      sh: Add missing FORCE prerequisites in Makefile

Kortan (1):
      gen_compile_commands: fix missing 'sys' package

Nathan Chancellor (2):
      x86/build: Do not add -falign flags unconditionally for clang
      kbuild: Add -Werror=ignored-optimization-argument to CLANG_FLAGS

Ramji Jiyani (1):
      kbuild: Fix comment typo in scripts/Makefile.modpost

 arch/sh/boot/Makefile                       | 16 ++++++++--------
 arch/x86/Makefile_32.cpu                    | 12 +++++++++---
 scripts/Makefile.clang                      |  5 +++++
 scripts/Makefile.modpost                    |  2 +-
 scripts/checkkconfigsymbols.py              | 11 +++--------
 scripts/clang-tools/gen_compile_commands.py |  1 +
 6 files changed, 27 insertions(+), 20 deletions(-)


-- 
Best Regards
Masahiro Yamada
