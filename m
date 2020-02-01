Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3F114F662
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 05:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgBAEGs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jan 2020 23:06:48 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17270 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgBAEGs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jan 2020 23:06:48 -0500
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01146OcX008625;
        Sat, 1 Feb 2020 13:06:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01146OcX008625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580529985;
        bh=62+/FcHMnTbonWmz7MP3yXfafR7OX00IRPTXg5Q41b0=;
        h=From:Date:Subject:To:Cc:From;
        b=L4VxXv5yCP0tj9LPy5OZaXlKB9Yjbo2PSowHYMHHHxAi+Z0lV9+seekTyY5MhUOkN
         ChyX/Og3PeNfWZPA81PJfwEw9hF+gZXO+eEi9qSLriuAlg+zarFOCLWc2r2bPdNkWc
         oKtVpySOyLnGvDnsfP39ut2nCuyIMxvnn48LutNnpWD4fwE8YnQFoUqbkCHys1ptrs
         9ykxU8HxjIwdy0xJBm+2sNikr7dEwEGmUZ3efeEx39pehe/cHfINj5/ip6V9cTL2JR
         UXWD06nuciDK3UEpKhgJpPdljnufw7iCjLx7JUypRon1Cu5BubYcJqfwBJ6bh/VG7E
         7Bz0WMBKgLzeQ==
X-Nifty-SrcIP: [209.85.221.177]
Received: by mail-vk1-f177.google.com with SMTP id c129so2683173vkh.7;
        Fri, 31 Jan 2020 20:06:25 -0800 (PST)
X-Gm-Message-State: APjAAAVLmnefjP1nbE+0jdCeqCErixFrrC2RqIg725aZTHVICw5NwB5y
        QlB1VKIF1D56Y/zO9+P8oBz8Jc4o8Y2NTURwZ8E=
X-Google-Smtp-Source: APXvYqzQ1ooX4XW0vLIg4VqWEa7P+o76wpFjNS7v9Xqzwhbb35CjemJkx3JY5ygjSQdFA3th/Oyq5lmKS9vpIewItL8=
X-Received: by 2002:a1f:6344:: with SMTP id x65mr8509443vkb.26.1580529983999;
 Fri, 31 Jan 2020 20:06:23 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 1 Feb 2020 13:05:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
Message-ID: <CAK7LNAT2Z=_ig0CnCcCS-=MVN409XrPay5-62LhVRRtvOPshTA@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.6-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.6-rc1.

Thanks!


The following changes since commit c79f46a282390e0f5b306007bf7b11a46d529538:

  Linux 5.5-rc5 (2020-01-05 14:23:27 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.6

for you to fetch changes up to 2b5072b9dfab1bc9e4f605bba19b4470e429c60c:

  kconfig: fix documentation typos (2020-01-22 00:54:35 +0900)

----------------------------------------------------------------
Kconfig updates for v5.6

 - add 'yes2modconfig' and 'mod2yesconfig' targets

 - sanitize help text

 - various code cleanups

----------------------------------------------------------------
Bartosz Golaszewski (1):
      kconfig: fix an "implicit declaration of function" warning

Bjorn Helgaas (1):
      kconfig: fix documentation typos

Masahiro Yamada (12):
      kconfig: remove the rootmenu check in menu_add_prop()
      kconfig: use parent->dep as the parentdep of 'menu'
      kconfig: drop T_WORD from the RHS of 'prompt' symbol
      kconfig: remove 'prompt' symbol
      kconfig: move prompt handling to menu_add_prompt() from menu_add_prop()
      kconfig: remove 'prompt' argument from menu_add_prop()
      kconfig: remove sym from struct property
      kconfig: squash prop_alloc() into menu_add_prop()
      kconfig: localmodconfig: remove unused $config
      kconfig: localmodconfig: fix indentation for closing brace
      kconfig: fix too deep indentation in Makefile
      kconfig: use $(PERL) in Makefile

Tetsuo Handa (1):
      kconfig: Add yes2modconfig and mod2yesconfig targets.

Thomas Hebb (3):
      kconfig: list all definitions of a symbol in help text
      kconfig: distinguish between dependencies and visibility in help text
      kconfig: fix nesting of symbol help text

 Documentation/kbuild/kconfig-language.rst |   7 +-
 scripts/kconfig/Makefile                  |  24 ++--
 scripts/kconfig/conf.c                    |  16 +++
 scripts/kconfig/confdata.c                |  16 +++
 scripts/kconfig/expr.c                    |   3 +-
 scripts/kconfig/expr.h                    |   2 +-
 scripts/kconfig/gconf.c                   |   1 +
 scripts/kconfig/lkc.h                     |   4 +-
 scripts/kconfig/mconf.c                   |   1 +
 scripts/kconfig/menu.c                    | 185 ++++++++++++++++------------
 scripts/kconfig/nconf.c                   |   1 +
 scripts/kconfig/parser.y                  |  21 ++--
 scripts/kconfig/streamline_config.pl      |   4 +-
 scripts/kconfig/symbol.c                  |  22 ----
 14 files changed, 174 insertions(+), 133 deletions(-)


-- 
Best Regards
Masahiro Yamada
