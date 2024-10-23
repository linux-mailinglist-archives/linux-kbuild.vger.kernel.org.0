Return-Path: <linux-kbuild+bounces-4269-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A00D9ACF00
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 17:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 195DB1F22168
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 15:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088CF1CACEF;
	Wed, 23 Oct 2024 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="sAPYhX9i";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="DKkM0ch8";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="gEcH7T0T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i55.smtp2go.com (e2i55.smtp2go.com [103.2.140.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9411C9EB0
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2024 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.140.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697948; cv=none; b=RZH/tHKVDB9uN9bTUcj/pPlZYJGJxKvGddVTVZWJbxjEvg7X/1SXykeNltmqq5+RJeaPgso2LRnKlkhzC4CF+aSoU5rKs8slIJrRKSBXXqDBQaJl+X/dXPDL9lUclYWPvYUOLCD7Owl5nAX8xAycv7xjoVthmKILWIU/PytxpkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697948; c=relaxed/simple;
	bh=TArXztQb+MkM8RiEqijx7IT5RomzWnTWUWB7pS0l0KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFVx43wWGDqmtHrut9G5+dcT8KJ2WSBrCYJcYiJ0EhfoAugthk943tgSe5NyQ4cNqMbrXXOtK0TicpK/NqKuvJ1TzeZXiezk1r3d6vmYNoVA4eg/OUGOki8M9+eKXkdcccju+hIDSqm1xIXnr6qaHel1BooNE0XDLtS1Hr2dD4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=sAPYhX9i reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=DKkM0ch8; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=gEcH7T0T; arc=none smtp.client-ip=103.2.140.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1729698842; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=PGordEIR45jrNlNrTNYlWgRJv5GwdV7ZsRzwl31sT1s=; b=sAPYhX9iJHfF7Cc4BWf0UCUB2u
	qEgScQbO4TtZn6RqfmcoanqWxCE9M2GSg/BKBOYTxiJ9S2FNH+NNACi8wjfNUrtCBUqJD8m7OvdNK
	ovKAniRMb/25xui44cYEPa46kDuIrJ/HL7NJNUZcvrT52JowQpMJUZNgWJV8/6HOWqWSpNG6kdkfR
	r+1Bkoy9F/QYT1lBWnw3H1wW1Zn50Ag+mLCE4K6KfvwEGAwj1WMjse8+hk6/Aeo9pCkcyO5rq4pBW
	ZJ9hY8x1NZPM5Ly34VSQmpNdI6SVflkSpslsmFpAfM2hOs07ZFzWmOx/VofMTxrMw8fFT5orx1Xvn
	fHdiRYcw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1729697942; h=from : subject :
 to : message-id : date;
 bh=PGordEIR45jrNlNrTNYlWgRJv5GwdV7ZsRzwl31sT1s=;
 b=DKkM0ch8sz4A7MQhsYsq/fUkJdG4J1BHksdqldG9YwQeng+tKul6UwoNy1pr7tExtJFS9
 3mUCU7bPBOfLP8qBKk+RYKML8Y7PRv6tgca8D+3JIAdE0hOEEXB2I/CjvRy+qjwyv9LFoen
 tTNnrf1WFy8w79vOEh/w1l/H2SSYSkLdLT/cxQprIQWOT/ilwFHJ7HMPu1CZq2iSGeYr8ul
 6A1qDhEk2w+FTaaUDKRnzGyihRjvqFF5DV5h7aJihWz6/RRtereXutwble3NHh9hBS5zYzP
 vWSe/MyEisDcrwLwfNBq/oQvyhy14J7gEI7IidjvMy3uvPgD4C93D9Rmxbiw==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t3dR5-cp4XYB-N4; Wed, 23 Oct 2024 15:38:12 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t3dR4-4o5NDgrnm55-q8BV; Wed, 23 Oct 2024 15:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1729697888; bh=TArXztQb+MkM8RiEqijx7IT5RomzWnTWUWB7pS0l0KU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gEcH7T0TYi7Qysti88+ZUXIfIOMyb9BHFoq5nSXCUOKYI0uVGFhK2z48N8Pfy31W9
 QhIE/JrdSelmEz4hXq5mbBUvIziHeAzoKiXB8GqSEMdlKSW85YZnX17oZXxwHciQqY
 JCXEsIrtvGdCMGRG1Yq/uEn3ModBzfiSSV294JxQ=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 2EC8C3D2A2; Wed, 23 Oct 2024 17:38:08 +0200 (CEST)
Date: Wed, 23 Oct 2024 17:38:08 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <benh@debian.org>,
 Ron Economos <re@w6rz.net>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] kbuild: deb-pkg: add
 pkg.linux-upstream.nokernelheaders build profile
Message-ID: <ZxkYYLbiXZ3p59iu@fjasle.eu>
References: <20241022181703.1710116-1-masahiroy@kernel.org>
 <20241022181703.1710116-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022181703.1710116-2-masahiroy@kernel.org>
X-Smtpcorp-Track: CUGQAJ8WMfc5.1korG4rogHqO.9jBznQ9T09n
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sX19qKHJLT
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Wed, Oct 23, 2024 at 03:16:58AM +0900 Masahiro Yamada wrote:
> Since commit f1d87664b82a ("kbuild: cross-compile linux-headers package
> when possible"), 'make bindeb-pkg' may attempt to cross-compile the
> linux-headers package, but it fails under certain circumstances.
> 
> For example, when CONFIG_MODULE_SIG_FORMAT is enabled on Debian, the
> following command fails:
> 
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
>       [ snip ]
>   Rebuilding host programs with aarch64-linux-gnu-gcc...
>     HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/kallsyms
>     HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/sorttable
>     HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/asn1_compiler
>     HOSTCC  debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/sign-file
>   In file included from /usr/include/openssl/opensslv.h:109,
>                    from debian/linux-headers-6.12.0-rc4/usr/src/linux-headers-6.12.0-rc4/scripts/sign-file.c:25:
>   /usr/include/openssl/macros.h:14:10: fatal error: openssl/opensslconf.h: No such file or directory
>      14 | #include <openssl/opensslconf.h>
>         |          ^~~~~~~~~~~~~~~~~~~~~~~
>   compilation terminated.
> 
> This commit adds a new profile, pkg.linux-upstream.nokernelheaders, to
> guard the linux-headers package.
> 
> There are two options to fix the above issue.
> 
> [option 1] Set the pkg.linux-upstream.nokernelheaders build profile
> 
>   $ DEB_BUILD_PROFILES=pkg.linux-upstream.nokernelheaders \
>     make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bindeb-pkg
> 
> This skips the building of the linux-headers package.
> 
> [option 2] Install the necessary build dependencies
> 
> If you want to cross-compile the linux-headers package, you need to
> install additional packages. This is a one-time installation step.
> 
> For example, on Debian, the packages necessary for cross-compiling it
> to arm64 can be installed with the following commands:
> 
>   # dpkg --add-architecture arm64
>   # apt update
>   # apt install gcc-aarch64-linux-gnu libssl-dev:arm64
> 
> Fixes: f1d87664b82a ("kbuild: cross-compile linux-headers package when possible")
> Reported-by: Ron Economos <re@w6rz.net>
> Closes: https://lore.kernel.org/all/b3d4f49e-7ddb-29ba-0967-689232329b53@w6rz.net/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/package/builddeb             | 2 +-
>  scripts/package/install-extmod-build | 6 ++----
>  scripts/package/mkdebian             | 9 ++++++++-
>  3 files changed, 11 insertions(+), 6 deletions(-)

Nice solution and thanks for also documenting option 2.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

