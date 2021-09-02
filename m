Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07713FF7DD
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Sep 2021 01:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345240AbhIBXb0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Sep 2021 19:31:26 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:19044 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbhIBXb0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Sep 2021 19:31:26 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 182NUCYt011640;
        Fri, 3 Sep 2021 08:30:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 182NUCYt011640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630625412;
        bh=P1D19XxJ2cDNUJGvGWQYdMlXX4RPrIV3hfw+IVNOVCM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uk33Iu1fWX0WsjwOSDh6sixoEzUeDeMGxD1tIDT6Zf5HEFZuaXjEoiFmwtdBxYYsQ
         zrt/eIHqWhOvzi/4NjBCUT9pEdgeFpd6FPDay6eqgmXwuPelJMEsGB+dD0Gm5lkm0Q
         FGf8tSrwzCkYloJoC8hjgtxvlRJSFpmQMsBEMplWOtUbeCXuDomEzelozcoYPYOjhZ
         8e+QxHnrQ75RUlBUaMbBdsdLR8ksVwNjy5jIRed68+DxUKknoCN9tngveq5Pv5UfHO
         knNWwA5qoYaLBXuYcBq9IyubSjkNQMdktLuuyX6ouvG/SbdWe0BIXuQV1yyVkoO0lr
         fs30/AysmcOKA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so2659841pjx.5;
        Thu, 02 Sep 2021 16:30:12 -0700 (PDT)
X-Gm-Message-State: AOAM533KReKf+IkWlFxGa8syEbb/IRJyfijRpYzpu8c8ojncfM/kaxWs
        V2ta/nYGTi1zvDvZ9oAKd8cOOYcyHizTA5/NqjI=
X-Google-Smtp-Source: ABdhPJzfgiZiR8YVVv+QsK2uvvQo9aw+BOkyiqAiIYKg85Y/wME4InJVcxvyyPkXucUhZ4+lr1zx5Qe60mBZ+dGAEQc=
X-Received: by 2002:a17:902:c643:b0:138:b603:f940 with SMTP id
 s3-20020a170902c64300b00138b603f940mr484914pls.71.1630625411701; Thu, 02 Sep
 2021 16:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATrzUSQg8pnpG1cDbA0sRdAeQGyy7d3ZqFJ4HMZymB=xQ@mail.gmail.com>
 <CAHk-=wjbjVb5wNURa7-_PtvKqf96X-7a1OoUDPJjo9rz68YB=Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjbjVb5wNURa7-_PtvKqf96X-7a1OoUDPJjo9rz68YB=Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Sep 2021 08:29:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQYW6b4S4yafSwESsaUxWsbzVy-hKA0x5NujUo2_nE+=A@mail.gmail.com>
Message-ID: <CAK7LNAQYW6b4S4yafSwESsaUxWsbzVy-hKA0x5NujUo2_nE+=A@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v5.15-rc1
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

On Thu, Sep 2, 2021 at 6:36 AM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> On Mon, Aug 30, 2021 at 6:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > After pulling this, you may see new warnings like this:
> >
> >     arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing
> >
> > They are just trivial Makefile mistakes, and patches
> > already exist. So, they will be fixed sooner or later.
>
> I refuse to have new warnings in my tree, particularly during the merge window.
>
> So I will not be pulling this, since I do indeed see those warnings
> when doing my test builds.
>
>                 Linus


OK, I will fix the warnings and send v2 shortly.
Thanks.






--
Best Regards
Masahiro Yamada
