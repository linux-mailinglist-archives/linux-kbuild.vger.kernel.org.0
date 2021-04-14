Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDEEA35FC7D
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 22:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348298AbhDNUVZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 16:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346875AbhDNUVY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 16:21:24 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CECC061574;
        Wed, 14 Apr 2021 13:21:02 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id v72so2844498ybe.11;
        Wed, 14 Apr 2021 13:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9WAReIIx1ygTdBPWTI/Fl7Iw9AOXUrLAYUBbvQxYk/0=;
        b=AtZ86fQsc9vbhS+649ka/x3Vj2lPW3l2j7IbUMgqzoHIr27tbnz34peNrS+Osln6MF
         8s4zB25sJWABQ/ft4gzaNPScyPjYQNC6LqeY6kIAvpae9UbMrYeiSduUmQyEr1EMCPbi
         BjHlDGCELkTeNCMKpJ/0AHTa+3ie6WA0rOS3EMqB0QPDD/wIjGm6QO0gxhWuMp0+W8T8
         IZ2Nf99VYAhiC0/QDvOCEXIia/ABgVwDWpNN0NvwfiyaD14yindlUw0D8NetVqY38kPT
         Xu49nNmdrxSButVyzlw+DOOqBuE/QPdX06vRdQcJnhKmevZTVYU9OVfuTeOipVVsoxNu
         L5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9WAReIIx1ygTdBPWTI/Fl7Iw9AOXUrLAYUBbvQxYk/0=;
        b=eJJdEcNPjIHf1/e7BkerASwIXLi9o9PtTb+MC51cZGUF1IZEVx776AvKuOrRfEliKb
         /owULlJD0OfKptZaslRvZ6skXXLHdEu8Az28SozSlYzRGN1SOBXsjwQvshQwnllBQEkz
         X7LZOf/HNJpFgbyLXZg2vL+yU8dUJQx4d5ROULtN8SkCXlkuANdm7YswYGAVWPZNDsMj
         3PKFVS9LIEZzekN3nV5uYGrMmdKmC9mnEMqPeECStQsApsJk0G7IihMij3VujNYaktj4
         n7jKqQkwef4FOiDUDmrCTgfEEuYzoK+wxdyIjWLoLRd5P8Goty9VaBU4h6pLq6GAgJeJ
         4pgA==
X-Gm-Message-State: AOAM532fxC04geBXDqwQc+plblCz3t7J4nSN0KHGD4aRYO6plDRqxa6N
        W4TKA7B+ipdEs6XsjqOUQ3HMVvS05DIjclRd+l/kK6d66Po=
X-Google-Smtp-Source: ABdhPJwtFkwWYVw1PZvDFwR6rrbSIKUJhbJ583nYNAFSAqVJ1i9nl83cDJyFig6U2jHrTseiLxEuutlz1Vwc1rFqekk=
X-Received: by 2002:a25:b781:: with SMTP id n1mr56541289ybh.115.1618431662257;
 Wed, 14 Apr 2021 13:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
In-Reply-To: <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Apr 2021 22:20:51 +0200
Message-ID: <CANiq72mSMtfdRFPGJKuoqCBFdsa_xHvx9ATjcB7QSunQdDHBuw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 9:45 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> With the main point of Rust being safety, there is no way I will ever
> accept "panic dynamically" (whether due to out-of-memory or due to
> anything else - I also reacted to the "floating point use causes
> dynamic panics") as a feature in the Rust model.

Agreed on all your points. As I mentioned in the other message (we
crossed emails), we have a lot of work to do regarding `alloc` and
slicing `core` for things that are not needed for the kernel
(floating-point, etc.).

We haven't done it just yet because it is not a trivial amount of work
and we wanted to have some overall sentiment from you and the
community overall before tackling everything. But it is doable and
there isn't any fundamental reason that prevents it (in fact, the
language supports no-allocation code).

Worst case, we may need to request a few bits here and there to the
`rustc` and standard library teams, but that should be about it.

In summary, to be clear:

  - On allocation: this is just our usage of `alloc` in order to speed
development up -- it will be replaced (or customized, we have to
decide how we will approach it) with our own allocation and data
structures.

  - On floating-point, 128-bit, etc.: the main issue is that the
`core` library is a single big blob at the moment. I have already
mentioned this to some Rust team folks. We will need a way to "cut"
some things out, for instance with the "feature flags" they already
have for other crates (or they can split `core` in to several, like
`alloc` is for similar reasons). Or we could do it on our side
somehow, but I prefer to avoid that (we cannot easily customize `core`
like we can with `alloc`, because it is tied to the compiler too
tightly).

Thanks a lot for having taken a look so quickly, by the way!

Cheers,
Miguel
