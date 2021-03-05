Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3D332EF90
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 17:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCEQEn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 11:04:43 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52009 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCEQEf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 11:04:35 -0500
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 125G4BOM023409;
        Sat, 6 Mar 2021 01:04:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 125G4BOM023409
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614960252;
        bh=lJOgwp/fJHEfHxHWw7DCbhUu5+385NIZO1SUNkZgfyA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oQCOayBbRjAr+SqyC3Urz4r451bKS+cFkk51dUl+dKnbuu02Ju+xfVs7YjePsrprE
         Qs9h1Za4Z3hhsuf4X+gQAPS7KXeXEowNN7VdvgF7He0K5IeI0iGgHiAXb8lUAvNn4d
         wNkgBTX5bgvcNCLhW2CwViKWLfAuWY4iU7tcGNBxAanL7QWd2U21fpzk+UQoTPOFag
         kffMwqjb9Nl4+zj8fFyjdgctwck118xTeYo//0ipOs0u0dkX2ew9qPCMwCu4PXZZEe
         HO3Z1jfonHFpPEi3lOIKK0wq4C9PN/sU8DmKBVJQPcl94Mo2xoJpkNQVIToU5gYPeZ
         KKfHVbV7jqWTQ==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id q20so2390328pfu.8;
        Fri, 05 Mar 2021 08:04:12 -0800 (PST)
X-Gm-Message-State: AOAM533KJcfZ9hNvjKN42+QX7h4ScyJq6GzNBtAh4cAGJFnzV75jS6oH
        NuWAxpq2wkJI+rDLgOuL7tB7szLOEKmr7MokSWs=
X-Google-Smtp-Source: ABdhPJxpgCIdSFIxF8zUpVMma443/GyCws8C2eAWcytUHSr5IBGolYV8psu8gxwjYK130RvJe++s4g0tNx+vz6dGexk=
X-Received: by 2002:aa7:956d:0:b029:1f1:5ba6:2a58 with SMTP id
 x13-20020aa7956d0000b02901f15ba62a58mr2602273pfq.63.1614960251387; Fri, 05
 Mar 2021 08:04:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble> <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble> <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble> <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
 <20210304150812.rzya7ewmerwhe4m4@treble> <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
 <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com> <20210305024140.fv4i4ujreem2w7sw@treble>
In-Reply-To: <20210305024140.fv4i4ujreem2w7sw@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Mar 2021 01:03:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR3FW8wQe6Zsbj86LQpY4=ASC7Zec-HN4D70FNZcQk0_Q@mail.gmail.com>
Message-ID: <CAK7LNAR3FW8wQe6Zsbj86LQpY4=ASC7Zec-HN4D70FNZcQk0_Q@mail.gmail.com>
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

On Fri, Mar 5, 2021 at 11:41 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Mar 04, 2021 at 11:12:42AM -0800, Linus Torvalds wrote:
> > On Thu, Mar 4, 2021 at 7:36 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > All the kernel-space objects are rebuilt
> > > when the compiler is upgraded.
> >
> > I very much NAK'ed that one. Why did that go in?
> >
> > Or maybe I NAK'ed another version of it (I think the one I NAK'ed was
> > from Josh), and didn't realize that there were multiple ones.
>
> This thread is making me dizzy,

Me too.

> Ok.  So it sounds like the best/easiest option is the original patch in
> this thread:  when building an external module with a GCC mismatch, just
> disable the GCC plugin, with a warning (or an error for randstruct).

Just for clarification,
I believe "the original patch" pointed to this one:
https://lore.kernel.org/lkml/efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com/

This is dead. Please do not come back to this.
See negative comments not only from me,
but also from Greg, Peter, Christoph.



> but I think the patch you NAK'ed from me
> was different.  It just added an error on GCC mismatch with external
> modules:
>
>   https://lkml.kernel.org/r/fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com
>
> though I think you were ok with downgrading it to a warning.

I think this was not NAKed.

At first, Linus NAKed it, but I think it was
just because of some misunderstanding.

I do not have an objection about checking
compiler version difference for external module
builds.

I was pointing out some mistakes in the Makefile implementation.
(I would say "not that way" even with your second trial).


--
Best Regards
Masahiro Yamada
