Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEC0368891
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Apr 2021 23:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237092AbhDVV3q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Apr 2021 17:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237070AbhDVV3q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Apr 2021 17:29:46 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C832EC06174A;
        Thu, 22 Apr 2021 14:29:09 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 65so53243809ybc.4;
        Thu, 22 Apr 2021 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=loqGhmjoo7B1jLi+p/76FpRCD8XLvuYJzJOLuM3m3c8=;
        b=Su94ZazL5a1+FJKlC8MHGSEvcxJh3tH6xyp1KYMte8Bu0rfLKr52Ujx3l84o/DB86j
         0qYkV2jSKbuj7nAeqADPq0/FeICK/eKX9IQIVYxF1AgSf1XGvKBZOL6bgIyg7+iKaL4N
         IlHRw4hUOUijpzvlazto6VThw9toY7sVS/uefTXN+UbHtbIEeCsy1wkvI9+VZ1w3El6y
         vzAhMbfOkHUNM09gu4d5myC/X8eWcBWSsvqsEO3M7kOAQhFekoY37tBKD/xFF+qGgpl0
         HSv3Tofhar2BY7xgpwSDIb+TGyM1KQb97E+a6aC0Fagydtd4ewgdUi2iuvB+e2dIR1Vr
         +wrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=loqGhmjoo7B1jLi+p/76FpRCD8XLvuYJzJOLuM3m3c8=;
        b=AVClBHFar5ZMyfBjtxa9D9wTDwAddSAHZoT4R1oecSmnNUU9DB/V/92iS4/jdET9Fc
         NNlD3XKFxFtjoUroXPOAqt/2zPImZ9PhlF3LET/7h1i82gWIrz3ItkxU3Y3lFx/Amsq0
         8BdT6IL5x0qeR/EFD3gXIkDYPpRrs3AR4KKPo4EtL2eRri1dESxI1jM1OQgg8B0KyESe
         LKuJ6g/KCzxjhMt9P6ZrMpFIj1uHvNv40vkYSW0dUcd17QnHAzMHC3Auu+cQr/+QVJ6U
         AUiPTnx6Qqod680jEmPZNCm1G5fd3YVxd5G9B2lVbIqHgMi0fo1qrEwX6Mc9nvt8uYmi
         Qwlg==
X-Gm-Message-State: AOAM532KUzOYgeCcWzjhVWOfiUq/EDyQsaRa0UHtD/BUDfdq3oHDR6hg
        MYBNvHVRM5psW6leApYgxxjUXwzQqS5Udcd3Xdc=
X-Google-Smtp-Source: ABdhPJzMoC0mHuCojvPzrjPP+5pxCx/LDOhg/mgf8WZz/o6ClLDV/nlCMx68GFFCO9q+4qmQ42E/7tkk151elzpcFpQ=
X-Received: by 2002:a25:818f:: with SMTP id p15mr949715ybk.135.1619126948986;
 Thu, 22 Apr 2021 14:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
In-Reply-To: <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 22 Apr 2021 23:28:57 +0200
Message-ID: <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
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

Hi Linus,

Thanks for all those very good questions (and thanks for the positive
tone!). I will try to complement Wedson's answer in a couple places.

On Thu, Apr 22, 2021 at 12:03 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> But as subsystem maintainer I'd like a clear picture of this wrapper
> overhead, what does it usually entail? A typical kernel API has
> vtable and a few variables, not much more than that.

If you mean runtime-overhead, i.e. performance, it should be very
small or even zero. It should be possible to perform LTO across
languages too.

If you mean source code overhead, or cognitive overhead, then it is
quite a bit, yes. Please see below.

> It becomes obvious that as subsystem maintainer for the Linux kernel
> a casual drive-by experience with Rust is not going to suffice by far.
>
> All subsystem maintainers are expected to understand and maintain
> wrappers like these, right? That means all subsystem maintainers need
> to be elevated to understand the above without effort if you wake them
> up in their sleep at 4 in the morning.

I would say so, at least if longer-term a substantial amount of new
drivers are written in Rust. That is why I mentioned this as the very
first thing in the RFC. Rust does require some learning to use, even
by C experts.

Having said that, someone that is already a kernel developer and/or a
C expert is in a very good position to learn how Rust approaches
things and the main "new" concepts it introduces.

In the end, Rust is addressing some of the familiar problems that we
face when programming in C and C++.

> Get me right, we are of course good at doing really complicated stuff,
> that's what engineers do. But we are not Iron Man. We need a clear
> way into understanding and maintaining wrappers and we need support
> with it when we don't understand it, so the kernel would need a Rust
> wrapper maintainer that we can trust to stay around for the long term,
> i.e. until their retirement, while actively teaching others for decades.
> For an example see how RCU is maintained.

I hear you! I do not think it will take decades for kernel developers
to get up to speed, but I agree that having some help/backup is a very
good idea in the beginning.

Our hope is that, if Rust advantages prove themselves, then it will
the subsystem maintainers the ones that will want to create and
maintain the wrappers so that drivers in their tree are easier to
maintain and less prone to mistakes ;-)

Cheers,
Miguel
