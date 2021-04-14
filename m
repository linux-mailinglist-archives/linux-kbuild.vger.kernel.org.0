Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAD135FCAA
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 22:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240342AbhDNUaD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 16:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhDNUaD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 16:30:03 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDB3C061574;
        Wed, 14 Apr 2021 13:29:41 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id o10so23577775ybb.10;
        Wed, 14 Apr 2021 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k5+3Zcx9SbPgbtideyuztneS+UphA/WZENqotqNybCo=;
        b=Cne8wDCv8xZzPpyCejigmMiiK72EAolmihHlFf9BvT8vNS3TOvJxdileV9kq6EHAuw
         VnHgybuoHRVZvpFWbGNpMMGIs1iez2Zx3L4MHfeJut6MubGEk2AyFRMdQkoDxgtANUEb
         c12uupBh/lkfvh0tacVFI2Nws1flG0+KEp5i5OojS6ohzRCfuL4by3KgLvTO7tMx2IpW
         FFRK75R+v0hvl2qfxOEiQrw4YXslAx9BhoZ90GB3JckIYPLtYzdEtLU7KkXJsUXahbW8
         gAgG3VuRuPd/NXFGYIQDS69m6nW2CF4SQxg7Qgwj9mBkB0kCB/r7+RnHhLEYcMN5MN9a
         xtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k5+3Zcx9SbPgbtideyuztneS+UphA/WZENqotqNybCo=;
        b=AbUa5KDIXOT7HPpK21LgkjpXlgd0kA89ktwZrzj0usxYig0e6Ka0JbJ5ITf9p27ohQ
         CG5dGb9y20LOnF1F5+yPvXHBLHXxCOYmjPt86rG7sFztpfNkfhtC0q/yWI1Ml6tMbwRv
         bzYRTSut6Cvevs6FeVApNkIWDM2RE0pK5JHqG/ARouyUk+hdBH4EXHvD7fwcvI7W6uX4
         baWvE06jNO7J5oo3R/AfsN6t8ej6F9itTywh49YhqD1H1LaSwMEPtB3C/cJ36W6NkED8
         dA9Ty/H7tHbQhv9cESZ4JnGSZjDGqXHEUfIGUIp4rlCVuhLHXIGeV9ysDxifccOtOmbZ
         FIlw==
X-Gm-Message-State: AOAM531XyCTEmR+DpOIusDBPGnICIBbCvfzrTwnBvumH5uZ+EO8A3JjA
        2wztItPIfxO+hjwrmyRunfNtZ2ikhsMbj862i9VEkcXd3rQJrA==
X-Google-Smtp-Source: ABdhPJx+qxrzB0uaHK8kY8gSFqvwpxqkk7bZ5pRKgT+ZXeNYlXZYhUhnTXTIBXR9Mh7x3yiMfLT8aahFZ7vqwW1PY+E=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr36810340ybg.26.1618432180677;
 Wed, 14 Apr 2021 13:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414200953.GX2531743@casper.infradead.org>
In-Reply-To: <20210414200953.GX2531743@casper.infradead.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Apr 2021 22:29:29 +0200
Message-ID: <CANiq72khBa2GcB6-PHM3A44Y90d6vzYAS=BVpk3nT4B6u+NVDw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 10:10 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
> >   - Manish Goregaokar implemented the fallible `Box`, `Arc`, and `Rc`
> >     allocator APIs in Rust's `alloc` standard library for us.
>
> There's a philosophical point to be discussed here which you're skating
> right over!  Should rust-in-the-linux-kernel provide the same memory
> allocation APIs as the rust-standard-library, or should it provide a Rusty
> API to the standard-linux-memory-allocation APIs?  You seem to be doing
> both ... there was a wrapper around alloc_pages() in the Binder patches,
> and then you talk about Box, Arc and Rc here.

Please see my reply to Linus. The Rust standard library team is doing
work on allocators, fallible allocations, etc., but that is very much
a WIP. We hope that our usage and needs inform them in their design.

Manish Goregaokar implemented the `try_reserve` feature since he knew
we wanted to have fallible allocations etc. (I was not really involved
in that, perhaps somebody else can comment); but we will have to
replace `alloc` anyway in the near feature, and we wanted to give
Manish credit for advancing the state of the art there nevertheless.

> Maybe there's some details about when one can use one kind of API and
> when to use another.  But I fear that we'll have Rust code at interrupt
> level trying to use allocators which assume that they can sleep, and
> things will go badly wrong.

Definitely. In fact, we want to have all public functions exposed by
Rust infrastructure tagged with the context they can work in, etc.
Ideally, we could propose a language feature like "colored `unsafe`"
so that one can actually inform the compiler that a function is only
safe in some contexts, e.g. `unsafe(interrupt)`. But language features
are a moonshot, for the moment we want to go with the annotation in
the doc-comment, like we do with the `Safety` preconditions and type
invariants.

Cheers,
Miguel
