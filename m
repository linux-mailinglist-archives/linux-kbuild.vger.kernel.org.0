Return-Path: <linux-kbuild+bounces-7165-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC949ABD32F
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 11:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27E373B682E
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 09:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27341262FF8;
	Tue, 20 May 2025 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSKWpIrx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A825C701;
	Tue, 20 May 2025 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732803; cv=none; b=iBLeO5Nypifo8xQ+ykYplKICACW+TmspyZUJNPXDGkW1Q2cau77Fpg9Y785UC+tqDukl6U5gGIh/4LSWekgL9PgiGoOnG+woewHdTry9vljb/p8VUeRI1ORIlDk2b5F4SKP3X3lwFp2bUo0v8I3v1d0fGHCuofF2N5IdG9DKCnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732803; c=relaxed/simple;
	bh=OvPIBUE0bWywwX+5amiRSbhQI4shI1x2lmUM9etBsf8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cY11P6jThLD0rmg+IJ0nymDN3KGlhsONB4aEkt9znE0G9XtbuK7ckPQqVWI5w0ZRG3AFY5T5w4VLGlJPDbS9fScY76AMneRA39J4IBbteDaEeaPSDgacaIN3F/Tz3lW8FnIjjJXTbdeyH338hWIkRtRv6KqHiTfFa1Knt07Uiwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSKWpIrx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4D8C4CEE9;
	Tue, 20 May 2025 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747732802;
	bh=OvPIBUE0bWywwX+5amiRSbhQI4shI1x2lmUM9etBsf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mSKWpIrxHRb/73jCabMq1y4CdFRUjth/kB+0BkUUFXNa/OIlqS6LP0eE+TMzaoDgK
	 7O7fC42aQEAfVelBhu82SowO0pjOCbOUA14zX3bI8OmZ2TwJixtlSk+ZG8nggP8KZd
	 gf2zdD4TGrP7yaX3iuuCqww0zBs7aILbqvH3gu8sCNFFcEos6ViRVaWHjkHGBPdnwr
	 WItIFeNV+FvEBQX93CulDXJcRpvPUCEWq6/6N8VhGzu851P/bOoTP1dPqdjDhvYLpq
	 RFRDEISaw6yUbLauKof8kkRI8yeQ6SZq+d/QIv68U8EOTk2Eu+z5SpYJDikratL9sH
	 M7Q4/uLafw7Kw==
Date: Tue, 20 May 2025 11:19:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Nicolas Schier
 <nicolas.schier@linux.dev>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: kerneldoc.py: don't use Sphinx logger
Message-ID: <20250520111956.1db9db88@sal.lan>
In-Reply-To: <590981da-4d37-464f-a52e-ba163d3ecbc5@gmail.com>
References: <cover.1747719873.git.mchehab+huawei@kernel.org>
	<6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
	<7bbe75ff-548f-4ffd-9522-59d1518d6c72@infradead.org>
	<20250520095037.3dc39685@sal.lan>
	<590981da-4d37-464f-a52e-ba163d3ecbc5@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 20 May 2025 17:23:30 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> On Tue, 20 May 2025 09:50:37 +0200, Mauro Carvalho Chehab wrote:
> > Hi Randy,
> > 
> > Em Mon, 19 May 2025 22:55:08 -0700
> > Randy Dunlap <rdunlap@infradead.org> escreveu:
> >   
> [...]
> 
> >> Traceback
> >> =========
> >>
> >>       File "/usr/lib/python3.13/site-packages/sphinx/util/parallel.py", line 137, in _join_one
> >>         raise SphinxParallelError(*result)
> >>     sphinx.errors.SphinxParallelError: KeyError: '../drivers/gpio/gpiolib-acpi.c'
> >>
> >> and then it's finished (not a normal finish).
> >> So IMHO this patch is not sufficient.  
> > 
> > Well, on next-20250516:
> > 
> > 	$ ls drivers/gpio/gpiolib-acpi.c
> > 	ls: cannot access 'drivers/gpio/gpiolib-acpi.c': No such file or directory
> > 
> > Avoiding the script to abort is a matter of adding a try/except
> > block at kerneldoc.py, but I'd say that, if an include file (or any other
> > file needed for the build) is not found, "make" should abort anyway for
> > the affected target (Kernel compilation or when doc building).  
> 
> Interesting ...
> 
> So, it sounds to me you think you have the right to break Stephen's (and
> possibly other devs') workflow of test-building kernel docs, aren't you?
> 
> I don't buy such an argument.
> 
> An innocent typo in pathname somewhere in the doc tree deserves a friendly
> warning at most, not a fatal crash within Sphinx.  That would need another
> run of "make htmldocs" after fixing the fatal error to see for other
> innocuous warnings.

