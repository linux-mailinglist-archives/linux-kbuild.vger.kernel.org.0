Return-Path: <linux-kbuild+bounces-5213-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1D99F87C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 23:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32C3C160A86
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8271C3039;
	Thu, 19 Dec 2024 22:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijGRqiUU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F41AAA29;
	Thu, 19 Dec 2024 22:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646760; cv=none; b=VUkl3TF88oy0/ehQXAm0BWoXavWcB/C3BHJSBedRaa8tAOtz9t2gcfP9CkHxWY9bwM19DfoIZyotP6/TlRbR3aBBhHtgpgGzLXu90BIzJ5jvAuEPCCXU75LigETI2JcDJgNGju8eBbzTFe9m2KSeOGXcKbIeyet7avPYR2CP1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646760; c=relaxed/simple;
	bh=ivsCR2JS+q1cc8VeLt+rOztWN+9GiuD5P1zV2IE9VoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0tiP9eDeKHoXw2oDrKMWQfLg2HsuvqOrF/gSuHUN5cEYYoRgWf8SbwYdqVD3ZqEap9mzCTiQu8WRmYMM8kcDGzx5le9ksYnGcdA3gAhxd+77nJyo1NwTV/s/xulaba1ZWqT5xZitZJrrP1dsSLM0eEe9N5E43FBoIXiXusLq0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijGRqiUU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDCAC4CECE;
	Thu, 19 Dec 2024 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734646757;
	bh=ivsCR2JS+q1cc8VeLt+rOztWN+9GiuD5P1zV2IE9VoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ijGRqiUUOlQbBVmihakFMFxU1pgw0fytk8icWvf1PmR4Zy+WoPK9cIBTR9AQxXmqr
	 /uZD2f1E2m9SYLGkIQTEBV+C4ZqXAHJfUlqTHKpFapjiSRdKic06AJxoCZ+7dgSMp/
	 CHqpu/W6npS8Dyw6dp5ocJW0bKJ68CVXjM1zHJiXwEp1Ce0nVMfDZhTOIFTSpOHWBb
	 +mlYQInEDWKUsXNjHxOU88/y5JVxLoANt7hM4/MhuI6PuNk9MEMBBcFuD618iPWQwC
	 p5gwZZDrf5uy7dPvNA2ktW9Cs3pSRmoIB8FFrsdd28Qy4L9KmP0viWT7yp3upaOV3b
	 yspexiuCf81jQ==
Date: Thu, 19 Dec 2024 15:19:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20241219221913.GA1259354@ax162>
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
 <20241219010054.pxcnejgkvy3g744k@jpoimboe>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219010054.pxcnejgkvy3g744k@jpoimboe>

Hi Josh,

On Wed, Dec 18, 2024 at 05:00:54PM -0800, Josh Poimboeuf wrote:
...
>   - obscure toolchain bugs in certain compiler versions which do weird
>     things with control flow.  some of these bugs break the kernel, some
>     don't.
> 
> Problem is, it usually falls on the objtool maintainers to figure out
> the root of the problem and the resolution, neither of which is
> necessarily straightforward, especially the latter.  There's only two of
> us maintainers at the moment, with limited bandwidth.
> 
> So yes, it *should* always fail the build.  But unless we get more
> maintainer bandwidth, I don't think we're ready for that.
> 
> We might end up being able to make CONFIG_OBJTOOL_WERROR=y the default,
> and then just require broken features to depend on
> CONFIG_OBJTOOL_WERROR=n.  And then print a big fat warning message at
> build and/or runtime in the case of warnings.
> 
> We also might need to add some features, like a way to mark certain
> compiler versions as bad, or a way to silence objtool warnings for
> certain known harmless cases, or improve the specificity and usefulness
> of certain vague warnings.
> 
> But as a first step I'll planning on just throwing these patches on a
> robot-monitored branch with CONFIG_OBJTOOL_WERROR=y over the holidays to
> see how bad the damage is.

For the record, I plan to monitor these reports for LLVM and try to
investigate and triage all other known objtool warnings for LLVM after
the holidays to try and prepare for this. I felt blind sided by the
compiler -Werror change so I'd rather not go through that again :) one
reason I would like to be objtool clean is to catch changed compiler
behavior quicker, as I tend to notice it is easier to get problems
addressed when the problem is reported as close as possible to the
original change.

I do agree with you that figuring our the root problem and resolution to
some of these warnings is not always the easiest, especially when they
are on the toolchain side, so I have often kicked the can down the road.
I know there is some documentation in objtool.txt around various
warnings, is that pretty up to date/accurate? Are there any other
resources I could look at to help with this work? I know Arnd just
recently fixed a set [1] that I saw in our builds as well due to a bare
unreachable(), which I think tend to hurt Clang more than GCC but maybe
I am imagining things there.

Some objtool reports get sent to only llvm@lists.linux.dev when clang is
involved (due to a historical filter IIRC, I cannot find the original
request), so you may want to glance at [2] to see if anything new pops
up.

[1]: https://git.kernel.org/netdev/net/c/cff865c700711ecc3824b2dfe181637f3ed23c80
[2]: https://lore.kernel.org/llvm/?q=objtool+f:lkp@intel.com

Cheers,
Nathan

