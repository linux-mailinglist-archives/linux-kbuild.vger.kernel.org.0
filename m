Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6E13630DB
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 17:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236539AbhDQPXy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 11:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhDQPXy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 11:23:54 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EBAC061574;
        Sat, 17 Apr 2021 08:23:27 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id z1so33490442ybf.6;
        Sat, 17 Apr 2021 08:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HmMTmtBCQRZNyofhpoOoEzj8ENmJ8kD0a5DLzP7HYg=;
        b=eoQGnE/u95mYRZnHpjwYMY+m3rRKxZ3nlDOHhPzMBe1ibEcUeY+RSBy8XGHGNr8XGA
         4wwT/7Ia+UZZ+QwF2az2wWiZy7EriWC19DdD+DQLm2DxFxy4qsAnEXYfoKFtxIzOWX+T
         fba//DMusfhTFX5S19UmZrz8RrMABIHeCk66V8ZJ7tDgiSAs/dXcUM7maZI6upNxzPEf
         dasXZTsVBVYnAWNZTVo44IVslgscs2Azr0fmSd+Ir79QCqV6C2fQ3uE4FGlmHrUakpkr
         yPvKl7wU1VzrGeSW5/6SnPuyRYjSXxe7pqemNGJZyzx1XLGvepj9F6rcuGn7XfPteBUB
         cFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HmMTmtBCQRZNyofhpoOoEzj8ENmJ8kD0a5DLzP7HYg=;
        b=CWngPU3qbMXaCi9rp5ggS17lPbd9gWZ0r+5xz02uHjpt5dYrLqDJLMJrMhjiiiGvL4
         qPau6hkH9bYyOSAC4Zofp/oPsScpspb6fQwiR3q4i3wRIq3oJJaBgw5GeZawr10DhTlh
         IStn7tCmsxE00PDHn/I3zJgibutZJURcyuqhw0hl15OScu9ujQihZmJmQOUrm2CTS++C
         a2rDjYSpF82Tq3XwbiY7ocqeU9TLUhjnqKQIQDrCTrdDq6H44NqNFT/MdJfMNbB8f9uZ
         zzFtOTlabfIP1aifHUS1he/sfb05z6NUt5dT5NNfXmgCX7u5OWH/6Tgy02eIgFOg6OP7
         Aqhw==
X-Gm-Message-State: AOAM531heF0sKDOkEpysK1ID96+uBkyJyCur9ZTjWrbhd44wtR4InsgR
        H2dnIgdTmPyg4N8LQB4gY69nyJNvz1woTHit7ew=
X-Google-Smtp-Source: ABdhPJxc/J0XmDB6yBktwqTCEL8uc2L1lpMB3kJYCGdwdbEmDK7hbWGVvJb2r7XxL5/DFVADVgfBvmu39VuskdAyHfw=
X-Received: by 2002:a25:818f:: with SMTP id p15mr5294762ybk.135.1618673007090;
 Sat, 17 Apr 2021 08:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com> <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com> <20210416161444.GA10484@1wt.eu>
 <YHroRuI7lYDABWJR@google.com> <20210417142126.GA15678@1wt.eu>
In-Reply-To: <20210417142126.GA15678@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 17 Apr 2021 17:23:15 +0200
Message-ID: <CANiq72=FcOkw4NF8pXu8jk89zy6p81STuVktDnZRS=ZGW2HReA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Willy Tarreau <w@1wt.eu>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 4:21 PM Willy Tarreau <w@1wt.eu> wrote:
>
> Well, I can't express how much I hate abstractions because I constantly
> need to know what it's doing under the hood, and I spend my time reading
> the output asm code because I always want to confirm my assumptions about
> the compiler not cheating on me (and not hitting one of its bugs),
> especially after C compilers have become so smart that they completely
> replace your code with what they think is better for you, (including
> nothing), so I guess all of this is really not for someone like me.

Concerning compiler bugs etc.: as you mention, nowadays that applies
to both C and Rust.

Manually inspecting the output asm does not really scale anymore
because we need to worry about all compiler versions out there,
including future ones, for both GCC and Clang.

So we would need to disable optimizations, or reduce the set of
supported compiler versions, or automatically check the generated asm
(like in the compiler's own test suites), or keep binary blobs after
checking (like in some safety-critical domains), etc.

Since none of those are really doable for us (except perhaps for small
subsets of code or unit tests), we need other ways to help with this.
Rust provides several here. For instance, the UB-less subset means
less surprises and less double-checking if some particular construct
is UB and may give problems later on.

Similarly, Rust is actually more explicit in many cases than C, to
reduce surprises further. For instance, regarding implicit type
conversions, none of these compile:

    fn f1(n: i32) -> i64 { n }
    fn f2(n: i32, m: i64) { n + m; }
    fn f3(b: bool) -> i32 { b }
    fn f4(n: i32) -> bool { n }
    fn f5(n: i32) -> i32 { if n { 42 } else { 53 } }

Building abstractions also helps to ensure you get the semantics you
want in the face of smart optimizers -- rather than the opposite. For
instance, continuing with the integer examples, you may use a
`NonZeroU32`. Or a `Wrapping<u32>` for intentional wrapping integer
arithmetic, etc.

Cheers,
Miguel
