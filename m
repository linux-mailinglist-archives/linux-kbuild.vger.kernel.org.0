Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565FD380595
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 May 2021 10:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhENIyn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 14 May 2021 04:54:43 -0400
Received: from gate.crashing.org ([63.228.1.57]:60419 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231145AbhENIyl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 14 May 2021 04:54:41 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14E8kuAV007787;
        Fri, 14 May 2021 03:46:56 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 14E8koYF007785;
        Fri, 14 May 2021 03:46:50 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Fri, 14 May 2021 03:46:49 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for preprocessor
Message-ID: <20210514084649.GI10366@gate.crashing.org>
References: <20210513115904.519912-1-aik@ozlabs.ru> <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org> <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

On Fri, May 14, 2021 at 11:42:32AM +0900, Masahiro Yamada wrote:
> In my best guess, the reason why powerpc adding the endian flag to CPP
> is this line in arch/powerpc/kernel/vdso64/vdso64.lds.S
> 
> #ifdef __LITTLE_ENDIAN__
> OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
> #else
> OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
> #endif

Which is equivalent to

#ifdef __LITTLE_ENDIAN__
OUTPUT_FORMAT("elf64-powerpcle")
#else
OUTPUT_FORMAT("elf64-powerpc")
#endif

so please change that at the same time if you touch this :-)

> __LITTLE_ENDIAN__  is defined by powerpc gcc and clang.

This predefined macro is required by the newer ABIs, but all older
compilers have it as well.  _LITTLE_ENDIAN is not supported on all
platforms (but it is if your compiler targets Linux, which you cannot
necessarily rely on).  These macros are PowerPC-specific.

For GCC, for all targets, you can say
  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
You do not need any of the other *ORDER__ macros in most cases.
See "info cpp" for the sordid details.

> [2] powerpc-linux-gnu-gcc + -mlittle-endian    -> __LITTLE_ENDIAN__ is defined

You can just write -mbig and -mlittle btw.  Those aren't available on
all targets, but neither are the long-winded -m{big,little}-endian
option names.  Pet peeve, I know :-)

HtH,


Segher
