Return-Path: <linux-kbuild+bounces-1744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA748BA459
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 May 2024 02:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F18311C2237A
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 May 2024 00:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4D44C9F;
	Fri,  3 May 2024 00:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k9/Fbnli"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912574C7C
	for <linux-kbuild@vger.kernel.org>; Fri,  3 May 2024 00:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714695020; cv=none; b=rOSWhYei3UseHkFGM7kTzLbWwcNyFczq6UZAMH1CaiY8km7A9H/lvJhtMcM7DSoL3YjoRImDrXEy4Qlp846dINGESeYO9P2ybvCVV2A1aSeBU1VTDByDR47e1fbgLl+Ug4DwSFcOtZiv5wVHkzWDKhjbKXt5URLRh0svsH0hBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714695020; c=relaxed/simple;
	bh=396tSPnsu1o8PLgTUwTVh4aL60msCw5+EXNie4fn0Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTSemLBxQWa4y30HnM7wuowsEAhyDMjPx5mfma6+U+q4K4dTOzJwGo5/ifYdRmzNsQuMes85LijD4tPNnklwLooIpDnhN96RUl0NODzYOX+1RR2IOa+xPFoSHtq801TJbQgLtBi+z7dyQdYgKf7qWWYBsAgjvZfHMAEYpZ8qaec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k9/Fbnli; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e3c3aa8938so57489345ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 02 May 2024 17:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714695019; x=1715299819; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvQ96PVcBTjB1DlDAHvZFWsvHSveciEwekt2iZelkZw=;
        b=k9/FbnliWqrl/WrS762l/Mz3AtsWA2PIQfbgk31ICqcz9tfs3FpMk2ChIY2eKxPY9k
         T2/JzPfprBcFtYxcGy25P1V/pNDDMB5Z2EPjuink3ij/KOoQ2vvwH7zc0BOYRFSh+B14
         P1nNq9YJL+BECGhnV/wEMM4J+odD0cjAmCRbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714695019; x=1715299819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvQ96PVcBTjB1DlDAHvZFWsvHSveciEwekt2iZelkZw=;
        b=vPKw+NM0rvzGOe0FxEbEU+UtnaJvI66yM18bRb+7DxwVTXVNeJmOE5g223i+BRyBKF
         FqhuEssvLlImEdClQU5QvwBOWzDvYjCIJHB8Byr8amIJEi0qCb1KZPgY5AhnKCr4I1dq
         E8UTHAIdxdesMQbI3GHFx2+aMvaRQUkKgxNcuTPBUg8hoG/37EeArcWGEwWT4nrdfGyq
         8clBjW6IezbcsH7v3BWEx9fvDx8h/i/W41yDmE7LFgUFA9KIYohMskNHtbrguJLvRbcD
         bDJSjzof957fYYz9Ldvp6Xa3VqaLcyBvyDSwGvRsPrMAmbtEaUjMPCmzhpIojSFEPEPA
         BC9w==
X-Forwarded-Encrypted: i=1; AJvYcCXUIZNokbYoRAInODoYep68rExbelpbH5skcTZeQu2WRSkJvXcCIiPDTdhIqoxW0esPump7PUcfKfLkqoAQ8nu9Mq9C7hY3oPg8YvTT
X-Gm-Message-State: AOJu0Yyaoi174oKXU62AKBjsvjLuTtlywEXPqRiUBFcrFGANx/fsC8/K
	gzXLX7017BRB0zUfpyHufjKErnMt4h8cA1neEVPBsxpPS2Fb5bZJRyS7hCtZ8w==
X-Google-Smtp-Source: AGHT+IFkLXUnyQMj2OIKX8j+BzYHRt/RqitCOGt4Mqy98jeuCfO60gH63IL3cwkWZr8dM72N35IMEw==
X-Received: by 2002:a17:902:e747:b0:1e3:e380:8724 with SMTP id p7-20020a170902e74700b001e3e3808724mr1684558plf.48.1714695018965;
        Thu, 02 May 2024 17:10:18 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a12-20020a170902b58c00b001e4881fbec8sm1942415pls.36.2024.05.02.17.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 17:10:18 -0700 (PDT)
Date: Thu, 2 May 2024 17:10:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Matt Atwood <matthew.s.atwood@intel.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>,
	Jonathan Cavitt <jonathan.cavitt@intel.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 5/5] fs: Convert struct file::f_count to refcount_long_t
Message-ID: <202405021708.267B02842@keescook>
References: <20240502222252.work.690-kees@kernel.org>
 <20240502223341.1835070-5-keescook@chromium.org>
 <20240502224250.GM2118490@ZenIV>
 <202405021548.040579B1C@keescook>
 <20240502231228.GN2118490@ZenIV>
 <202405021620.C8115568@keescook>
 <20240502234152.GP2118490@ZenIV>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502234152.GP2118490@ZenIV>

On Fri, May 03, 2024 at 12:41:52AM +0100, Al Viro wrote:
> On Thu, May 02, 2024 at 04:21:13PM -0700, Kees Cook wrote:
> > On Fri, May 03, 2024 at 12:12:28AM +0100, Al Viro wrote:
> > > On Thu, May 02, 2024 at 03:52:21PM -0700, Kees Cook wrote:
> > > 
> > > > As for semantics, what do you mean? Detecting dec-below-zero means we
> > > > catch underflow, and detected inc-from-zero means we catch resurrection
> > > > attempts. In both cases we avoid double-free, but we have already lost
> > > > to a potential dangling reference to a freed struct file. But just
> > > > letting f_count go bad seems dangerous.
> > > 
> > > Detected inc-from-zero can also mean an RCU lookup detecting a descriptor
> > > in the middle of getting closed.  And it's more subtle than that, actually,
> > > thanks to SLAB_TYPESAFE_BY_RCU for struct file.
> > 
> > But isn't that already handled by __get_file_rcu()? i.e. shouldn't it be
> > impossible for a simple get_file() to ever see a 0 f_count under normal
> > conditions?
> 
> For get_file() it is impossible.  The comment about semantics had been
> about the sane ways to recover if such crap gets detected.
> 
> __get_file_rcu() is a separate story - consider the comment in there: 
> 	* atomic_long_inc_not_zero() above provided a full memory
> 	* barrier when we acquired a reference.
>          *
>          * This is paired with the write barrier from assigning to the
>          * __rcu protected file pointer so that if that pointer still
>          * matches the current file, we know we have successfully
>          * acquired a reference to the right file.
> 
> and IIRC, refcount_t is weaker wrt barriers.

I think that was also fixed for refcount_t. I'll need to go dig out the
commit...

But anyway, there needs to be a general "oops I hit 0"-aware form of
get_file(), and it seems like it should just be get_file() itself...

-- 
Kees Cook