If by "innocent typo" you mean removing/renaming/moving a file from
the Kernel tree without updating Makefiles, or adding them with wrong
names, then yes: I do think this should be fatal for the affected "make" 
targets. The quickest such build issues are caught, the best for everyone.

Yet, this is is a separate discussion: if there are bugs at the doc
build system, they should be fixed. In this specific case, the missing
file produces a KeyError when the messages that were supposed to be
generated by it aren't stored on a dict. I sent already some patches
addressing it:

	https://lore.kernel.org/linux-doc/cover.1747730982.git.mchehab+huawei@kernel.org/T/#t

Plus the logger fix to prevent Sphinx to suppress warnings/errors:
	https://lore.kernel.org/linux-doc/cover.1747719873.git.mchehab+huawei@kernel.org/T/#t

> 
> And your change has no effect on exposing those innocuous warnings.
> 
> On current docs-next + your change above, running:
> 
>     make cleandocs; make KERNELDOC=$PWD/scripts/kernel-doc.pl htmldocs
> 
> produces these 3 warnings:
> 
> ----------------------------------------------------------------------
> ./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
> ./drivers/gpu/drm/amd/include/amd_shared.h:369: warning: Incorrect use of kernel-doc format:          * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
> ./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDCP_LC_ENABLE_SW_FALLBACK' not described in enum 'DC_DEBUG_MASK'
> ----------------------------------------------------------------------
> 
> , while running:
> 
>     make cleandocs; make htmldocs
> 
> or:
> 
>     make cleandocs; make KERNELDOC=$PWD/scripts/kerneldoc htmldocs
> 
> doesn't produce them.

Testing here with next-20250516:

	$ ./scripts/kernel-doc.pl -Wall -none ./drivers/gpu/drm/amd/include/amd_shared.h
	$

	$ ./scripts/kernel-doc.py -Wall -none ./drivers/gpu/drm/amd/include/amd_shared.h
	$

Also, if I rename the value 'DC_HDCP_LC_ENABLE_SW_FALLBACK_XXX',
both produces identical warnings:

	$ ./scripts/kernel-doc.pl -Wall -none ./drivers/gpu/drm/amd/include/amd_shared.h
	./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Enum value 'DC_HDCP_LC_ENABLE_SW_FALLBACK_XXX' not described in enum 'DC_DEBUG_MASK'
	./drivers/gpu/drm/amd/include/amd_shared.h:373: warning: Excess enum value 'DC_HDCP_LC_ENABLE_SW_FALLBACK' description in 'DC_DEBUG_MASK'

	$ ./scripts/kernel-doc.py -Wall -none ./drivers/gpu/drm/amd/include/amd_shared.h
	Warning: ./drivers/gpu/drm/amd/include/amd_shared.h:372 Enum value 'DC_HDCP_LC_ENABLE_SW_FALLBACK_XXX' not described in enum 'DC_DEBUG_MASK'
	Warning: ./drivers/gpu/drm/amd/include/amd_shared.h:372 Excess enum value '%DC_HDCP_LC_ENABLE_SW_FALLBACK' description in 'DC_DEBUG_MASK'

So, it sounds to me that things are the way they're expected,
after applying both series.

Regards,
Mauro

