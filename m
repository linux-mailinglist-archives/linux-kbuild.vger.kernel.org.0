Return-Path: <linux-kbuild+bounces-2527-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 487E4931600
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 15:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCD2A1F224B1
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 13:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0079818D4D7;
	Mon, 15 Jul 2024 13:44:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C65618C180;
	Mon, 15 Jul 2024 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721051042; cv=none; b=aMRhX+ZfeplQuvqTFrBoAazMtYNY08TFDxOdlXnF1pSeO6PJRoTOyS7mhit3noFh1fyEO+vhFe4s4oGBzfqG6L0Trq+JKSI6weS5WqzKyCRtVwYHxIzn6ljHRKUVkvPYHiX5HLwqlotVhu2cvtb7yDOZb++GKy5rA8cg8rdsKxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721051042; c=relaxed/simple;
	bh=RbNyzPfrBDMS6Wa60MAPH9Oe7T+hXrhb1KM4uwLs0H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZ+cQQiOmw9n2l7czVOz2eVwU5X/hOo88/Fvue3HQxa+z6Z6N+LSqDPHG4sHNo6liKKk4qEvmGejdsfyT35BtEBTFo9WLZrZA1buL+34xooE5l3tnY3tI8l3uvhvoPfPhgq4Ge6nRqw2XdqSCAWMlnZdwFEGttYnUtBqUiFPP3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E77E6DA7;
	Mon, 15 Jul 2024 06:44:25 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77A0A3F73F;
	Mon, 15 Jul 2024 06:43:59 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:43:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: remove redundant 'if HAVE_ARCH_KASAN' in Kconfig
Message-ID: <ZpUnnYTRX-OkEPHh@J2N7QTR9R3>
References: <20240714105848.1844400-1-masahiroy@kernel.org>
 <87d70313-9c8c-4cdf-a040-7ea31804cad7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d70313-9c8c-4cdf-a040-7ea31804cad7@arm.com>

On Mon, Jul 15, 2024 at 08:11:08AM +0530, Anshuman Khandual wrote:
> On 7/14/24 16:28, Masahiro Yamada wrote:
> > The condition 'select HAVE_ARCH_KASAN' is always true because
> > there is 'select HAVE_ARCH_KASAN' statement above.
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> > 
> >  arch/arm64/Kconfig | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index c87d16b12e9b..d37cbfc3031e 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -167,9 +167,9 @@ config ARM64
> >  	select HAVE_ARCH_JUMP_LABEL
> >  	select HAVE_ARCH_JUMP_LABEL_RELATIVE
> >  	select HAVE_ARCH_KASAN
> > -	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
> > -	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
> > -	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
> > +	select HAVE_ARCH_KASAN_VMALLOC
> > +	select HAVE_ARCH_KASAN_SW_TAGS
> > +	select HAVE_ARCH_KASAN_HW_TAGS if ARM64_MTE
> >  	# Some instrumentation may be unsound, hence EXPERT
> >  	select HAVE_ARCH_KCSAN if EXPERT
> >  	select HAVE_ARCH_KFENCE
> 
> There is another similar instance with HAVE_FUNCTION_GRAPH_TRACER as well.
> Just wondering if the following change should be folded in here ?
> 
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -210,8 +210,8 @@ config ARM64
>         select HAVE_FTRACE_MCOUNT_RECORD
>         select HAVE_FUNCTION_TRACER
>         select HAVE_FUNCTION_ERROR_INJECTION
> -       select HAVE_FUNCTION_GRAPH_RETVAL if HAVE_FUNCTION_GRAPH_TRACER
>         select HAVE_FUNCTION_GRAPH_TRACER
> +       select HAVE_FUNCTION_GRAPH_RETVAL
>         select HAVE_GCC_PLUGINS
>         select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
>                 HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI

That looks like a sensible cleanup, but I think it'd be better as a
separate patch.

It looks like that has always been redundant since it was introduced in
commit

  3646970322464c21 ("arm64: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL")

... would you mind spinning a patch?

Mark.

