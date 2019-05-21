Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 345C3244DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 May 2019 02:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfEUACl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 May 2019 20:02:41 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:48083 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726370AbfEUACl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 20:02:41 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x4L02TYi011262;
        Tue, 21 May 2019 09:02:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x4L02TYi011262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558396949;
        bh=mX1sA9/aVGAIuXsfflg8yrb/ZOucTCKOj7jxvpzOq30=;
        h=From:Date:Subject:To:Cc:From;
        b=D5N1Ez5U+exIjKwS02aKwBpQX33FCk8AIYT5okAf2QyBS0lDLN07jTb2nyZFzNmCa
         RHHdRe+rp/G2+WruP562MvdhBMwPGS3hi6lDMRYDdUI5eHy8N6lDo4C1Qm3gWcEGdP
         fIDPP1lQvdehp6WqHpnIm4/hop49y5WrLU/D4Q9xtb2dkGxSC8qnANAFPm3IwV+GXg
         ImwN/ZfRhs4u1h5cAztA5uUkieJjNTSxGsUHTkbdVCqC6yuu/6rckbA8dYma9/9i0M
         P+MvfsWU+WK4ivVcMGrIyM7ws4vF61rOaSQZso63qt269daHwo//fJlqRP+M00SM1P
         6jwklen4Ro22w==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id x8so6140773vsx.13;
        Mon, 20 May 2019 17:02:29 -0700 (PDT)
X-Gm-Message-State: APjAAAU6+S70l+/kDRkSqKPtY6lNxyHcS9pffCeO0xkTWrkGiZtxahoC
        T8rgq4Pehy02d//rKVnGYIZyz557dmXpR9Y+fGQ=
X-Google-Smtp-Source: APXvYqy31Jmucr3BuoeG2CYnFptVQ9yoFkAhL9wdIee+qc4UsKZ6HAYcVbxcJyMmZo+FxYtNFyKy1fviKdrt7d79o4c=
X-Received: by 2002:a67:1783:: with SMTP id 125mr17862865vsx.54.1558396948619;
 Mon, 20 May 2019 17:02:28 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 21 May 2019 09:01:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT2wVBP_yV3P=Eg_0_UUo8xCRZdJK5x1kOufKiYFv=A+Q@mail.gmail.com>
Message-ID: <CAK7LNAT2wVBP_yV3P=Eg_0_UUo8xCRZdJK5x1kOufKiYFv=A+Q@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.2-rc2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes.

Thanks.



The following changes since commit cb6f8739fbf98203d0fb0bc2c2dbbec0ddfe978a:

  Merge branch 'akpm' (patches from Andrew) (2019-05-19 12:15:32 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.2

for you to fetch changes up to 4a33d4f17a19ece50ccf5ccbb8bc4ee539fb492e:

  kbuild: do not check name uniqueness of builtin modules (2019-05-21
08:54:05 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.2

 - remove unused cc-ldoption

 - do not check the name uniquness of builtin modules to avoid
   false positives

----------------------------------------------------------------
Masahiro Yamada (1):
      kbuild: do not check name uniqueness of builtin modules

Nick Desaulniers (1):
      kbuild: drop support for cc-ldoption

 Documentation/kbuild/makefiles.txt | 14 --------------
 scripts/Kbuild.include             |  5 -----
 scripts/modules-check.sh           |  6 +++---


-- 
Best Regards
Masahiro Yamada
