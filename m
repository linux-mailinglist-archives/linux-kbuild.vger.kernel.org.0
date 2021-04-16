Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5CD362661
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 19:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238791AbhDPRK4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 13:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236512AbhDPRKz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 13:10:55 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06908C061574;
        Fri, 16 Apr 2021 10:10:30 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id y2so28800430ybq.13;
        Fri, 16 Apr 2021 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1zgTToNLJoMuV9m9Y7BccDXR5cq7ptjnKmsyng+DijQ=;
        b=YUKPynEEPBjso+ydCdysrTs5r6L7GQhrBdq6jpkp+ft0xY2zyNmFCM22BD+obn+2gm
         v7rDbm26dVq3mdgjsx8Ef73/oelbgAnjFZUca36jyPKvYKL/z0wnI8X45uT3Vm98Vhrv
         uC0j7g7aEhfTY/js2W8KYiaF1aqrrrrwHiax5z2STZClS2S8qAXQ2oMW4eC12Ovx7kXp
         1DoCqr/uq5e4T+Hy7puza1hSpxoDQVLMUx1jPAHnrwvpyNkqWngH6VHgNZFxQsx+asZz
         VduGMJZ1mGCxRquayXi/QlJVYegchz6FBezaj5Z8M6rjLWtXrHRiRisKkySCZZPSxQv4
         42/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1zgTToNLJoMuV9m9Y7BccDXR5cq7ptjnKmsyng+DijQ=;
        b=n2ycmC0VL0rC345vIdvl2eJE+Ctd3VSwi4c6TAycQx2QlsHnAa99rHF7r3L0wuI8cs
         p61ssXm+GyWzDYvzBGCteYfmAt53oWBNhFAhVXwlqP5seMzaTV+Y5XbwP+OvQXmfh6tB
         UM6bzBW9Nlh3rUu4MmdWxl4IVkI+TlmiNefqzP72g6cLkSz/A4zDS2KbTJwHeI+OW0fi
         W57JjQM8JzKENYZ82R0Pm+U2KF8yYMWrQKVDZMZ8VqJnOfu6nO2bGMqgQw6VsyMvWC2L
         Pozj6OfCG879GazPW4DugfGkyesHoKFflGw21QHmj0HUq+kLbG3q4P16GcUjdMuhKKJ2
         1lLA==
X-Gm-Message-State: AOAM533kyL9N/Vp+r9NVfriInei8QvOHzaeKheNhH7AVbEHprLk/L++W
        gTW/n3tVmSmEgBBHk672N1C9A2z9Qif+8QuCTDs=
X-Google-Smtp-Source: ABdhPJx+FtMDXeXPtNo4VguHJPOX+TS0vwAbAQLv/JGrhgR/Ts/oEOMKX/UOyBmQLWpwuJODAvynSGXShJPRYfmvxGk=
X-Received: by 2002:a25:bfc9:: with SMTP id q9mr132073ybm.33.1618593029166;
 Fri, 16 Apr 2021 10:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com> <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com> <20210416161444.GA10484@1wt.eu>
In-Reply-To: <20210416161444.GA10484@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 19:10:17 +0200
Message-ID: <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Willy Tarreau <w@1wt.eu>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
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

On Fri, Apr 16, 2021 at 6:14 PM Willy Tarreau <w@1wt.eu> wrote:
>
> I'm really afraid by languages which force developers to do this or that.
> Many bugs in C come from casts because developers know their use case
> better than the compiler's developers, and result in lack of warnings
> when the code evolves, leaving pending bugs behind. What is important
> in my opinion is to let developers express what they want and report
> suspicious constructs, not to force them to dirtily work around rules
> that conflict with their use case :-/

I understand your concerns. The idea is that by restricting some
patterns (in the safe subset), you gain the ability to guarantee the
absence of UB (as long as the `unsafe` code is sound).

But please note that the `unsafe` side is still there, and you can
reach out for it when needed.

Thus, if you find yourself in a situation where the safe abstractions
are not enough for what you need to convey, you have two options:
ideally, you think about how to model that pattern in a way that can
be exposed as a safe API so that others can reuse it. And if that is
not possible, you reach out for `unsafe` yourself.

Even in those cases where there is no other way around `unsafe`, note
that you still have gained something very important: now you have made
it explicit in the code that this is needed, and you will have written
a `SAFETY` annotation that tells others why your usage is sound (i.e.
why it cannot trigger UB).

And by having the compiler enforce this safe-unsafe split, you can
review safe code without having to constantly worry about UB; and be
extra alert when dealing with `unsafe` blocks.

Of course, UB is only a subset of errors, but it is a major one, and
particularly critical for privileged code.

Cheers,
Miguel
