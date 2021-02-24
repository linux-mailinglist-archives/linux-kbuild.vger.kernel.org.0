Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6976332354C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 02:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhBXB23 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 20:28:29 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46437 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232818AbhBXBP5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 20:15:57 -0500
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 11O1EmEG018923;
        Wed, 24 Feb 2021 10:14:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11O1EmEG018923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614129288;
        bh=58nlSjH7ev/k6UNl8tD5zDkVjNz+kCtEoOrBQkkT2jc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ak0UhE5ywgPW9X1rvOYl2P7Rfjm2i7yKP6bnzqIcreuqGV4xqVGq3yy+w+iKtwbN6
         fHEihePzSPb4RxuVHFupJL9/3MdCW1GBasiDOTIK9wRkIEg4vYN3MrBToSaRpW6Rac
         gsp3KkIx8gwauhAv7kSnNT/VPgA6hHrnZYqzpDM2M7//r8rjiNfHX+dk1csNSxoRNa
         26j1n4Vyy6saTgWczjhrHcN5dgeOLTMlvg7PlfHgaDRn4V05zcKojH/dRDoU9GrjAk
         s9ozr697fy/ap2HSTWhhqZIUWe9U185xGozmPE3pPd97y4zVVP8f8ZkkRnQ4Evbcfv
         zv3a2WoF5xnhw==
X-Nifty-SrcIP: [209.85.215.171]
Received: by mail-pg1-f171.google.com with SMTP id g4so379004pgj.0;
        Tue, 23 Feb 2021 17:14:48 -0800 (PST)
X-Gm-Message-State: AOAM533a25NOh4+M9bZ/utIh+sQpvlUyPQeujX4TYkng94sX/qmJtUAl
        LD9ULKE30xlCMPzWddaHVdCACbt5qvinx828lNc=
X-Google-Smtp-Source: ABdhPJyrQeODiURWdqxKjPnl2wIx11t+swV8wG2gm3/7PvBCvSz+pZjJSArrkSUJsH9pozhE7QU66GxKU4VPXBYNjjI=
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id
 h22-20020a62b4160000b02901e4fb5a55bbmr28292875pfn.80.1614129287543; Tue, 23
 Feb 2021 17:14:47 -0800 (PST)
MIME-Version: 1.0
References: <20210223181425.4010665-1-robh@kernel.org> <20210223181425.4010665-4-robh@kernel.org>
 <CAHk-=wiWoqUt5z0Phvr-0HQkohi2SkYRPuCGi0xefV0KE+t4kA@mail.gmail.com> <CAL_JsqLNVy4KHSViVWePermXsG1K_W=Buj8a1wxQ1pdEVYFr3w@mail.gmail.com>
In-Reply-To: <CAL_JsqLNVy4KHSViVWePermXsG1K_W=Buj8a1wxQ1pdEVYFr3w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Feb 2021 10:14:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2E3tdW6w0u0VEg+r2swxMKAi3qG2C2uCE-FsMBV59bQ@mail.gmail.com>
Message-ID: <CAK7LNAQ2E3tdW6w0u0VEg+r2swxMKAi3qG2C2uCE-FsMBV59bQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: Add a build check for missing gitignore entries
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 24, 2021 at 8:59 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Feb 23, 2021 at 5:20 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Tue, Feb 23, 2021 at 10:14 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > Any non-phony targets need to be in gitignore. The normal way to check
> > > this is doing an in-tree build and running git-status which is easy to
> > > miss. Git provides an easy way to check whether a file is ignored with
> > > git-check-ignore. Let's add a build time check using it.
> >
> > This looks ridiculously expensive with a shell and git invocation for
> > every single target just for this check.



I run "git status" in my usual development flow,
and my eyes eventually catch non-tracked files, if any.

As a fact, Linus noticed the untracked fdtoverlay soon
(but not soon enough to push back the pull request).

So, I am not convinced with doing this in the build time.
This is ugly and expensive.

Maybe we can ask Intel's 0day bot team to run "git status"
after the build test.
(Or, we can ask Stephen Rothwell to do this.)


As it turns out, this detects more than just missed .gitignore addition,
but looking at 1/3 and 2/3, people cannot fix the issues properly,
rather just try to blindly suppress the warnings to make the code even worse.








> I was a bit worried too initially, but casually didn't notice any
> difference so I didn't do any measurements. Now I have, and it looks
> like it adds about 2 sec on a rebuild with no changes. I probably can
> rework it to a single shell and git call per invocation of
> Makefile.lib. What I really need is git-check-ignore to take '-n'
> without '-v', but grep can solve that.
>
> Here's the raw data:
>
> clean x86 defconfig:
> 1805.08user 165.87system 5:05.15elapsed 645%CPU (0avgtext+0avgdata
> 260180maxresident)k
> 110536inputs+1390704outputs (11major+52491225minor)pagefaults 0swaps
>
> rebuild with no changes:
> 12.61user 3.56system 0:04.32elapsed 374%CPU (0avgtext+0avgdata
> 38876maxresident)k
> 0inputs+1984outputs (0major+755708minor)pagefaults 0swaps
>
> adding this commit and rebuild:
> 14.90user 4.80system 0:06.50elapsed 303%CPU (0avgtext+0avgdata
> 39160maxresident)k
> 80inputs+1992outputs (0major+1402830minor)pagefaults 0swaps
>
> clean x86 defconfig with this commit:
> 1799.10user 165.84system 5:06.19elapsed 641%CPU (0avgtext+0avgdata
> 259932maxresident)k
> 8inputs+1390712outputs (0major+53146757minor)pagefaults 0swaps
>
> another rebuild with this commit:
> 14.55user 4.85system 0:06.14elapsed 315%CPU (0avgtext+0avgdata
> 38664maxresident)k
> 0inputs+1992outputs (0major+1402878minor)pagefaults 0swaps
>
> Rob



--
Best Regards
Masahiro Yamada
