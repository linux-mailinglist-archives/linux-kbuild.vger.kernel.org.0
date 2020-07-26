Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A35822E28B
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Jul 2020 22:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgGZUdr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 26 Jul 2020 16:33:47 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56059 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGZUdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Jul 2020 16:33:47 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 06QKXAju002049;
        Mon, 27 Jul 2020 05:33:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 06QKXAju002049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1595795591;
        bh=Wr805kZZMPky1w2j3QyQhPyUMy4aoK/zsMoAmfS796s=;
        h=From:Date:Subject:To:Cc:From;
        b=UabQlkn34032by3sf5BcqAU/opFn8I3zUUwWLjWpE7T6Tnoc/DFYLg8/UlPGtfYHz
         lZBy70820s7oo7cA6lhAVpTajeZH2W9CyKfECW2H2LK5oY8lIsLCkDu3zWzrzd4SpZ
         VX+J+CDmPOit8hBezPkHFRHzZ8lF/IYU3e7UM5a/eCzIQXFxAlwPD+4IYYQXijJIws
         gdk94wchWqSH4toEDbHo9sDEpG6Jl0O7LM0RIbMFdv/nEdpk/VG4+pRQ63LpthYHyp
         fGc2zM7cCQL5GNLvBbuaSlzV0Z5iPIkyL/uXIzowAA9p9kZEGAdLOKikeW/reP23n/
         6e6nkoNu7JUyQ==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id y8so1008133vsq.8;
        Sun, 26 Jul 2020 13:33:10 -0700 (PDT)
X-Gm-Message-State: AOAM5333CUm3HXTLuBqwOgk5NvZxQXeNxDbcI7jRXSAeFqtt1rTXYZjt
        kEGmfENp0Pcz90nlQB86OqhD4mIb9gQmoIZuemo=
X-Google-Smtp-Source: ABdhPJwamUALWKCuRknmWAZTVVlGgycKzFamdM8xsTmrJH01BR1sv9ePRSd1WeB4Ti02AzP9F4N2jGpKSvHI6Sz7Krg=
X-Received: by 2002:a67:6c84:: with SMTP id h126mr13976667vsc.181.1595795589584;
 Sun, 26 Jul 2020 13:33:09 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 27 Jul 2020 05:32:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNYmyeB1ZWQ1t4bLZtC4+08TUNtjobwyj4-7e-7BOPAw@mail.gmail.com>
Message-ID: <CAK7LNAQNYmyeB1ZWQ1t4bLZtC4+08TUNtjobwyj4-7e-7BOPAw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.8-rc7
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some more Kbuild fixes.
Thanks.


The following changes since commit dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258:

  Linux 5.8-rc4 (2020-07-05 16:20:22 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.8-3

for you to fetch changes up to ca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51:

  Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
(2020-07-23 11:29:07 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.8 (3rd)

 - do not use non-portable strsep() in a host program

 - fix single target builds for external modules

 - change Clang's --prefix option to make it work for the latest Clang

----------------------------------------------------------------
Fangrui Song (1):
      Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation

H. Nikolaus Schaller (1):
      modpost: remove use of non-standard strsep() in HOSTCC code

Masahiro Yamada (1):
      kbuild: fix single target builds for external modules

 Makefile              |  4 ++--
 scripts/mod/modpost.c | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)



-- 
Best Regards
Masahiro Yamada
