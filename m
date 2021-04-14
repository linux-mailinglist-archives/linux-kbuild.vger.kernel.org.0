Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8950F35FBE0
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 21:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353501AbhDNTvJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 15:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbhDNTvI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 15:51:08 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7953C061574;
        Wed, 14 Apr 2021 12:50:46 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id v72so2750972ybe.11;
        Wed, 14 Apr 2021 12:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYlm7QJNdb4JnhGTMGRomUPh4aAvt7AdM3SQppwmFQM=;
        b=NA/LNzHuNEZosNIqBZP0SH2adQEhB6bQguQXseEhYnkGVZyhZfztxieK1rL8LA1N7t
         rkwrXGd47OGgEb9eAGDaG+lWxyiYDl25LYPH+5/sJ4/d8CaRbRNZZiceqEJGOMXRmIoy
         br3Q1SsYOEcA1ZtnlLA9u9UDOvG8gNVPg5uiIxIGF/9d8hB2fvtgHGFqSTcx6m14E2CQ
         +ilR3RNgJJa6QTzd2ZUSZfswKdiKvTxQ+7+OsDzbKhWT0NsbBN2h62erP8YMsuU3vzlJ
         BCd+V14DEsHqX8ZynYp0lpP8YjZPnArk9Ycz4oZXc0eBK7NZzU8m4j4JX01sZpKOv7p9
         +Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYlm7QJNdb4JnhGTMGRomUPh4aAvt7AdM3SQppwmFQM=;
        b=XhhVPh96delW1Q0ry4Bk5KQIF501dS11ui2aiJfPHAh5P9uawrhJgOwxZJfQDW++t8
         3igSS07WuWJJM9ei9QFk0qy+/y5n31VT3jgL9ApM8R2HerR4Sezzzv2oByHE7JcL4Gyb
         I5sJUIkyQtZqsdPx1LIs6naKD0AOpRbEwv94YGmKLu2Gjkdxst0PENx3b5L0U7G+bl5w
         9zBjz7lhHqKge/MH3rHYMWF/6DeflM2xjawkGEX1VnPvuu0zTnkIIVbumPQmRAxLpG1Q
         33d8UHfShMxHy4dr2nQ9j1heAG8j1SGTE8h6LNaeO55FiymLst3zAmZVks5DZt7UqDdn
         /T1w==
X-Gm-Message-State: AOAM5312e4JqsKsVrCLyy6O9Axm4jNOy6ia8QddIoxmcudchc5SBdufy
        nHaeEJzBciyhcPQlyaUPV95hLsYTA90sIDAUZaA=
X-Google-Smtp-Source: ABdhPJyc5WdBgAwpcNaT4ZnVDVccWaCGIXvnyziVT2JDu6RWbr+K0E9wplZIpWP5+MopFoA+ItsxBPpTnrjSy7xTFmE=
X-Received: by 2002:a25:6803:: with SMTP id d3mr46864038ybc.422.1618429846183;
 Wed, 14 Apr 2021 12:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-8-ojeda@kernel.org>
 <CAHk-=wiVY56LzwV_G075NEFwsdf-p7GOTy_cB7-UU9b=49rB1g@mail.gmail.com>
In-Reply-To: <CAHk-=wiVY56LzwV_G075NEFwsdf-p7GOTy_cB7-UU9b=49rB1g@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Apr 2021 21:50:35 +0200
Message-ID: <CANiq72=VnWEdh2uuwH2JM6ZhrEVDiQisnNBQGX-qwPnTitcR=g@mail.gmail.com>
Subject: Re: [PATCH 07/13] Rust: Kernel crate
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
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

On Wed, Apr 14, 2021 at 9:31 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Again, excuse my lack of internal Rust knowledge, but when do these
> end up being an issue?
>
> If the Rust compiler ends up doing hidden allocations, and they then
> cause panics, then one of the main *points* of Rustification is
> entirely broken. That's 100% the opposite of being memory-safe at
> build time.

Of course! What happens here is that we use, for the moment, `alloc`,
which is part of the Rust standard library. However, we will be
customizing/rewriting `alloc` as needed to customize its types (things
like `Box`, `Vec`, etc.) so that we can do things like pass allocation
flags, ensure we always have fallible allocations, perhaps reuse some
of the kernel data structures, etc.

Cheers,
Miguel
