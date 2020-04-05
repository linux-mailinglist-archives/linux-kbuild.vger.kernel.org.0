Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0302619EBCB
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2020 15:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgDEN4a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Apr 2020 09:56:30 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16577 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgDEN4a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 09:56:30 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 035DuCEN018712;
        Sun, 5 Apr 2020 22:56:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 035DuCEN018712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586094973;
        bh=HIBW+9wU6pa/k1BuO2NwsZV9UocoT5Jj56/5NqbTF7c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PVWfeqsO3ivryKKJxzlLOtGf5XoRrRR7lczuFXwHQwRVhx6R6OFDe8AkDdvLU5Cum
         ZMZuD95ocNmE9ZEwqIy1CU7MzsgZpm+ad9l8kTl2LO+ZnSJ2+x9zEDWbttTedqGe0N
         wIJsDAZxAp3ZK+cpjnzhxMA9SMQL04oAiJlYrZfSJngHiklzWcvSfcwup55vHxBx69
         +e/hc2YD4yGkyhoWzBaygALDeT7xAsqUKn3q5iJR7mCh0PhupAYlZmYnPLPN+9S38T
         mQiHAXeXtD0YYv+yMkCNsZFdKvabN7F18x3iecVB0oD4EcEk6TmYuv0NKEvf3YKVRJ
         p0GpsZrl0sf5A==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id x82so7969850vsc.12;
        Sun, 05 Apr 2020 06:56:12 -0700 (PDT)
X-Gm-Message-State: AGi0PuY/BggLzogPQeMeirWk9lEtgdns8bmaT/PkHsaQpO3nmKQyLU4M
        nly4DPhHf1/vRf8RWlQEPHVPNlategqzjwzmsFI=
X-Google-Smtp-Source: APiQypJpa1N4IPj3YD40pPZZwmcQV1V71AHj92NGOXLU6OFQOqj5kpGruVQn3mPOedmeTudf/1g7ZyUUHYxIiBzqnBQ=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr12826483vsz.155.1586094971431;
 Sun, 05 Apr 2020 06:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook> <CA+icZUW0R9LDGJ1YjJAB2oWkcEQxCO79xYmdVEoh=P8Fy_AL1A@mail.gmail.com>
 <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
In-Reply-To: <CA+icZUVowLVpAxiWw=FJHfQ38KtU7AXXkVnw46D2XLM41-NCEA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 5 Apr 2020 22:55:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
Message-ID: <CAK7LNAQ6ji3=2+7R1DL7eFveH7L7No6e3XkqfqgiH5QFyQj==A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 5, 2020 at 8:23 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Apr 2, 2020 at 4:24 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Thu, Apr 2, 2020 at 10:18 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > When doing Clang builds of the kernel, it is possible to link with
> > > either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> > > discover this from a running kernel. Add the "$LD -v" output to
> > > /proc/version.
> > >
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
>
> Please feel free and add:
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>


Thanks.

I collected all Reviewed-by and Tested-by.






-- 
Best Regards
Masahiro Yamada
