Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34349383D07
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 21:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbhEQTRR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 May 2021 15:17:17 -0400
Received: from gate.crashing.org ([63.228.1.57]:48303 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231161AbhEQTRR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 May 2021 15:17:17 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14HJAYe3010889;
        Mon, 17 May 2021 14:10:34 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 14HJAXEs010888;
        Mon, 17 May 2021 14:10:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 17 May 2021 14:10:32 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Alexey Kardashevskiy <aik@ozlabs.ru>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for preprocessor
Message-ID: <20210517191032.GU10366@gate.crashing.org>
References: <20210513115904.519912-1-aik@ozlabs.ru> <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org> <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com> <20210514084649.GI10366@gate.crashing.org> <f8d64d7d-cd2b-342a-de6a-c14a5df9462c@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8d64d7d-cd2b-342a-de6a-c14a5df9462c@ozlabs.ru>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

On Mon, May 17, 2021 at 01:23:11PM +1000, Alexey Kardashevskiy wrote:
> On 5/14/21 18:46, Segher Boessenkool wrote:
> >On Fri, May 14, 2021 at 11:42:32AM +0900, Masahiro Yamada wrote:
> >>In my best guess, the reason why powerpc adding the endian flag to CPP
> >>is this line in arch/powerpc/kernel/vdso64/vdso64.lds.S
> >>
> >>#ifdef __LITTLE_ENDIAN__
> >>OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
> >>#else
> >>OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
> >>#endif
> >
> >Which is equivalent to
> >
> >#ifdef __LITTLE_ENDIAN__
> >OUTPUT_FORMAT("elf64-powerpcle")
> >#else
> >OUTPUT_FORMAT("elf64-powerpc")
> >#endif
> >
> >so please change that at the same time if you touch this :-)
> 
> "If you touch this" approach did not work well with this patch so sorry 
> but no ;)
> 
> and for a separate patch, I'll have to dig since when it is equal, do 
> you know?

Since 1994, when the three-arg version was introduced (the one-arg
version is from 1992).

> >>__LITTLE_ENDIAN__  is defined by powerpc gcc and clang.
> >
> >This predefined macro is required by the newer ABIs, but all older
> 
> That's good so I'll stick to it.

Great.

> >You can just write -mbig and -mlittle btw.  Those aren't available on
> >all targets, but neither are the long-winded -m{big,little}-endian
> >option names.  Pet peeve, I know :-)
> 
> I am looking the same guarantees across modern enough gcc and clang and 
> I am not sure all of the above is valid for clang 10.0.something (or 
> whatever we say we support) ;)

-mbig/-mlittle is supported in GCC since times immemorial.  Whether LLVM
supports it as well just depends on how good their emulation is, I have
no idea.


Segher
