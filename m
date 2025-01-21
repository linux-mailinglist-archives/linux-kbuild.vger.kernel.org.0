Return-Path: <linux-kbuild+bounces-5526-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A4A18782
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 22:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0206E188B73B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2025 21:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126B81F791C;
	Tue, 21 Jan 2025 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qo1EOUYl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9901B85C5;
	Tue, 21 Jan 2025 21:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737496415; cv=none; b=kYp0YvAV5jhaa4UQHYg2jJP9juUmIkV4A6i3q8ZFw82CzRxgoiYI/cM6URp9+px2FOYPv0AgUXv65tuBlVmKM8lsqW2E72brrZvQRYYr4/xArjJSDbj30uyiqsDQ+rtOZKSuPeHBTmw2INSPuHBzlWiawe8q+UYi6GWtmR4IJDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737496415; c=relaxed/simple;
	bh=wO7nlXrdgq8dnKW/0q0WLq1jr4AlyakzwXqV5l0s+Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HklXu/alMa0Jv49DOc/behGSR88/ZHYf6xVbEi0SZvRS+4AQbJLBzCMMbmLEVcSDO/xYWlVTvyr2kwV+DXVgd7IiGYo+g66jOm4dnCLS/wIBoyhudEXdBHMnYmSem6KnEg35+F3MniVws/ji2TeXLWJAVTgM/kCBglKm0DAOekw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qo1EOUYl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8A2C4CEDF;
	Tue, 21 Jan 2025 21:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737496414;
	bh=wO7nlXrdgq8dnKW/0q0WLq1jr4AlyakzwXqV5l0s+Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qo1EOUYlk5sa5YJi7F6JVGMEN1SYwQYMfG+YpHn2FYbH5DpxPf3lQPKtDnn1LmVPi
	 R/0igYfkWTg/4Q05I1YIwOznHf58lT6kPpTBJIZ3qdIOLiOumgJc1x/OnDwtGawRUw
	 bLWPD3Q4pTdNshCLpxzk5Z9eWDtXePew4bdZ8QoORmbsIHD6ucybyry7YWil1Lqwg/
	 MrM54xgssK/PhZYUvRCcrnVi7WDjruO0t3ABcZagzUHrTsyP50XdZL2mWaU6txtZi5
	 kxUjB4/2bgORaspes24qCie4KF/aJOYRCaDHhbw9EoIm7eqJNBAduwhoKXcrGuToPt
	 xe/TOKwd84/gA==
Date: Tue, 21 Jan 2025 14:53:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Sam James <sam@gentoo.org>,
	Kostadin Shishmanov <kostadinshishmanov@protonmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	arnd@arndb.de, linux-kbuild@vger.kernel.org
Subject: Re: Build failure with GCC 15 (-std=gnu23)
Message-ID: <20250121215330.GB1517789@ax162>
References: <4OAhbllK7x4QJGpZjkYjtBYNLd_2whHx9oFiuZcGwtVR4hIzvduultkgfAIRZI3vQpZylu7Gl929HaYFRGeMEalWCpeMzCIIhLxxRhq4U-Y=@protonmail.com>
 <20241118205629.GA15698@thelio-3990X>
 <8734joj5gn.fsf@gentoo.org>
 <20241119041550.GA573925@thelio-3990X>
 <87r077j1fa.fsf@gentoo.org>
 <20241119044724.GA2246422@thelio-3990X>
 <CAK7LNAS6DZkbf6AM7kthPuUE_=ZPaaBPoP0UtvuF=6ijrzUPgQ@mail.gmail.com>
 <202501201615.F606516@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501201615.F606516@keescook>

On Mon, Jan 20, 2025 at 04:16:30PM -0800, Kees Cook wrote:
> On Wed, Nov 20, 2024 at 03:28:35AM +0900, Masahiro Yamada wrote:
> > Some Makefile overriding KBUILD_CFLAGS would forget to add
> > $(CSTD_FLAG), for the same reason as they would forget to add
> > -std=gnu11.
> 
> But at least we'd have 1 place to change when we changed the std level.
> 
> FWIW, I just ran into this build failure too testing GCC 15 from their
> ToT. Both EFI and compressed Makefiles needed it in my build.

Yeah, I suggested the simpler diff in a separate thread, which seems to
agree with your testing:

https://lore.kernel.org/20250120182048.GA3244701@ax162/

I don't mind drafting up a commit message and sending those along if
that would be preferrable.

Cheers,
Nathan

