Return-Path: <linux-kbuild+bounces-7040-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175EDAAFFB2
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 17:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E09963A2ABA
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 15:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AB5279915;
	Thu,  8 May 2025 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efx2VuLZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F372253345;
	Thu,  8 May 2025 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746719771; cv=none; b=umSURqfOtXR/acLabm795p9L+EZAawLrSeE9nEGM3WnoHZWO/a+/39VYvg/1F5shft7g1Eez93UflSnsv+Rj5UcIT6McvOufBEQjPEjR1W0f0ynWt07cXAozOLICa1iCoVkPbNydYR77lXS8p2v1NqqtaZuQXQIPHN4xhakpYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746719771; c=relaxed/simple;
	bh=R8fdD9fVl6RxUXNhfszFi2YhYgJUMsMcmvmKFfo7eO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCbMxpMVmOgha1purwJhklbt1OmIXxaYCwKwCb6LPzIr9o8hjZLjjQXRsgzAchY0j2KdR+IxkcXk3ZKnrAn/sHGpXmajyrzEpZEmrIJMkOxFM9anc015TWikDoEhyEobml6/I4f+46z52/jln2nVDuP2NrKOFKb6mzd9QpBeqCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Efx2VuLZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E297BC4CEE7;
	Thu,  8 May 2025 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746719771;
	bh=R8fdD9fVl6RxUXNhfszFi2YhYgJUMsMcmvmKFfo7eO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Efx2VuLZYAAyMVp4ltoAba2BeKO0tyJr98h3ceIl1h13nU7z/gI3ndFDWQyss61zj
	 BC44B4WEkjweiTRy6gq6u/YIydERCC1oDgT4T55mvzhYB8iAJ8Apw41+n38GWMoamE
	 ubbh1aoM55vFQwTINJ2ZGi+rPGYeV9STqkp75HOEe7v+NBKfZ7HSjnVqipsts1ST4N
	 lLrhH+fNWSNjqsNEgrp7YxVweRBc8EWOf11lTdEaTJPtrzot3LqugqrBJK1Sd1PzK6
	 i/bBQ/fHFjrkXD+jrWKROlyk6BQZ/BhPqxErDKMtUfnudVuiQn5QQPrb4DTaz/HvJO
	 84Gh0lFBROq9Q==
Date: Thu, 8 May 2025 08:56:07 -0700
From: Kees Cook <kees@kernel.org>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/3] Detect changed compiler dependencies for full
 rebuild
Message-ID: <202505080855.DF4FB68A@keescook>
References: <20250503184001.make.594-kees@kernel.org>
 <20250507-mature-idealistic-toad-59c15f@l-nschier-aarch64>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507-mature-idealistic-toad-59c15f@l-nschier-aarch64>

On Wed, May 07, 2025 at 02:02:42PM +0200, Nicolas Schier wrote:
> On Sat, 03 May 2025, Kees Cook wrote:
> 
> >  v3: move to include/generated, add touch helper
> >  v2: https://lore.kernel.org/lkml/20250502224512.it.706-kees@kernel.org/
> >  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@kernel.org/
> > 
> > Hi,
> > 
> > This is my attempt to introduce dependencies that track the various
> > compiler behaviors that may globally change the build that aren't
> > represented by either compiler flags nor the compiler version
> > (CC_VERSION_TEXT). Namely, this is to detect when the contents of a
> > file the compiler uses changes. We have 3 such situations currently in
> > the tree:
> > 
> > - If any of the GCC plugins change, we need to rebuild everything that
> >   was built with them, as they may have changed their behavior and those
> >   behaviors may need to be synchronized across all translation units.
> >   (The most obvious of these is the randstruct GCC plugin, but is true
> >   for most of them.)
> > 
> > - If the randstruct seed itself changes (whether for GCC plugins or
> >   Clang), the entire tree needs to be rebuilt since the randomization of
> >   structures may change between compilation units if not.
> > 
> > - If the integer-wrap-ignore.scl file for Clang's integer wrapping
> >   sanitizer changes, a full rebuild is needed as the coverage for wrapping
> >   types may have changed, once again cause behavior differences between
> >   compilation units.
> 
> I am unsure if it is too much detail, but I'd like to see some of these 
> infos in include/linux/compiler-version.h, too.

Yeah, that's a good idea. No reason to make people dig for the commit
logs, etc -- it should be immediately discoverable. I've updated the
patches to include the (slight rephrased) text above.

Thanks!

-- 
Kees Cook

