Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0534730B1D1
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Feb 2021 22:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhBAVAd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Feb 2021 16:00:33 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:40249 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhBAVAb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Feb 2021 16:00:31 -0500
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 111KxSLi012988;
        Tue, 2 Feb 2021 05:59:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 111KxSLi012988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612213169;
        bh=kAlAHi/OGtvLm+bYrSQ8UHY37fzkJJ3uPPuK5hDluAs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CDJyrsnKeA09Ip8ukvWIBazReG5HhM+cxCQAk7Y7cQ5O+wvJ3ckgvQ5yY1ZCE4Eet
         ZThkVTyAQ7WK9ScoSsfyTeEkGrBMmMUC2uxGgMNerbBpA+kXkiFS4unCZpny9FN9Ew
         44wZJYCZETIpQVJMhYyb2AItBIXS8/M6FBnU4K2qUHKf8QjbOH5ZEiQdQCX4LfxUdE
         mqyuzUdC869wc/cksy+LIqVWh3tUqcmox+xspVxxRFE71N0eyLnh7SuqieMH9RLCG5
         iLu9noLS+9Ixf/HIjR+VR+1hcQ/AFLwldFCkQ2jS3EAW2AGT8kcJA4s9GtrdWG7/3o
         SxDABvdSrhuug==
X-Nifty-SrcIP: [209.85.215.173]
Received: by mail-pg1-f173.google.com with SMTP id n10so12910564pgl.10;
        Mon, 01 Feb 2021 12:59:28 -0800 (PST)
X-Gm-Message-State: AOAM531u0zgqseuZtvQtobrWxgvTDr1NOhw6GadkXEkRce4ASHsG36gX
        TCpUF7EZEB10GTsf/z3OYmGxDdt1M99W1pwPCxc=
X-Google-Smtp-Source: ABdhPJys0q96JhGd9rQK509mjBP+Td2+PvZmoi8hhx8MEYI4qlX/UXEaMXaykRrQo4Yg7kC2dDa6Gqg1a9cK56zqQfA=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr19001783pgi.175.1612213168125;
 Mon, 01 Feb 2021 12:59:28 -0800 (PST)
MIME-Version: 1.0
References: <20210201010024.654526-1-masahiroy@kernel.org> <87r1lzvj3q.fsf@meer.lwn.net>
In-Reply-To: <87r1lzvj3q.fsf@meer.lwn.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 2 Feb 2021 05:58:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQQ=kqhx6REix7j+ZndABjuCBEwp=yiQp71Z0fBrQZxog@mail.gmail.com>
Message-ID: <CAK7LNAQQ=kqhx6REix7j+ZndABjuCBEwp=yiQp71Z0fBrQZxog@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove PYTHON variable
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 2, 2021 at 1:38 AM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > Python retired in 2020, and some distributions do not provide the
> > 'python' command any more.
> >
> > As in commit 51839e29cb59 ("scripts: switch explicitly to Python 3"),
> > we need to use more specific 'python3' to invoke scripts even if they
> > are written in a way compatible with both Python 2 and 3.
> >
> > This commit removes the variable 'PYTHON', and switches the existing
> > users to 'PYTHON3'.
> >
> > BTW, PEP 394 (https://www.python.org/dev/peps/pep-0394/) is a helpful
> > material.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> So this will have the effect of making the docs build impossible for
> folks who only have Python 2.


Is this a problem?  Python 2 is EOL.

Everybody who wants to use Python
must install Python 3.


Rather, people are screaming
that the 'python' command does not exist.




>  As I said before, this is a step that we
> knew was coming, we just hadn't decided on the exact timing - I guess
> this decides for us :)
>
> That said, I'll copy linux-doc to see if anybody screams.  I assume this
> is a 5.12 change?


No, I am planning to do this for 5.11
(a pull request this week if there is no objection).








> Thanks,
>
> jon
>


-- 
Best Regards
Masahiro Yamada
