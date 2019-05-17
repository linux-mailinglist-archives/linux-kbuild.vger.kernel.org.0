Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC73421B0F
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 17:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbfEQP51 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 11:57:27 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:32540 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbfEQP50 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 11:57:26 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4HFvL9n027883;
        Sat, 18 May 2019 00:57:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4HFvL9n027883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558108642;
        bh=201g0kbs2uB+GwEUpx//GJ+uGiu2C1BbNfc9wcMx28M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=daO9zMPtTO1SudT852qzfFXT3zN1kX0AnlrMUt9bNXWbBbYbkGr6Bp6NDxrbHuIHx
         X/4J1e8+cQATiUnou+PuZ4jmwSMIP5OJFnGVnlrD6kOn3Ctt2fo22qEPJYYwKOe35o
         DxubPrHMzEI//dZzILv91GxM8H/Jzat7AGctFvqFDUgUou/UAUiqgMl07KWX6bk+zr
         dqVjgNTW05XspY4Q7YtIYAVKNb3Ubb8A6nwh8VeOSeSGXLwmgNI0598VHRNTGfLHIm
         WOJEJxBrissBxUkwhDbDtPSnYqTZSrnif84FOELRbi006LEtydsZhJ4nNmmcWUyPmC
         ebwprQ1qvJN3A==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id n7so2856030uap.12;
        Fri, 17 May 2019 08:57:21 -0700 (PDT)
X-Gm-Message-State: APjAAAVujX9Un6Cmn8ItI0jnfhOKzZwjn8S4lQ7Abj+gN01VJUZqthnJ
        1h2xieeq/U1B/94/2QTZ0Ssng575JtMd/P7+FCk=
X-Google-Smtp-Source: APXvYqxKCJU7FYDbi2z/Ynz5+ClThgGVIlGk5c+MP7LYq+ng9LP99MBRt97KIy7ayu2FnqEy1VXipCTrUsF0p0Cuy3M=
X-Received: by 2002:ab0:3058:: with SMTP id x24mr24619043ual.95.1558108640471;
 Fri, 17 May 2019 08:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAJ1xhMUxsFR6yLeV1rG1FRZzqwyMGF5PURk6F5_6kN3v2dGN1A@mail.gmail.com>
 <68270a84-966b-05e3-c82e-893c320febfd@petrovitsch.priv.at> <CAJ1xhMVaeQPoW1v91bcNOkw1FJOr7ddhDc-ir=3AiKRCSzCj=g@mail.gmail.com>
In-Reply-To: <CAJ1xhMVaeQPoW1v91bcNOkw1FJOr7ddhDc-ir=3AiKRCSzCj=g@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 18 May 2019 00:56:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNATm5OS8wUh8boZJ9x65SUxajtDZV9bNdAvXcRgHC2NQdA@mail.gmail.com>
Message-ID: <CAK7LNATm5OS8wUh8boZJ9x65SUxajtDZV9bNdAvXcRgHC2NQdA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc:     Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 6:25 PM Alexander Kapshuk
<alexander.kapshuk@gmail.com> wrote:
>
> On Fri, May 17, 2019 at 11:58 AM Bernd Petrovitsch
> <bernd@petrovitsch.priv.at> wrote:
> >
> > On 17/05/2019 10:16, Alexander Kapshuk wrote:
> > [...]
> > > The 'xargs' '-r' flag is a GNU extension.
> > > If POSIX compliance is important here, the use of 'cat', 'xargs' and
> > > 'basename' may be substituted with that of 'sed' to initialise
> > > same_name_modules:
> > > sed 's!.*/!!' modules.order modules.builtin | sort | uniq -d
> >
> > 's!' is TTBOMK also a GNU-extension:
> > sed 's/.*\///' modules.order modules.builtin | sort | uniq -d
>
> It isn't.
> Here's an excerpt from the POSIX manpage for 'sed',
> http://pubs.opengroup.org/onlinepubs/009695399/utilities/sed.html:
> [2addr]s/BRE/replacement/flags
> ...  Any character other than backslash or <newline> can be used
> instead of a slash to delimit the BRE and the replacement....
>
> >
> > > 'Sed' may also be used on its own in the 'for' loop instead of as part
> > > of a pipeline along with 'grep' to generate the desired output:
> > > sed '/\/'$m'/!d;s:^kernel/:  :' modules.order modules.builtin
> >
> > sed "/\/${m}/!d;s/^kernel\//  /" modules.order modules.builtin
>
> The parameter expansion syntax is redundant here.
> See https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_02:
> The parameter name or symbol can be enclosed in braces, which are
> optional except for positional parameters with more than one digit or
> when parameter is a name and is followed by a character that could be
> interpreted as part of the name.
>
> Here's an alternative version using double quotes.
> sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin


Awesome!
This is much shorter.
I will use it in v3.

Thanks.


-- 
Best Regards
Masahiro Yamada
