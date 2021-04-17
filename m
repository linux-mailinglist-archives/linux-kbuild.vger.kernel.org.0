Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A854F3630F2
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 17:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236691AbhDQPjf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 11:39:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236481AbhDQPje (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 11:39:34 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36367C061574;
        Sat, 17 Apr 2021 08:39:08 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id o10so33526514ybb.10;
        Sat, 17 Apr 2021 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=REupEnRN7L+AIB6fZVn/PM0AvwXs9epbdeATajunDF8=;
        b=N7hAtqIixPrITocgEQklFpqfXSxObVUSuWpjcfnYlWzb4KMba/NJ8qvYxobCiP7UTq
         xk9XHfVcvEazTk9v8Xinig1AeZobTU/z78bw00pQUVIIySL6bOAyLskC56DtiqXABjM7
         ruUMIg20cUr67vUWuKZUZBQ8zWZeIESk89FgllbIeFNaflaVVD5eWrk6YypfLt6ogBwc
         Zc43Vj7vPewU5C9q7phOT0wj32oVYauAISJNJblbz6msPplFs2WNz6UdBCUhq8DkOYiG
         /R77D7XAo1aYGfkhudGy1evL2bfw0fTCPCThRnv87c4ldPuzIiByKTssBKqQAII8ouQT
         JkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=REupEnRN7L+AIB6fZVn/PM0AvwXs9epbdeATajunDF8=;
        b=GHJ+3SYWddeIR4RBMwyHfGWgeacrrHvniRTT7UfKH2RjvQxVXLcRvdzsvJrIi8gBce
         yatvyl9iOGiDezmexAN3MvUV9DyBsufwNu886xwLS7FkUy9MlXFbx44JAkznQJOy8xzv
         MjOJx7eb45/BI+XZfmpUcNVyYNra1FSBiC/A1GZja2xB7sq0zIlt+d/0rMZfhkXUB5GP
         mrpz0GxIQ+bfDIx8xwfsGBdJHQFyXk8InQGf3s6zQTS5axN9H2gxpZ5mh8wdoFZB+6JZ
         xPXqqrJhpLEJWQyQpJU+dMoaSdvVH6yZvHlJehUoD1Gv8MQLg4tuqnE3LxU8OsbM9gck
         0jlw==
X-Gm-Message-State: AOAM531RUJpwmE7+7xMONQplvs8HH7O6tV+a1T2lrIMWdiGFLH0EXQub
        oD7Z0CXc+4ocA2lVU3OKuxPSYVRlQz9bbk99jN8=
X-Google-Smtp-Source: ABdhPJyRCCaZudkXqCxTOjMFhA1wZway4wafI3l5bnaJyjHaAQVXSkUb8Q1pUwX8dLNC5PQ14xJCH6qt89pkQgMp9tc=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr6511822ybg.26.1618673947623;
 Sat, 17 Apr 2021 08:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72=3zZvdEsp-AH2Xj1nuvfGOQQ1WGmav6i4nFTz-3-_c_w@mail.gmail.com>
 <CANiq72=5pMzSS5V7h-QcQvYgyZUwdE=T705KtBWrNYZPjMYK3Q@mail.gmail.com>
 <20210416220416.GA11872@1wt.eu> <CANiq72k3wmuqgPz+WR1=64vr--SFu971P+2Neq+Xe2TUSZFv0g@mail.gmail.com>
 <20210417042405.GA13432@1wt.eu>
In-Reply-To: <20210417042405.GA13432@1wt.eu>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 17 Apr 2021 17:38:56 +0200
Message-ID: <CANiq72=G+JdHiLovGv=5Yi_7smyrinWFfEQH31x=KPP4=nKKGQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] Kbuild: Rust support
To:     Willy Tarreau <w@1wt.eu>
Cc:     Connor Kuehl <ckuehl@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
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

On Sat, Apr 17, 2021 at 6:24 AM Willy Tarreau <w@1wt.eu> wrote:
>
> My concern was to know what field to look at to reliably detect an error
> from the C side after a sequence doing C -> Rust -> C when the inner C
> code uses NULL to mark an error and the upper C code uses NULL as a valid
> value and needs to look at an error code instead to rebuild a result. But

I see, thanks for clarifying. I don't think we want to change anything
on either of the C sides (at least for the foreseeable future). So the
Rust code in-between must respect whatever conventions both C sides
already use, even if they happen to be different on each side.

Thus the C side will not know there was a `Result` inside the Rust
side and so it does not need to worry about which field to look at.

Cheers,
Miguel
