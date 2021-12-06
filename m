Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E6746A602
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Dec 2021 20:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348729AbhLFTzw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Dec 2021 14:55:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347759AbhLFTzv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Dec 2021 14:55:51 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F28C0613F8
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Dec 2021 11:52:22 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id t26so27999873lfk.9
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Dec 2021 11:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qCi545GbK80p7g1dOndZmxZ1t+GhgtzglTvcr5pYytw=;
        b=BeOKbti2cLjxynXRhm3uVU/EUMQvrRDofJNFCXD70PoFjKCjIkViJzExWINqSM41cT
         M3tsA3XXX728I+CF7b3WuTC0hZCo4DzYk8wCuxW+yfH1IbsWDO6KfXuxH856xk/DZp20
         M/2ExrQz6BX6H1dHggEaZL0QsDljVu9i6MJ7TyyNCkY1DmLrISnlMjca/mU3gdYAx8JE
         szTRQLeSZHqYxNJnAXaAufrUUJaMbKSAGtqmRgl/MhABVM+32IMpOkIoPswXlcRGDxTJ
         /Y3Qj26Hg4ihT90ZPGsVrFNHbEEs9VKWfvpu4BBLkMgCmwB5zY+fyhgq1R/3NqABjo2C
         bE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qCi545GbK80p7g1dOndZmxZ1t+GhgtzglTvcr5pYytw=;
        b=1McQvjS2PGg5gYJjhWMf9Wgvw6bfn5AA7l4o4MZQasM7miJr7xtuCBSTkqGk5DKfTx
         jaqIaNuzh0RKAbFm/WXeAhmgXHbhjs6uacs3gTG6SsWlCE6a/ZF5m571rhLtlFQjYMdn
         Qpy7RXkEP/kzlAqytcqYlLmLC0Ba2m15CqT5LsAFESJvA2tRaMExZmuLo81wAzlK4qOw
         2p7Mf9x+p94Xj2Ylhlwj7VFgzipqyVl7Vc5e5+XzOhcihUZRoNIMxMbpqT6GcJwIZRdD
         Af2oGApqNFONvLE9xIecP7AOVewF+E0Lqt07Gc2okBuBOtGHauSVB9Vh+GsRO1OsMiVs
         vDDg==
X-Gm-Message-State: AOAM532YEmZ+1M/LLnl4k5B2qECZeqkqvQfxVwEq4BZeRw68w8W1rYgN
        cQQHI5+rNNc+224flf2Y0/KcJ+EYZIVBaNBcasWVNA==
X-Google-Smtp-Source: ABdhPJzxQx0rWjWRUrzzOUFgjYLY+vk8jRMLZ9DjSV/X+VNkcdE4K2MaupeR9XFTfer1Qnc8G4Woge338nytB1DpSxE=
X-Received: by 2002:a05:6512:1506:: with SMTP id bq6mr37711959lfb.444.1638820340271;
 Mon, 06 Dec 2021 11:52:20 -0800 (PST)
MIME-Version: 1.0
References: <20211206140313.5653-1-ojeda@kernel.org> <20211206140313.5653-12-ojeda@kernel.org>
 <Ya4mAqoOa8zIeZGZ@kroah.com> <CANiq72kCmLgrv++mFygR6dt0xOhfv04o9j6jYLQ1N+zLNvqohQ@mail.gmail.com>
 <Ya40Bcv+eFkqc9jv@kroah.com>
In-Reply-To: <Ya40Bcv+eFkqc9jv@kroah.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 6 Dec 2021 11:52:09 -0800
Message-ID: <CAKwvOdkLF_DPP1FF60720q3zxZG2qaSNTthxJPxLb4Bj=AFE=Q@mail.gmail.com>
Subject: Re: [PATCH 11/19] vsprintf: add new `%pA` format specifier
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Gary Guo <gary@garyguo.net>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 6, 2021 at 8:14 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 06, 2021 at 04:56:32PM +0100, Miguel Ojeda wrote:
> > On Mon, Dec 6, 2021 at 4:46 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > That should be in a .h file somewhere.  Remember, don't put #ifdef in .c
> > > files please.

Why not put #ifdef in .c files?

> > Will do, thanks for reviewing!
> >
> > > Same here, this should not be needed if you put it in a .h file
> > > correctly.

I guess IS_ENABLED could be used in the .c code, but I don't see how
they could move the dispatch to rust_fmt_argument to a header without
moving the definition of pointer() to a header, which they probably
_cant_ do because it's noinline_for_stack.

> >
> > This one is mimicking the `CONFIG_BLOCK` one (`case 'g'` a bit above)
> > -- but we can change it, of course.
>
> That should be changed as well :)

Isn't the point to minimize code that's unused for certain configurations?

-- 
Thanks,
~Nick Desaulniers
