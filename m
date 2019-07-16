Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147376A9FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 16:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbfGPOAe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 10:00:34 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25048 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfGPOAe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 10:00:34 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6GE07F6004768;
        Tue, 16 Jul 2019 23:00:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6GE07F6004768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563285608;
        bh=17EXgbDG+FKzhJ6mf7iS/6cZE4J0a/HBc40gJ8UDRJc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GvAs+RtgAEUCREMWDOUlA+oz2hXY9gVNv4s+5RK6aebOjta6duG3RlW8+KWFJIeed
         Be/fmvnbjnqY0sQw14tuoMAdTOaK0NbrjQMTKT9+fQpDPDzjkGqOrC9cGqOv9QvIgo
         6TuvblrO/Gw/DjKGmn5ioCw2erzV5Tg0XaNlGqY6/LLmU0wAiGNJck3u5JyPASUlqb
         0ZviQks7w1ofPbLr2hYvrGoJz0Em2SSC/qSczLPudgEykXHnusQp+bmyUATGp7EoYl
         iM9f3EYWzAZia5AKKh6Zsx2ytUcoQnSwmLm/JhfjQh3Dbfx2pzWH3skwgWw4vHCZif
         0vzXxtJUq+aBw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id v6so13987855vsq.4;
        Tue, 16 Jul 2019 07:00:08 -0700 (PDT)
X-Gm-Message-State: APjAAAUhH+HHh8TBPP3ElVkbuIksfnNlkOIFVarq+/JfhNBuG/S4U0eO
        Euf9qmCPbmS95ReVBF0PN58/jLwDwjVeXS3c2zE=
X-Google-Smtp-Source: APXvYqzvMEy8fZNv6UB2oKKUYxxkbEpHi5QKtGfbHhPeitQzInE0Pg9qezW5fEKvogiTzQiQ9hzkE61TlQi3ugWH0FA=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr19966577vsd.215.1563285607104;
 Tue, 16 Jul 2019 07:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <201907160706.9xUSQ36X%lkp@intel.com> <CAK7LNATqxQnen2Tzcici8GnJuc-qNeCYcCYisKM2OkNow1FDnQ@mail.gmail.com>
 <20190716124249.GP5418@ubuntu-xps13>
In-Reply-To: <20190716124249.GP5418@ubuntu-xps13>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 16 Jul 2019 22:59:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJNC3xaBbZBROEgggop41fUFBMA56_+aX3Xt=g7FGd_A@mail.gmail.com>
Message-ID: <CAK7LNATJNC3xaBbZBROEgggop41fUFBMA56_+aX3Xt=g7FGd_A@mail.gmail.com>
Subject: Re: [kbuild:kbuild 5/19] drivers/atm/eni.o: warning: objtool:
 eni_init_one()+0xe42: indirect call found in RETPOLINE build
To:     Seth Forshee <seth.forshee@canonical.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>, kbuild-all@01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 9:42 PM Seth Forshee <seth.forshee@canonical.com> wrote:
>
> On Tue, Jul 16, 2019 at 03:57:24PM +0900, Masahiro Yamada wrote:
> > (+ Josh Poimboeuf)
> >
> > On Tue, Jul 16, 2019 at 8:44 AM kbuild test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> > > head:   0ff0c3753e06c0420c80dac1b0187a442b372acb
> > > commit: 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f [5/19] kbuild: add -fcf-protection=none to retpoline flags
> > > config: x86_64-randconfig-s2-07160214 (attached as .config)
> > > compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
> > > reproduce:
> > >         git checkout 2eaf4e87ba258cc3f27e486cdf32d5ba76303c6f
> > >         # save the attached .config to linux build tree
> > >         make ARCH=x86_64
> >
> > 0-day bot reports objtool warnings with the following applied:
> > https://patchwork.kernel.org/patch/11037379/
> >
> > I have no idea about objtool.
> >
> > Is it better to drop this patch for now?
>
> I'm surprised that the change would have any impact on a build with
> gcc-4.9, since -fcf-protection seems to have been introduced in gcc-8. I
> guess there's no full build log that would let us see the actual flags
> passed to the compiler.
>
> I'll try to reproduce this result. If you think the patch should be
> dropped in the meantime, that's fine.

Dropped now.

Thanks.

-- 
Best Regards
Masahiro Yamada
