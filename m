Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53DD2D0504
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Dec 2020 13:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgLFM56 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Dec 2020 07:57:58 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:19806 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgLFM56 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Dec 2020 07:57:58 -0500
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0B6Cuuoh022591;
        Sun, 6 Dec 2020 21:56:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0B6Cuuoh022591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1607259417;
        bh=gbIpeIkRESVhlsRy63GztoRY1RdZYOlRiuk3WB+Rdwk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1fkgfoQM4+zB01OeIC6dC0yEsxiUv0OKewB1OPpiftWSR27XmaPQoj6651oWHwnRY
         0KRny6gm/4vXWy0/QQUPFBw4Yku6oHqt/w2S3svovHV/CEolPiRFhMSgpSM6yuw8ki
         VA8YBcEBTT3JGQxo/2Ithnd+rhnvUiSptcOxlECu/gAAeBGuQRGpQ8g4aTDzsGtOh4
         exmWG6+00/FF0I2C9hgplgNnRXLAQH2C08lxuME6hnWVX3P+PO48CZO5x5nu1nV3iC
         8m0jryUTMUFcjx+bMcvYKgt5QTg1JimZKYdH16kEN7cpVcQ6pHnd8yEtflxw6DQvLu
         1/MiGBF6X0pig==
X-Nifty-SrcIP: [209.85.215.174]
Received: by mail-pg1-f174.google.com with SMTP id w16so6578673pga.9;
        Sun, 06 Dec 2020 04:56:57 -0800 (PST)
X-Gm-Message-State: AOAM532zwGhmt63iujtebcKxEupPrw5AP8VY2i070TFWrlIYA/4cuBcE
        j4Auxm4Ds+PaPkky72NJubFhxvF0sd2z6i43Y6g=
X-Google-Smtp-Source: ABdhPJzteZp219zhz+wSg7qnEEkJgRUoJJd2Oig5kInGuhzNbpTUiveQwxVN0N1Y2J6Pet7pLqCWjpbmH31H1bVhIXM=
X-Received: by 2002:aa7:9501:0:b029:155:3b11:d5c4 with SMTP id
 b1-20020aa795010000b02901553b11d5c4mr11632573pfp.76.1607259416261; Sun, 06
 Dec 2020 04:56:56 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASVM_r0q6vQzjzTivu-bhOxgDwm4rsJzT5j7TFJmwOViA@mail.gmail.com>
In-Reply-To: <CAK7LNASVM_r0q6vQzjzTivu-bhOxgDwm4rsJzT5j7TFJmwOViA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 6 Dec 2020 21:56:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ89DmUWajCk6kssBa5rLFDUh6EYgROW=cY3-i_SQJHDA@mail.gmail.com>
Message-ID: <CAK7LNAQ89DmUWajCk6kssBa5rLFDUh6EYgROW=cY3-i_SQJHDA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v5.10-rc6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The email subject should be "Kbuild fixes for v5.10-rc7",
not for v5.10-rc6.





On Sun, Dec 6, 2020 at 9:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Linus,
>
> Please pull some more Kbuild fixes for v5.10
> Thanks.
>
>
>
> The following changes since commit 418baf2c28f3473039f2f7377760bd8f6897ae18:
>
>   Linux 5.10-rc5 (2020-11-22 15:36:08 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> tags/kbuild-fixes-v5.10-2
>
> for you to fetch changes up to 7d32358be8acb119dcfe39b6cf67ec6d94bf1fe7:
>
>   kbuild: avoid split lines in .mod files (2020-12-06 21:09:28 +0900)
>
> ----------------------------------------------------------------
> Kbuild fixes for v5.10 (2nd)
>
>  - Move -Wcast-align to W=3, which tends to be false-positive and there
>    is no tree-wide solution.
>
>  - Pass -fmacro-prefix-map to KBUILD_CPPFLAGS because it is a preprocessor
>    option and makes sense for .S files as well.
>
>  - Disable -gdwarf-2 for Clang's integrated assembler to avoid warnings.
>
>  - Disable --orphan-handling=warn for LLD 10.0.1 to avoid warnings.
>
>  - Fix undesirable line breaks in *.mod files.
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       Makefile.extrawarn: move -Wcast-align to W=3
>
> Denys Zagorui (1):
>       kbuild: use -fmacro-prefix-map for .S sources
>
> Masahiro Yamada (1):
>       kbuild: avoid split lines in .mod files
>
> Nathan Chancellor (2):
>       kbuild: Hoist '--orphan-handling' into Kconfig
>       kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1
>
> Nick Desaulniers (1):
>       Kbuild: do not emit debug info for assembly with LLVM_IAS=1
>
>  MAINTAINERS                       |  1 +
>  Makefile                          | 10 +++++++++-
>  arch/Kconfig                      |  9 +++++++++
>  arch/arm/Kconfig                  |  1 +
>  arch/arm/Makefile                 |  4 ----
>  arch/arm/boot/compressed/Makefile |  4 +++-
>  arch/arm64/Kconfig                |  1 +
>  arch/arm64/Makefile               |  4 ----
>  arch/powerpc/Kconfig              |  1 +
>  arch/powerpc/Makefile             |  1 -
>  arch/x86/Kconfig                  |  1 +
>  arch/x86/Makefile                 |  3 ---
>  arch/x86/boot/compressed/Makefile |  4 +++-
>  init/Kconfig                      | 10 ++++++++++
>  scripts/Makefile.build            | 12 ++++--------
>  scripts/Makefile.extrawarn        |  2 +-
>  scripts/lld-version.sh            | 20 ++++++++++++++++++++
>  17 files changed, 64 insertions(+), 24 deletions(-)
>  create mode 100755 scripts/lld-version.sh
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
Masahiro Yamada
