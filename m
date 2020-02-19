Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02C216519B
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 22:32:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgBSVcu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Feb 2020 16:32:50 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40956 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbgBSVcu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 16:32:50 -0500
Received: by mail-pf1-f195.google.com with SMTP id b185so725157pfb.7
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Feb 2020 13:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EmqhwxfTOPH5Jwang1lE3QOy4zcv0gzG5lBl/plns9w=;
        b=aAobjYpFklyAkqlSG70awWRHMtlHSvugns/9mnKxCnZbo5CBJsQf4GsGU2DC6SwVxM
         PqCQwGEARKxeFBmbEdcjD4vQwtPfRz6yplo6lJvfbOvKffn7U//Av3nzUBjvTKIQA1SI
         3rRlpdcbJ6/nTMZrkb86TdZfyolv0kDit/gwKe4Yw2DPTokH2zcFLvoCc46OIl/x/aHB
         nLS5TEWP/iXmuWbKI4NopOwy54x337xvKNUJeEV6goeSU4DERoVDEYnQ6uruiyaODWt2
         KjfY0l2/gfssEmO9emTMo66m1oaAYdh6bkuZvzRLFE9ZCl2+5QErp/rw6O16d+fE/Uim
         MbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EmqhwxfTOPH5Jwang1lE3QOy4zcv0gzG5lBl/plns9w=;
        b=fUm4C1qIKXwO9hKLxu+Y/Pcbem0yhsy4RhtoQS/J8AvLo7OadSRb/HPT6UiseyaxxL
         0kaBcyHGarG+MkL1ZNWWee9uBxOzORZD9P0i3WQM5gnTdNuE0deLk1aswFox58BRPLQl
         qxXyDWRVxbxItW55jevjRHZOxY+sE7S21W8D5fL9kJNGIhzMmna1w8C+GRn2+0ZenbHy
         vrXeGjFiCklqqvTZSLcOZPmj62CRCLsYzPnRJa7UbjrfbAdfo1B8QYikjrbbfQKpnOhj
         adOiSAPrJLNb4ud6L6VItxsDyuBwZMEi+2Y2zm5Fe7P5dKBWWMhI5G+Q/ffKY/yylnLb
         7K1g==
X-Gm-Message-State: APjAAAWXK1QGKe+qxcFiu2ZQhyUKumd82OLCcZ/fEmX0We0VhLleu0am
        cgR9PejEl9dI/VZdhD260+LYdVvLTxIv+RgRQ22moQ==
X-Google-Smtp-Source: APXvYqxQilzonYgGRhT+QA+AwfuB+IZ31TKJHQheCGHzsJIF3F3Ns2HplQu/HPC/eZCCe/ALDkwRksUMLFmdHy1Hrik=
X-Received: by 2002:a63:af52:: with SMTP id s18mr30581478pgo.263.1582147969204;
 Wed, 19 Feb 2020 13:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20200219045423.54190-1-natechancellor@gmail.com>
 <20200219045423.54190-4-natechancellor@gmail.com> <20200219093445.386f1c09@gandalf.local.home>
 <CAKwvOdm-N1iX0SMxGDV5Vf=qS5uHPdH3S-TRs-065BuSOdKt1w@mail.gmail.com>
 <20200219181619.GV31668@ziepe.ca> <CAKwvOd=8vb5eOjiLg96zr25Xsq_Xge_Ym7RsNqKK8g+ZR9KWzA@mail.gmail.com>
 <20200219195424.GW31668@ziepe.ca>
In-Reply-To: <20200219195424.GW31668@ziepe.ca>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 19 Feb 2020 13:32:38 -0800
Message-ID: <CAKwvOdktG0vZOZVtNJBk1COhOnLYv3MU5KNQ8Z40L4ph5QcnRg@mail.gmail.com>
Subject: Re: [PATCH 3/6] tracing: Wrap section comparison in
 tracer_alloc_buffers with COMPARE_SECTIONS
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>,
        Jason Baron <jbaron@akamai.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 19, 2020 at 11:54 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Feb 19, 2020 at 11:11:19AM -0800, Nick Desaulniers wrote:
> > > Godbolt says clang is happy if it is written as:
> > >
> > >   if (&__stop___trace_bprintk_fmt[0] != &__start___trace_bprintk_fmt[0])
> > >
> > > Which is probably the best compromise. The type here is const char
> > > *[], so it would be a shame to see it go.
> >
> > If the "address" is never dereferenced, but only used for arithmetic
> > (in a way that the the pointed to type is irrelevant), does the
> > pointed to type matter?
>
> The type is used here:
>
>         if (*pos < start_index)
>                 return __start___trace_bprintk_fmt + *pos;
>
> The return expression should be a const char **
>
> Presumably the caller of find_next derferences it.
>
> Jason

And the callers of find_next just return the return value from
find_next, but suddenly as `void*` (find_next()'s return type is
`char**`).  So it doesn't seem like the pointed to type matters, hence
the recommendation of `void` and then address-of (&) used in
comparison+arithmetic.

-- 
Thanks,
~Nick Desaulniers
