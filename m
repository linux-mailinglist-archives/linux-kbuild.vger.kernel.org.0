Return-Path: <linux-kbuild+bounces-7059-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34CAB1531
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 15:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7C316BA6F
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 13:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA08228F528;
	Fri,  9 May 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K/qKTkYv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCCE1F5EA;
	Fri,  9 May 2025 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797291; cv=none; b=W8fGlfBie7WWsOh1jkE46qqXIjMYPGTrm/4VC0dLxZb6Te43zbDqeEcwtuPSwvWKveWPFQtQRnG6HHkM2H/dvOpFehBtsvPM5R5HJkkX+8p7Beokhlnv/URzUtBfTkfD7/4DTOnr0o+9R5EJVwvftjKhsoy1j79MgJecsWOtfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797291; c=relaxed/simple;
	bh=uGoem5oxm43T5fBHILnLczoz1AtySDH/1Rn1MgOYPac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5mW3f5XXPf61GKpUgi5LuB0SaimB4IT+3/mLtzDtEJcdBxGC0pm9WzzKQdL7O6Cmer3/V4iFWhctBMWp/TGjiTctZR+0QQS5y/5P/NltDQlQSEOjY87PHgbzohZYS58vPpMh+PgGx7sd7DjOwb94mVe48hpNh0IDzCNtYTIv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K/qKTkYv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821F1C4CEE4;
	Fri,  9 May 2025 13:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746797291;
	bh=uGoem5oxm43T5fBHILnLczoz1AtySDH/1Rn1MgOYPac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K/qKTkYvKVVTL/AsYT4XN3dR5mNNF5V9oZU0cgbdrjt5Uye0DU6ayJJQmIz1SYb3j
	 5CNDMVXNCVxAeK+YYRqkm5q+4v4VHH3tSa5GFhcGmNMiEBH0L/jcrbWRPWT4OkaX3b
	 bCyofsZLMixdAyw6F1VeLVSoY3OZ08xuDuA9pTg2CmP7GRDbkCjTLvu3zWhNQ/E83w
	 UpIU80N5XF4HS8cq+FB70/eNtNZsXnQ7VrQa1ZA6dryXimDHM6rYYc9SQGi86hnkRm
	 JwtVXjQK/mJ53alMZcRcbjqgYC7LuWMaUmfYiQHc6Gsz/iTjS/vv8k5ktyIK1T3ynt
	 wn1c4ga+aXmcQ==
Date: Fri, 9 May 2025 14:28:05 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Marcus Seyfarth <m.seyfarth@gmail.com>
Subject: Re: [PATCH v2] kbuild: Disable -Wdefault-const-init-unsafe
Message-ID: <20250509132805.GA4132662@ax162>
References: <20250506-default-const-init-clang-v2-1-fcfb69703264@kernel.org>
 <CAK7LNATmW6SfUkF4uZBLVCDUK9NRpWUrmenat1HsSkLHDNmVTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATmW6SfUkF4uZBLVCDUK9NRpWUrmenat1HsSkLHDNmVTQ@mail.gmail.com>

