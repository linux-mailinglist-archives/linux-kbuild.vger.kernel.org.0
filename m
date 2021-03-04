Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D62532D2F5
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 13:31:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240645AbhCDM3i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 07:29:38 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:52257 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233785AbhCDM3P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 07:29:15 -0500
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 124CS6Rq009011;
        Thu, 4 Mar 2021 21:28:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 124CS6Rq009011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614860886;
        bh=Irzj2yjdZ3CLdRv1cDzW4OzBos4tk0kk+hDpIub76LA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bvUJazwZiNRY8heTj7xTfl2HmoK/+nuraa0gep/9D1Mc8Fxq3XIgxQUojhIF5PIbp
         1ZrZMWmVMaHGCUvzhycJdmI64WnD+CXXVGWZNFGCoLCBzkLSJP4XHjNf4y2UnqDMjc
         bX/6/Ew9IXKxsVtr24eemy2Ur4RmTC+XyooENQZwGFwHG+ce8tmrW7PCvzo9Aq6VYf
         vugVE5PppSkKaDAxwflc8lpkiZbYnqXKL5z6qOM5JaLJMEST7RqSAiMIW+mlNTqsJQ
         dh4Jy2orkxpz/YgIB7uUAldo6BFP+wMnCA6HBWIPBRBUfH9oN6TFU3aE1tg4JcoYRr
         lVAwsvAQ4Wehw==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id s7so8865832plg.5;
        Thu, 04 Mar 2021 04:28:06 -0800 (PST)
X-Gm-Message-State: AOAM531JtJRCogyUoKVo/69GtLVXqGWnNWBQ38sLQrEYe/AcGl5uaBw4
        m+aD1em8CgYVkGg4YxuJLowCkqYs6gMtZUrtcic=
X-Google-Smtp-Source: ABdhPJxzsQlqGgo4NvfSLwRPyaSNY2c5Jchh9K+ULSaLODKi4nRvy694XWcgTx+5kX7UG7VamVjQeA1dQOQUh2XDKjM=
X-Received: by 2002:a17:902:8687:b029:e1:601e:bd29 with SMTP id
 g7-20020a1709028687b02900e1601ebd29mr3711611plo.47.1614860885734; Thu, 04 Mar
 2021 04:28:05 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble> <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble> <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble> <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble>
In-Reply-To: <20210303214534.guyoxcwrgxgcqzy4@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 4 Mar 2021 21:27:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
Message-ID: <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 6:45 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Wed, Mar 03, 2021 at 12:56:52PM -0800, Linus Torvalds wrote:
> > On Wed, Mar 3, 2021 at 12:24 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > >
> > > Your nack is for a different reason: GCC plugins are second-class
> > > citizens.  Fair enough...
> >
> > MNo, I didn't NAK it. Quite the reverser.
> >
> > I am ABSOLUTELY against rebuilding normal object files just because
> > gcc versions change. A compiler version change makes zero difference
> > for any normal object file.
> >
> > But the gcc plugins are different. They very much _are_ tied to a
> > particular gcc version.
> >
> > Now, they are tied to a particular gcc version because they are
> > horribly badly done, and bad technology, and I went off on a bit of a
> > rant about just how bad they are, but the point is that gcc plugins
> > depend on the exact gcc version in ways that normal object files do
> > _not_.
>
> Thanks, reading comprehension is hard.  I realized after re-reading that
> I interpreted your "plugins should depend on the kernel version"
> statement too broadly.
>
> Masahiro, any idea how I can make the GCC version a build dependency?


I agree with rebuilding GCC plugins when the compiler is upgraded
for *in-tree* building.
Linus had reported it a couple of months before,
and I just submitted a very easy fix.

Rebuilding plugins for external modules is not easy;
plugins are placed in the read-only directory,
/usr/src/linux-headers-$(uname -r)/scripts/gcc-plugins/.

The external modules must not (cannot) update in-tree
build artifacts.  "Rebuild" means creating copies in a different
writable directory.
Doing that requires a lot of design changes.


-- 
Best Regards
Masahiro Yamada
