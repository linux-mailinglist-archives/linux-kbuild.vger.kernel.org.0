Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420A23234DA
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 02:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBXBFq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 20:05:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:57604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234687AbhBXAFk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 19:05:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD45964EBA;
        Tue, 23 Feb 2021 23:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614124771;
        bh=d8bhfTDGI9W39QzlxnPPLrP0VWvKUzQ7BK1mYKgo9bA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tyPZC6RjnjTj5pSU0VB5e1epmkPcWqFelbhkY5W/hh2lFen0FTZzCmFc5u17S2UCk
         IUSj3R471D3GfQF/drgrtOjwe7spQ1LnOgtgOzfnMDBUQ2OGFkyfHqVYvrKXQZCiSB
         eRxQSOkQP17CrQDHw7ddHEbq2DSmVh6i/dhiZFVf3otifw20icBRYDmZep5ju9LM2u
         euuj2/2vGT/CBWoMf2XS1HiYHF9GO9uZirW5lFTyg2VyilW+BT9i6qDnYgiN/1uYMD
         LNj0mMEZa+V0yE4oEd7A+yGNHhVoDIWWj8Ur2EBsMn3sjpWwuA83Ccp+0fj7cm7z8i
         PkV5hwELppe5Q==
Received: by mail-ed1-f42.google.com with SMTP id j9so475807edp.1;
        Tue, 23 Feb 2021 15:59:30 -0800 (PST)
X-Gm-Message-State: AOAM5301dM/ZRoxwJI9xTVMMbuO9CwTQ5ZyIFMKPaBWLIITLSpc2tbhz
        hfrKqogjlmxpgbOGPP0h+V6/NvgubxiJJInyuw==
X-Google-Smtp-Source: ABdhPJzy2WY+J2dV1PUUmZu/lKy62FdvqPm74QE245X5CUGwMtEVPr93/MqHapjUWaxZ7K8UKNyNqMBVEaiqnQR3nn4=
X-Received: by 2002:a05:6402:164e:: with SMTP id s14mr17830402edx.62.1614124769468;
 Tue, 23 Feb 2021 15:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20210223181425.4010665-1-robh@kernel.org> <20210223181425.4010665-4-robh@kernel.org>
 <CAHk-=wiWoqUt5z0Phvr-0HQkohi2SkYRPuCGi0xefV0KE+t4kA@mail.gmail.com>
In-Reply-To: <CAHk-=wiWoqUt5z0Phvr-0HQkohi2SkYRPuCGi0xefV0KE+t4kA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 23 Feb 2021 17:59:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLNVy4KHSViVWePermXsG1K_W=Buj8a1wxQ1pdEVYFr3w@mail.gmail.com>
Message-ID: <CAL_JsqLNVy4KHSViVWePermXsG1K_W=Buj8a1wxQ1pdEVYFr3w@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: Add a build check for missing gitignore entries
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
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

On Tue, Feb 23, 2021 at 5:20 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Feb 23, 2021 at 10:14 AM Rob Herring <robh@kernel.org> wrote:
> >
> > Any non-phony targets need to be in gitignore. The normal way to check
> > this is doing an in-tree build and running git-status which is easy to
> > miss. Git provides an easy way to check whether a file is ignored with
> > git-check-ignore. Let's add a build time check using it.
>
> This looks ridiculously expensive with a shell and git invocation for
> every single target just for this check.

I was a bit worried too initially, but casually didn't notice any
difference so I didn't do any measurements. Now I have, and it looks
like it adds about 2 sec on a rebuild with no changes. I probably can
rework it to a single shell and git call per invocation of
Makefile.lib. What I really need is git-check-ignore to take '-n'
without '-v', but grep can solve that.

Here's the raw data:

clean x86 defconfig:
1805.08user 165.87system 5:05.15elapsed 645%CPU (0avgtext+0avgdata
260180maxresident)k
110536inputs+1390704outputs (11major+52491225minor)pagefaults 0swaps

rebuild with no changes:
12.61user 3.56system 0:04.32elapsed 374%CPU (0avgtext+0avgdata
38876maxresident)k
0inputs+1984outputs (0major+755708minor)pagefaults 0swaps

adding this commit and rebuild:
14.90user 4.80system 0:06.50elapsed 303%CPU (0avgtext+0avgdata
39160maxresident)k
80inputs+1992outputs (0major+1402830minor)pagefaults 0swaps

clean x86 defconfig with this commit:
1799.10user 165.84system 5:06.19elapsed 641%CPU (0avgtext+0avgdata
259932maxresident)k
8inputs+1390712outputs (0major+53146757minor)pagefaults 0swaps

another rebuild with this commit:
14.55user 4.85system 0:06.14elapsed 315%CPU (0avgtext+0avgdata
38664maxresident)k
0inputs+1992outputs (0major+1402878minor)pagefaults 0swaps

Rob
