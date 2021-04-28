Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D05C136D0C6
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Apr 2021 05:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhD1DLG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Apr 2021 23:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhD1DLF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Apr 2021 23:11:05 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70ABFC061574;
        Tue, 27 Apr 2021 20:10:21 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id q192so18352709ybg.4;
        Tue, 27 Apr 2021 20:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rRuk3LXxZffE/YX5087tARIXQX+VPzj1e3QOp6q3WkI=;
        b=YrTxrQyl/0O8RuK469UHGDQmdPy30gkpj/QVi1D87zFB2s4PNcs4aIwYgy3myjrgAS
         CWcmXoQaTuYcWfVixySmMkPl+9j/ENrB9qwfELtYVxC4yHHvd4iHqrnx02+ZXIYkA4YX
         1tMcz5dnS4nRk06FjdEGU5Me1fdZ4S3xG8o7RXiE9N6uMIJtnxMLDXAE4LnbE5+t5uyg
         PLqUgZHw3EERuwzRx+9p641e7ZHXtQZEZB/VLbUUgT0NPhpVjZvjAG00eUoz2gwsWAtZ
         PL+yWMeAVHoELF14fqTbwRoSlIqCFJessFZb6bUWAcTcnBDncH5ijG0KEC24wtdSOWG6
         1Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rRuk3LXxZffE/YX5087tARIXQX+VPzj1e3QOp6q3WkI=;
        b=cU0Tp+B4znBKQxtnnOJIZkoSlWI6COKXMPN+3AlnvzB8NHKvOzl3XGvGMzZjCV498v
         4A8XfwTCtJTPW482+ZXoksUZQelKMeeJ4DEuHBcKHc/GXxjqwCixJuBIKkumBE6/yhOI
         w4YUavQQsSxFwlYWebn51bydVtX9lQiJtoOribFWTcVvyX/GPj+YGPM6HrZzjsYhTHRQ
         QAOUTGvv9CDNVX+23BedkIF9sHrkW6AhEviROJIlkNP6L2tzWSPWfNVnxISibzXCyfrT
         rGC/8HKUSQFiQ0trNcaXTdxy2Zo5RpI7E8BMSRFrprTIWJJYaLMXbPRRvavIBDTLgcVZ
         iQWA==
X-Gm-Message-State: AOAM531HFs1GPH8mJrr3BUeXCWGwT7WQmQ44Cw1Zm/mlPaL9O2UAY6SA
        /BOPD9zxxg40f25MGongZNu/WkKX+a+YRAIn4CI=
X-Google-Smtp-Source: ABdhPJxJTXxlHGTfIoVgADZf3q5v15IcdYP2/e/o4lr6MmWgGzC87uZ4XdePgx4ghhzctxm0Ta5iK+NOUPFxd/V6q/4=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr38000740ybk.115.1619579420788;
 Tue, 27 Apr 2021 20:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com> <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
In-Reply-To: <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 28 Apr 2021 05:10:09 +0200
Message-ID: <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 27, 2021 at 1:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Actually my reply to Wedson brought up a new issue, which is the
> quality of learning resources and the lack of an equivalent to
> The C Programming Language book.

I recall having a similar feeling when initially jumping into
individual chapters of The Rust Programming Language book. I think it
is intended to be read from cover to cover instead.

There are other resources, see [1]. For instance, there is The
Embedded Rust Book [2]. Some of those are a WIP, but perhaps others
can recommend better finished/published books.

In any case, Rust has more features than C, some of them quite unique,
and they are routinely used, so it does take some time to learn.

[1] https://www.rust-lang.org/learn
[2] https://docs.rust-embedded.org/book/

> I think a good starting point would be to either fix Rust support in
> GCC or implement some more important ISAs in LLVM,
> whichever is easiest. I don't mind having just *one* compiler but
> I mind having *a* compiler for every arch we support.
>
> [...]
>
> Portability to old systems and ISAs is a virtue in itself
> because of the effect it has on code quality, not necessarily
> for the support itself.

I agree that there are benefits of keeping compiler technology
flexible, but one cannot force or expect any project (including the
Linux kernel) to maintain all code forever.

In the end, we need to balance that adaptability against the benefits
of adding Rust. In particular because nowadays LLVM is able to cover
the majority of devices that want to run the very latest Linux
kernels. Thus those benefits apply to most users. If LLVM only
supported, say, x86_64, I would agree that it would not be enough.

By contrast, compiler flexibility only matters indirectly to users,
and at some point there are diminishing returns to keeping all
architectures around.

In any case, adding Rust (in particular for "leaf" modules) does not
imply that we will lose those architectures any time soon. That would
take at least several years, and would require quite a few things to
happen at the same time:

  - That Rust got so widely used in the kernel (because the benefits
turned out to be important) that maintainers went as far as wanting to
drop C drivers from mainline for Rust equivalents.

  - That GCC did not get any way to compile Rust (no Rust frontend for
GCC, no GCC backend for `rustc`, etc.) and, moreover, that the plans
for that had been dropped.

  - That LLVM did not add support for the missing architectures.

The first point is unlikely any time soon. The second point is
unlikely, too, given there is funding for that now (and I assume those
projects will receive more support if Rust lands in the kernel). The
third point is likely, though.

Cheers,
Miguel
