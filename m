Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB3C361FB7
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 14:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243453AbhDPMYE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 08:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243404AbhDPMYC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 08:24:02 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5821C061574;
        Fri, 16 Apr 2021 05:23:37 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id z1so29863722ybf.6;
        Fri, 16 Apr 2021 05:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oJWOBU898RR64I5dUgBojnrKLrF+H0PdTgSU59Ph068=;
        b=F88mPaWYARVjBdkYiXNxWNv06dZCNfEiE9bRYpt7hK7KKzw55VR34flKRflG+TlZky
         ynS8EVLCuLTrn4YY0MRl4/3veqV67byO44Y1SUsL9OVIGvuZC/gSwmHg0hNvtp6jKNyc
         NRFEw7z1UNPyuswTtwXFHmmBku37m5ofWkthnZz0pRbY53CPfx8YZ9mIwKNxbM9mdiI3
         0Q/12eTlMPqvE8Z9sqhLPu8bjXNWwIrgOICYTBK1I2pBHFaoRvPco4PULKgon3U0+EY5
         dbVbRQ7fwteo5CgoLswR7VWsxbHgbXZUCoBlEgbkohQTUJjCBALqU3duntCU+LvJvQli
         xQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJWOBU898RR64I5dUgBojnrKLrF+H0PdTgSU59Ph068=;
        b=UPLMiB1k+O2fTmgyeYWq+/P0zWem1npT5o908V4pOyCGM7rf7jCPfG8v2UB3SraCeE
         NgMDNkJBk9m5oVhWMpMdaJpad9SmiQiOfZ8bqLQX2h2AlptidRVonVaXkvlNpO2jTniX
         qJ3wPvlCIt5/Mfr5VRre3ErmGBrH7HjJi9b4JwN4vi/dGMEdY2L78yRCVesI3UmGN/Y5
         dua2xOxboW7c1ejt/pxxCQ/yXTax4YNHmXS9CsiJBqMNt2zg/prz/8pVgAjMybsbxaK9
         KiqPe2V0pTyQJTsntKySFwdSrCJQXVxjD39DCc69iwMTTZ7D//CQMj9kIIm4f9hrgii4
         1NOQ==
X-Gm-Message-State: AOAM533sG0xdHF3ZveRTKBPrqb3qhcsk14pqnMcEwS+2qXfmIfm7GQEL
        BYMOyS8KuLAOmmIx4n2PCsUdtthU+c6LLB8UUjU=
X-Google-Smtp-Source: ABdhPJxQmILSd73jktfvCK8N1AvhaqwM43zyeMR4u8U2bCKGdASsI/jtNsPLqlByKcaOcHTssmfTv+/86lWTiZlLLnI=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr12128491ybg.26.1618575817094;
 Fri, 16 Apr 2021 05:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <CAKwvOdkjttdX83tL4pw+J5EnHM1MgEYDPp=YTpEagV4RrhdxwA@mail.gmail.com>
 <CANiq72ksLeuL_uqoqbf3fhLP7M0j-7TdEvRDDmxThdmrEqD2Lw@mail.gmail.com> <CAKwvOdkyRkR0Jj5w5HWJ+o4YpOrLfTY1Vjho0bDn60fgRE-pkA@mail.gmail.com>
In-Reply-To: <CAKwvOdkyRkR0Jj5w5HWJ+o4YpOrLfTY1Vjho0bDn60fgRE-pkA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 14:23:26 +0200
Message-ID: <CANiq72=TDkRzZi7fN5y9QmtRbvoZTzxHXDg_ELjdD+YhmXzgPw@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
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

On Thu, Apr 15, 2021 at 8:03 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Until then, I don't see why we need to permit developers to express
> such flexibility for just the Rust code, or have it differ from the
> intent of the C code. Does it make sense to set RUST_OPT_LEVEL_3 and
> CC_OPTIMIZE_FOR_SIZE? I doubt it. That doesn't seem like a development
> feature, but a mistake.  YAGNI.  Instead developers should clarify
> what they care about in terms of high level intent; if someone wants
> to micromanage optimization level flags in their forks they don't need
> a Kconfig to do it (they're either going to hack KBUILD_CFLAGS,
> CFLAGS_*.o, or KCFLAGS), and there's probably better mechanisms for
> fine-tooth precision of optimizing actually hot code or not via PGO
> and AutoFDO.

I completely agree when we are talking about higher level optimization
levels. From a user perspective, it does not make much sense to want
slightly different optimizations levels or different size/performance
trade-offs between C and Rust. However, I am thinking from the
debugging side, i.e. mostly low or no optimization; rather than about
micromanaging optimizations for performance.

For instance, last year I used `RUST_OPT_LEVEL_0/1` to quickly rule
out optimizer/codegen/etc. bugs on the Rust side when we had some
memory corruption over Rust data
(https://github.com/Rust-for-Linux/linux/pull/28), which is important
when dealing with compiler nightly versions. It was also nice to be
able to easily follow along when stepping, too.

Having said that, I agree that in those cases one can simply tweak the
flags manually -- so that's why I said it is fine dropping the the
`Kconfig` options. There might be some advantages of having them, such
as making developers aware that those builds should work, to keep them
tested/working, etc.; but we can do that manually too in the CI/docs
too.

Cheers,
Miguel
