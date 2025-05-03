Return-Path: <linux-kbuild+bounces-6914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EF7AA81DC
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 19:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 121644602DC
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 17:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CE1221FB4;
	Sat,  3 May 2025 17:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roGI5vk0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E6849C;
	Sat,  3 May 2025 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746293835; cv=none; b=ll1lMdGm6Fv0q0U5wEGX2Gf8ViCtGo6slgPg8f0DNV3ULJTJs2ef77/0grJnIPuCeclpzwI8Tv1yDjbNP8mjtn+B/DWJRLR655aWBBMci1JuzhSDETZ6Jn5jEMm5d1uz56ClipFNPr1ZAzISpbGxEeiQns+pPA+rnmZmQ7eA8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746293835; c=relaxed/simple;
	bh=y7WfEK3a16DmPLp50jYGnCuAQ573Pt+N9OZeOpG6A8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOVHVQG1wIcBqlJFy/KKDuXBBJju/SuDrOoqB2upx3WLRyegCsN009QxeRZQIjntLYa71J8Rnh/BT4q3VbGHdAXbtrDbulXaVTB4009yRRib/VTi+g6wbD5mZiNxJ2d2GtptHKkm2tiz3JusdI4ggrhpong/xfcgLzQsUlorGII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roGI5vk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F681C4CEE3;
	Sat,  3 May 2025 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746293834;
	bh=y7WfEK3a16DmPLp50jYGnCuAQ573Pt+N9OZeOpG6A8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roGI5vk0DiDOfwmApphUuD1Ln8gVL17ZzOLJgmneAflP1O6DXKh1gHZRbQm1/kQrY
	 IVSgRhSrPGEKdpI+v6gSZuWlDOIP7DRFepBw8Ddr2aTTrk3sezWp/fMpeGYqQtU0D4
	 vq9TynoZ7BF7Ij0YesGKG5Q2sUHjwhnjmzLbcVuRYMrgJg9y16ZuEwKX7dBl/e9aRE
	 SwqRyVwYjCfrR2JmeFvO0vw49V2HyWGnc3sxp6tBYeQ08YJE0PqWgF9ji1MUFF9tgA
	 l3vMzVN2pNCLUhLLraTFCEjiOf3tDhNYDIbLfrWv+KoApkd+mPw9b3PfLUWNYza6DC
	 FMmzHGLdILrhg==
Date: Sat, 3 May 2025 10:37:11 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Detect changed compiler dependencies for full
 rebuild
Message-ID: <202505031028.7022F10061@keescook>
References: <20250502224512.it.706-kees@kernel.org>
 <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQCZMmAGfPTr1kgp5cNSdnLWMU5kC_duU0WzWnwZrqt2A@mail.gmail.com>

On Sat, May 03, 2025 at 06:39:28PM +0900, Masahiro Yamada wrote:
> On Sat, May 3, 2025 at 7:54 AM Kees Cook <kees@kernel.org> wrote:
> >
> >  v2:
> >   - switch from -include to -I with a -D gated include compiler-version.h
> >  v1: https://lore.kernel.org/lkml/20250501193839.work.525-kees@kernel.org/
> 
> 
> What do you think of my patch as a prerequisite?
> https://lore.kernel.org/linux-kbuild/20250503084145.1994176-1-masahiroy@kernel.org/T/#u
> Perhaps, can you implement this series more simply?
> 
> My idea is to touch a single include/generated/global-rebuild.h
> rather than multiple files such as gcc-plugins-deps.h, integer-wrap.h, etc.
> 
> When the file is touched, the entire kernel source tree will be rebuilt.
> This may rebuild more than needed (e.g. vdso) but I do not think
> it is a big deal.

This is roughly where I started when trying to implement this, but I
didn't like the ergonomics of needing to scatter "touch" calls all over,
which was especially difficult for targets that shared a build rule but
may not all need to trigger a global rebuild. But what ultimately pushed
me away from it was when I needed to notice if a non-built source file
changed (the Clang .scl file), and I saw that I need to be dependency
driven rather than target driven. (Though perhaps there is a way to
address this with your global-rebuild.h?)

As far as doing a full rebuild, if it had been available last week, I
probably would have used it, but now given the work that Nicolas, you,
and I have put into this, we have a viable way (I think) to make this
more specific. It does end up being a waste of time/resources to rebuild
stuff that doesn't need to be (efi-stub, vdso, boot code, etc), and that
does add up when I'm iterating on something that keeps triggering a full
rebuild. We already have to do the argument filtering for targets that
don't want randstruct, etc, so why not capitalize on that and make the
rebuild avoid those files too?

So, I think the global-rebuild.h idea is a good one (though I think it
should maybe be included in compiler-version.h just to avoid yet more
compiler command line arguments), I'd really like to try to have the
specific dependency-based way to get it done.

I'll send a v3, and see what you think?

-Kees

-- 
Kees Cook

