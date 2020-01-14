Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6F213A276
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jan 2020 09:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgANIFL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jan 2020 03:05:11 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61739 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgANIFL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jan 2020 03:05:11 -0500
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 00E84k4r023665;
        Tue, 14 Jan 2020 17:04:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 00E84k4r023665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578989086;
        bh=zqtq7IkCW0id1F79otkq2+3zhL0Fqy1TdiL18Qrl+go=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PGMJ4GR8yXY0XFl7WeuL8GsoMC9mwzswUAhGBUp03qVUOut1FPZT38sH4zKo0m1Ta
         Q/6OKFqhSlG91gvqrQxtkmMativVX78yjntMkR2FSkuvdJq+tjaKsboRowajPTZ3aY
         eKLd0i8bf4i/dmnzE6LGyqe5mDVEuxwnBI5gweaLpu9Df/weFOLWLv71VoMFLTa4Z8
         LNIgICa0C/DaHLG8Bn27+j6hrrMVoLIUi3WwjivDdX0Xvg93Ro/q9lUXzDwwM1eS/4
         MDYm5kzLK4ZCDaFNcsuFM+z+Yyv8aCA563qvVwQg5dcp+IL1LY2c5CbsDpf0/tBUyD
         UeIE0VvsfVLwQ==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id y23so4436379ual.2;
        Tue, 14 Jan 2020 00:04:46 -0800 (PST)
X-Gm-Message-State: APjAAAUdg9v5S3EZKt8HBI6ODLMWjCTeCP697WXp3JA8UQfgpnda+Jdj
        NT0XfIRfhp0OSIJlRCKv461EOLbFyKRa+HufGx8=
X-Google-Smtp-Source: APXvYqxACHfBMoAc+LfpdScWVrlt7n/Wtwl7tQFYgbXxfF+CTJmEFF/P0ykqAGDjiJK626yMtn+wvRqVclE4WoYQdIY=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr9924613uay.25.1578989085420;
 Tue, 14 Jan 2020 00:04:45 -0800 (PST)
MIME-Version: 1.0
References: <20200113064841.3946-1-masahiroy@kernel.org> <20200113064841.3946-4-masahiroy@kernel.org>
 <7da5750c40489dcb6cd8eef0307ee8d8df2e134e.camel@decadent.org.uk>
In-Reply-To: <7da5750c40489dcb6cd8eef0307ee8d8df2e134e.camel@decadent.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 14 Jan 2020 17:04:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR3fL-RQM412LJmJD6v81JTJ+s0A5vcS4O=Y_=kNO4DUA@mail.gmail.com>
Message-ID: <CAK7LNAR3fL-RQM412LJmJD6v81JTJ+s0A5vcS4O=Y_=kNO4DUA@mail.gmail.com>
Subject: Re: [PATCH 4/7] builddeb: avoid invoking sub-shells where possible
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Riku Voipio <riku.voipio@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Ben,

On Tue, Jan 14, 2020 at 2:21 AM Ben Hutchings <ben@decadent.org.uk> wrote:
> > +(
> > +     cd $srctree
> > +     find . arch/$SRCARCH -maxdepth 1 -name Makefile\*
> > +     find include scripts -type f -o -type l
> > +     find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform
> > +     find arch/$SRCARCH -name include -type f
>
> This command is wrong.  We currently find all files under all
> directories named "include" under arch/$SRCARCH.  (arc, arm and xtensa
> have some per-platform include directories in additional to the per-
> architecture include directory.)
>
> > +
> > +     if [ -d arch/$SRCARCH/scripts ]; then
> > +             find arch/$SRCARCH/scripts -type f
> > +     fi
> > +) > debian/hdrsrcfiles
> > +
> > +{
> > +     if is_enabled CONFIG_STACK_VALIDATION; then
> > +             find tools/objtool -type f -executable
> > +     fi
> > +
> > +     find arch/$SRCARCH/include Module.symvers include scripts -type f
> > +
> > +     if is_enabled CONFIG_GCC_PLUGINS; then
> > +             find scripts/gcc-plugins -name \*.so -o -name gcc-common.h
> > +     fi
>
> This is reverting patch 1.
>
> Ben.

Thank you for catching these.

I made a mistake somehow
when I inserted the patch 1, and then
rebased the others on top of it.

I will fix it in v2.


-- 
Best Regards
Masahiro Yamada
