Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F2E440B64
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Oct 2021 21:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhJ3TFj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Oct 2021 15:05:39 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22528 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhJ3TFi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Oct 2021 15:05:38 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 19UJ2fZ7008930;
        Sun, 31 Oct 2021 04:02:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 19UJ2fZ7008930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1635620562;
        bh=VHv3+uAVSmOcJ7Q+/oSeDmUgWjj1CdtLJ7CGK6H5By0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=V/XE66sF4dJv0rRN7UWJFEAw5H9YkKa9VsbI8tY1AJymwzcGWZmc9rdl3B1ko3mlq
         cF/d7FEj5g7+og3FH8V1uqf3CmN4bmvCkFgXTzieKt/wSkOrLI10ntRjv8tS7gZLwu
         KRuK2LOdXvDb3s98f1hDQQHZz92Tgl2YzOhNHCPqcwkCdIyhKxLOoiFBX+pZHItVT6
         cM5ikT3yuh1fVsewpnTVIuxQl9+5XA8dCO24KgYQiWC8xLZMciKTkDEuqu9qDm1+E7
         BC48j5QVMvLLsdO6Piver9MS3cLEmLOUUc0wk9zus/C9wZwl+0mvi5BQO24S35p/U/
         nyxbiGTQ7VuVw==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso9714081pjb.1;
        Sat, 30 Oct 2021 12:02:41 -0700 (PDT)
X-Gm-Message-State: AOAM533JvNin9OPab6cab+uBvQ2rh7Bhw5+elftxrkSR6su6X0h1GWgc
        FuRhOO19lmSdidc4OtlgaWCLZLjpIUEOAdr1nXM=
X-Google-Smtp-Source: ABdhPJyqfuvV/CmwUM6JcQlCVNajsUWt4uUkwK4fYHTm/UCMiwLGNuRoDNJPa5q7akhDjTP3ZFUL1MDlmQJLO8zzXJk=
X-Received: by 2002:a17:90a:ce02:: with SMTP id f2mr15295663pju.77.1635620560734;
 Sat, 30 Oct 2021 12:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211030175604.1716611-1-masahiroy@kernel.org> <20211030185339.GD7074@brightrain.aerifal.cx>
In-Reply-To: <20211030185339.GD7074@brightrain.aerifal.cx>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 31 Oct 2021 04:02:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyg7t5Dz_bZwnv7CoOrEDiNkY6CVPoxPHSnBT8wARZqQ@mail.gmail.com>
Message-ID: <CAK7LNARyg7t5Dz_bZwnv7CoOrEDiNkY6CVPoxPHSnBT8wARZqQ@mail.gmail.com>
Subject: Re: [PATCH] sh: decompressor: do not copy source files while building
To:     Rich Felker <dalias@libc.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        patches@arm.linux.org.uk,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 31, 2021 at 3:55 AM Rich Felker <dalias@libc.org> wrote:
>
> On Sun, Oct 31, 2021 at 02:56:04AM +0900, Masahiro Yamada wrote:
> > As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
> > builds") stated, copying source files during the build time may not
> > end up with as clean code as expected.
> >
> > Do similar for sh to clean up the Makefile and .gitignore.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
>
> I think this is the same as "sh: boot: avoid unneeded rebuilds under
> arch/sh/boot/compressed/" in commit 7fe859eef9 in linux-next, which
> I've had in next but with no pull request sent for embarrassingly
> long. It will be included in the PR for the new release cycle.
>
> Sorry about the long delay. Let me know if there's anything else I
> need to know about it. And thanks for the patch.
>
> Rich

Oh, I had forgotten it completely.

That's good to hear you will send a pull req in the next MW.

Thanks.




-- 
Best Regards
Masahiro Yamada
