Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCA5370F1B
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 22:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbhEBUr2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 16:47:28 -0400
Received: from gate.crashing.org ([63.228.1.57]:49169 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232338AbhEBUr1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 16:47:27 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 142KWu7A032481;
        Sun, 2 May 2021 15:32:56 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 142KWrfq032479;
        Sun, 2 May 2021 15:32:53 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Sun, 2 May 2021 15:32:53 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Joe Perches <joe@perches.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210502203253.GH10366@gate.crashing.org>
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com> <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com> <20210502183030.GF10366@gate.crashing.org> <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 02, 2021 at 01:00:28PM -0700, Joe Perches wrote:
> On Sun, 2021-05-02 at 13:30 -0500, Segher Boessenkool wrote:
> > On Sat, May 01, 2021 at 07:41:53PM -0700, Joe Perches wrote:
> > > Why not raise the minimum gcc compiler version even higher?
> 
> On Sun, 2021-05-02 at 13:37 -0500, Segher Boessenkool wrote:
> > Everyone should always use an as new release as practical
> 
> []
> 
> > The latest GCC 5 release is only three and a half years old.
> 
> You argue slightly against yourself here.

I don't?

> Yes, it's mostly a question of practicality vs latest.
> 
> clang requires a _very_ recent version.
> gcc _could_ require a later version.
> Perhaps 8 might be best as that has a __diag warning control mechanism.

I have no idea what you mean?

> gcc 8.1 is now 3 years old today.

And there will be a new GCC 8 release very soon now!

The point is, you inconvenience users if you require a compiler version
they do not already have.  Five years might be fine, but three years is
not.


Segher
