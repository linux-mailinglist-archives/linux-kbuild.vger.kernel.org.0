Return-Path: <linux-kbuild+bounces-4156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BD89A14B8
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 23:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8E7286A3F
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 21:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035CF1B0F36;
	Wed, 16 Oct 2024 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7/6Prv0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FD013B298;
	Wed, 16 Oct 2024 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729113869; cv=none; b=AgJxa+ipRFXg1h5J2uweyQqY2LXr43aOZDukBk598I9sThsyHL5PZK3MwOWeWBnrI7F6L6KtOAFokVmFSXePWmrqt8B5Cp2jILofQAdni19k2wfefUZ56W/JCqk96seK5GT4C5BseIuzMQtEw5HqPMWOZpOUbJaTUJFHC0AYJUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729113869; c=relaxed/simple;
	bh=WmRyooRpNUPsrOSIwLEuGtI5tETK3P7F58Xs9VK/nqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbrZUyKlISAXdX69mhNKd8lEvtJPJr7HO4BuQfUHbXsJGEX0fZ2bWKXLEm4lCBZAHDl1Xuo0WXFEH56q/U1RTy8FQynKXynKWShL5T1vkMqF1d9YqjObNDV6ay9o0emPcFrrM0uWVsn+7Wxm/xgbmoj9EjFtZlPDfzrEeNab1FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7/6Prv0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D230C4CECD;
	Wed, 16 Oct 2024 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729113869;
	bh=WmRyooRpNUPsrOSIwLEuGtI5tETK3P7F58Xs9VK/nqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7/6Prv0V/3uEKt5DQtqrnxyPW+061zPoW9DD2m5SSMpeREYxcAQtl3ic6CvySKSN
	 e50H621ALjxb7Te6UYMKh3m6wM5StaKEuuqc8NRN/zN8Zamof45GxR2lZx6lc1OuD7
	 2waucJwnFs8bNs+Nfwzs9+WbTiSK4saf+HJRmnWkdDYfcK5zzR63me4hK3IzJmlP2K
	 CsBg0dTzFDLeEyEKVCZc889Lju7SQOZCGpIkE579Kds6XwFCXUVqiFAFTXygSjB5GS
	 bYqIUtBFrUhuynUF6pos3ukihM0+vjR1XMURbBndqor8amdckbZFcuY7QFixWHNEQI
	 +RP/ffKudQJCw==
Date: Wed, 16 Oct 2024 14:24:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Aleksei Vetrov <vvvvvv@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: Fully disable
 -Wenum-{compare-conditional,enum-conversion}
Message-ID: <20241016212427.GA695927@thelio-3990X>
References: <20241016-disable-two-clang-enum-warnings-v1-1-ae886d7a0269@kernel.org>
 <a22ab6cb-6eb6-44df-9e82-b6e95b9ae08e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a22ab6cb-6eb6-44df-9e82-b6e95b9ae08e@app.fastmail.com>

On Wed, Oct 16, 2024 at 06:31:27PM +0000, Arnd Bergmann wrote:
> On Wed, Oct 16, 2024, at 18:01, Nathan Chancellor wrote:
> > -Wenum-enum-conversion and -Wenum-compare-conditional were strengthened
> > in clang-19 to warn in C mode, which caused the kernel to move them to
> > W=1 in commit 75b5ab134bb5 ("kbuild: Move
> > -Wenum-{compare-conditional,enum-conversion} into W=1") because there
> > were numerous instances of each that would break builds with -Werror.
> > Unfortunately, this is not a full solution, as more and more developers,
> > subsystems, and distributors are building with W=1 as well, so they
> > continue to see the numerous instances of these warnings.
> >
> > Since the move to W=1, there have not been many new instances that have
> > appeared through various build reports and the ones that have appeared
> > seem to be following similar existing patterns, suggesting that most
> > instances of these warnings will not be real issues. The only
> > alternatives for silencing these warnings are adding casts (which is
> > generally seen as an ugly practice) or refactoring the enums to macro
> > defines or a unified enum (which may be undesirable because of type
> > safety in other parts of the code).
> >
> > Disable the warnings altogether so that W=1 users do not see them.
> 
> I don't think we have to go all the way of completely disabling
> the warnings here, they are still potentially useful. I can see
> three ways of being less aggressive with them:
> 
> - keep -Wno-enum-compare-conditional in W=1 and fix up the
>   remaining warnings for that, iirc the Wno-enum-enum-conversion
>   is the one that causes the problems.
> 
> - Move them to W=2 instead of always disabled
> 
> - Leave the warnings enabled for clang-18 and older.

Arnd and I talked about this offline in the ClangBuiltLinux meeting
today. I am going to run my usual test matrix against a tree with
-Wenum-compare-conditional turned on to see how many instances of these
warnings are in the tree and how difficult it would be to silence them
to address the first point above. I will move -Wenum-enum-conversion to
W=2 and send that as v2 soon to satisfy point two, which should clear up
the blockage for the Android folks.

While disabling the warnings for clang-19 and newer and leaving them on
for clang-18 and older would technically address the issue at hand, it
won't result in increased coverage because the whole point of the change
that caused this in clang-19 is enabling the warning for C code, so
clang-18 and older won't ever emit these warnings.

Cheers,
Nathan

