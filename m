Return-Path: <linux-kbuild+bounces-3724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C091984D75
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 00:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E32DC1F22F99
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 22:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C351422A2;
	Tue, 24 Sep 2024 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUaxKOuq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B491768FD;
	Tue, 24 Sep 2024 22:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727216115; cv=none; b=ott40MMtlhhsg3yPcph1waZ1HLiQtc43aAlFOR1Dry/sh/qQ45f/zghbdcHMh2DUd3iT7SQ6QuD9DokZdzbyZ1EPr7uklCGDZHJES/WdaP20Lbmm7CB+0vml82Iu5p933zffq690BDVurMr7gHDKmXBNFCVSxwgZAJtGUYEJ2/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727216115; c=relaxed/simple;
	bh=eO7rpd+j+GkUt3i9+9myWUGwe6iHUbQ4BQWoQ6/BBJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzyC2q+HYnc7FM53o3AzuDP0PMqTvjUFjivFJKO2Q+ZBYvVHLG9nTL3Wj4Cg/BZw3xwKzK+sGXWy+4PT1gqqdmdWNpmu3fev+ql3nQMd5/nFa/xC3Uk3CNNQTvLbMmX4A9VaH0GfJAOfl86PxqOlC62sDlhHwR8zZ+D/y1IlTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUaxKOuq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2347C4CEC4;
	Tue, 24 Sep 2024 22:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727216114;
	bh=eO7rpd+j+GkUt3i9+9myWUGwe6iHUbQ4BQWoQ6/BBJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUaxKOuqXzekKuBfH86uEC03wJyrrruiQuMGqlzqKReuFlRHloFn85wsNtTMl7Ocd
	 ByRHrijjcTCvPfJ8LALpGhufpgbrx2P5m+malRWXJDs+76WFwNJsHWadQt04Yu2NAg
	 OgBWFvJwg7FXxV96GuACn2+PZiygU6l3jkUPSq7nXTgArya6mDn4GfTsXBwZFUhf2s
	 sw78buDxWxHZdZG7WCAKvtDaHy6n/XmfjMnRBtIROfC7uSpD8B1xT7uG6JkpvqLzxi
	 YF2qWbG/pM3DBS3/OlYf5i40CXUrLAq9WWElXNGIzo7izTzg4ccQ4l9HP6J037/Ep2
	 1ovg919ytQuBw==
Date: Tue, 24 Sep 2024 17:15:14 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	devicetree@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH v3 1/2] kbuild: move non-boot built-in DTBs to .rodata
 section
Message-ID: <20240924221514.GA374455-robh@kernel.org>
References: <20240923075704.3567313-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923075704.3567313-1-masahiroy@kernel.org>

On Mon, Sep 23, 2024 at 04:56:02PM +0900, Masahiro Yamada wrote:
> Commit aab94339cd85 ("of: Add support for linking device tree blobs
> into vmlinux") introduced a mechanism to embed DTBs into vmlinux.
> 
> Initially, it was used for wrapping boot DTBs in arch/*/boot/dts/, but
> it is now reused for more generic purposes, such as testing.
> 
> Built-in DTBs are discarded because KERNEL_DTB() is part of INIT_DATA,
> as defined in include/asm-generic/vmlinux.lds.h.
> 
> This has not been an issue so far because OF unittests are triggered
> during boot, as defined by late_initcall(of_unittest).
> 
> However, the recent clk KUnit test additions have caused problems
> because KUnit can execute test suites after boot.
> 
> For example:
> 
>   # echo > /sys/kernel/debug/kunit/clk_register_clk_parent_data_device/run
> 
> This command triggers a stack trace because built-in DTBs have already
> been freed.
> 
> While it is possible to move such test suites from kunit_test_suites to
> kunit_test_init_section_suites, it would be preferable to avoid usage
> limitations.
> 
> This commit moves non-boot built-in DTBs to the .rodata section. Since
> these generic DTBs are looked up by name, they do not need to be placed
> in the special .dtb.init.rodata section.
> 
> Boot DTBs should remain in .dtb.init.rodata because the arch boot code
> generally does not know the DT name, thus it uses the __dtb_start symbol
> to locate it.
> 
> This separation also ensures that the __dtb_start symbol references the
> boot DTB. Currently, the .dtb.init.rodata is a mixture of both boot and
> non-boot DTBs. The __dtb_start symbol must be followed by the boot DTB,
> but we currently rely on the link order (i.e., the order in Makefiles),
> which is very fragile.
> 
> Fixes: 5c9dd72d8385 ("of: Add a KUnit test for overlays and test managed APIs")
> Fixes: 5776526beb95 ("clk: Add KUnit tests for clk fixed rate basic type")
> Fixes: 274aff8711b2 ("clk: Add KUnit tests for clks registered with struct clk_parent_data")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v3:
>   - Move to .rodata section instead of .init.rodata
> 
>  scripts/Makefile.dtbs | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

