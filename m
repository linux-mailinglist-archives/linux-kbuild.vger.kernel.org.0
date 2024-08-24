Return-Path: <linux-kbuild+bounces-3190-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BBD95DB09
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 05:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E848283684
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 03:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D511BDDB;
	Sat, 24 Aug 2024 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TY7kVKKZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A217EEB1;
	Sat, 24 Aug 2024 03:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724470389; cv=none; b=h2N/paalDD/Xm9LHft6J/h59MdKaZXJMn0k8S4oT9zQrQ7MJHeqtW3Trys6wAWTR8P2R6vj/iFMR4WCef4XEj5FlvmGT8n5tsybUq2bfqkwbnf+0qBaP0OJfuGENZwI+oyTkWr+TcKY1S8qL1ChzXu4KfmTcVJmzpZsCxQww3/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724470389; c=relaxed/simple;
	bh=KiliZRb6EV7cdg7Is5wvXw6Z0tQs6uGk02S++Ojv9x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vv+itVZ8kZFsB5HkZ0d/0OranFO+4vReRb6DjiVctxhxvgqVp+0Iq8k+GJ5kOgOvMtBf34NUi2z0s/OnMJ0ckne9JSfUxAgW4ebNPJURkxVizYxnhXcJ3UQos6QDlQyV0J84Z5G5sLL4i0GKPjNlh0oerKNDC6NkMCNrmIFWmH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TY7kVKKZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75CC7C4AF09;
	Sat, 24 Aug 2024 03:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724470388;
	bh=KiliZRb6EV7cdg7Is5wvXw6Z0tQs6uGk02S++Ojv9x8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TY7kVKKZkJ1GWy0oaunC9F4OXt24q/X2FeHpihzGsIU3RGhvyawC3CW6RYkVypgno
	 YoiB/FiAyG0yiElH3H+yQ4N5SdCcRmuPe0OeFlGRyfILefBr1WRWbtlEXyfAmc6TvB
	 5Ev1vZkxK4tdDlY6eeFBdoVREb2AfG/lJtsxq9s7YQ5eRwmNg5I3Sz7osjZZnfMaoL
	 xwuKtZ/r4p8rm9yRri9+iEcYtYpRk8X0/LFzHxqWlx5AGR5hlbRioVKq9+sUD8R+WE
	 5StHIw3cdP0V2rBWTElQCU/34lONiT4zjJfZC2erClAUIeRKhh6UZfCdczXxJQ5s84
	 nfABP1uj5lcbg==
Date: Fri, 23 Aug 2024 20:33:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH v2] Documentation: kbuild: explicitly document missing
 prompt
Message-ID: <20240824033306.GC1733394@thelio-3990X>
References: <20240823194152.13881-1-stephen.s.brennan@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823194152.13881-1-stephen.s.brennan@oracle.com>

On Fri, Aug 23, 2024 at 12:41:51PM -0700, Stephen Brennan wrote:
> There are a few lines in the kbuild-language.rst document which
> obliquely reference the behavior of config options without prompts.
> But there is nothing in the obvious location that explicitly calls
> out that users cannot edit config options unless they have a prompt.
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>

Looks good to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> v1: https://lore.kernel.org/linux-doc/20240820171000.1656021-1-stephen.s.brennan@oracle.com/
> 
>  Documentation/kbuild/kconfig-language.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 1fb3f5e6193c3..4650daaf5d365 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -70,7 +70,11 @@ applicable everywhere (see syntax).
>  
>    Every menu entry can have at most one prompt, which is used to display
>    to the user. Optionally dependencies only for this prompt can be added
> -  with "if".
> +  with "if". If a prompt is not present, the config option is a non-visible
> +  symbol, meaning its value cannot be directly changed by the user (such as
> +  altering the value in ``.config``) and the option will not appear in any
> +  config menus. Its value can only be set via "default" and "select" (see
> +  below).
>  
>  - default value: "default" <expr> ["if" <expr>]
>  
> -- 
> 2.43.5
> 

