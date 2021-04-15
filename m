Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793AF35FEFA
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 02:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhDOAnw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 20:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbhDOAnw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 20:43:52 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB21C061574;
        Wed, 14 Apr 2021 17:43:30 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id n12so24189719ybf.8;
        Wed, 14 Apr 2021 17:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gbhHC/vUWtGXjPx5nVJMHlGAGaElqOL7Wm2WWdBAjY0=;
        b=GBJxD+5wzc4WCtmmyvlFdpThQgshHxMBnvPvg6UyaVhQoSyNJxykdRZhcOftvsBf6d
         dwvrZO385oKymlr4NDYx5XCxWjBo9VFpTtpieQHDjXOPGKnTwk5fgNpSD/nkzhcZW1Ab
         F7+cjXnLK1smG9RMQPicTXeGyFGEQyEaK8WBppnoR8NcsrCa0Fcfy+OL4AKnaihWwnhv
         3sZjipIH5LAnBPEKzVcusNDE7+H6RaU/yEirmlpn9pimq+OoGnGqBV+ip0CLENkB4Ax2
         EOqz5u8GreIzYu77vPAt31VqT9PDpQtMKMXncRZ0ZNcRxDV6k3vyWM7Vs/Gk7JS9dd39
         bL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gbhHC/vUWtGXjPx5nVJMHlGAGaElqOL7Wm2WWdBAjY0=;
        b=Rur9mkDYi54FB2PZYASMtgPL0pVW1MZrxm6AK0/EfCpC0bUbYEUqxxb2UaD8yBQykh
         crvvyPmZOoJlrHNN8u6rKAY4fxq77TDs5OzBIqn49wURzcSTDtVk1JYB6zu26NDA8ss+
         qArgYrmGSFI4abA3ZrU2n+DyVcVTbdYWzF2AxL587Z4ROBvPXazO8EzPjn0mXhnL91Fn
         hzLOHU0awyER7j1NNoHhHy7cIWfUNzvGyze92PdQAHAGzVH6865yadOaowyof4iH8XTR
         6B0Uo2iI6eIVVoMjBFwPuX3dJlDEm0SbJl0AkU0QWbGg5zDTm2Wj0GSlHvfg6LPvq4AG
         VadA==
X-Gm-Message-State: AOAM533SyBckp0gH2QAfGHoJU1MHJaexn0TL8ghq7RxSp0VedpiwWUQM
        olIxfN500u/hk9vhsf62MnCMiCzz0PAvlsx91TM=
X-Google-Smtp-Source: ABdhPJxIJ9b115uBRz3qbbYjABf/NUfZ+da4kvQJ1seamblPV15DQy8d3Nt99lbWTJx4+d2Z0pBdFplm5RPiE9d2Y6c=
X-Received: by 2002:a25:3cc6:: with SMTP id j189mr889416yba.247.1618447409518;
 Wed, 14 Apr 2021 17:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <CAKwvOdkjttdX83tL4pw+J5EnHM1MgEYDPp=YTpEagV4RrhdxwA@mail.gmail.com>
In-Reply-To: <CAKwvOdkjttdX83tL4pw+J5EnHM1MgEYDPp=YTpEagV4RrhdxwA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 02:43:18 +0200
Message-ID: <CANiq72ksLeuL_uqoqbf3fhLP7M0j-7TdEvRDDmxThdmrEqD2Lw@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
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

On Thu, Apr 15, 2021 at 1:19 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Rather than check the origin (yikes, are we intentionally avoiding env
> vars?), can this simply be
> ifneq ($(CLIPPY),)
>   KBUILD_CLIPPY := $(CLIPPY)
> endif
>
> Then you can specify whatever value you want, support command line or
> env vars, etc.?

I was following the other existing cases like `V`. Masahiro can
probably answer why they are done like this.

> -Oz in clang typically generates larger kernel code than -Os; LLVM
> seems to aggressively emit libcalls even when the setup for a call
> would be larger than the inlined call itself.  Is z smaller than s for
> the existing rust examples?

I will check if the `s`/`z` flags have the exact same semantics as
they do in Clang, but as a quick test (quite late here, sorry!), yes,
it seems `z` is smaller:

      text data bss    dec   hex filename

    126568    8 104 126680 1eed8 drivers/android/rust_binder.o [s]
    122923    8 104 123035 1e09b drivers/android/rust_binder.o [z]

    212351    0   0 212351 33d7f rust/core.o [s]
    207653    0   0 207653 32b25 rust/core.o [z]

> This is a mess; who thought it would be a good idea to support
> compiling the rust code at a different optimization level than the
> rest of the C code in the kernel?  Do we really need that flexibility
> for Rust kernel code, or can we drop this feature?

I did :P

The idea is that, since it seemed to work out of the box when I tried,
it could be nice to keep for debugging and for having another degree
of freedom when testing the compiler/nightlies etc.

Also, it is not intended for users, which is why I put it in the
"hacking" menu -- users should still only modify the usual global
option.

However, it is indeed strange for the kernel and I don't mind dropping
it if people want to see it out (one could still do it manually if
needed...).

(Related: from what I have been told, the kernel does not support
lower levels in C just due to old problems with compilers; but those
may be gone now).

> Don't the target.json files all set `"eliminate-frame-pointer":
> false,`?  Is this necessary then?  Also, which targets retain frame
> pointers at which optimization levels is quite messy (in C compilers),
> as well as your choice of unwinder, which is configurable for certain
> architectures.

For this (and other questions regarding the target definition files
you have below): the situation is quite messy, indeed. Some of these
options can be configured via flags too. Also, the target definition
files are actually unstable in `rustc` because they are too tied to
LLVM. So AFAIK if a command-line flag exists, we should use that. But
I am not sure if the target definition file is supposed to support
removing keys etc.

Anyway, the plan here short-term is to generate the target definition
file on the fly taking into account the options, and keep it working
w.r.t. `rustc` nightlies (this is also why we don't have have big
endian for ppc or 32-bit x86). Longer-term, hopefully `rustc` adds
enough command-line flags to tweak as needed, or stabilizes the target
files somehow, or stabilizes all the target combinations we need (i.e.
as built-in targets in the compiler).

In fact, I will add this to the "unstable features" list.

> Seems like a good way for drive by commits where someone reformatted
> the whole kernel.

We enforce the formatting for all the code at the moment in the CI and
AFAIK `rustfmt` tries to keep formatting stable (as long as one does
not use unstable features), so code should always be formatted.

Having said that, I'm not sure 100% how stable it actually is in
practice over long periods of time -- I guess we will find out soon
enough.

> Might be nice to invoke this somehow from checkpatch.pl somehow for
> changes to rust source files. Not necessary in the RFC, but perhaps
> one day.

We do it in the CI (see above).

> Yuck. This should be default on and not configurable.

See above for the opt-levels.

Cheers,
Miguel
