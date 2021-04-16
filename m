Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A8A362A72
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 23:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344491AbhDPVji (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 17:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235540AbhDPVjh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 17:39:37 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A51C061574;
        Fri, 16 Apr 2021 14:39:12 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id y2so29590937ybq.13;
        Fri, 16 Apr 2021 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhRl8wyt4kyWOXB4hj/P/sBHkU0fAxeEEfW1FWg8FGY=;
        b=XUGR4FumO2z4d0PIcvh90tV8PwYc+5gWKgmSCmH3w1L7wBW7hlSBrBhtWIegDIdFi+
         tYyIcTf4dOiNcHnz8/O3l3/r1VcosYhR9v74MM11yCYBg66MjAcX2suBNjvS8LNFe2jh
         vvwY0I623sJv0wFH71vOF7qFnp5Z5DUKuh4hBULkM5sqAc87aYjDoLh2+E3OljTUcW61
         wuxXmf3rVGfEpJhxnWcTDvj0Y1EZUyDiJrK2FmMNjsbufrCfeqeS4F0EwtNZljFSMP68
         m1OIu+L6I6f7BeHfWENgUkMIcUFezR6bkG7n2ByWKCekEaWqD/u7BK+OaVYISkTez5Rb
         K84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhRl8wyt4kyWOXB4hj/P/sBHkU0fAxeEEfW1FWg8FGY=;
        b=aaHSRCsBV0A99BYkmKwWfSlA6hZISHwMN6xRHCnyw5O62RgOHKk448Xytpo0WpAYkF
         f41bSJqLjZmwZgkSewIZIABLeJyBgn8TIhyNfSsfEJLsF21aQo81qZbiBleCmnDfybwK
         sTBSNzfTyHuKV9qS9PPtW1PBjWsugf1Qu5mmeuhnyVOTllZrWDhLB8nrozw3WLOMCGRO
         3rysMzxZV5DXdw1ClE7e0F5vHlNldKYV5r8Lgjd2FGhlM7vO3KRRh92P3W2Pqbx9K2tw
         FgMSptXkb1Ln1GHj5FPQNGJI6NPW2O8+qR7GRvvdCjeTnrprufkVnGRWIxAR7psLB18U
         4Vag==
X-Gm-Message-State: AOAM532BozrXS+rJeYlfxWe4nHp01YbkLhCDMdupc/Tn/quUBfZoJc8r
        wRztkQ2S/5QbF32p0hXL13XvhGH188vf5UqJKdM=
X-Google-Smtp-Source: ABdhPJy6fjJ1LaIk+0NY41aYV58CnFUA6clshxkRCpoJPC9v/sp1QPt2XSbN3aUPzb7vMWH10nJweNMaG5p6cNBhrPI=
X-Received: by 2002:a25:7909:: with SMTP id u9mr1622529ybc.22.1618609151601;
 Fri, 16 Apr 2021 14:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-5-ojeda@kernel.org>
 <YHmTWEAS/QjX++w4@hirez.programming.kicks-ass.net> <CAHk-=wh_zb=K1B-N8mgHmSZDqTLgOm711NRXbTX_OwFAzDYg0Q@mail.gmail.com>
 <CANiq72nx7ngazsH7sZgc=HeU0cNj45F9+-rwQb7AkdYsRCmRbQ@mail.gmail.com>
 <YHnS92ZKZ4tRWTiA@zeniv-ca.linux.org.uk> <CANiq72=RLf0FiuLVL-ZeLFp9P2LxTymbzhXoyQGG=tvUY_J-Sg@mail.gmail.com>
 <20210416202215.GA11236@1wt.eu> <efe80452-fac9-247a-1e2b-a73553f605e8@redhat.com>
 <20210416205812.GA11655@1wt.eu>
In-Reply-To: <20210416205812.GA11655@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 23:39:00 +0200
Message-ID: <CANiq72=5pMzSS5V7h-QcQvYgyZUwdE=T705KtBWrNYZPjMYK3Q@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Willy Tarreau <w@1wt.eu>
Cc:     Connor Kuehl <ckuehl@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
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

On Fri, Apr 16, 2021 at 10:58 PM Willy Tarreau <w@1wt.eu> wrote:
>
> No, two:
>   - ok in %rax (seems like it's "!ok" technically speaking since it
>     returns 1 on !ok and 0 on ok)
>   - foo_or_err in %rdx

Yes, but that is the implementation -- conceptually you only have one
or the other, and Rust won't allow you to use the wrong one.

> However then I'm bothered because Miguel's example showed that regardless
> of OK, EINVAL was always returned in foo_or_err, so maybe it's just
> because his example was not well chosen but it wasn't very visible from
> the source:

That is the optimizer being fancy since the error can be put
unconditionally in `rdx`.

If you compile:

    pub fn it_is_ok() -> KernelResult<Bar> {
        Ok(Bar)
    }

you will see it just clears `rax`.

Cheers,
Miguel
