Return-Path: <linux-kbuild+bounces-9763-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B689FC7B942
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 20:47:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 705D73A4054
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 19:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1345D2DCF61;
	Fri, 21 Nov 2025 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSFFKfMe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D530B299931;
	Fri, 21 Nov 2025 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754423; cv=none; b=KJKEgsMZ/YFaQSJQHRW9y7SlLkm35vrfBejJUCYdagDMtcX6VBn4xjOPcQxNauTK8nYYAx7H3eJcRclfdJaokELtEtef6Hg90POrimDr/18jPXNiPs/ggWz0YrVcyWCTrDA8dJRgQAtRVohrIjHIt3V7Mbn59PMWasoXKHx87Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754423; c=relaxed/simple;
	bh=cEdRCa2NBNmESBxc72utfubK3/50PKg3AObY9g7OMis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXEjAg3iGjiIRlipp+j83VISBjsMzV9R+yR/H+kq1e+vUCMmCfoUF1XgWPkHzOgbODLGLAWcH8Tg4IyzOqIm3S2wNgMajornnPdDDy4i/oZm8f5/pdBbEeCgdRENIP9sxG9FcuhzvoacPGwRxce2zHbEwIEXiULVTlW/+s5jfhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSFFKfMe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1C9C4CEF1;
	Fri, 21 Nov 2025 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763754420;
	bh=cEdRCa2NBNmESBxc72utfubK3/50PKg3AObY9g7OMis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSFFKfMeMTUHsC8yj3jqUJ/m8QBV+GwQ/2LqO9m8lU6FGqr+MDNB9s41UgbZsY0tq
	 PL6+i4/ySPvKoZyv0vYYrhIvHv1Np1oZXvA3RRYdt5YBGKcX0HwqEINffE7tatFMvF
	 dGIgaxbXK7QEqTiOKMcR7eHx53Cn7tVkeAYhA+XTyTzDbxw967a5phtYgtwu6uxHTB
	 Gx+mhXtJgUzU6IF84T7VLB7J+/eL0T4M5XMWb3/E0IWYU+UWWMrz6DfTs0aH00zJ5B
	 txWs4Nmj3znlJOhLorrmIxXQufrgiPy0ZMLyu4JmUOpJwoYsFZq6caXJzpMPUY0qQh
	 Qb3GiKPtwPb1g==
Date: Wed, 19 Nov 2025 21:20:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Chen-Yu Tsai <wenst@chromium.org>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v6 5/8] kbuild: Split out module targets into a variable
Message-ID: <aR4mdI3u51z4qhoN@derry.ads.avm.de>
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-6-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119181333.991099-6-sjg@chromium.org>

On Wed, Nov 19, 2025 at 11:13:26AM -0700, Simon Glass wrote:
> Add a modules-targets variable to list the targets which cause modules
> to be built, since we want to add a conditional target.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> (no changes since v5)
> 
> Changes in v5:
> - Add a new patch to split out module targets into a variable
> 
>  Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 638bc09a546a..8cd46222fc48 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,7 +772,12 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>  
> -ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +modules-targets := all
> +modules-targets += modules
> +modules-targets += nsdeps
> +modules-targets += compile_commands.json
> +modules-targets += clang-%
> +ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
>    KBUILD_MODULES := y
>  endif
>  
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>


