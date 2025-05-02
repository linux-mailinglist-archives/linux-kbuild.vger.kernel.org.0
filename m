Return-Path: <linux-kbuild+bounces-6856-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 385BEAA68D1
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 04:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4DF45A5B63
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 02:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B5384A2B;
	Fri,  2 May 2025 02:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvxly764"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3F34689;
	Fri,  2 May 2025 02:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746153413; cv=none; b=qaHR44GznOaQzubA7LEf18JDw0veYavzvLr2p80DGAb5H8hAnmhjwgaNKtmXHwTS5SSBXRA6vqQjAmcBGp/MokXTnf9Lm6jo3PW1e2baTQjaNVYzocUBxqov/sLLwBB40z+AYw9MnNsU6sbQS9Agh18VBjoUgTqSTQMcJTdayNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746153413; c=relaxed/simple;
	bh=kGjqdNL6uWTxYXfoihhELmFCGnZqUTkDeX57TXY79HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usFmv94pQ/P80ogU19Nim2IKSmFbtCJ6UvVnoP2uee8Zhv80vh5g0edYuMIWJW9FYHyvFoenCdT75simxZMbWL7eSy+W3CUK3NgHUnEmOLQRPudh50N6YowhB6+y2hdsMZnb5BOE9ipSADlnqyHgb0pBjEOVtvL4L1wRSrc5MMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvxly764; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDF0C4CEE3;
	Fri,  2 May 2025 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746153413;
	bh=kGjqdNL6uWTxYXfoihhELmFCGnZqUTkDeX57TXY79HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gvxly764wJbgzP9snvgCvOl2pbOzHoX4FAL21k1/SmWVDnmwm7Muxgc2uMhdtoYBI
	 er2RlDHi8pKyojvj0RFjRrlPAt1EwEpMcmpzdGWy6dOeb/kALWD9dsGkJWmcH2C7xw
	 RL4wTkqSvJz1M/p2zACHb3aBMMM2LvTTbK/PeIRaSmmU5CKU0IJSL8RSRrn2SaP+n9
	 KC6ZKmzwztSvOW6lwDpOeqJAJbtFo1lHL5LVUm9K8mRN53cCRdzBnjrtBUNpty6shX
	 0qtm/durPsaBGrDJA1EmDApizIxI/xpw6QfFi6eVIu2mEEvJK2NZDSFIG+LmC2UuoF
	 X1vIvfnnfZmOg==
Date: Thu, 1 May 2025 19:36:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Marcus Seyfarth <m.seyfarth@gmail.com>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy
 variables
Message-ID: <20250502023647.GC1744689@ax162>
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
 <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
 <20250502012449.GA1744689@ax162>
 <20250502020534.GU2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502020534.GU2023217@ZenIV>

On Fri, May 02, 2025 at 03:05:34AM +0100, Al Viro wrote:
> On Thu, May 01, 2025 at 06:24:49PM -0700, Nathan Chancellor wrote:
> 
> > > How long has that been valid? Because this is certainly new to the
> > > kernel, and sparse does complain about this initializer.
> > 
> > As you noted, brace initialization for scalars appears to always be
> > valid (at least in my testing) but as Al points out, empty braces for
> > scalars is only supported in GCC 13+ and Clang 17+ (I think [1] was the
> > clang commit), so that is not going to fly...
> 
> From some digging around it looks like
> 	* {} for compounds had been an extension for quite a while
> 	* C++11 got it into standard, with semantics defined as "same
> value you get for static-duration variables of that type without an
> explicit initializer".  For scalar types as well, with the same
> semantics.
> 	* On C side that happened (again, with scalar types allowed)
> in 2022; N2912 is the first draft with that change already merged,
> N2913 is the corresponding editor's report, saying that change in question
> (N2900) got merged in January/February virtual meeting.
> 	IOW, C23 has it, no previous versions do.  For C17 this syntax
> is an error, and AFAICS you need at least -std=c2x or -std=gnu2x to have
> it acceptable.

Neat, thanks for digging around.

> We can make sparse accept it (either unconditionally or with sufficient
> -std in arguments), but that won't do a damn thing for cc(1).  Does
> clang (any version) really accept it with -std=gnu11?

Yes, it appears that both GCC and clang accept it even with -std=gnu89:
https://godbolt.org/z/GYKrKhTdf

The clang commit mentions that this is exposed to older C modes like the
GNU extension was.

I guess another option to locally silence the warning would be to insert
something like

  #if defined(__clang__) && __clang_major__ >= 21
  #define typecheck_init = {}
  #else
  #define typecheck_init
  #endif

  #define typecheck(type,x) \
  ({    type __dummy typecheck_init; \
        typeof(x) __dummy2 typecheck_init; \
        (void)(&__dummy == &__dummy2); \
        1; \
  })

but maybe that is just too ugly or worthless.

Cheers,
Nathan

