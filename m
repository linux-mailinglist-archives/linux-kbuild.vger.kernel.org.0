Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA76036237C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 17:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244655AbhDPPFS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 11:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242887AbhDPPFS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 11:05:18 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F897C061574;
        Fri, 16 Apr 2021 08:04:53 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id o10so30427637ybb.10;
        Fri, 16 Apr 2021 08:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ASBECRR2g8o0eEPuhP36bCJw6J7d6BL/mPCtDFMgQzk=;
        b=EPBEOSXWHQYLJJ94BNQ1es3DnQ2369sgcrR5f1IK8QwJPtWzJJsCd//u5vN/qA8/gJ
         FETmalCBD/m0cC5tRrJv6N767JRGfA9Xa/lPwqaO57Gxg6yKetFwruRG551tO0uzfP3R
         VMd11+cq1om8zYZCZ1wIf5LwyTSriBig+xpyms9CL/4zSFHDtNi1SjJntTgqHRVwpdB7
         yggsCh8xyvKV5Q12AQgN9hpLJVpO8C2n53EEgq+bdeW9ljN6CuZyitw1qjM21k5d12FK
         OUUA+8kcqnpE2wkNaLXsSE7v1s0dMF1Z/+mFkb6bwIJTKco5YTSD08Ni1xc2Qe9HTClT
         rbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ASBECRR2g8o0eEPuhP36bCJw6J7d6BL/mPCtDFMgQzk=;
        b=Umqk6skqDZ6o8DPBIkj18MI1s7hKzMjHbjPK95XX1D15A9H9QSwauutO56RjO2IDMn
         9zsrg+zq1PlHgfT6WFmRWE4/XXYGXS3HWs2cepcBBVcRZOi8ptPvr8zw1dvmxp3YWxjt
         Xww3oj7O7OmoQL/8HeT8poC5ivbR7n2lGYJPUD2O+DaG96LVEvx9GszEcJBJLt+ShSsQ
         ZrsUfUcqKcoB8SBqq3SPugmjHCzWPBy+cTpyQtNo5AiUckotkDgVkShfhJ+neZH3Ph//
         Awfb2LUmDFTQGs8gCGUVdg2azgl+xS26msY15gamuPp2putKbW+9xosLDQhgpDLcUWtc
         EQhw==
X-Gm-Message-State: AOAM530+6XYiYGLclkAj1a0+sgamPDS+oAvgwmdmsyUCjnPz5Ox8lTO8
        uQV8QghAkJEewkrF7hnOvTnKqKehTTkcFD1NZxU=
X-Google-Smtp-Source: ABdhPJwOP1jqySabrmdO2Nez26tdLBldNP1OC3pzBYnBcQ5evdFvIGlVLXz/zepHWnj6Vdqyan/kLqVp5AIQq/t8Li8=
X-Received: by 2002:a25:7909:: with SMTP id u9mr12030433ybc.22.1618585492879;
 Fri, 16 Apr 2021 08:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com> <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
In-Reply-To: <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Apr 2021 17:04:41 +0200
Message-ID: <CANiq72n9ocqaFQnOjUO95_7Xd3wpWShtzMKrBQE2gN8jOyrW5g@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
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

On Fri, Apr 16, 2021 at 4:19 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Does this also not prohibit constructs where modification must be done
> while holding two locks, but reading can be done while holding either
> lock?

Yeah, this came up in some discussions we had. There are some locking
patterns that we need to think about how to model best within Rust's
type system.

But even if some patterns cannot be made safe, that is fine and does
not diminish the advantages everywhere else.

> I would much rather have a language extention where we can associate
> custom assertions with variable access, sorta like a sanitizer:
>
> static inline void assert_foo_bar(struct foo *f)
> {
>         lockdep_assert_held(&f->lock);
> }
>
> struct foo {
>         spinlock_t lock;
>         int bar __assert__(assert_foo_bar);
> };
>
> Such things can be optional and only enabled for debug builds on new
> compilers.

More sanitizers and ways to check "unsafe" code is sound are always
welcome -- not just for C, also for Rust `unsafe` code (e.g. Miri).

However, the main advantage of Rust for us is its safe subset (which
handles quite a lot of patterns, thanks to the lifetime tracking /
borrow checker).

Of course, we could propose something similar for C -- in fact, there
was a recent discussion around this in the C committee triggered by my
n2659 "Safety attributes for C" paper. However, achieving that would
require a lot of work, time, new syntax, etc. It is not something that
is in the radar just yet.

Similarly, if some compiler ends up implementing an extension that
actually realizes the same guarantees as Rust, we would likely end up
wrapping everything with macros like in the guards example you
mentioned, and even then we would not have got the rest of the
advantages that Rust brings to the table.

> C does indeed not have the concept of ownership, unlike modern C++ I
> think. But I would much rather see a C language extention for that than
> go Rust.

Many "resource-like" C++ types model ownership, yes; e.g.
`std::unique_ptr` for memory, as well as a myriad of ones in different
projects for different kinds of resources, plus generic ones like  the
proposed P0052. However, they do not enforce their usage is correct.

Cheers,
Miguel
