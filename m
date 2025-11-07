Return-Path: <linux-kbuild+bounces-9445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93978C419F8
	for <lists+linux-kbuild@lfdr.de>; Fri, 07 Nov 2025 21:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13B074F1332
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Nov 2025 20:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE28334690;
	Fri,  7 Nov 2025 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BZTKNRUF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BF7331A73;
	Fri,  7 Nov 2025 20:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762548328; cv=none; b=Sam47r3Y7EDVDximOm9GfLFGEIqZz9x5JF7fGISVvWk614kirlMm1gTbUb5vtO5rOQ5JqZKKVU0QFjo1LgUjNRJzzVmsM7CX7BRpTbmuecq4UFqqSpfSr1BGOcPNVpyaHUYYqRFgacOFVy9EVh2Nuv5H7bKT9Zkww4p606MUgik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762548328; c=relaxed/simple;
	bh=XV5vMD5mhNb8S3bVYhpguDXmejXTv6xbJBbd8aUKog0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GkPYg/hLDXz6v9lfZn8Q4RYkfj5PRxxLAynjhSODnyiYeR1P1woSUC+9iW0XacGWW7jiorFkd3Yb+VkDRxQyyspYSrXoN0VLkFrNaEiInJuqb1QEWHUQAH5I5u91P96HALXRz1dqzSg9NgGBjhn+xDjZvkQXIsmrLB9Y6zIti98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZTKNRUF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCBBC4CEF5;
	Fri,  7 Nov 2025 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762548328;
	bh=XV5vMD5mhNb8S3bVYhpguDXmejXTv6xbJBbd8aUKog0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BZTKNRUF2rFxDqT+8yy2Cq1oC4F9HOzEulZYRlYOfvd+VsRTSsx5ziDYnP+rK7CMY
	 QYfQjvrZhK5x3UYMAq8v7TgZpRy4UY075HNF88ogiPMycb20yCtZ933bnKKopmxmJp
	 DI3/U3YyYoL1m7/iFIlkhynYzogF04RGXA1nF970KawR7fvsTbL3DsO4wynKJ+D+/a
	 i6OeqlLlIe7ZnFKLKylSQKigmcXSz9da5C/hIuO17BxemuaYej3/ugNLqEhtfIaMkn
	 EqczKvfFGuJKYa87vuv3R6PNC3EJyZNxm/lBk6EAEUVwTjDBhGYuljzf1GDwrVhPpp
	 9PW1urkiVnHkA==
Date: Fri, 7 Nov 2025 21:45:23 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Linux Documentation <linux-doc@vger.kernel.org>,
 linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH] Makefile: Let kernel-doc.py use PYTHON3 override
Message-ID: <20251107214523.50648778@foz.lan>
In-Reply-To: <20251107192624.78b8a8cf@endymion>
References: <20251103131419.5e504ae2@endymion>
	<20251103185609.GB672460@ax162>
	<c0e4a0b0-b7c9-491b-ada3-74945fb2e3d9@infradead.org>
	<20251107071342.52ed6437@sal.lan>
	<20251107192624.78b8a8cf@endymion>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 7 Nov 2025 19:26:24 +0100
Jean Delvare <jdelvare@suse.de> escreveu:

> Hi Mauro,
> 
> On Fri, 7 Nov 2025 07:13:42 -0300, Mauro Carvalho Chehab wrote:
> > Please notice, however, that kERNEL_DOC env var is also called at some
> > DRM makefiles. Perhaps the issue you're getting is there.  
> 
> I'm getting the warnings from a simple "make" call with W=1, and for
> pretty much all C files, not just drm drivers. For example:
> 
> $ nice make CC=/usr/bin/gcc-8 PYTHON3=/usr/bin/python3.12 W=1
> (...)
>   CC      arch/x86/events/intel/core.o
> Warning: Python 3.7 or later is required for correct results
> Warning: arch/x86/events/intel/core.c:0 Python 3.7 or later is required for correct results
>   CC      arch/x86/events/intel/bts.o
> Warning: Python 3.7 or later is required for correct results
> Warning: arch/x86/events/intel/bts.c:0 Python 3.7 or later is required for correct results
>   CC      arch/x86/events/intel/ds.o
> Warning: Python 3.7 or later is required for correct results
> Warning: arch/x86/events/intel/ds.c:0 Python 3.7 or later is required for correct results
>   CC      arch/x86/events/intel/knc.o
> Warning: Python 3.7 or later is required for correct results
> Warning: arch/x86/events/intel/knc.c:0 Python 3.7 or later is required for correct results
> 
> So without my patch, PYTHON3= is ignored for part of the build, and
> these recurrent warnings make it difficult to spot other warnings.

I was kind of expecting such issues on SUSE/openSUSE. That's why
I proposed a logic which auto-detects if a newer python was present,
using it when python version is < 3.7. However, most people didn't like
such approach.

> Which is the reason why I proposed a fix. Alas, I see that my first candidate
> fix breaks "make htmldocs" as reported by Nathan. I'll send a different
> fix which doesn't seem to break anything in my tests.

The second patch seems to be the correct approach to make PYTHON3
override work for kernel-doc. Sent my R-B to it.

Thanks,
Mauro

