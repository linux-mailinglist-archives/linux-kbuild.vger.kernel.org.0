Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F923B0277
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 13:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhFVLNE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Jun 2021 07:13:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:40116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhFVLND (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Jun 2021 07:13:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 127D561076;
        Tue, 22 Jun 2021 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624360248;
        bh=lqtyp4Cx8BPhhiC+aCM09V0C4tGXRAm837DZNpt2OJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KgzLPLsxIOuVtQHlDR17vMyUPdcC12xCtUIm8CspHkucEl2g9RtOc/WA0x0LjBX5U
         ROxBCI2MAhTjJs/ePvAcnlUrPPOjYXAXEp21q0Xd0dzrI7mrswW6gP5orF7bdEVuGz
         PP3DpGsCCfmZXiI8aXvJur33iRUnVNbSZxfFAL3PQ6LA3aBbqPXruw87dLOzrGNb/U
         1nc4pbAfhxQJybnHHTX76kC6nTfQJV7BB+vJGJjQ5Z9a1XadLl/XZWQQrjRd7rCloL
         azVz4DNCF4YYfD6ORrWj/RjxgwH0F/93X8CtoSwpy8aXFohiLBqibYnA2p8UFYApLF
         15UyZTdo5hkug==
Date:   Tue, 22 Jun 2021 12:10:39 +0100
From:   Will Deacon <will@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] Kconfig: add
 ARCH_WANTS_NO_INSTR+CC_HAS_NO_PROFILE_FN_ATTR, depend on for GCOV and PGO
Message-ID: <20210622111039.GA30757@willie-the-truck>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
 <20210621231822.2848305-4-ndesaulniers@google.com>
 <20210622090540.GA67232@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622090540.GA67232@C02TD0UTHF1T.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 22, 2021 at 10:05:40AM +0100, Mark Rutland wrote:
> On Mon, Jun 21, 2021 at 04:18:22PM -0700, Nick Desaulniers wrote:
> > We don't want compiler instrumentation to touch noinstr functions, which
> > are annotated with the no_profile_instrument_function function
> > attribute. Add a Kconfig test for this and make PGO and GCOV depend on
> > it.
> > 
> > If an architecture is using noinstr, it should denote that via this
> > Kconfig value. That makes Kconfigs that depend on noinstr able to
> > express dependencies in an architecturally agnostic way.
> > 
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Peter Oberparleiter <oberpar@linux.ibm.com>
> > Link: https://lore.kernel.org/lkml/YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net/
> > Link: https://lore.kernel.org/lkml/YMcssV%2Fn5IBGv4f0@hirez.programming.kicks-ass.net/
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> FWIW, this looks good to me:
> 
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> 
> Catalin, Will, are you happy iwth the arm64 bit?

Looks fine to me.

Will
