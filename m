Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2BC36B87B
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 20:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237683AbhDZSCW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 14:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235357AbhDZSCS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 14:02:18 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D31C061574;
        Mon, 26 Apr 2021 11:01:33 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id p126so12345668yba.1;
        Mon, 26 Apr 2021 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jy4OFsO0PDb4s3VtfvvtXkiYMuYdbRS3kT7/Hvwb0lc=;
        b=Cc0m3YnBbqfGZSKW9pO2qzUWrj0YihP9qtdd9ehIRk/+kz6tR4873rBCMwZSaqUM6G
         jkoxmHjSGp0ha53OhAfkLfcm38V8ixOLFtgIEUIZHkE2J0uv3zEztiOSXOe9MhoInQ9z
         iR3CXcCk3Sloff6y3nwbUvQ6y+vkCCjtspr1Ppx3EP2iqjFuxKTXLceQXGS/YiTbzgFy
         uNjiG6iXo1g4GULV1udH2ZyrpEZX2Nl2hDuM0g6PC1U1IZbc4smsXqhK2RWzTabFKUc4
         xbuz4VwCtjcX7zF/VnPOhZv93q7x7EMwqFkXIKXQ8f6pn9pEnnBMHCdF9XdQIS736nIn
         4MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jy4OFsO0PDb4s3VtfvvtXkiYMuYdbRS3kT7/Hvwb0lc=;
        b=cLTyk+g1ggbJLvN8Bt5dFVUNW+r323ScrMW9vOjBaoP5F0xtMFoSFLIVTcBhMazrdZ
         mq1SxFe4+hQE3/N5G4/rQ/Dm9V15BzSB8QIHkVQSAzbMDYCGmUEU/wdiPdtFW99aEdJS
         o80A4bRCuMFbyXi6WUs9wpn29KD/uJa52hJF39Zgqic+cWVtmzvVcBRgAgOENu6IqnII
         6KjY1H+fCF47YEWCH/TQiF3+MuaQEVZzPT/8jIDsEZonxutf0Z8MpLdy6u8QIvFqtqzB
         ecWAl4geSZpBMW6DIwk076cMcn4JzxfoPtzKzZytyEZKpB6V6KTRayFhnql5jS7VVro/
         ch2Q==
X-Gm-Message-State: AOAM5325J3Td89PtXV8TXg2T9UtBqApYdvmELtWhAf37bq3SsX/7iYl1
        DTbFDrk6oQRh8BkIt7ldmHmrG7h5oTkZ+iznoo0=
X-Google-Smtp-Source: ABdhPJwP5wBlcrmkMKIEQfkfFF5xNCT0t11kzMWAEMF7lxCkrpnE3u/XrWU+Aasdl3+MAnjcikXH+i2L0ia9gqqNvec=
X-Received: by 2002:a25:bfc9:: with SMTP id q9mr25486485ybm.33.1619460093262;
 Mon, 26 Apr 2021 11:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <YIGVFCymUn+4HBIj@google.com> <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
In-Reply-To: <CACRpkdat-4BbKHMBerdxXBseMb9O3PiDRZmMLP_OWFE2ctSgEg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 26 Apr 2021 20:01:21 +0200
Message-ID: <CANiq72=YAU1iNyUpXd-1VgQQDxy+wCRLkqp==a4QH2ir_pe5Jg@mail.gmail.com>
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

On Mon, Apr 26, 2021 at 2:18 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> static void yas53x_extract_calibration(u8 *data, struct yas5xx_calibration *c)
> {
>         u64 val = get_unaligned_be64(data);
>
>         c->a2 = FIELD_GET(GENMASK_ULL(63, 58), val) - 32;
>         c->a3 = FIELD_GET(GENMASK_ULL(57, 54), val) - 8;
>         c->a4 = FIELD_GET(GENMASK_ULL(53, 48), val) - 32;
>         c->a5 = FIELD_GET(GENMASK_ULL(47, 42), val) + 38;
>         c->a6 = FIELD_GET(GENMASK_ULL(41, 36), val) - 32;
>         c->a7 = FIELD_GET(GENMASK_ULL(35, 29), val) - 64;
>         c->a8 = FIELD_GET(GENMASK_ULL(28, 23), val) - 32;
>         c->a9 = FIELD_GET(GENMASK_ULL(22, 15), val);
>         c->k = FIELD_GET(GENMASK_ULL(14, 10), val) + 10;
>         c->dck = FIELD_GET(GENMASK_ULL(9, 7), val);
> }

By the way, to give a more concrete example, this function could look like this:

    fn yas53x_extract_calibration(data: [u8; 8], c: &mut yas5xx_calibration)
    {
        let val = u64::from_be_bytes(data);

        c.a2 = FIELD_GET(GENMASK_ULL(63, 58), val) - 32;
        c.a3 = FIELD_GET(GENMASK_ULL(57, 54), val) - 8;
        c.a4 = FIELD_GET(GENMASK_ULL(53, 48), val) - 32;
        c.a5 = FIELD_GET(GENMASK_ULL(47, 42), val) + 38;
        c.a6 = FIELD_GET(GENMASK_ULL(41, 36), val) - 32;
        c.a7 = FIELD_GET(GENMASK_ULL(35, 29), val) - 64;
        c.a8 = FIELD_GET(GENMASK_ULL(28, 23), val) - 32;
        c.a9 = FIELD_GET(GENMASK_ULL(22, 15), val);
        c.k = FIELD_GET(GENMASK_ULL(14, 10), val) + 10;
        c.dck = FIELD_GET(GENMASK_ULL(9, 7), val) as u8;
    }

assuming `FIELD_GET()` returns `i32`. In particular, `GENMASK_ULL` and
`FIELD_GET` can be written as normal functions, no need for macros
(and can be `const fn` too -- i.e. can be evaluated at compile-time if
needed).

As you see, it looks remarkably similar, and there is no `unsafe`
because we pass the array of bytes instead of a raw pointer.

The caller needs to get the array from somewhere, of course -- if you
only have a raw pointer to start with, then the caller will need an
`unsafe` line to dereference it, as usual.

Cheers,
Miguel
