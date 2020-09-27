Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8834C27A20E
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Sep 2020 19:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgI0Rjn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 27 Sep 2020 13:39:43 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:19710 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgI0Rjn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 27 Sep 2020 13:39:43 -0400
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 08RHdG7M010848;
        Mon, 28 Sep 2020 02:39:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 08RHdG7M010848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1601228357;
        bh=XR63nmWE4Wsx8vlGMTUVE6dfgWyHW3V9zZklUvKsjT8=;
        h=From:Date:Subject:To:Cc:From;
        b=Ta5F24UNMpejlUpdhsCZ+crQEKeAdtpi58XgaNTbI84poEBsOWA/Qiv2+JsgDyFMR
         /mTcstVVoNp1yJruwIxLFAJv0FPglirzlzpkfs/+TdmOCdrm236DNpJhGRnwM+mwr3
         malcTEHHveaAxhtAocQS6pKtFqT4X+sF6+cSqPS2wwINXcdbVIay+uEm2rFaH5bggS
         wsvmt3BL6PuiSTwdfcFyZx7RzyCcsZJNz0NScnmZSohwYkgwmAx9asbKhd0Ps9Sd3E
         ewl0ndA7MBzCbz+h/Flh8xCrjRlaUZOI9p716CIgJ1ZGhIuyfodn1RUpBEVN3upO38
         IrzF62i9SJ6CQ==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id k8so7200552pfk.2;
        Sun, 27 Sep 2020 10:39:16 -0700 (PDT)
X-Gm-Message-State: AOAM5318i+QFtNrGjVoR0xwZHvVkM6OHbK8Vtros8Wcicj4T2zv676K2
        CXhumw6sn4mSk2N0p4JiU4KLLmQwfCNTvhR4aGQ=
X-Google-Smtp-Source: ABdhPJxxJgZmaSbssrAT+fweb7D87tqXhDgOObqeGglJ3SlDlBK3TOtFv2s4tOnVq1rgnyesMVr81VlXYyDfIS5YK/g=
X-Received: by 2002:aa7:9f4a:0:b029:142:2501:34f7 with SMTP id
 h10-20020aa79f4a0000b0290142250134f7mr7773446pfr.80.1601228355960; Sun, 27
 Sep 2020 10:39:15 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 28 Sep 2020 02:38:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTwQUtJKnEyyJySJunja4szZPHvxim5+KTA04w6wjhgA@mail.gmail.com>
Message-ID: <CAK7LNARTwQUtJKnEyyJySJunja4szZPHvxim5+KTA04w6wjhgA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.9-rc7
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull more fixes.
Thanks.


-- The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:

  Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.9-4

for you to fetch changes up to e30d694c3381b565e043cf74b0bed059db1b4ac9:

  Documentation/llvm: Fix clang target examples (2020-09-26 13:54:08 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.9 (4th)

 - Ignore compiler stubs for PPC to fix builds

 - Fix the usage of --target mentioned in the LLVM document

----------------------------------------------------------------
Florian Fainelli (1):
      Documentation/llvm: Fix clang target examples

Masahiro Yamada (1):
      scripts/kallsyms: skip ppc compiler stub *.long_branch.* / *.plt_branch.*

 Documentation/kbuild/llvm.rst |  4 ++--
 scripts/kallsyms.c            | 16 +++++++++++++++-
 2 files changed, 17 insertions(+), 3 deletions(-)

Best Regards
Masahiro Yamada
