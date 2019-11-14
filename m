Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 188DAFC9BE
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 16:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfKNPUI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 10:20:08 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62876 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726482AbfKNPUI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 10:20:08 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id xAEFK48h013579;
        Fri, 15 Nov 2019 00:20:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com xAEFK48h013579
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573744805;
        bh=3xRjq3uNRUjL7HgdFdr9feX3wpSW0Sa0zqEAmZVb+HE=;
        h=From:Date:Subject:To:Cc:From;
        b=aTy6eNniRWzcbIl+ZTnv6kz6TA69XYKi13+XThpw9rtQWRaqzy4Nd4QM6cIMoBuLE
         7npBx+Y5SujRoi6UQ9VOSNM1bHf3Bgi87bu2Szix3QExBsR/Mtb2PTMjxwHZI8NvmN
         2NHiNlothrf/R9/w36jx8/3OfmNRkBX/8fsHr7gi5+EhN+3eYid5dS/pEbCQIVGVHA
         m9IM1o4J3HTP32BMnkQrkU6cL8k6UP9sjSKKJa0gpNJ//b49ReZDL/cpmeP8jAIIBf
         qBnSu7H2CZM0QovcfVloQhqfbAqubTm8r6zGo+u9lWrgZa3cISTamSPb6sihzd9st/
         OgxTP40nF8sXw==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id 190so4091905vss.8;
        Thu, 14 Nov 2019 07:20:04 -0800 (PST)
X-Gm-Message-State: APjAAAV6VUcVRFQXyiwcqlLgBsY5tI8/jwNp9nmCwGKKsiFc1Wyb9zFp
        s6j5Gy50Sgdf5nuyjvg0wFGq0L+D5B+bEOrNNoA=
X-Google-Smtp-Source: APXvYqzsCpF7BoPyCPU6uyM+cv4BXaVEnVdg0L9GEzq1RIcJ6vKtAiRpl6zS9qGgnHGMwR4dKg8Y64d12gFXaUkpQnY=
X-Received: by 2002:a05:6102:3204:: with SMTP id r4mr2491856vsf.181.1573744803448;
 Thu, 14 Nov 2019 07:20:03 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 15 Nov 2019 00:19:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqoF-NVhkP9J7SyDmK-x8vQ5pDJ7U_aEngdJb_vvDixg@mail.gmail.com>
Message-ID: <CAK7LNATqoF-NVhkP9J7SyDmK-x8vQ5pDJ7U_aEngdJb_vvDixg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.4(-rc8)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes.
Thanks.


The following changes since commit 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c:

  Linux 5.4-rc7 (2019-11-10 16:17:15 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kbuild-fixes-v5.4-3

for you to fetch changes up to 80591e61a0f7e88deaada69844e4a31280c4a38f:

  kbuild: tell sparse about the $ARCH (2019-11-15 00:13:23 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.4 (3rc)

 - fix build error when compiling SPARC VDSO with CONFIG_COMPAT=y

 - pass correct --arch option to Sparse

----------------------------------------------------------------
Luc Van Oostenryck (1):
      kbuild: tell sparse about the $ARCH

Masahiro Yamada (1):
      sparc: vdso: fix build error of vdso32

 Makefile                 | 3 +++
 arch/sparc/vdso/Makefile | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)


-- 
Best Regards
Masahiro Yamada
