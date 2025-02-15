Return-Path: <linux-kbuild+bounces-5756-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E255A36BF7
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 05:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 579B63A78F1
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Feb 2025 04:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253711624D9;
	Sat, 15 Feb 2025 04:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf639F+A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5E1156F39;
	Sat, 15 Feb 2025 04:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739592923; cv=none; b=Vz9W7eAxBs+3StpEV4Uk1Sw78XKEqxz/1Rtu9oWelRQJxtLlqhI+X69fGugyTF3ucuQ4e4JcbyNqFvF1ISA/J6dWRbiK+GdcrbRo/QpAhAkS5LseX4MRSp04WCW17o2qKmuhYOyyXpeTjedUZ/E/lNgZyTJLY5aA8ZZQUx2JPZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739592923; c=relaxed/simple;
	bh=e1gaUV3FYLUO6BIeTFTNkohw5dKtYwMx99wkGdyY0nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl7HXggRrd6E9P+OE8tYFpQt7eIMsdwtt7qgF6ESJnPm81GEYQQK1+UmuiXYtFO+zAVWcfdXQQN6UgpwlFtyT7N9E5Di3dI/wolSUOpMZj7oM+Nu79kahRLi3K4hp7TtpHKdgbrgnttAZmiBBTOOdtKHuCj8qLTRJcIeoD+B4uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf639F+A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 259FBC4CEE4;
	Sat, 15 Feb 2025 04:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739592922;
	bh=e1gaUV3FYLUO6BIeTFTNkohw5dKtYwMx99wkGdyY0nU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uf639F+AirtZYCPWDY5P0SggLOZopBOT1ROf+624WWDnFA56Fu7noZ8WR7ASuaQqp
	 vwbXekOyT/HmeLEnW9mtmYxJOUqCIphbkr9f0yPkChUBrhguptmYjYwANA08mX1LqT
	 JbB1vHPx9WW7yeERNGEfZpiEluy+lT7Q7eeh/jxZuF+xtmUK90L/ur9Nxmlbb69mSu
	 CdiwkrJiWoCQ/x1FHy3+VvTXw67p98WjOgaLRzPibo58z321BOEDb+EfmV3QqrQWxG
	 ChkTFnMGX2JSgHDxLHo2C3pECmVtH5/LZnloUT6nu+6GthggzAf7okY27ZuMJKbA5D
	 LiHAKnp+xfTjQ==
Date: Fri, 14 Feb 2025 21:15:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: userprogs: use lld to link through clang
Message-ID: <20250215041517.GA2645277@ax162>
References: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
 <20250213-kbuild-userprog-fixes-v1-2-f255fb477d98@linutronix.de>
 <20250213175437.GA2756218@ax162>
 <20250214081034-a5fd06c6-9cb5-4efc-ad2b-69e6acfb08bd@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214081034-a5fd06c6-9cb5-4efc-ad2b-69e6acfb08bd@linutronix.de>

On Fri, Feb 14, 2025 at 08:40:22AM +0100, Thomas Weißschuh wrote:
> FYI, in case you want to have a look:
> The kunit config for powerpc is currently broken on LLVM=1.
> 
> $ ./tools/testing/kunit/kunit.py run --arch powerpc --make_options LLVM=1
> 
> arch/powerpc/boot/wrapper manually inspects with CROSS_COMPILE, which does not
> exist when LLVM=1. Instead it falls back to the system objcopy, etc.

Thanks for reminding me, it is a known papercut:

https://github.com/ClangBuiltLinux/linux/issues/1601

I have a WIP series but there are still some errors in the
configurations that I test that I have not investigated.

https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git/log/?h=b4/ppc-boot-llvm-1

Cheers,
Nathan