On Fri, May 09, 2025 at 10:04:23PM +0900, Masahiro Yamada wrote:
> On Wed, May 7, 2025 at 6:06 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > A new on by default warning in clang [1] aims to flags instances where
> > const variables without static or thread local storage or const members
> > in aggregate types are not initialized because it can lead to an
> > indeterminate value. This is quite noisy for the kernel due to
> > instances originating from header files such as:
> >
> >   drivers/gpu/drm/i915/gt/intel_ring.h:62:2: error: default initialization of an object of type 'typeof (ring->size)' (aka 'const unsigned int') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
> >      62 |         typecheck(typeof(ring->size), next);
> >         |         ^
> >   include/linux/typecheck.h:10:9: note: expanded from macro 'typecheck'
> >      10 | ({      type __dummy; \
> >         |              ^
> >
> >   include/net/ip.h:478:14: error: default initialization of an object of type 'typeof (rt->dst.expires)' (aka 'const unsigned long') leaves the object uninitialized [-Werror,-Wdefault-const-init-var-unsafe]
> >     478 |                 if (mtu && time_before(jiffies, rt->dst.expires))
> >         |                            ^
> >   include/linux/jiffies.h:138:26: note: expanded from macro 'time_before'
> >     138 | #define time_before(a,b)        time_after(b,a)
> >         |                                 ^
> >   include/linux/jiffies.h:128:3: note: expanded from macro 'time_after'
> >     128 |         (typecheck(unsigned long, a) && \
> >         |          ^
> >   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
> >      11 |         typeof(x) __dummy2; \
> >         |                   ^
> >
> >   include/linux/list.h:409:27: warning: default initialization of an object of type 'union (unnamed union at include/linux/list.h:409:27)' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
> >     409 |         struct list_head *next = smp_load_acquire(&head->next);
> >         |                                  ^
> >   include/asm-generic/barrier.h:176:29: note: expanded from macro 'smp_load_acquire'
> >     176 | #define smp_load_acquire(p) __smp_load_acquire(p)
> >         |                             ^
> >   arch/arm64/include/asm/barrier.h:164:59: note: expanded from macro '__smp_load_acquire'
> >     164 |         union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u;   \
> >         |                                                                  ^
> >   include/linux/list.h:409:27: note: member '__val' declared 'const' here
> >
> >   crypto/scatterwalk.c:66:22: error: default initialization of an object of type 'struct scatter_walk' with const member leaves the object uninitialized [-Werror,-Wdefault-const-init-field-unsafe]
> >      66 |         struct scatter_walk walk;
> >         |                             ^
> >   include/crypto/algapi.h:112:15: note: member 'addr' declared 'const' here
> >     112 |                 void *const addr;
> >         |                             ^
> >
> >   fs/hugetlbfs/inode.c:733:24: error: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Werror,-Wdefault-const-init-field-unsafe]
> >     733 |         struct vm_area_struct pseudo_vma;
> >         |                               ^
> >   include/linux/mm_types.h:803:20: note: member 'vm_flags' declared 'const' here
> >     803 |                 const vm_flags_t vm_flags;
> >         |                                  ^
> >
> > Silencing the instances from typecheck.h is difficult because '= {}' is
> > not available in older but supported compilers and '= {0}' would cause
> > warnings about a literal 0 being treated as NULL. While it might be
> > possible to come up with a local hack to silence the warning for
> > clang-21+, it may not be worth it since -Wuninitialized will still
> > trigger if an uninitialized const variable is actually used.
> >
> > In all audited cases of the "field" variant of the warning, the members
> > are either not used in the particular call path, modified through other
> > means such as memset() / memcpy() because the containing object is not
> > const, or are within a union with other non-const members.
> >
> > Since this warning does not appear to have a high signal to noise ratio,
> > just disable it.
> >
> > Cc: stable@vger.kernel.org
> > Link: https://github.com/llvm/llvm-project/commit/576161cb6069e2c7656a8ef530727a0f4aefff30 [1]
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Closes: https://lore.kernel.org/CA+G9fYuNjKcxFKS_MKPRuga32XbndkLGcY-PVuoSwzv6VWbY=w@mail.gmail.com/
> > Reported-by: Marcus Seyfarth <m.seyfarth@gmail.com>
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/2088
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > Changes in v2:
> > - Disable -Wdefault-const-init-var-unsafe as well, as '= {}' does not
> >   work in typecheck() for all supported compilers and it may not be
> >   worth a local hack.
> > - Link to v1: https://lore.kernel.org/r/20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org
> 
> 
> 
> Applied to linux-kbuild.
> Thanks.
> 
> I fixed up the conflict with the -Wdefault-const-init-field-unsafe patch.
> 
> Please check if it is correct.

This patch should replace the -Wdefault-const-init-field-unsafe patch,
not be applied on top. -Wdefault-const-init-unsafe contains both
-Wdefault-const-init-field-unsafe and -Wdefault-const-init-var-unsafe.

Cheers,
Nathan

