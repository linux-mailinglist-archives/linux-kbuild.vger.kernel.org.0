Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC668362BFF
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 01:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhDPXrM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 19:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbhDPXrM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 19:47:12 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 494A3C061574;
        Fri, 16 Apr 2021 16:46:47 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id n12so31909567ybf.8;
        Fri, 16 Apr 2021 16:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=APA5wC+P/0ZKq5TVeThEh/cxr/kH2+e6GX8LVc3zw0g=;
        b=U2NSKrtcQiRKmP1U6OBC7AvX6odmxnxR6nyk8z94k3YcYoYO5wEvOWQrL5vp0kU3Ei
         sXTxQXTQVJ06Wk47ThAV/rpTkf7SiMKnANVIlP6TtGBiIoYN6HqCLg7Fnq/Rs6ti7MHI
         MH3sZDOV/J6Lgr4KWn5jFBcvBjdVaPvbyJuH/4hKaJh2TFvCSlmVWUBLgcBv8BUZCfFc
         86XAe8TwjXze2BuVK/kkaFBLhh6IIVmAdXo6ZKOn+19oVDdfRGupMU1Zqd3gVB3lkUbl
         1CWzErSrsOzwuza3PyYJWD772BOhIvbBK0TKzniNr+kb++pg7jRwWkpilmRuyque0Enf
         dJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APA5wC+P/0ZKq5TVeThEh/cxr/kH2+e6GX8LVc3zw0g=;
        b=KgUSzlbAFdG31U3snnLUZUNHeXbFOMVDx7tOcwo+f72Wz8Bhj2v2zcWy8j5O8b9XJH
         uhoShCvXq32x8Uz8QIlTo05yqdYMqGp61rIs2lxAg+guvtX3++JevjqeQPjUD7einOZM
         eZfJRbGox6xEA51uFjLNS4AxGqn4Se7trDVmQ2w2hjfm2gNm++YSoFVjSNf5b9HpoSuZ
         ppW1PwLceVZmwJwy5niMFS4XQqNbcb6Iqtl7iSEMzwC+vx8L0vQE62HAVcUgwvKOaDmb
         ZcqD+kKkmxxeqJbJHTvC/cEF3cXLDr2RKx0obN+5WnYFna8chEZM2LNxUNl1/CfYdfWf
         cLyg==
X-Gm-Message-State: AOAM532ZjNgbZmWsxpDNs3rtqZBiVtMlqIciaQWxPQtLOzTJ/aT4F+SG
        Oc1CmeYPIrLNOr1M9q2c9eInh/azbVNaWmlVhh8=
X-Google-Smtp-Source: ABdhPJzqvChEDMbEYrcy2HcRNiSdTFLNoqUgfLnbJ8QqMFE6MHVeyG44RTzpQYm+39tHEfJ85H4JMciKLP+nE5A4cAE=
X-Received: by 2002:a25:818f:: with SMTP id p15mr1960758ybk.135.1618616806470;
 Fri, 16 Apr 2021 16:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72=3zZvdEsp-AH2Xj1nuvfGOQQ1WGmav6i4nFTz-3-_c_w@mail.gmail.com>
 <CANiq72=5pMzSS5V7h-QcQvYgyZUwdE=T705KtBWrNYZPjMYK3Q@mail.gmail.com> <20210416220416.GA11872@1wt.eu>
In-Reply-To: <20210416220416.GA11872@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 17 Apr 2021 01:46:35 +0200
Message-ID: <CANiq72k3wmuqgPz+WR1=64vr--SFu971P+2Neq+Xe2TUSZFv0g@mail.gmail.com>
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

On Sat, Apr 17, 2021 at 12:04 AM Willy Tarreau <w@1wt.eu> wrote:
>
> But my point remains that the point of extreme care is at the interface
> with the rest of the kernel because there is a change of semantics
> there.
>
> Sure but as I said most often (due to API or ABI inheritance), both
> are already exclusive and stored as ranges. Returning 1..4095 for
> errno or a pointer including NULL for a success doesn't shock me at
> all.

At the point of the interface we definitely need to take care of
converting properly, but for Rust-to-Rust code (i.e. the ones using
`Result` etc.), that would not be a concern.

Just to ensure I understood your concern, for instance, in this case
you mentioned:

   result.status = foo_alloc();
   if (!result.status) {
       result.error = -ENOMEM;
       return result;
   }

Is your concern is that the caller would mix up the `status` with the
`error`, basically bubbling up the `status` as an `int` and forgetting
about the `error`, and then someone else later understanding that
`int` as a non-error because it is non-negative?

If yes: in C, yes, that could be a concern (if done with raw `int`s).
In Rust, if you get an `Err(ENOMEM)` from somebody, you cannot easily
conflate it with another type and return it by mistake because it is
more strictly typed than C.

Cheers,
Miguel
