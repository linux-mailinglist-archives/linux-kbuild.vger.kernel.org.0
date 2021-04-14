Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A3635FBCB
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242822AbhDNTpf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbhDNTpf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:45:35 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A358FC06175F
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:45:12 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a25so11246575ljm.11
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=catwv2q3GSgLTDfMsYUmKmCZSwshqzh+pHe6dS6qFq0=;
        b=QSP43wtvqaEpZcRARk7mnw6oGOWu/4ywNnl/aVkEAOC2K7s8WzvGjOeQ31KNa9gAzv
         Kwi4DqSQUP2RnnG596Y/A8JFnkJHEpUBMWLjMY+a11yRwc7I1t6lIfi35/Jgsk4ZVu7F
         xXR4Tg1KelOIvKHH456Hdflb01KVNQFjYFjuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=catwv2q3GSgLTDfMsYUmKmCZSwshqzh+pHe6dS6qFq0=;
        b=lNznhZl4B48zehyMPqVbMbzKWNmJcsZQk/eLPKNaWgaX8ERmFdMySVF2swDulzEgU2
         dtMLulK/Jh+6tvET4xpDue91YwpBQ3B9BkfBTM8Evp2gf0NIzituj6kmkXT3IxXJHrV2
         sQ4UbbvFATK5tuW7I8A1+wzhGMSDL5eFrzC6QFBu02UJqgajLgmtSq9hbngYzueO+IvT
         7Q7Tpy7EKX1+AECn8DeukPyl3XDs6cC+fZnVZ+bCWWFjo4pKf2/OEHWULhSBbLVjOK6n
         0N2HibAJUsLjKPghBNddak8mByoXzmhzuLfourqgsjsz0NqpX4bKPkIYXNfo0KL1yNw+
         oG+Q==
X-Gm-Message-State: AOAM5318nw7k8N57fRhCJ46AKwHYd9vlDjUdea6tK0Egzbcjp2E749cZ
        cR0y7gYnp5EqEY7m85f8I/jo3MLg9w+aqHhF
X-Google-Smtp-Source: ABdhPJzlvUaykN6hFuBdTPOOG5OhjMQjug5LaBxGlvtsWUpRFyXYUUYsUZBpVKAQ3H48uDVl69M9vA==
X-Received: by 2002:a2e:8657:: with SMTP id i23mr8002904ljj.72.1618429510868;
        Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id l7sm109501lje.30.2021.04.14.12.45.10
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id n138so35249588lfa.3
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 12:45:10 -0700 (PDT)
X-Received: by 2002:ac2:58fc:: with SMTP id v28mr26526183lfo.201.1618429509986;
 Wed, 14 Apr 2021 12:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Apr 2021 12:44:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
Message-ID: <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     ojeda@kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:46 AM <ojeda@kernel.org> wrote:
>
> Some of you have noticed the past few weeks and months that
> a serious attempt to bring a second language to the kernel was
> being forged. We are finally here, with an RFC that adds support
> for Rust to the Linux kernel.

So I replied with my reactions to a couple of the individual patches,
but on the whole I don't hate it.

HOWEVER.

I do think that the "run-time failure panic" is a fundamental issue.

I may not understand the ramifications of when it can happen, so maybe
it's less of an issue than I think it is, but very fundamentally I
think that if some Rust allocation can cause a panic, this is simply
_fundamentally_ not acceptable.

Allocation failures in a driver or non-core code - and that is by
definition all of any new Rust code - can never EVER validly cause
panics. Same goes for "oh, some case I didn't test used 128-bit
integers or floating point".

So if the Rust compiler causes hidden allocations that cannot be
caught and returned as errors, then I seriously think that this whole
approach needs to be entirely NAK'ed, and the Rust infrastructure -
whether at the compiler level or in the kernel wrappers - needs more
work.

So if the panic was just some placeholder for things that _can_ be
caught, then I think that catching code absolutely needs to be
written, and not left as a to-do.

And if the panic situation is some fundamental "this is what the Rust
compiler does for internal allocation failures", then I think it needs
more than just kernel wrapper work - it needs the Rust compiler to be
*fixed*.

Because kernel code is different from random user-space system tools.
Running out of memory simply MUST NOT cause an abort.  It needs to
just result in an error return.

I don't know enough about how the out-of-memory situations would be
triggered and caught to actually know whether this is a fundamental
problem or not, so my reaction comes from ignorance, but basically the
rule has to be that there are absolutely zero run-time "panic()"
calls. Unsafe code has to either be caught at compile time, or it has
to be handled dynamically as just a regular error.

With the main point of Rust being safety, there is no way I will ever
accept "panic dynamically" (whether due to out-of-memory or due to
anything else - I also reacted to the "floating point use causes
dynamic panics") as a feature in the Rust model.

           Linus
