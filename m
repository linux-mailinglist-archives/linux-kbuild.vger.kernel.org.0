Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2763E12F98F
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 16:09:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbgACPJr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 10:09:47 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38982 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgACPJr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 10:09:47 -0500
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 003F9d3T026521;
        Sat, 4 Jan 2020 00:09:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 003F9d3T026521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578064180;
        bh=w5k3Y6PRdORnwNbzc3iByB79B3AhU7Esyn55B41uToc=;
        h=From:Date:Subject:To:Cc:From;
        b=iLGX7YbLXN9Yy4RWKw7psjqXK42sYxjLOlDfnbB2rOiK8H9sM5U+r7M4Xhf79IUew
         yWOsexzku92XxZbtaUhHW5vSIA9qhgZW+Z+bEkSS/IfGnpipbMPdx7PukhphCfCHmN
         kgueKdYZmZI23P0GRescDAxEx96xxDoVzw4kLHvENA0kvt9axByfpr/4eTz9/9h49E
         DzmvYCfKnR34lgKDaDsGG6QViVCi6oOCF7RB9KJURfS4tYUYcChmHm6tHVwWfswhnG
         yjvB5FdRSvg4ehXuPGKQhKxH6Tn+7VoFUsyqAxbYv6S32cqPXrgaxNRHAygqueKUNm
         ++vk111nLhWuw==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id c7so11798026uaf.5;
        Fri, 03 Jan 2020 07:09:39 -0800 (PST)
X-Gm-Message-State: APjAAAUv+Y0xlalctAhvNJaXR5RD/m4YaEUwKjR3dabFBjB47Rg16WL/
        G/6DurvQfkJjY5d/gyrARsIRyWrYao1I4z08jRE=
X-Google-Smtp-Source: APXvYqy53bQV6ypHzQk3ECwhOSflaJ9dY5+WS7bD513QSnOGDZ3yZA6AtoCaREULbGgE8OOB5qo2Rf/CIMcLn8Tth+k=
X-Received: by 2002:ab0:7049:: with SMTP id v9mr51165839ual.95.1578064178429;
 Fri, 03 Jan 2020 07:09:38 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 4 Jan 2020 00:09:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRUHZSvrhzm8MkGhHO1G4L=ZbTjo+8m4tmXSZcEE_8bg@mail.gmail.com>
Message-ID: <CAK7LNATRUHZSvrhzm8MkGhHO1G4L=ZbTjo+8m4tmXSZcEE_8bg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.5-rc5
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks!



The following changes since commit 46cf053efec6a3a5f343fead837777efe8252a46:

  Linux 5.5-rc3 (2019-12-22 17:02:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.5-2

for you to fetch changes up to 8ffdc54b6f4cd718a45802e645bb853e3a46a078:

  kbuild/deb-pkg: annotate libelf-dev dependency as :native
(2020-01-04 00:00:48 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.5 (2nd)

 - fix build error in usr/gen_initramfs_list.sh

 - fix libelf-dev dependency in deb-pkg build

----------------------------------------------------------------
Ard Biesheuvel (1):
      kbuild/deb-pkg: annotate libelf-dev dependency as :native

Masahiro Yamada (1):
      gen_initramfs_list.sh: fix 'bad variable name' error

 scripts/package/mkdebian  | 2 +-
 usr/gen_initramfs_list.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


-- 
Best Regards
Masahiro Yamada
