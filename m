Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1A44C30B4
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2019 11:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfJAJzg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Oct 2019 05:55:36 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44232 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJAJzg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Oct 2019 05:55:36 -0400
Received: by mail-ot1-f66.google.com with SMTP id 21so10964305otj.11;
        Tue, 01 Oct 2019 02:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=57em5qMaUxgwixlimVtXQoiZ7hrM6q9JADm0XwFiAhc=;
        b=BzrQaC8wAz9ITg8/sUMrMPLf1/jLoq7naXuzZwY3mBKZY1sHIeV9qTIOn97IpcWHuq
         F9KwVQ3kLEZn0AdVrtFhzNiGCJPGNclh/GkZq79yuyHmuq3772oJ+Vv0VoJATZYpAuRQ
         e18RfxeXzesFOTM87vi+95JHh/X1X2VxZ2N23+medtSYT8RjVz0Umdm80yk8fcWsYNft
         Oi7IYpMioMWRHzEx387Z80C3mYBne7R4jaC8dPfC55LT5QBHlZCCyWxunxPgSBArD2tG
         ZnL2jbIWFE0G5/h/dOuiQT6gW4SJOjGhKsi1Wausii/qs2NrqtH0FHdd7Yos4DifFC2M
         SAZw==
X-Gm-Message-State: APjAAAV7FBTV3ynrOiU7J3vFMUN5v7AzLU0SD1+GwkOCv4xsaZy+cpmo
        Db8jvBZOvdIrzxlfGpWSooH1h4QiebUAUua/dN8=
X-Google-Smtp-Source: APXvYqzkX7Thn6lNSJ3o+XYEkPg62CV4JuLydhxM+5dLjGbLepbTswGotKWTi798Ipt1p/7DrWarF7USre4jhr1ywek=
X-Received: by 2002:a9d:7311:: with SMTP id e17mr1477724otk.107.1569923735203;
 Tue, 01 Oct 2019 02:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190825132837.13873-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190825132837.13873-1-yamada.masahiro@socionext.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Oct 2019 11:55:24 +0200
Message-ID: <CAMuHMdWad4QnmXVr82isawC055GwDE5vbERdpYRR2KmD2rX1tQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add $(BASH) to run scripts with bash-extension
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Sun, Aug 25, 2019 at 3:29 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> CONFIG_SHELL falls back to sh when bash is not installed on the system,
> but nobody is testing such a case since bash is usually installed.
> That is, shell scripts invoked by CONFIG_SHELL are only tested with
> bash.
>
> It makes it difficult to test whether the hashbang #!/bin/sh is real.
> In fact, I saw some patches trying to add bash-extension to #!/bin/sh
> script.
>
> Besides, some shell scripts invoked by CONFIG_SHELL use bash-extension
> and #!/bin/bash is specified as the hashbang, while CONFIG_SHELL may
> not always be set to bash.
>
> Probably, the right thing to do is to introduce BASH that is bash by
> default, and always set CONFIG_SHELL to sh. Replace $(CONFIG_SHELL)
> with $(BASH) for #!/bin/bash scripts.
>
> If somebody tries to add bash-extension to a #!/bin/sh script, it will
> be caught by somebody because /bin/sh is a symlink to dash on some
> major distributions.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This is now commit 858805b336be1cab ("kbuild: add $(BASH) to run scripts
with bash-extension").

This commit has the strange side-effect of inserting the contents of a
localversion file in the build directory twice.

Steps to reproduce:

    src-dir$ echo src > localversion
    build-dir$ echo build > localversion
    build-dir$ make defconfig; make include/generated/utsrelease.h;
cat include/generated/utsrelease.h
    ...
    #define UTS_RELEASE "5.3.0-rc4buildbuildsrc+"

Building in the source directory is OK.

    src-dir$ make defconfig; make include/generated/utsrelease.h; cat
include/generated/utsrelease.h
    ...
    #define UTS_RELEASE "5.3.0-rc4src+"

Changing scripts/setlocalversion to use /bin/bash does not fix the issue.

Do you have a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
