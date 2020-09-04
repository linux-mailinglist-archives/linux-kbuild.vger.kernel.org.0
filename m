Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CC825D889
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 14:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgIDMWX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Sep 2020 08:22:23 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17166 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730178AbgIDMWM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Sep 2020 08:22:12 -0400
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 084CLpaQ011231;
        Fri, 4 Sep 2020 21:21:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 084CLpaQ011231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599222112;
        bh=x/yifUkRlLB9UfaYl2xOtzBdludps5JWV6bLncouj9I=;
        h=From:Date:Subject:To:Cc:From;
        b=nf2TRHly49akD82vhEhEEbsHMDBf8X1SxMqTHU1lG0tjL37MivfjASDgFum6TOh7+
         14bx9o5drUHJ4rVXGh3y6L6hyfC/rtjLBv1/6Dr8bXBIIW6UaffwetiLnSbEDAj3Qt
         lHg+Tw8G1781tRG/nMXuy8+dD7Fs4GGfEI5yDpy9+/x/ty2BW5kbqNfUlWQswXHije
         +Ge40lWZnx3StIboU/vGdCsWssYhkxB2ZCMjMaxUlFa7Vr3HGINK6r5xrmZ59A4K7+
         GjXxqM6xLpy3D0qVKyDTykS4TxnDD67pdFbvY1b3/0wMddWJfClC00TxK+iIIi7H3A
         9CKhFW/G5HVdg==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id z19so2350395pfn.8;
        Fri, 04 Sep 2020 05:21:52 -0700 (PDT)
X-Gm-Message-State: AOAM5302s+HakfyqFe/0Htsc+gnNa5WXJhBCbK1FLEQVG1IewrUhZ3wP
        o1B2OSP+BHVVzitdOcb4uqUsXamyH0vDurK+dCM=
X-Google-Smtp-Source: ABdhPJxR8TuiL2dzc+6fOXXOG8sgGhT2/b32RqcFUy7Sd3rZ5Il4s/mb77ioLvbfsHdsSNTG7d1NGP9NdbO9bYrtBQw=
X-Received: by 2002:a62:8007:0:b029:13c:1611:6533 with SMTP id
 j7-20020a6280070000b029013c16116533mr6500008pfd.5.1599222111283; Fri, 04 Sep
 2020 05:21:51 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 4 Sep 2020 21:21:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNARx_s1pyrU=PKSWLr6nX7=+=U78OjXVNdX7B2-bXzpX6Q@mail.gmail.com>
Message-ID: <CAK7LNARx_s1pyrU=PKSWLr6nX7=+=U78OjXVNdX7B2-bXzpX6Q@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.9-rc4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes.
Thanks.



The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.9-2

for you to fetch changes up to 163e0c27fead96fd6804fa59a55fc4f841d38db8:

  kconfig: remove redundant assignment prompt = prompt (2020-09-03
12:21:22 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.9 (2nd)

 - fix documents

 - fix warning in 'make localmodconfig'

----------------------------------------------------------------
Denis Efremov (1):
      kconfig: remove redundant assignment prompt = prompt

Nathan Chancellor (1):
      Documentation/llvm: Improve formatting of commands, variables,
and arguments

Randy Dunlap (2):
      kconfig: streamline_config.pl: check defined(ENV variable) before using it
      kbuild: Documentation: clean up makefiles.rst

 Documentation/kbuild/llvm.rst        | 26 +++++++++++++-------------
 Documentation/kbuild/makefiles.rst   | 18 +++++++++---------
 scripts/kconfig/nconf.c              |  1 -
 scripts/kconfig/streamline_config.pl |  5 ++++-
 4 files changed, 26 insertions(+), 24 deletions(-)


-- 
Best Regards
Masahiro Yamada
