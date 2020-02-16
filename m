Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D9E1601A5
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Feb 2020 05:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgBPE2H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 Feb 2020 23:28:07 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30329 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBPE2H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 Feb 2020 23:28:07 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01G4RuqS019081;
        Sun, 16 Feb 2020 13:27:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01G4RuqS019081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581827277;
        bh=W2C/jmuxMmam57+9aJUIVpRDw8p3eH2qNzl48a8ilKs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fulvgh9XRLhWMSKUekKh+FrHtD0r6bQftEikx9aHvCgYrVC8ZzAhS9992eDjrLkT2
         2iyzIsMIkU92G0v6WMymP4fFGc/Gql34m/XeIC8s45afXGDOMWKZdToZUowXcstajO
         Saq31bpejwxoumUyACseGCYCHGY7mgqHiuTR2X7DJuqrk5mAHqUIWPN7VGFfuStzLy
         4w14yur6QnneOpyyPdf23kaf3tc/3ZSHi+S98y7GYvYDGDlJsjgU7T7MjOHX1ljK7g
         ngimSlcqwhvpJ5s6+P0eh+SPI4t58zmm9XJaKw4HDZkWhd7hObCpXz7NpRqEhtXrT7
         D1iHOFMxrT9VA==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id y23so5012139ual.2;
        Sat, 15 Feb 2020 20:27:57 -0800 (PST)
X-Gm-Message-State: APjAAAU4pb9KrozsefVsplUGoqWQpwV+HZQ4sqA2LSByUGXosebqvwsP
        zS27qKQAZsoW3HEGZ+um9QjHGKTZxRK5jnm93xY=
X-Google-Smtp-Source: APXvYqxigRJ5eLrgiz9xEj+lkD8K4QDoRqbdKRp/dv91nqDiBN03PCGMBXWIwCKeCSI9wfkPGFVGWPfNqwSr+c0ldvk=
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr4868962uau.109.1581827276241;
 Sat, 15 Feb 2020 20:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com>
 <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com> <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com>
In-Reply-To: <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 16 Feb 2020 13:27:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARyYqmSByD3jQr+TPe1RHEj9CxqRE880AqxA5SU3yUk5A@mail.gmail.com>
Message-ID: <CAK7LNARyYqmSByD3jQr+TPe1RHEj9CxqRE880AqxA5SU3yUk5A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sami,

On Thu, Feb 13, 2020 at 2:13 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Wed, Feb 12, 2020 at 5:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > In which case are undefined symbols duplicated?
>
> When a module consists of multiple compilation units, which depend on
> the same external symbols. In Android, we ran into this when adding
> hardening features that all depend on an external error handler
> function with a rather long name. When CONFIG_TRIM_UNUSED_SYMS was
> later enabled, we ran into this:
>
> $ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
> xargs echo | wc
>       2    9136  168660
>
> xargs defaults to 128kiB limit for command line size, so the output
> was split into two lines, which means some of the dependencies were
> dropped and we ran into modpost errors. One method of fixing this is
> to increase the limit:
>
> $ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
> xargs -s 262144 echo | wc
>       1    9136  168660
>
> But it seems removing duplicates is a better solution as the length of
> the dependency list is reduced significantly:
>
> $ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
> sort -u | xargs echo | wc
>       1    2716   50461


At least, I am unable to reproduce this in upstream.

This is my result for x86 allmodconfig builds.

masahiro@grover:~/workspace/linux-kbuild$ nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | wc
    572     572   11478
masahiro@grover:~/workspace/linux-kbuild$ nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | sort -u |
wc
    572     572   11478


I see no difference with/without 'sort -u'.


I also tried llvm-nm instead of GNU nm,
but the result is the same.


masahiro@grover:~/workspace/linux-kbuild$ llvm-nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | wc
    572     572   11478
masahiro@grover:~/workspace/linux-kbuild$ llvm-nm
drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | sort -u |
wc
    572     572   11478




> > Do you have a .config to reproduce it?
>
> I can currently reproduce this on an Android kernel that has
> Control-Flow Integrity (CFI) enabled. While this feature is not
> upstreamed yet, there's nothing that would prevent us from hitting the
> command line limit with sufficiently large modules otherwise as well.


Does ACK do this differently?

I think it would be strange
if $(NM) duplicated undefined symbols.



-- 
Best Regards
Masahiro Yamada
