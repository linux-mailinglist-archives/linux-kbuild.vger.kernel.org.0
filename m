Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF06F3A2B90
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Jun 2021 14:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhFJMao (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Jun 2021 08:30:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230313AbhFJMan (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Jun 2021 08:30:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E9A9613FF;
        Thu, 10 Jun 2021 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623328127;
        bh=oM8Xy2d4wRrsobuhLSoo6NIi3h4j+xja59Yg4YTixBw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C0JM370Zn9XSAXrX0rvJQqL0iMUHJUCv1yxzYh531URiNLAvW+TeJpduq1s0suThX
         8zaVmM2dxW6+cdXLkoOC+MgT16XtWz0iVwJbxKY7Oq4jh9X18sUmhf9xh3I3cF3VZa
         dOZ7hs5U+XoNp4mslgZC3U822pTOp2/XgPnZMyHvRLTz/5rIAu1yaxVH+I9+m4v7Oa
         NGwUr78YvKUquAdtAbiuVjL2TSmajRGpOC7fkxXCnfrXCqHlKn2vUbifmaOZCN0frw
         T6GakEGYg1Px0tp0s3/H/MReuQ/atseQ1PViLsxkFE/iLqmHRa707YFWlF28/g59pE
         Y41ufH40UzjeA==
Received: by mail-wm1-f50.google.com with SMTP id h11-20020a05600c350bb02901b59c28e8b4so5956827wmq.1;
        Thu, 10 Jun 2021 05:28:47 -0700 (PDT)
X-Gm-Message-State: AOAM531Bie7bvYcwjFjaVzDQMRKo7+bjYq3E5qd9Jo1v+ATCUend0ayI
        X05/1UlfIGwdLqaCYkkeruzGod5kQz+IkfbZCro=
X-Google-Smtp-Source: ABdhPJwBHRvZvUbFL9UBAe/5V1ayCpUBjyRB67fB7fC88KdQAAnpTCYoX7GDjBqcyIt1zA/+d1+HlHBvBQ5DCiAiACY=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr14938844wmb.142.1623328125935;
 Thu, 10 Jun 2021 05:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210204152957.1288448-1-arnd@kernel.org> <20210609110531.GA1528247@roeck-us.net>
 <CAK8P3a2cVpJf+r2b-8YCbknOeOA4w=bY8njr-+vmzbmm8AAC3Q@mail.gmail.com>
 <20210609151608.GA3389541@roeck-us.net> <20210609191553.GA2535199@roeck-us.net>
 <CAK8P3a1kgc6+fSHr7ddMRHxh+znW6jL2ZSo=JLWa-Uuzw7UZ-w@mail.gmail.com> <20210610120531.GA711216@roeck-us.net>
In-Reply-To: <20210610120531.GA711216@roeck-us.net>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 10 Jun 2021 14:26:50 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LTXme3pa-es=7s7aHX2EvC+2Dxegs=reuJrjeS4sygg@mail.gmail.com>
Message-ID: <CAK8P3a2LTXme3pa-es=7s7aHX2EvC+2Dxegs=reuJrjeS4sygg@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: fix nonconverging kallsyms table with lld
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Brazdil <dbrazdil@google.com>,
        Marc Zyngier <maz@kernel.org>,
        Mikhail Petrov <Mikhail.Petrov@mir.dev>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marty Faltesek <mfaltesek@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 10, 2021 at 2:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Jun 09, 2021 at 10:30:23PM +0200, Arnd Bergmann wrote:
> > > I thought I'd see the added symbols, but it looks like the only difference
> > > between the two files is the addresses.
> > >
> > > What am I missing ?
> >
> > I probably misremembered the part about 'objdump --syms' and there was
> > something more to it.
> >
> > Maybe this was the last version before converging? It looks like the '<' version
> > has one extra symbol ompared to the '>' version. The diff has no context, but I
>
> It is the difference between step 1 and 2. Why would diff on objdump not
> show the additional symbol ? Is it possible that the symbol is not added
> to the object file ?

Note sure. The symbol must be in the object file, but perhaps the
'objdump --syms' output skips a different set of symbols compared
to the list that is used as input for kallsyms, which comes from '${NM}'.

Comparing the nm output might be another thing to try.

      Arnd
