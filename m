Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9862C362A18
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 23:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344298AbhDPVWE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 17:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344236AbhDPVV6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 17:21:58 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FF8C061344;
        Fri, 16 Apr 2021 14:19:29 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id n12so31607189ybf.8;
        Fri, 16 Apr 2021 14:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=udsjYFmKZpzpPEZQ/S94m1J5JpuvU1EmGzVJfAa7Om8=;
        b=EosPrWTw2GhguQ2HMV+cpFl/54oW1S4zmr0H6Z19xIAq8cU8Ub7uO0q4nQJtoyDVvK
         BNqH90kAcYN+mw5cr4HGgxGG+iJGmV4cALQryNtFoHePwef1ZBT3WZigxR2u2XzyID7Y
         FtENA/IG+gQ+zeJ6zH2YdrU+qKGAPR0s8lhip+Vpw4vNuMV+2D2wdts7ehDxz0UES6H4
         l4fvpS8suXEog7ap3jlfQ0Xh4KOLjFaYu3p7hSp7QcjjOsG8VFx8Qr4mwG/NZitsEk7L
         pRcdqgY1Iw0tQF5BDyjGmlQw08P9lXHmjJ5Q0dPeFAD9IEr3E316XmQ10pJ36U1McKEH
         ToRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udsjYFmKZpzpPEZQ/S94m1J5JpuvU1EmGzVJfAa7Om8=;
        b=WdpT+jFBsWQRQ819ZrHvu+RIVCQZ6P3/aI4uXeNhips7Orx0XP5xfsJw0s2WikOY0L
         LVzK/8ZOWcvKvm6dYnxXTsEduDbbDjceYc3JVFya+lQ9P5dd4/zwIQXvnQJWqc3IQng/
         OPd03p0iJMEf1Lhs3lA8OZIoFfnMr9MivkaoBKNT8taHb3ENJ0MJtrmXjEq1lDBy1huI
         VlOgAD6P65sennUFm8Ut5WPB5k3wOqcTGfqf1xR/uEO6k42Urw0xzCV4sTL+vZ06qjez
         s6b0sadOrmxHIjE2Vt5J9rItfnGUkUtXxgWQtFyRcnu6CkziQkC8WIoQsYsrhQVjnaeX
         XrDA==
X-Gm-Message-State: AOAM533mtfUVJMZUwgqIIoU1Vx3iohlS4kTf7VzgddxIYqhF2Do51FT9
        0ALxOPUr3WEk2I15QmHL8DV+Fra6pcb9JpH3+5M=
X-Google-Smtp-Source: ABdhPJyNClVV1yCAjhal7QcWJILaE+DVzQrq0w+nHD/4P9l19UMiv/gcRcnPaNvszVrGtWxPIoOZxPQaGFw3tBNsX4U=
X-Received: by 2002:a25:7909:: with SMTP id u9mr1528074ybc.22.1618607969202;
 Fri, 16 Apr 2021 14:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net> <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
 <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk> <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
 <20210416202215.GA11236@1wt.eu>
In-Reply-To: <20210416202215.GA11236@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 23:19:18 +0200
Message-ID: <CANiq72=3zZvdEsp-AH2Xj1nuvfGOQQ1WGmav6i4nFTz-3-_c_w@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Willy Tarreau <w@1wt.eu>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 10:22 PM Willy Tarreau <w@1wt.eu> wrote:
>
> So it simply does the equivalent of:
>
>   struct result {
>      int status;
>      int error;
>   };

Not exactly, it is more like a tagged union, as Connor mentioned.

However, and this is the critical bit: it is a compile-time error to
access the inactive variants (in safe code). In C, it is on you to
keep track which one is the current one.

>      kill_foo();   // only for rust, C doesn't need it

Please note that `kill_foo()` is not needed in Rust -- it was an
example of possible cleanup (since Al mentioned resources/cleanup)
using RAII.

Cheers,
Miguel
