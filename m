Return-Path: <linux-kbuild+bounces-6559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AEA831D2
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 22:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85D7D16B704
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 20:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BB7202F6D;
	Wed,  9 Apr 2025 20:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFWm9V9/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312512CDAE;
	Wed,  9 Apr 2025 20:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230124; cv=none; b=eTTANAAVcyIV05X+qckcJKq1xd3Z2dFeCO+vaaMWqzFn0J6YfqImlXPzgHjvtkIPOKkJvyMwlx9JhKxAWNPuXsR3la9+SEnKoOkus1VlHuI5CoEtbHcanGnIDRKcdoJf75WSxEIQh9C5iKzd2Fltu+YaZnwZbehPrNzCtpV+7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230124; c=relaxed/simple;
	bh=MMRz+vb2BOjUdmlOeFEN6bQcotKDYU5qJMLFpB9ja5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j640I2JBTVlrmZiJFD+Adce5QdTg+/+FF16BgH+1BY1srI+MyGRM2hIHfPzNB6k4lS44XLFCgO4S/ODkSDuGaMfnIvP7DkDtu7vq38RMKX9dqffa6iHx9W5v33giKsz5J/6zsXypYVYxn6DVFu1n13X2At7um40bWTvvzJJwhqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFWm9V9/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4306FC4CEE2;
	Wed,  9 Apr 2025 20:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230123;
	bh=MMRz+vb2BOjUdmlOeFEN6bQcotKDYU5qJMLFpB9ja5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFWm9V9/vljEHrS7yFn71GZuBhNtsIXQ7+61FViNslTyatO8/0Z/PYGhsEHXovUeB
	 gzcX7FVGJcRsZHh0vkr/fMylokgBA4WvVxLNfemgVJZKsNXx3clbhKwjEukBPKTvCM
	 NI9Fm+6Z+HO2VvQfolN5BpO1S+cc+sx38gQ095iRAtRTQeIzgn9FkPE4Ksj9pc/reS
	 egS1kF9BVqxdry7cc+Yr2E8bhe24S3lXFmFurRS/DPk6CIFW2iPIVe9bUINzEnmrzZ
	 LhRzysJnA0DtFDgfCOMHh1IngaNELcKaTOuSQ1O4MERJl8YWSW5jvBOBvmBnjUCnGf
	 fpZiRJcaDTGkA==
Date: Wed, 9 Apr 2025 13:21:58 -0700
From: Kees Cook <kees@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] gcc-plugins: Remove SANCOV plugin
Message-ID: <202504091321.2B7E95FE@keescook>
References: <20250409160251.work.914-kees@kernel.org>
 <32bb421a-1a9e-40eb-9318-d8ca1a0f407f@app.fastmail.com>
 <202504090919.6DE21CFA7A@keescook>
 <6f7e3436-8ae8-473d-be64-c962366ca5c8@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f7e3436-8ae8-473d-be64-c962366ca5c8@app.fastmail.com>

On Wed, Apr 09, 2025 at 09:28:22PM +0200, Arnd Bergmann wrote:
> On Wed, Apr 9, 2025, at 18:19, Kees Cook wrote:
> > On Wed, Apr 09, 2025 at 06:16:58PM +0200, Arnd Bergmann wrote:
> >> On Wed, Apr 9, 2025, at 18:02, Kees Cook wrote:
> >> 
> >> >  config KCOV
> >> >  	bool "Code coverage for fuzzing"
> >> >  	depends on ARCH_HAS_KCOV
> >> > -	depends on CC_HAS_SANCOV_TRACE_PC || GCC_PLUGINS
> >> > +	depends on CC_HAS_SANCOV_TRACE_PC
> >> 
> >> So this dependency would also disappear. I think either way is fine.
> >> 
> >> The rest of the patch is again identical to my version.
> >
> > Ah! How about you keep the patch as part of your gcc-8.1 clean up, then?
> > That seems more clear, etc.
> 
> Sure, I can probably keep that all in a branch of the asm-generic
> tree, or alternatively send it through the kbuild tree.
> 
> Shall I include the patch to remove the structleak plugin as well?

No, structleak needs to stay for now.

-- 
Kees Cook

