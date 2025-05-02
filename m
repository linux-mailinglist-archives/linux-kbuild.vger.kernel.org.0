Return-Path: <linux-kbuild+bounces-6901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B5AA7C87
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 00:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 712FE4C289E
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 22:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66DE215795;
	Fri,  2 May 2025 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDDD+ufi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D976EB79;
	Fri,  2 May 2025 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226636; cv=none; b=fsRUBsddPUVoa15J/TlRpDZMmC0HKEy/TCIDpZ/Of/HXxw/tupJzscZhw4SXU2JubSJdRLU/bMzH6Ln44ADNCu7IE4ZEhm6SMORV8uEY8xC1XAhocAj2qgFsTrrqTdl4JiLC+qwW4hroJ+uWbyOLcfeIE1Lpi5hjdYBToeN9WPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226636; c=relaxed/simple;
	bh=uCx5v4Wr0SWlA5nPTbbhMhDY/egC5u+xm1ompeTsJ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9+HKH41DsVv6KhdhsrTTDW9oqits8Fd/15CnyRBj8wctTt+QvA8uLGjchGL51OdRcRWqHDZZU9MtJCQfYr3eN1VMmb5uMypXfCzI9I7aF13CVhzNrtoRMiHWsLxNcwr97OZ6lQBeeRxuM4tLcMqFeUbudLer7CecXGs655ZVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDDD+ufi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B3BC4CEE4;
	Fri,  2 May 2025 22:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746226636;
	bh=uCx5v4Wr0SWlA5nPTbbhMhDY/egC5u+xm1ompeTsJ6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDDD+ufiwF5kRqz0eVCPfiyuCdZADYeen1Qf4Q11hMQ8g9mxOzpDJ7P6s0BJdaFRs
	 gORHmtyRQ/mP+pH0lIUUMWEwJ7jOhHxyXCh+tg1G26PFGysnI1pgepFk2AyRjcNO5Z
	 p1F27+5jqLtSEIezMf3bE0T7Zyic7YHh7zKlAGt9tb7C5Ngb+hT+JRBzACvoJkmBGA
	 3m5qRhBNhb8j2gPxdvZAtpHHrZw/RbaN1VIrB7zltyQdUConv0m9Hnsn0/mt2YsCZm
	 WXO0+O6xH7Y+03dyO0OG64CGKuup9TUlOl0N28VkKA/9kwC4w3LmeM/wlxH9uzjOWO
	 qiB7UG7ETGx+w==
Date: Fri, 2 May 2025 15:57:13 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH 2/3] randstruct: Force full rebuild when seed changes
Message-ID: <202505021555.A74E678976@keescook>
References: <20250501193839.work.525-kees@kernel.org>
 <20250501194826.2947101-2-kees@kernel.org>
 <20250502161209.GA2850065@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502161209.GA2850065@ax162>

On Fri, May 02, 2025 at 09:12:09AM -0700, Nathan Chancellor wrote:
> Hi Kees,
> 
> On Thu, May 01, 2025 at 12:48:17PM -0700, Kees Cook wrote:
> > While the randstruct GCC plugin was being rebuilt if the randstruct
> > seed changed, Clangs build did not notice the change. Include the hash
> > header directly so that it becomes a universal build dependency and full
> > rebuilds will happen if it changes.
> > 
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nicolas Schier <nicolas.schier@linux.dev>
> > Cc: Petr Pavlu <petr.pavlu@suse.com>
> > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Cc: <linux-kbuild@vger.kernel.org>
> > ---
> >  include/linux/vermagic.h    |  1 -
> >  scripts/Makefile.randstruct |  3 ++-
> >  scripts/basic/Makefile      | 11 ++++++-----
> >  3 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
> > index 939ceabcaf06..335c360d4f9b 100644
> > --- a/include/linux/vermagic.h
> > +++ b/include/linux/vermagic.h
> > @@ -33,7 +33,6 @@
> >  #define MODULE_VERMAGIC_MODVERSIONS ""
> >  #endif
> >  #ifdef RANDSTRUCT
> > -#include <generated/randstruct_hash.h>
> >  #define MODULE_RANDSTRUCT "RANDSTRUCT_" RANDSTRUCT_HASHED_SEED
> >  #else
> >  #define MODULE_RANDSTRUCT
> > diff --git a/scripts/Makefile.randstruct b/scripts/Makefile.randstruct
> > index 24e283e89893..ab87219c6149 100644
> > --- a/scripts/Makefile.randstruct
> > +++ b/scripts/Makefile.randstruct
> > @@ -12,6 +12,7 @@ randstruct-cflags-y	\
> >  	+= -frandomize-layout-seed-file=$(objtree)/scripts/basic/randstruct.seed
> >  endif
> >  
> > -export RANDSTRUCT_CFLAGS := $(randstruct-cflags-y)
> > +export RANDSTRUCT_CFLAGS := $(randstruct-cflags-y) \
> > +			    -include $(objtree)/scripts/basic/randstruct_hash.h
> 
> As the kernel test robot points out (on a report that you weren't
> included on for some reason...), this breaks the build in several
> places on next-20250502.
> 
> https://lore.kernel.org/202505021409.yC9C70lH-lkp@intel.com/
> 
>   $ make -skj"$(nproc)" ARCH=arm LLVM=1 clean allmodconfig arch/arm/vdso/vgettimeofday.o
>   clang: error: cannot specify -o when generating multiple output files
> 
> There are places in the kernel that filter out RANDSTRUCT_CFLAGS and
> this appears to cause other '-include' flags to be filtered out as well,
> such as the one in the efistub that includes hidden.h.

Thanks! Yeah, I have been poking at it for most of today. 😭

I think I have a viable solution, that I actually end up liking a bit
better, which I just sent out:
https://lore.kernel.org/lkml/20250502224512.it.706-kees@kernel.org/

-- 
Kees Cook

