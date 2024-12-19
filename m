Return-Path: <linux-kbuild+bounces-5182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 113C39F718B
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 02:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C05188E108
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 01:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A384A1863E;
	Thu, 19 Dec 2024 01:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhuoxHlQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D2F17580;
	Thu, 19 Dec 2024 01:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734570056; cv=none; b=YFcmY0Z2Jw+/vxO2pTjn1Aj2Jht7hOtIs2r+ehzvIfo4gYh5T3g9aGnYCWq8i+T5k/UPvWgji4GwKI8WmKyu4ylEtp4hTld9oIZ6btasvgpN9GtIAbZieZ5oniPezR9grYZnQZFCu3fv8Jo4Acbv8Dbrtapr3qtT71cR2v6Y7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734570056; c=relaxed/simple;
	bh=J6oGfeC9681eWCnbxbmP5+P718HOsDJqEbnDjj0m7nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X43DAGAebToEHLlE0Ehwq3p36Yc99HqG56ehl9bTxvPCy8vPkIhfe/CmFkHiLZYuVk0pFLwSLroy9n8gR5w6w6hPKY6aTTwcu0zYa4bQY8/yoqnRbTjFcBR/EuAWGOIjkb1Y/sFdvDiGnZhbL7FGRRjFzu6YcAJoXivieAYaLqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhuoxHlQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37C3C4CECD;
	Thu, 19 Dec 2024 01:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734570056;
	bh=J6oGfeC9681eWCnbxbmP5+P718HOsDJqEbnDjj0m7nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhuoxHlQeZZbIvtobhAAEMxrF/kdY9jOobZFG+tqgjgVT5RkM1NyUV+bo68XB9Mo5
	 zBNfwiPkyRdIVQAlQm/CNC6PgDzoS40a24J1UioGWCy7H4cbYqEAi7agi4BZp+nYus
	 qHzyJqDXapOmkWqg5MRCV0RVOeIT59HH6GmxNKWejoHfKK9wyVnsJzAbcd6Jmt5D/c
	 r5/QmVpxt5924qH+jqNU1QIAHl3pKNinKcY4FxFZTs9m3iDP/QxTg4HLAzKDxIjH7G
	 2n4VW71f2FvH6HYznKyzLK2uCFcFo2A5I1lJqahVzcKx0prjfEHx8zyxLpPHUJ4nu2
	 77Qs3uSEqoF8Q==
Date: Wed, 18 Dec 2024 17:00:54 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brendan Jackman <jackmanb@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20241219010054.pxcnejgkvy3g744k@jpoimboe>
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>

On Wed, Dec 18, 2024 at 04:06:56PM -0800, Andrew Morton wrote:
> On Wed, 18 Dec 2024 14:58:54 +0000 Brendan Jackman <jackmanb@google.com> wrote:
> 
> > This adds an option to objtool to exit with an error when it enounters
> > warnings.
> 
> Why is it optional?  Can we always fail the build so stuff gets fixed?

Eventually, yes.  But right now, I'm not so sure...

it will likely break a lot of robot builds, there are some obscure
randconfigs out there triggering some "interesting" edge cases, e.g.:

  - ftrace branch profiling which is fundamentally incompatible with
    uaccess STAC/CLAC rules

  - similar weirdnesses with UBSAN/KASAN/etc and other compiler
    features/plugins

  - obscure toolchain bugs in certain compiler versions which do weird
    things with control flow.  some of these bugs break the kernel, some
    don't.

Problem is, it usually falls on the objtool maintainers to figure out
the root of the problem and the resolution, neither of which is
necessarily straightforward, especially the latter.  There's only two of
us maintainers at the moment, with limited bandwidth.

So yes, it *should* always fail the build.  But unless we get more
maintainer bandwidth, I don't think we're ready for that.

We might end up being able to make CONFIG_OBJTOOL_WERROR=y the default,
and then just require broken features to depend on
CONFIG_OBJTOOL_WERROR=n.  And then print a big fat warning message at
build and/or runtime in the case of warnings.

We also might need to add some features, like a way to mark certain
compiler versions as bad, or a way to silence objtool warnings for
certain known harmless cases, or improve the specificity and usefulness
of certain vague warnings.

But as a first step I'll planning on just throwing these patches on a
robot-monitored branch with CONFIG_OBJTOOL_WERROR=y over the holidays to
see how bad the damage is.

-- 
Josh

