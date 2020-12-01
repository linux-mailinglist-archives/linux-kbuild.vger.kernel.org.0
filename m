Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435AF2CA578
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 15:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbgLAOVj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 09:21:39 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:36413 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729411AbgLAOVi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 09:21:38 -0500
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0B1EKYI1003371
        for <linux-kbuild@vger.kernel.org>; Tue, 1 Dec 2020 23:20:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0B1EKYI1003371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606832434;
        bh=2ppzpEexn36KCtFQ3tIfMLzoLL13C4A8eh09nX8Pgl0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2RfCewjI7xPiiolHBrgQsVThkaYhySrG7UfNyH58Sg/ZO5Icaici5tAU2hhqcUY3C
         7sqew61c1slf2zUCYeWNHQGD7MiWUvWsJxHfsWZjJTD17iMJjDhKhPKjWtPMDveiV/
         q6Zqdj6KCQqzFatMOu3HOSSwGKpeJUq/RvwpYoSULD9Eb3o1vfjbgjwdL9i7J/2KoA
         k4BorY+4PqL8gwwTXCljYDlcGNLAtDIB909fAKPAyaxSGlxImmq4tE7WkJfDhckYQD
         rDuhP48eb9SyTMy1vC0D1YvKFiW8/7bvdI8VyQZmjT5gO58tnXA3OeAeEq2hUJcP9m
         yXmwXsNYMcHhA==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id v1so1311380pjr.2
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 06:20:34 -0800 (PST)
X-Gm-Message-State: AOAM531bP/9TibLJXKyCxOd5VNfJiw6wHGIq/YH7J8CF8hjfZSXNf4Ge
        NSxM0ozU1iEEafdj41v3RRuUyflqQ/HscVbgNdc=
X-Google-Smtp-Source: ABdhPJxrfq7p7X3oh2q1F0WlXdeZV5J9pRol0jcaxqq4GRF/PrL3ZtCEgdrmBi52F5Nescr1qkbr+T5u4zcPzAL2oGc=
X-Received: by 2002:a17:90a:c209:: with SMTP id e9mr2975577pjt.87.1606832433912;
 Tue, 01 Dec 2020 06:20:33 -0800 (PST)
MIME-Version: 1.0
References: <boris.20201125161355@codesynthesis.com>
In-Reply-To: <boris.20201125161355@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 23:19:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
Message-ID: <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
Subject: Re: kconfig: diagnostics cleanups
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 25, 2020 at 11:38 PM Boris Kolpackov
<boris@codesynthesis.com> wrote:
>
> I am preparing a set of patches that clean up kconfig diagnostics and
> make it more consistent both internally and with respect to other
> tools (like compilers). However, a couple of changes that I would like
> to make could be controversial so I want to discuss them before wasting
> everyone's time with patches:
>
> 1. Add 'warning' word to $(warning-if) output:
>
> -  fprintf(stderr, "%s:%d: %s\n", ...);
> +  fprintf(stderr, "%s:%d: warning: %s\n", ...);
>
>    This makes it consistent with the rest of the warnings printed by
>    kconfig.
>
> 2. Print $(info) output to stderr instead of stdout.
>
> I realize the current behavior is consistent with GNU make (on which
> it is based) but at the same time it's inconsistent with the rest of
> kconfig (#1) or does not seem to make much sense (#2), at least to
> me.
>
> To elaborate on #2, $(info) is still diagnostics, just a different
> level compared to $(warning-if) and $(error-if). It's not clear to
> me why it should go to stdout.
>
> If we needed the ability to print something to stdout, we could add
> another function, such as $(print). However, I can't think of a good
> reason why we would need to; this, for example, has the potential to
> mess up with the terminal-based UI (which is written to stdout).
>
> I've done a search and as far as I can see, neither $(warning) nor
> $(info) is currently used anywhere in the kernel outside the kconfig
> testsuite. So these changes shouldn't have any backwards-compatibility
> issues.
>
> Thoughts?


$(warning-if ...) and $(info ...) mimic
$(warning ...) and $(info ...) because
the design of kconfig macros was inspired by GNU Make.

So, I implemented them in the same way as GNU Make did
unless I had a good reason to do otherwise.

I expected they would be useful for debugging for something,
but there is no actual user.

We can change them if there is a reason,
but I cannot see it in your description.


-- 
Best Regards
Masahiro Yamada
