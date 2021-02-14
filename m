Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B976931B168
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Feb 2021 18:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhBNREL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Feb 2021 12:04:11 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:58936 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhBNREK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Feb 2021 12:04:10 -0500
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 11EH2tJ2003874;
        Mon, 15 Feb 2021 02:02:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11EH2tJ2003874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613322176;
        bh=9P9gW0FejU9AqllvKh/W7ry9uxtyXcglrhbf/Rv4S5Q=;
        h=From:Date:Subject:To:Cc:From;
        b=OIM66JPOP5b+exkFzq2vTRraAs7ZKgvqkUhXoJopfoP86tUCADI95b46AjWdhVlac
         pVR/POLR7zy0l8RdIvVXlOQpn5SLioQDvu8Ukt+8gLQLH1Z04FgxEPXcr/yL4ocqwn
         2j8EkVeLPcZo00gxKNtleT029Ced3BlwMha5IQqfXqpx4cTTsOxRidKQ1KYL//ER95
         aeKkwgsv2FZuqAKymHwqdeE6zKlesbVpoR97yxMQJ6AE8TD8lFrKuYcSYheKMdQPsw
         mvmHjY8mFHfV52eCD9ULI/CCeYn5z1flvwOnCg3tDlHZ4wLFtLMJaHVCE/DCOs2+nI
         8jbLhuXinqvTQ==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id 189so2773858pfy.6;
        Sun, 14 Feb 2021 09:02:56 -0800 (PST)
X-Gm-Message-State: AOAM530lYcpfbwAHNP6vJnG9x50KN2kIZAsUKsU0jFXiq/874LaGB7fN
        BWjQjCUmMnUKVKqtYdecprkh+QdWqWI9bWc1/dM=
X-Google-Smtp-Source: ABdhPJwqaJ68LH7/bMJ/hFQnqSMVHi/zZualzYgDlrC8b0mqF5fvUm8VFhbcmSMfhRiZGOLAWIVJR/sqpIJDaoOuCjk=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr11950956pgf.47.1613322175451;
 Sun, 14 Feb 2021 09:02:55 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 15 Feb 2021 02:02:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpVZdyiN4Ug5zujSFnX5OesaVkFX7aP0feZHEF4DVHWQ@mail.gmail.com>
Message-ID: <CAK7LNASpVZdyiN4Ug5zujSFnX5OesaVkFX7aP0feZHEF4DVHWQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.11
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes.
Thanks.

The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.11-3

for you to fetch changes up to fe968c41ac4f4ec9ffe3c4cf16b72285f5e9674f:

  scripts: set proper OpenSSL include dir also for sign-file
(2021-02-15 01:54:11 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.11 (3rd)

 - Fix CONFIG_TRIM_UNUSED_KSYMS build for ppc64

 - Use pkg-config for scripts/sign-file.c CFLAGS

----------------------------------------------------------------
Masahiro Yamada (2):
      kbuild: fix CONFIG_TRIM_UNUSED_KSYMS build for ppc64
      sparc: remove wrong comment from arch/sparc/include/asm/Kbuild

Rolf Eike Beer (1):
      scripts: set proper OpenSSL include dir also for sign-file

 arch/sparc/include/asm/Kbuild | 2 --
 scripts/Makefile              | 1 +
 scripts/gen_autoksyms.sh      | 3 +++
 3 files changed, 4 insertions(+), 2 deletions(-)




-- 
Best Regards
Masahiro Yamada
