Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8840536282A
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 20:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbhDPS5o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 14:57:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbhDPS5o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 14:57:44 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BA6C061574;
        Fri, 16 Apr 2021 11:57:19 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id c195so31207566ybf.9;
        Fri, 16 Apr 2021 11:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IuXR4s76KW2g16KgmTJ3s1NR8NxaS0rBglhD+4wC2bA=;
        b=t6Eh6V9OMwi659Ak0KE8pRM5p87Dz7/7Ty3eBJkJHR3jxgYIRk0vixc1KxYDXStbk3
         0xvaAqI02zC6EBd3wRdbUwS3/Z/BenDWtD6tLgUY2gwjWBt+8SHdws8AwkQZcTMCn7kl
         Sp3dnKOM/qyPCfBCJ40L2kHBWxeAhGPHPN4AjRdjoXVllD5DZC/L4Wl2n0WmZDCEsFkM
         J6Qc9+HPOeE5f+JvWQTM/3gHA99pYJs2U5IS1IiXXhX8jaOCQOY7X19eZOG14hIgMPWg
         O1+7MnPo2thZERtolLuOH8vVpWQgb18ZVviCi3wdpOcMF7nxQ4o2D5qfJ4G5oRDOrgUh
         2p3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IuXR4s76KW2g16KgmTJ3s1NR8NxaS0rBglhD+4wC2bA=;
        b=NYIjMm4lEkPwIcMaUDyDT5xaKKD2U+yilwnWNNlNTT0yL5dBBkzR58BLM+F2F0f0Vz
         Hfwc/exKTRDJYkiGFLxg+82FDOcAwaiaCELMW8jWjk41YDH6sH65lOl0JtYbmz2dYgH9
         ATzlSpZAxMB48F1b0yanH60GxDQxyETKwFg0k+f7yntuKSHVKp24aZnXQW15ArCgdOrf
         aXjQYPPClvmE3QTzZpQOQohHrb5+V35NE1UMXkCQZte4Gpy1i8XN+WyKSfTgIN5dukRd
         quksGae5h3qn8rw/ZRZXODe2a8VT+nh8jhdoEsN6DCYbCdEdqLPOSd6em8rgm0XulNz0
         ac2w==
X-Gm-Message-State: AOAM530n34tK4h6tsiWP/rwK4NU7jOQpH1dbWd0jTCXehiLmdTS6k46f
        3Yy3t6/Rpk7MS3DTX4T++U795QSCYyqTaoFZcFA=
X-Google-Smtp-Source: ABdhPJx/Sef28+ab/jqRThJjs0GBqd35mSjtjTNKxxnwr7wkjUsSlz3TUt4YQ3eQatBFCI53ILW6au7VDYWbxBsQHvQ=
X-Received: by 2002:a25:7909:: with SMTP id u9mr796140ybc.22.1618599438460;
 Fri, 16 Apr 2021 11:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net> <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com> <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk>
In-Reply-To: <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 20:57:07 +0200
Message-ID: <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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

On Fri, Apr 16, 2021 at 8:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> How well would ? operator fit that pattern?  _If_ it's just a syntax sugar
> along the lines of "if argument matches Err(_), return Err(_)", the types
> shouldn't be an issue, but that might need some fun with releasing resources,
> etc.  If it's something more elaborate... details, please.

Yes, it is just syntax sugar -- it doesn't introduce any power to the language.

It was introduced because it is a very common pattern when using the
`Result` and `Option` enums. In fact, before it existed, it was just a
simple macro that you could also implement yourself.

For instance, given `Foo` and `Bar` types that need RAII cleanup of
some kind (let's say `kill_foo()` and `kill_bar()`):

    fn foo() -> KernelResult<Foo> {
        if black_box() {
            return Err(EINVAL);
        }

        // something that gets you a `Foo`
        let foo = ...;

        Ok(foo)
    }

    fn bar() -> KernelResult<Bar> {
        let p = foo()?;

        // something that gets you a `Bar`, possibly using the `p`
        let bar = ...;

        Ok(bar)
    }

This reduces to (full example at https://godbolt.org/z/hjTxd3oP1):

    bar:
            push    rbx
            mov     ebx, 1
            call    qword ptr [rip + black_box@GOTPCREL]
            test    al, al
            jne     .LBB2_2
            call    qword ptr [rip + kill_foo@GOTPCREL]
            xor     ebx, ebx
    .LBB2_2:
            mov     eax, ebx
            mov     edx, -1234
            pop     rbx
            ret

You can see `bar()` calls `black_box()`. If it failed, it returns the
EINVAL. Otherwise, it cleans up the `foo` automatically and returns
the successful `bar`.

Cheers,
Miguel
