Return-Path: <linux-kbuild+bounces-6852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA64AA6858
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 03:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5625A5CFE
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 01:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A9433987;
	Fri,  2 May 2025 01:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOA5IYgV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99EDC8DC;
	Fri,  2 May 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149098; cv=none; b=pIhUlzOlqymN2cDSRSWa846jDEuhUoO++UPuyRpMOXaK0MOO6qp0TLSXjix6K6AXSiexXJS2XHOyOLzzXDhVsE0nzTFHrmIqFs85I/lx7e+LDjmyfs+WQbnvxbL3wavdGBaokFHc9TLBj/dY2Az6Dz0Eml4kWkb+iUxb2gHR/pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149098; c=relaxed/simple;
	bh=af7HpQ3v0hPoGlXDCTIrLUkdmd3jd6lgFoK/XGJ1cFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRAh9W6flrXwqXRhdsdK1MoJkfrYd5QT9g05KN49q0yeadbpw9PQ1v9lyR+xBV4ihWedgPXMyOQX0OHpHX9zPoN9z0XEDLrb91gG1XHzqrwqXgP0ONzqS/do/YyvfbYT+xRuhU4flGM5RNmu5Af14m+MUdaz/b3GXbg3WJyy1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOA5IYgV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C14C4CEE3;
	Fri,  2 May 2025 01:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746149095;
	bh=af7HpQ3v0hPoGlXDCTIrLUkdmd3jd6lgFoK/XGJ1cFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOA5IYgVSCHIwwDgrz52mGuA7Y+xbenqnZVL7DZxOwLwD+hCrYPnhXNeRxyM3a/X/
	 KUz3NKnbR1e8/36/H/E632jPbzESpm2egxlzjL2ZABuLaKeEMQicsTp1G0BNOVCrVJ
	 8mKIr87E9PrppWV0447NPoJqZyZ9Px0ZkuPe2aHvE9NrimxbtQWrDwin2TLUNrfQLG
	 gjR0HZ2YZGWwfzltOiID65eYnMWgD4YYYt5In9LzM1AISG/vjVmfyKcwIMazzE/i+Y
	 3bu42B0hn99buqPQhcVgnlqzOvO4tevzdBK6RdwnLcnQtwI3NFd6JJN4vEZRrfBAiy
	 0aWIG6+a63BYw==
Date: Thu, 1 May 2025 18:24:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Marcus Seyfarth <m.seyfarth@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 2/2] include/linux/typecheck.h: Zero initialize dummy
 variables
Message-ID: <20250502012449.GA1744689@ax162>
References: <20250501-default-const-init-clang-v1-0-3d2c6c185dbb@kernel.org>
 <20250501-default-const-init-clang-v1-2-3d2c6c185dbb@kernel.org>
 <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whL8rmneKbrXpccouEN1LYDtEX3L6xTr20rkn7O_XT4uw@mail.gmail.com>

On Thu, May 01, 2025 at 04:28:25PM -0700, Linus Torvalds wrote:
> On Thu, 1 May 2025 at 16:00, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > +({     type __dummy = {}; \
> > +       typeof(x) __dummy2 = {}; \
> 
> I'm actually surprised that this doesn't cause warnings in itself.
> 
> The types in question are not necessarily compound types, and can be
> simple types like 'int'.
> 
> The fact that you can write
> 
>        int x = {};
> 
> without the compiler screaming bloody murder about that insanity blows
> my mind, but it does seem to be valid C (*).

I thought the same thing but I tend to trust people who are smarter than
I am :)

> How long has that been valid? Because this is certainly new to the
> kernel, and sparse does complain about this initializer.

As you noted, brace initialization for scalars appears to always be
valid (at least in my testing) but as Al points out, empty braces for
scalars is only supported in GCC 13+ and Clang 17+ (I think [1] was the
clang commit), so that is not going to fly...

> So honestly, this will just cause endless sparse warnings instead. I
> think disabling this warning for now is likely the right thing to do.

but '= {0}' appears to work: https://godbolt.org/z/x7eae5vex

If using that instead upsets sparse still, then I can just abandon this
change and update the other patch to disable -Wdefault-const-init-unsafe
altogether (rather than just the field variant) but it seems like you
were not entirely opposed to this even in spite of sparse not supporting
it. If that does work, I will send a v2 tomorrow.

[1]: https://github.com/llvm/llvm-project/commit/5d8aaad4452f60ba8902e921d9bed606713a8f26

Cheers,
Nathan

