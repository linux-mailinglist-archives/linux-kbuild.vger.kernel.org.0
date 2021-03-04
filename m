Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0FF32D6D3
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 16:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235079AbhCDPh5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 10:37:57 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:30926 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235021AbhCDPhb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 10:37:31 -0500
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 124FaMwT012221;
        Fri, 5 Mar 2021 00:36:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 124FaMwT012221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614872182;
        bh=xneyRTALxSEHsnaOni+xxhnkfIFH76q+BS/QxB/FQ4g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zKcJlEOp/Cbb/k0gh8JMi7fbY5INUWJwt64EcjVPiquCuUmQ2aKRY+IvmyWuaZ+Wo
         bMoH7v/Zgf0LeTYrFUR688k5FaD0+/k4XH5y8LLtl+9AlFgLsr/NGau32FEP7Ynan9
         DXG+P3UEKPFpGK+zMTxx9kplbji+R6vPUP6rQivyjjZULbYvoA3fx6xa1x8Jp9uYkj
         1qMM+QewUH6c9NuuE5u0HbDy1RR5qinGlZ+yqp8CchuvixemG/1ZZC8kQwYU+B1g7c
         4T96KQdy/YyLyyvEZ+JHM9WV3qz/WvunImyuOQPQ+nFej3dLG/MBRG7XgQ7JC/2Tzf
         cJkOXm87z4rDw==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id s23so7276532pji.1;
        Thu, 04 Mar 2021 07:36:22 -0800 (PST)
X-Gm-Message-State: AOAM533UcWIXg+dvWqCXjesq3P8uSaCdVh+vR2FRhAPsvR8gfggPraH5
        iSO+8/1Zztq0iD2PQrMyRt7Pqely8jfX3PTQ4UI=
X-Google-Smtp-Source: ABdhPJydG/s5c5MrY872bRNZ8zTNSqYSV41e0EjDU/LaRUp7ImpsS/Qoi/Ah6V0AmVXjEpU9DcT/+8YRqhkkd6k7f1w=
X-Received: by 2002:a17:90a:dc08:: with SMTP id i8mr4901424pjv.153.1614872181705;
 Thu, 04 Mar 2021 07:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble> <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble> <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble> <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble> <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
 <20210304150812.rzya7ewmerwhe4m4@treble>
In-Reply-To: <20210304150812.rzya7ewmerwhe4m4@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Mar 2021 00:35:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
Message-ID: <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
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

On Fri, Mar 5, 2021 at 12:08 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Mar 04, 2021 at 09:27:28PM +0900, Masahiro Yamada wrote:
> > I agree with rebuilding GCC plugins when the compiler is upgraded
> > for *in-tree* building.
> > Linus had reported it a couple of months before,
> > and I just submitted a very easy fix.
>
> Hm?  So does that mean that a GCC version change won't trigger a
> tree-wide rebuild?  So you're asserting that a GCC mismatch is ok for
> in-tree code, but not for external modules???  That seems backwards.
>
> For in-tree, why not just rebuild the entire tree?  Some kernel features
> are dependent on compiler version or capability, so not rebuilding the
> tree could introduce silent breakage.



All the kernel-space objects are rebuilt
when the compiler is upgraded.
(See commit 8b59cd81dc5e724eaea283fa6006985891c7bff4)


Linus complaint about GCC plugins not being rebuilt.
                      ^^^^^^^^^^^

https://lore.kernel.org/lkml/CAHk-=wieoN5ttOy7SnsGwZv+Fni3R6m-Ut=oxih6bbZ28G+4dw@mail.gmail.com/


That is easy to fix. I submitted a patch:
https://patchwork.kernel.org/project/linux-kbuild/patch/20210304113708.215121-1-masahiroy@kernel.org/




> For external modules, a tree-wide rebuild isn't an option so the risk is
> assumed by the user.  I posted a patch earlier [1] which prints a
> warning if the compiler major/minor version changes with an external
> module build.
>
> [1] https://lkml.kernel.org/r/20210201211322.t2rxmvnrystc2ky7@treble
>
> > Rebuilding plugins for external modules is not easy;
> > plugins are placed in the read-only directory,
> > /usr/src/linux-headers-$(uname -r)/scripts/gcc-plugins/.
> >
> > The external modules must not (cannot) update in-tree
> > build artifacts.  "Rebuild" means creating copies in a different
> > writable directory.
> > Doing that requires a lot of design changes.
>
> Ok.  So it sounds like the best/easiest option is the original patch in
> this thread:  when building an external module with a GCC mismatch, just
> disable the GCC plugin, with a warning (or an error for randstruct).

It was rejected.


If a distribution wants to enable CONFIG_GCC_PLUGINS,
it must provide GCC whose version is the same as
used for building the kernel.

If a distribution cannot manage release in that way,
do not enable CONFIG_GCC_PLUGINS in the first place.




-- 
Best Regards
Masahiro Yamada
