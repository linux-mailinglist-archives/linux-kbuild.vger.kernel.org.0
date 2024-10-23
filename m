Return-Path: <linux-kbuild+bounces-4273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834A9AD118
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED8132834FB
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 16:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2497C1CCB3A;
	Wed, 23 Oct 2024 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEYQtEHi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07201CC8AC;
	Wed, 23 Oct 2024 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729701356; cv=none; b=tPLXQHuzjAWG4b1WKjQ291w0VeG5p9wnfplLnHNwgKnZb2aSj//XjCrynFoTTSVAApNh/frvwgZ8MpczW7JnPzS+QJsl3Y/clvvhvOloI+CVxsideILOBBWe4Xyj/eoStk/SR5vvY6WiJquMJgMkzndQ9RcCApshcNTsCXWJg74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729701356; c=relaxed/simple;
	bh=61nkL2C+ow+E8+Boatl+Xw80BRmS0nwl/WaD14/w0Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUnATkZeQdU2NFJb5Dy8dsICUMSTocp09YxXdGzwhQEr0qDw6SkwQxNuZhO8R4CklYH8ZfvEmxTN/C7ZoldSnDWTjH0LSBDI88LcPKnCd783FdeQHIHOeiaHebqG7d99K/TsqnZw4cpNee0t6uNBvvAiadPG8LL1ozBSl5GBG5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEYQtEHi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD82C4CEE8;
	Wed, 23 Oct 2024 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729701355;
	bh=61nkL2C+ow+E8+Boatl+Xw80BRmS0nwl/WaD14/w0Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LEYQtEHi1EWI19ko67O+0PU8zE/qAT/gJ9cHaqpK9/e3SiXj/uunELGuLjk1HOJSW
	 fikUcIvBKW5JcdUht1RV4pn2HHP3/kjG/6UKMoIAmwAYB2/0Bawqn9+ta3uk8rRokd
	 K7ELEghKHxcO3uj2Vv4uQS57mrDQf/B/zvKsSW6fc3MZmT2wRsaA1Rf68QUrFElX+8
	 Pec4XLGIsbLIKsJKRGLvxJJytHyBTkyN37AK9Ryxb+2I1HIfKB8iS3tODXegExhSvH
	 15C2jq2G29MHx042l8avzXsksKBKKj2sjH0JPphmqb43JXqZws4o+3LSdpOhSi1wV2
	 Mz4lZeo9eHteA==
Date: Wed, 23 Oct 2024 09:35:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Koakuma <koachan@protonmail.com>, Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de,
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
Message-ID: <20241023163552.GA4081497@thelio-3990X>
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com>
 <20241021201657.GA898643@thelio-3990X>
 <CAK7LNASTkUTK8JZCzySNh3BVKxauusVKRhjnchy6iZz4qLbq8w@mail.gmail.com>
 <20241022200732.GA487584@thelio-3990X>
 <CAK7LNARSHhKr=4jrAFUrnVwU6Yw3reybku3CEVxDnSKqBptRVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNARSHhKr=4jrAFUrnVwU6Yw3reybku3CEVxDnSKqBptRVQ@mail.gmail.com>

On Wed, Oct 23, 2024 at 12:29:26PM +0900, Masahiro Yamada wrote:
> With running this command in Ubuntu 24.10, I got improvements,
> but I still got another build error.  (unknown argument: '-mv8plus')

> clang: error: unknown argument: '-mv8plus'
> make[5]: *** [scripts/Makefile.build:229:

> masahiro@3606c94ac88c:~/workspace/linux-kbuild$ clang --version
> Ubuntu clang version 19.1.1 (1ubuntu1)

> Is this version too old, or am I missing something?

Yes, that is the issue resolved by the pull request that Koakuma
mentioned in the changelog:

https://github.com/llvm/llvm-project/pull/98713
https://github.com/llvm/llvm-project/commit/6c270a8b9f1e1b80a6016aafb438db7dd89bcb99

which depends on some codegen changes too:

https://github.com/llvm/llvm-project/commit/aca971d336d9c7650120fc0fd6dfe58866408216

Those patches missed the LLVM 19 branch point by a couple of weeks:

https://github.com/llvm/llvm-project/commit/8f701b5df0adb3a2960d78ca2ad9cf53f39ba2fe

They are relatively simple, so maybe we would have a chance of
convincing the stable maintainer of LLVM to take them for a later 19.1
release but given how little usage this is likely to see until the full
LLVM stack is further developed, I am not sure that petition would be
worth it.

Cheers,
Nathan

