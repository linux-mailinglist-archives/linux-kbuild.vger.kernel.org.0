Return-Path: <linux-kbuild+bounces-9066-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E0BCA67F
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 19:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC068189BB95
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 17:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F078E2459DC;
	Thu,  9 Oct 2025 17:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilPXDzl9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29F3EEC0;
	Thu,  9 Oct 2025 17:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760031686; cv=none; b=a0daEExQ5uVBqdLeU/WLUWX3IqIqBRX3I0wpWHaH56S5hozVmk7CZfliS297w84IddD5M9ScAjnWdOIsyTXrWuxb83+Vvh0af+YbsoCSytilcm+A4X6hmkJsTJo/jHYJgEl68KQAPuUszXqAo+CoqChnaw72FkLCNJ5dQx7whKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760031686; c=relaxed/simple;
	bh=K23L2usRO9cloxuukdxyKgJDZionsYzMB3U1+Yzhy30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGJlLnOXYw3yuOTCum9q4Z/2/ugL21l/zbwcEElnvmH8wrei8ZbmpjcSbT5JFL96rVgFRFN45I1eSvHGKMgztDt4IsJY0r3/dajPPGLjlx5U4IZPkE75AawHmyQvr9qGyCEIj3CsY6srgzUWfzYpwemWFL7q5c08S5e0GaIZLc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilPXDzl9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1576BC4CEE7;
	Thu,  9 Oct 2025 17:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760031685;
	bh=K23L2usRO9cloxuukdxyKgJDZionsYzMB3U1+Yzhy30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilPXDzl9inaHuOpMWGvhmY+g5lALkpQvwcS3EjjxZ8qbRtZjibA2BuwnUYE4GTGWa
	 ROSh9/863YI2HCxPdSb52bI7mFhiDEPjJETfUukumlDjwYHLTOvHaDRC/9UV30ltBr
	 llNtSakZhlnZEChmqSyZYQYBL22Ce8AOvYL9D2rOFi4ZhGv7T2VwGF7b0XozMGPvpY
	 Uq4Ovdr2/AfpKVCHPsb5qTsmWtOLBBKozxI7iWFqvbXq5C3urjWJM6H+5HnW8QcAaT
	 mR42c7qiIOy3JEZZ8PwfTTGuSZXa8l3WzI6gsaZ1vnd5p5WKcEyTWLHLJ9C7E6mOCG
	 PzP5eylm3STIA==
Date: Thu, 9 Oct 2025 10:41:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Askar Safin <safinaskar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com, nsc@kernel.org, ojeda@kernel.org,
	sam@gentoo.org, thomas.weissschuh@linutronix.de,
	Daniel Xu <dxu@dxuuu.xyz>
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
Message-ID: <20251009174120.GA442207@ax162>
References: <20251009075149.1083040-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009075149.1083040-1-safinaskar@gmail.com>

Hi Askar,

On Thu, Oct 09, 2025 at 10:51:49AM +0300, Askar Safin wrote:
> #regzbot introduced: d1d0963121769d8d16150b913fe886e48efefa51
> 
> As well as I understand, if you want to disable warnings, you
> should pass "CFLAGS=-w" to "make". Starting with d1d096312176,
> this no longer works.
> 
> Steps to reproduce:
> 
> $ cd linux
> $ git clean -f -q -d -x  # To clean everything not controlled by git
> $ echo 'CONFIG_64BIT=y' > /tmp/minimini
> $ make allnoconfig KCONFIG_ALLCONFIG=/tmp/minimini
> $ make -j32 CFLAGS=-w

As Nicolas pointed out, CFLAGS has not be hooked into Kbuild for a long
time, see commit 69ee0b352242 ("kbuild: do not pick up CFLAGS from the
environment"). You would need to use KCFLAGS=-w to accomplish the same
thing. KCFLAGS is only for the kernel build though, you would need
HOSTCFLAGS=-w as well to ignore warnings when building the host
programs such as objtool.

It does seem like the objtool Makefile should be hardened against CFLAGS
being passed in from the command line so that the build does not break
like this though.

Cheers,
Nathan

