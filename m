Return-Path: <linux-kbuild+bounces-6601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62987A88C56
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 21:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 809C9160FB2
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 19:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95C5C8FE;
	Mon, 14 Apr 2025 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gW+uJoZv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48141AD403
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Apr 2025 19:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744659520; cv=none; b=PObEN1UKQinR+kowHq2u0uT8thwzBERX1MH2QWtF7jcLeauMZ5OgMtdgW+nBKlyKOK2yR4J9V+pigZdNzCvKHXtjnjAo+3B3NYzXHqzCXe8UCqtnMvAeSOOKAfEcFXBssAKhpdMeJwreRQcqhpMiHSaMLO7o7c0dcKjdpSLIMI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744659520; c=relaxed/simple;
	bh=7Ai995pKxI8qgB7r6PVGU1sv9Y3yWLi+adA6+lf1JZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZV00pf8hDOKAdYicH8tuzYyuSMLr8z2TWOYoJqmQGZAC/RCUH4rsKTOmAKBU9cCM6Q1mBC4cibeeyVkPjk0DpQlRYnhOqzG0RhwM8lEeguRGro/7xZWs5p2jlr+o/ZlKW8M4KOMeceO209M4+M7u/slntcRJpDU7YMLZ7RXC4KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gW+uJoZv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FD9C4CEE2;
	Mon, 14 Apr 2025 19:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744659520;
	bh=7Ai995pKxI8qgB7r6PVGU1sv9Y3yWLi+adA6+lf1JZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gW+uJoZvmifWg37cWWYeceRXyuzeGksZepX5qm4JZw0ifyC7Z1BwI58Zm7Y3eQ0x8
	 /vGuWUQqzw8moAEyhClXfduqAxu0CsJQ83Z9DcmFO5gbcnCJS4O2N61BBOV04E82Ky
	 7veIUAjPmKUnw5vRnqt8pvNeH9F6P0/jF9oL0euELBR79lsSIvVO+FS+Znx/5/AkPX
	 6FwhCDXIlOp8sCR7RpBM9WR7gV1e0TYbZ1SavQotY+A778GMQvaV9kjf0ylAGRpyAW
	 AILzU8D/zymi6pQT4nF9CB9gPJ+XCUwrzSdOO2BRuP6tVV7FMpn0ZBJtIhNT7QLEty
	 kCz+9BM9ybLzQ==
Date: Mon, 14 Apr 2025 12:38:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] correct disabling of -Wshift-negative-value
Message-ID: <20250414193836.GA107755@ax162>
References: <10b1ebd8-5d32-41a2-9454-1b40e98d5187@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10b1ebd8-5d32-41a2-9454-1b40e98d5187@suse.com>

Hi Jan,

On Mon, Apr 14, 2025 at 04:23:36PM +0200, Jan Beulich wrote:
> The warning is supported only from gcc6 onwards, hence its disabling
> needs probing that the (positive) option is actually supported.
> 
> Fixes: 1344794a59db ("Kbuild: add -Wno-shift-negative-value where -Wextra is used")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

The patch itself seems fine (I might add "scripts/Makefile.extrawarn: "
to the title) but if I understand correctly, this is only to support GCC
5? Would this be necessary if GCC 8.1 becomes the minimum supported
version of GCC for building the kernel?

https://lore.kernel.org/20250407094116.1339199-2-arnd@kernel.org/

If people are actively noticing this, perhaps we should send this to
Linus's tree for backports then Arnd could revert it in his series?

> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -154,7 +154,7 @@ else
>  # The following turn off the warnings enabled by -Wextra
>  KBUILD_CFLAGS += -Wno-missing-field-initializers
>  KBUILD_CFLAGS += -Wno-type-limits
> -KBUILD_CFLAGS += -Wno-shift-negative-value
> +KBUILD_CFLAGS += $(call cc-disable-warning,shift-negative-value)
>  
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-enum-enum-conversion

Cheers,
Nathan

