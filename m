Return-Path: <linux-kbuild+bounces-7167-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68664ABD8FA
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 15:10:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34CCB3A67FE
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 13:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2563322D4DF;
	Tue, 20 May 2025 13:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDRrB4dL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5B11187;
	Tue, 20 May 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747746598; cv=none; b=eOkDJijcOKHEJuLH/z6jaQrmOf3rT6YtRU+Me4gcBNWOJjWxUEihUkNwqkvXnzEgnjloRmOYQBpVWQkm8OStln0lvDOIv+DDYTNSkNbK2gNMiKIq79ANUtP0FVHcCQCXRQ8o+UX37GinfewPimThF7rBUhAuLjlBaQoIortNAnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747746598; c=relaxed/simple;
	bh=uUqa+t+RcBnaEC87LjZa0OB0xX9x5zOn6U+ny8ar9Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uiWlFsz0vlKaeSW7+ZCI+EPL7Fba5tgDox0NNb0rA2EJjwveOScPNcCz87wyJ7OBZVn/yON/YOYpfU428wWo3JkuA/VyMUUNj74Or5yiCEiKG3czBIxN1hmos0F5ymv7d8SfiSCLgUYfE8zTEkV7PIwhj3O9SCUpTFqccnsT78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDRrB4dL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44EF9C4CEF2;
	Tue, 20 May 2025 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747746597;
	bh=uUqa+t+RcBnaEC87LjZa0OB0xX9x5zOn6U+ny8ar9Vw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dDRrB4dLsMAO7S1sG2n4EIyWVARMsKlMYdN0cjte/U+HmBIQVMHVXTELFV4Rwbwa4
	 lX8Dpc9wBEDX6KzFdLGb+jvtRB0Ix71qFM5akYLM+w1QokgcYf7nCNLG/gw9LZy9vQ
	 Qc/inX0NGi6kPSk/onvhj0umkjMgWBvNYAqrLkiae2FG8aMi9uok+nL5luTeAkN9xH
	 zFltxQA06VIIYK/sFlxvfZawQYKHtlhKwpcQ3LjnJIN0oqqGIrFI9NJJ88GAM64W+m
	 mnXV1OnWDI0oucIrThVFajmCCOBAN7PjY5ARdogdf4UbiSLyG+spuZ43aphwSzxwwQ
	 Pc7tihuhV4oSw==
Date: Tue, 20 May 2025 15:09:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Schier
 <nicolas.schier@linux.dev>
Cc: Akira Yokosawa <akiyks@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: kerneldoc.py: don't use Sphinx logger
Message-ID: <20250520150940.7d1cffec@sal.lan>
In-Reply-To: <20250520213906.6ec263d8@canb.auug.org.au>
References: <cover.1747719873.git.mchehab+huawei@kernel.org>
	<6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org>
	<7bbe75ff-548f-4ffd-9522-59d1518d6c72@infradead.org>
	<20250520095037.3dc39685@sal.lan>
	<590981da-4d37-464f-a52e-ba163d3ecbc5@gmail.com>
	<20250520111956.1db9db88@sal.lan>
	<20250520213906.6ec263d8@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 20 May 2025 21:39:06 +1000
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Mauro,
> 
> I do appreciate your work on the document system.  Particularly you
> have made the process much faster.  However, see below.

Hi Stephen,

> On Tue, 20 May 2025 11:19:56 +0200 Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >
> > If by "innocent typo" you mean removing/renaming/moving a file from
> > the Kernel tree without updating Makefiles, or adding them with wrong
> > names, then yes: I do think this should be fatal for the affected "make" 
> > targets. The quickest such build issues are caught, the best for everyone.  
> 
> They are found if you leave them as warnings and just continue on.  I
> have been finding them by when the current python version just crashes
> (without any useful message before your current change) I rerun the
> htmldocs using the perl version to get the name of the missing file and
> then report it so it can be fixed.  But the perl version continues on
> and produces all the other warnings so I can compare with the previous
> and only report new errors/warnigs.  Sometime these reports are not
> foxed for days or weeks (or months).
> 

The issues we're seeing weren't due to the conversion from perl to
python, but, instead, to the new logic that calls the Python methods
directly, instead of opening a shell to call kernel-doc.

Those caused some unintended changes, due to the way Sphinx works:

1. Sphinx has an overlay over the Python logger class. Such overlay
   has some logic to output colored messages, which is interesting.
   However, it also has a filtering logic which is affected by the
   flags passed when sphinx-build is called. That was actually
   suppressing not only verbose level logs, but also warnings and
   errors. The fix is a single-line change:

   -	kfiles = KernelFiles(out_style=out_style, logger=logger)
   +	kfiles = KernelFiles(out_style=out_style)

   The patch is at:
	https://lore.kernel.org/linux-doc/6b81b1aaa8446b4d850064dd38ffffa1a1cb6254.1747719873.git.mchehab+huawei@kernel.org/

2. Now that we're not opening a shell anymore, if kernel-doc.py
   dies, it could cause a fatal error on Sphinx. I sent today
   two patches fixing it:

   2.1 Don't stop Documentation/sphinx/kerneldoc.py if a crash
       happens:

	https://lore.kernel.org/linux-doc/064bac2f462c13f56154891d8f3fb788db94f325.1747730982.git.mchehab+huawei@kernel.org/

   2.2 Don't crash trying to retrieve kernel-doc messages from
       a file that doesn't exist. This is patch 1/2 on this
       series:
	https://lore.kernel.org/lkml/d97e86c7176f671405b4c15d75cb951349022a23.1747730982.git.mchehab+huawei@kernel.org/

> So, please, now that you are producing more warnings, make a missing
> file just a warning (or at least continue on).  I have enough to do
> every day without having to run "make htmldocs" more than once.

OK. As I said, the crash was unintended. The idea was to preserve
the old behavior as much as possible. Yet, it could probably be a
good idea to have a way in the future to control the docs behavior
for the cases where non-existing files are detected, allowing it to
stop quickly on such cases, instead of taking several minutes to
generate an html ouptut, as this could be useful for CI automation.

In order to simplify for Jon, I'll send those tree altogether(*).

(*) I'll add a 4th patch, adding scripts/lib/kdoc to linux-doc
content. Without that, Lore doesn't store kernel-doc changes as
part of docs. See: 
	https://lore.kernel.org/linux-doc/d97e86c7176f671405b4c15d75cb951349022a23.1747730982.git.mchehab+huawei@kernel.org/

Regards,
Mauro

