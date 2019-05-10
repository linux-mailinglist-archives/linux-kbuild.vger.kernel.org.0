Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0111C1A2BB
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 19:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfEJR5P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 13:57:15 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46555 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727562AbfEJR5O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 13:57:14 -0400
Received: by mail-pg1-f196.google.com with SMTP id t187so3347411pgb.13
        for <linux-kbuild@vger.kernel.org>; Fri, 10 May 2019 10:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VOuGPhrIxeDuwlb+V+gF2cUy7+yMjgBS0voa81cD1ZE=;
        b=mOIsiXuywCZPv+ClDKwfdEW39vo0ZZd0SW0CFsbw9vWXRfIgsEre0tfwCx6q00cfbf
         +htAr/aGnXv9TdCRqWrnxf58uI/XK+KsCn6N8zScRzbFLv7PxzYIyB7AL8F4pRmJFCkT
         vmCsDq+1moLfAjUsPghhqStkiut/s8e9HK7BkK7CNGSl/J+3RbX8EJY/oRq6eIxK2WSt
         3XAWBRR2AM+EF2ULw47RFP4NcjF/nE8Ig6oqFAmYMUoFbdlI/vrNly6VbBN2VoB0OPx0
         HqBQF5hNGtzRHrXXIRquQUcBeYzrr3uKSPPI/OL6U9tRnWli26oH4+RPQ9bdfKxI5ei7
         4Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VOuGPhrIxeDuwlb+V+gF2cUy7+yMjgBS0voa81cD1ZE=;
        b=nXqLB/Gfw3egMPPCVpGqiOrKTnmtv/7LR3nIxJ7LvaaEHoAMpiSfKj/Hvt0gaoljnh
         D6kHOGooxCIL77UQ6f8UR/QSWsvd2S2ATwnNwRPv37BC8AkISx9v6NcQseq8Y5ncmoCq
         wi1GABHVKjQwUHgc1ya5AzIvH0IXCyfFhNhh+q8/354og++EkVUCMJFMyfjXmc5Cc977
         KCSeIZVnroyWaS0AJeJcs8aTH0OJo0j2rFyOVYDpa8rE41LnZb+FrPlkWOAqyuZbqiz/
         WREmcX8ELPSc8X3zz/q7CSZh5FdzyiXH9KvLc08mwxisPVwqJv830I2m4KaEicnLslo5
         pF4Q==
X-Gm-Message-State: APjAAAU0OFSw0QjuxJZc28YcTH1xXCrDrhlWkbKPywpFPAkHJdPRoIqc
        bq9IBTEj069aK8UBePuMvR+Nt1BQsW1X26JO7lU12g==
X-Google-Smtp-Source: APXvYqwOIiIqqwM2z/zA32ar7A1PUfGt4O/YdBnrJgzPsi6hlqYGyzRgcZVHZmsFzYgounGLJwoG1/3yVF1RnyN7MHA=
X-Received: by 2002:a63:f44b:: with SMTP id p11mr14838157pgk.225.1557511033089;
 Fri, 10 May 2019 10:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064455.1173-1-yamada.masahiro@socionext.com>
 <CA+icZUX_AgZdH5Z+1+k+oVdYSo7vqzeJsGPndb_Sa8VOSk_yOg@mail.gmail.com> <CAK7LNAS+FQqQZ0RfW8e6mxabUOq9YVk=eEEztmN-+BHnTmDa_w@mail.gmail.com>
In-Reply-To: <CAK7LNAS+FQqQZ0RfW8e6mxabUOq9YVk=eEEztmN-+BHnTmDa_w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 May 2019 10:57:01 -0700
Message-ID: <CAKwvOdkt9eCFdy7pNer7+6ZNz4vFVX_55Fe_98W1RFFzwz3U5Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Behan Webster <behanw@converseincode.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 10, 2019 at 6:54 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Thu, May 9, 2019 at 4:06 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Thu, May 9, 2019 at 8:45 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > >
> > > We do not support old Clang versions. Upgrade your clang version
> > > if any of these flags is unsupported.
> > >
> > > Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> > > except -fcatch-undefined-behavior.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > Looks good to me.
> >
> > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> >
> > Just as sidenote:
> > I experimented with a snapshot version of clang-9 and lld-9 and could
> > build, link and boot on bare-metal with '-mglobal-merge' on
> > Debian/buster AMD64.
>
>
> The comment says
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>  # source of a reference will be _MergedGlobals and not on of the
> whitelisted names.
>  # See modpost pattern 2
>
> So, it seems it is just a matter of modpost,
> but I am not sure enough.
>
> This flag has been here since the initial support.
> (61163efae02040f66a95c8ed17f4407951ba58fa)
>
>
> Perhaps, we should review clang flags one by one again?

Yes, it's always good to re-evaluate if something is just cruft and
can be removed.

+Behan

I don't quite understand the comment about _MergedGlobals, Behan, do
happen to have more context?
-- 
Thanks,
~Nick Desaulniers
