Return-Path: <linux-kbuild+bounces-10694-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64553D3BA13
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 22:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B58623025F95
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 21:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116572FBDF2;
	Mon, 19 Jan 2026 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kfg6OJX0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B05C2FB630;
	Mon, 19 Jan 2026 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768858521; cv=none; b=kb6sLQiGVK4pK/11h6sDCkNsG/qdNaaRkX4wXNGp6P0tAqGfS8aXss0b2Wn0Tfy4JXJM47fRovKrVCagrJ70hsmQ/6dlz9TEryNB/b+BG7El2tun5dgVUEVqOkpVOkZruansLvtHDoTQSwch7ASwxr0aDKRG5RqCv0mR/lldkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768858521; c=relaxed/simple;
	bh=6JE8OFcylc3fxhz3KTfSs84aPeT4MbWppixwZYVyHzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSTrsHeAx8Dm0CO+jSpa8pU9+/zh+4InagFZVjVke0y77E/onb/nsq9IxSd7AQQJDG9F5jJS/zAfBx/YzKFFZ7/HdG2mXM9w/E54Ys7c6T9QEU3Be+OXLY5uXuHQMuaf5H9X2sutktSh1bPXJIZ9HyXEMQGFvFAO6m8SiKOEKAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kfg6OJX0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2011C116C6;
	Mon, 19 Jan 2026 21:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768858521;
	bh=6JE8OFcylc3fxhz3KTfSs84aPeT4MbWppixwZYVyHzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kfg6OJX0F5mQtg3eXoyjI8WPeCieLdr+SO1KwTrwCvYZmaMn8JzogSKtG6XeZBLMu
	 d19i10Gmy19+Hvld0egitdclvZrrnaKtL1Ao3hBkLUpbxPavvKl7cHaO2LKXTGfelp
	 C40zXEsoJhLHcRAw7Cn6iH7hukHXBDEhOSveY3W0DWmWBsOYj3r3FBX3m7917ZBAGt
	 LqtWKISXz2Y7kgteBj3WgZrFA3jSSzzAv54c/VDn/qJI+JtC18ZJPQCNev/0JYLIIN
	 NVzJUGSBlf2DSqtRF/myHrg56skHWcV5rDSlGjq4SraEV8QNZ9X0CFcxzUv6W9rS3m
	 kNpqvamAZbsJQ==
Date: Mon, 19 Jan 2026 14:35:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <20260119213516.GA1051134@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767199119.git.gtucker@gtucker.io>

Hi Guillaume,

On Wed, Dec 31, 2025 at 05:51:48PM +0100, Guillaume Tucker wrote:
> This proposal emerged from discussions over email and after a talk at
> Plumbers 2024:
> 
>     https://lore.kernel.org/all/affb7aff-dc9b-4263-bbd4-a7965c19ac4e@gtucker.io/
> 
> The aim is to facilitate reproducing builds for CI bots as well as
> developers using containers.  Here's an illustrative example with a
> kernel.org toolchain in a Docker image from tuxmake:
> 
>     $ scripts/container -i tuxmake/korg-clang-21 make LLVM=1 defconfig
>       HOSTCC  scripts/basic/fixdep
>       HOSTCC  scripts/kconfig/conf.o
>     [...]
>       HOSTCC  scripts/kconfig/util.o
>       HOSTLD  scripts/kconfig/conf
>     *** Default configuration is based on 'x86_64_defconfig'
>     #
>     # configuration written to .config
>     #
> 
> This patch series also includes a documentation page with all the
> relevant details and further examples about how to use the tool.
> 
> To go one step further, I'm in the process of preparing reference
> container images with kernel.org toolchains and no third-party
> dependencies other than the base Debian distro.  See this thread for
> more details and options to host them in an upstream way:
> 
>     https://lore.kernel.org/all/cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io/
> 
> Say, to run KUnit using the latest kernel.org GCC toolchain:
> 
>     scripts/container --shell \
>         -i registry.gitlab.com/gtucker/korg-containers/gcc:kunit -- \
>         tools/testing/kunit/kunit.py \
>             run \
>             --arch=x86_64 \
>             --cross_compile=x86_64-linux-

I went over the script and the documentation and it looks pretty good to
me at this point. My only comment would be potentially referencing the
TuxMake container images in the example section to give folks a
"prebuilt" container option while getting the kernel.org container
images sorted out but that can always be done in a follow-up change.

I will apply this to kbuild-next-unstable shortly to give folks a week
or so to voice any objections or give critical review comments.

Cheers,
Nathan

