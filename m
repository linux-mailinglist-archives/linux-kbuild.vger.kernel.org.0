Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510D388798
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 04:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfHJCLA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Aug 2019 22:11:00 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:34751 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfHJCLA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Aug 2019 22:11:00 -0400
Received: by mail-ua1-f66.google.com with SMTP id c4so11593609uad.1;
        Fri, 09 Aug 2019 19:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=r5ZiGDUJysMSy5g0gynp2TrC20BGlewp8HsLSN7ffk8=;
        b=FL77UripyK2JGBg7lbm4yBwPyR/uhKBWEjMLXCGcS82ysvs9SOUHzLlvwNgwNBPKUa
         TVx09NokQZxaE86ehBb6PEMOqMb02bvqW8zmI/NAxQ4FSVDgaSYE9LO0ha1KCrNbQRAS
         uD8A04dxv+Ep45+sqz5FdvF8DPGq0ZClUJAsw4fKlaLZwTijleRjy2wCXYj7LnAAQFEh
         zU8FmXF+0nfgfpsF3x24KnE31keTah77bDGZ1O/USSAGlAbhZahP9NPSZDdBRhPl14bc
         ir7zLl+bJpBJ2/1iGWYHil4GyJyUGwR6JNK5hBE4TO+xzQH2NI7wX7Yn0CbVzt8lLmBC
         pZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=r5ZiGDUJysMSy5g0gynp2TrC20BGlewp8HsLSN7ffk8=;
        b=d3YcoyRobWDah3hgy88+lXalBUy5kpHd/PvoX0oS7KomDoZ9poxIFgXDLzvsCdAcC7
         0HigTMlxHhguxUK3g+Q4+UdRJFvycECEffvtNfDBaFpX1JPraNY5WQwx5gqephHImycW
         FmQ/AbmXlIFRy4WTBaqo0DYu/ZLs8x6vSs4rMiDnpowD0de1wnmO564+xlDryntQ787+
         Kr7CpHM/ZcqOdwXsJ34Uu5Ab1PlMN7/uuDVScNCqW1998AO1zbbFrWcIUXMBFuMZUUfy
         oAQH3AFurlXn3HMXJ0t0ROYEXixz41uX8VZnm3UDD4QKKt6hYVHxL+nNM9dYTbnXOkY0
         O+qA==
X-Gm-Message-State: APjAAAU09KJ0HwgvYmuzhTlvKU1Un/c/KoAvJFBFvZVBHlmEIiwGw/jw
        +L0Hp9J2HVRnmvDfgoU7QopayRG2X/HUsFVN/Zw=
X-Google-Smtp-Source: APXvYqzR5drDaLVLbg2/oBp/s6h+SGAHZcqbzc5ANb4s8BBJ7ISVgq5EWUWIt+GsVtBgL809J4mbht0XxEhGc8Jli5o=
X-Received: by 2002:ab0:5ea6:: with SMTP id y38mr14819703uag.40.1565403058784;
 Fri, 09 Aug 2019 19:10:58 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro YAMADA <masahir0yamad@gmail.com>
Date:   Sat, 10 Aug 2019 11:10:22 +0900
Message-ID: <CAK7LNAQGV+CFP6o3_iQNH3x6boXWH=2JN8j7WPJbtyi=eF6=dg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.3-rc4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull more Kbuild fixes.
Thanks!


The following changes since commit e21a712a9685488f5ce80495b37b9fdbe96c230d:

  Linux 5.3-rc3 (2019-08-04 18:40:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.3-3

for you to fetch changes up to c07d8d47bca1b325102fa2be3a463075f7b051d9:

  kbuild: show hint if subdir-y/m is used to visit module Makefile
(2019-08-10 01:45:31 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.3 (3rd)

 - revive single target %.ko

 - do not create built-in.a where it is unneeded

 - do not create modules.order where it is unneeded

 - show a warning if subdir-y/m is used to visit a module Makefile

----------------------------------------------------------------
Masahiro Yamada (4):
      kbuild: revive single target %.ko
      kbuild: fix false-positive need-builtin calculation
      kbuild: generate modules.order only in directories visited by obj-y/m
      kbuild: show hint if subdir-y/m is used to visit module Makefile

 Makefile                 | 13 ++++++++++++-
 scripts/Makefile.build   | 11 ++++++++++-
 scripts/Makefile.modpost |  6 ++----
 3 files changed, 24 insertions(+), 6 deletions(-)
