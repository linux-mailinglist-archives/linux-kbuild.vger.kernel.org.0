Return-Path: <linux-kbuild+bounces-6895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E425CAA7AFB
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 22:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18491C02A92
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 20:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DAE91F1511;
	Fri,  2 May 2025 20:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GTrMoDC2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007CF1EF368;
	Fri,  2 May 2025 20:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218359; cv=none; b=STZ9apGupWe1QzS9Z9ifMVXsAz0HFUf5Y6WxKZOsMYTDwioSyuz/Cp07OqWqg+8YazaGTPWiW7MUYRStlfGE9tNfyVwUjVu2tKDjmNlMAwWmilrZJ7koOrI7YVV2sgeh++mce3GAWCKgLnBblg8Ky9v0nZY9yiWCi0gUjbQBtTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218359; c=relaxed/simple;
	bh=09D95fCeGz8N6sLjtZzo4KLfz4fUqg335kqDi+c6Y2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnhIETetY6Q5ZHzUatMi1frIYYgGmtFbpc1Kn9EBLhETIBW/RID011VvUg5SvccjS7TbCZqy17BB/7CLBvOrQ1fxsCnYAXlh16jS3PgHLcBPnhBdpkPKvbJXTNvVFwRKdX40HDxEHWYwYI4XrRErbUp4pfeR3Xks8TM+16Q5FAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GTrMoDC2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D769C4CEE4;
	Fri,  2 May 2025 20:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218358;
	bh=09D95fCeGz8N6sLjtZzo4KLfz4fUqg335kqDi+c6Y2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTrMoDC2PIy9CmJMxenavNUOlDO0Z8z9EwJnnTucOt/5Asv3wwOTWwDdpH0cuCIAd
	 lHXpSNPhGg6JiAr8FDnBKc58b1QpGC5+++jzO9nlBtxr0k/V66lap+62fi7lArj39a
	 iJ0yeGbJczFtwlr1RBWCsHCaWvupI4BIJSZk1B3ZtwPbFvaeN7wZP1txpj38gnY/i5
	 demqVTSCq3/HpCMNA2R/Vq//RhJAu3JZHTzb83Fe1j2QCt11dXBjERWmTswNg1HzLb
	 r60CF+MfxhuOInbkdSuE13dNqeJ7+uJu30FpCGS9xO/ySvvLdpzNxRjOj4wjwJzekV
	 3iFRD59/+LFeg==
Date: Fri, 2 May 2025 13:39:15 -0700
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH 1/3] gcc-plugins: Force full rebuild when plugins change
Message-ID: <202505021337.DCC59E49@keescook>
References: <20250501193839.work.525-kees@kernel.org>
 <20250501194826.2947101-1-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501194826.2947101-1-kees@kernel.org>

On Thu, May 01, 2025 at 12:48:16PM -0700, Kees Cook wrote:
> There was no dependency between the plugins changing and the rest of the
> kernel being built. Enforce this by including a synthetic header file
> when using plugins, that is regenerated any time the plugins are built.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: <linux-hardening@vger.kernel.org>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  scripts/Makefile.gcc-plugins | 2 +-
>  scripts/gcc-plugins/Makefile | 8 ++++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 5b8a8378ca8a..b0d2b9ccf42c 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -38,7 +38,7 @@ export DISABLE_STACKLEAK_PLUGIN
>  
>  # All the plugin CFLAGS are collected here in case a build target needs to
>  # filter them out of the KBUILD_CFLAGS.
> -GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> +GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y)) -include $(objtree)/scripts/gcc-plugins/deps.h

This doesn't work[1] because CFLAGS_REMOVE and so many other places use
filter-out (instead of subst) to remove flags, thinking flags are
singular. But adding "-include path.h" means "-include" gets removed in
a "$(filter-out $GCC_PLUGINS_CFLAGS, ...)" case. :(

Ugh.

-Kees

[1] https://lore.kernel.org/r/202505021403.blhkPRXG-lkp@intel.com/

-- 
Kees Cook

