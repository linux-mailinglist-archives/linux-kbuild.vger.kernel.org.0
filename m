Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFC619911
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 09:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfEJHme (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 03:42:34 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:34274 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfEJHme (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:42:34 -0400
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4A7gN4u014009;
        Fri, 10 May 2019 16:42:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4A7gN4u014009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557474144;
        bh=YlQFpWyCF4koFxUrKwNjn9H1imLHQlb49VlUA4xXZYA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WzgJ7Yz1c7/4fkDz1D+HsayXrwITF0XMEAY848HkwsJMmnuAMqIZx69WNu/4WgGnC
         vWYSCLoFk5S2GgliRGQt3XIV26v3dcvm7e7XGdSKYhNzpWAyfIVJbQFoCz3StMTdm/
         B/SPJcKTj9JAo3XyGjlYA0a6MRqTk02/XsxjeF8Cx0Xl1w8qq2T6osT3E5UDUWTx91
         IP8ABVG/ZTWW7XGk9YaVrmsG+wh8gpqZzUahPG79x30Rd7V1Tsurf2DG1iwk175njQ
         PDa+Rg5p4LMrStnFE2V4KSPQKzzaTh7qIt/Uritu+1Tf1k++zpT7qqON8vHe0z8lRL
         fMwDoRLGkFQ1w==
X-Nifty-SrcIP: [209.85.160.169]
Received: by mail-qt1-f169.google.com with SMTP id m32so2493131qtf.0;
        Fri, 10 May 2019 00:42:24 -0700 (PDT)
X-Gm-Message-State: APjAAAXqtqTn3wDc3IpqzAxxcIMos+q2DAKSvVmwhjfXluzX3K5ZqocX
        iatYbiKjukMyH7snxq+J0qpDOUAIpCb9DGL4jGY=
X-Google-Smtp-Source: APXvYqyZrf0UJsSJQxKmr/G7lbAJz0M5TQd1WU9tqtsIKF7oJDZhaP7rRJBT58gVBjUgizNiZhcXwK2kt8XYVfcY7fQ=
X-Received: by 2002:aed:258a:: with SMTP id x10mr8156329qtc.380.1557474143345;
 Fri, 10 May 2019 00:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
 <20190510061205.28753-2-yamada.masahiro@socionext.com> <CAMuHMdVmgZjyGxz0F=Akz+3egFtGMppGg6TRAnRhd=KZv5ADdg@mail.gmail.com>
 <20190510070354.GA2193@ravnborg.org>
In-Reply-To: <20190510070354.GA2193@ravnborg.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 10 May 2019 16:41:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS56NOTdmAmHdi9Kk23HjbQXDmEJEySSU0c=+eTQF5nEw@mail.gmail.com>
Message-ID: <CAK7LNAS56NOTdmAmHdi9Kk23HjbQXDmEJEySSU0c=+eTQF5nEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the same
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam, Geert,

On Fri, May 10, 2019 at 4:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Geert/Masahiro.
>
> On Fri, May 10, 2019 at 08:46:35AM +0200, Geert Uytterhoeven wrote:
> > Hi Yamada-san,
> >
> > On Fri, May 10, 2019 at 8:14 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > Kconfig updates the .config when it exits even if its content is
> > > exactly the same as before. Since its timestamp becomes newer than
> > > that of other build artifacts, additional processing is invoked,
> > > which is annoying.
> > >
> > > - syncconfig is invoked to update include/config/auto.conf, etc.
> > >
> > > - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
> > >   then vmlinux is relinked as well.
> > >
> > > If the .config is not changed at all, we do not have to even
> > > touch it. Just bail out showing "No change to .config".
> It would be preferable that if nothing changed no output is generated.
> Like we do not tell that we did not build a .o file because the .c file
> had not changed.
> Less noise for a kernel build where nothings happens.
>
> > This causes a semantic change for the meaning of ".config.old", which is
> > no longer updated if .config has not changed.
> > Hence its contents may no longer correspond to the previous config, but to
> > an arbitrary older version.
> This semantic change is good.
> So we now have a .config.old that correspond to the state before
> the last change. Also after several kernel builds.


I agree.

When there is no change in the configuration,
Kconfig will not even attempt to output anything.

Updating only .config.old is strange.

Thanks.



--
Best Regards
Masahiro Yamada
