Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E85FDF0EDE
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 07:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbfKFG03 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 01:26:29 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20719 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfKFG03 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 01:26:29 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id xA66QLgl015592;
        Wed, 6 Nov 2019 15:26:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com xA66QLgl015592
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573021582;
        bh=nwdmRec0SwvFntm3oIpBtAklltXncxX2mwlUG5yNPgo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Yp0YpKRn+UMpUGuxOb739Zn1aD65XmZMHkgCbVNF8VdKW/8BpXQmfi428Y0d5Y5Qv
         hYJM6tjObUgtnAxz7jWyUfW5yVwhePikksylra69GtRAPQR4mIQrzcF5OcQGbwJuIc
         T20EmCLlV6s34eKBcUQxzwBTB6dw43IC5mA4y4yOodes1AsQLGRpodOVxK9+8z9Qa2
         DVWd94hvIDm1YglRI5VROjb3QusI4jPlgb/WjEASYrYH91sKA6ylWIWzH85f/U/UJB
         Fpoqlj1wg4/nSOTg2iKLzfwTvbBH0Jb9sG91tNdD5+BOO7JZtM3CZvjyKHHvPBwf6O
         /W2QppSZ1nIeg==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id c25so4923268vsp.0;
        Tue, 05 Nov 2019 22:26:22 -0800 (PST)
X-Gm-Message-State: APjAAAW3sC7fGL2CXxpFwBKa2875tMKriu7IRWfZQeH0FWG0YYTYyQvV
        z0SpJPKpR/GSuwrgAB4VVzW0/h4nsi4Mj8YMU3E=
X-Google-Smtp-Source: APXvYqwGgJ9D5WT2pjLPzqfIFFWGWWXEasOPtaXRompnn/0I3eBIhmjsnMRvmqemlUnLD5mT+T5vt2z+TsxRh/7goAs=
X-Received: by 2002:a67:2d08:: with SMTP id t8mr475945vst.155.1573021581064;
 Tue, 05 Nov 2019 22:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20191025080544.7209-1-unixbhaskar@gmail.com> <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
 <20191106042049.GC20442@Gentoo>
In-Reply-To: <20191106042049.GC20442@Gentoo>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 6 Nov 2019 15:25:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNARdxhr1Ab1bkUqRjz4LGuH6mUg9kmp_4U0sYcK8uWzRyw@mail.gmail.com>
Message-ID: <CAK7LNARdxhr1Ab1bkUqRjz4LGuH6mUg9kmp_4U0sYcK8uWzRyw@mail.gmail.com>
Subject: Re: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 6, 2019 at 1:21 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> On 13:15 Wed 06 Nov 2019, Masahiro Yamada wrote:
> >On Fri, Oct 25, 2019 at 5:06 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> >>
> >> This patch will replace backquote to dollar parenthesis syntax
> >> for better readability.Corrected one.
> >
> >Talking about the commit subject,
> >which part is 'bash syntax' ?
> >
> >One more thing,
> >"correct one" is not the correct way to send
> >a new patch version.
> >See the patch submission from other people.
> >The version number is enclosed in the square brackets.
> >
> >[PATCH v2]
> >
> >
> >The commit subject should describe what it does
> >in imperative mood.
> >
> >https://patchwork.kernel.org/patch/11205593/
> You are right ..my mistake ..shouldn't have included the
> "correct one" ...and you are absolutely right..."bash syntax"
> is as vague and confusing .
>
> Again , Would you mind if I send you the correct one with
> proper subject line and explained what changed.


I will pick up the patch with the subject corrected
but you do not need to send similar patches any more.

`...` is the correct syntax.
Even if $(...) is more readable,
the added value is quite small.




-- 
Best Regards
Masahiro Yamada
