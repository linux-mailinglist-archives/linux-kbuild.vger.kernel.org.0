Return-Path: <linux-kbuild+bounces-8670-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D9CB3C72F
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Aug 2025 03:49:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C4361C26EE0
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Aug 2025 01:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB052153E7;
	Sat, 30 Aug 2025 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz55jrla"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9F81DFE12;
	Sat, 30 Aug 2025 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756518593; cv=none; b=UAV7wVAg8EeFHlm1MWOx1+DWQVNl7377nPLQdUA8aUPHOrxPEnEf6iVUWssL+BW7RmO3/znQq+urziSaciNNPCG33kBNLKp8vGqtL2n1s3M8a8SUSBTPFsSC+zLPMp9uDapAzvInsw6/EBJLKqV62S4/JCXYjW41BB+PjTLofcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756518593; c=relaxed/simple;
	bh=YyMsQwc4XjkKqAxJXhMj+Bs1kFDoyhPa07eWi4Gz2cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2r1bVKEVUqFmfJ5ll1YM1at9rnfWKwPi3fBjihXPLjhx2UyCb+vtrWVmA+yIfBtZTCDcPC9tl3DH1XQ2Bbgd58MjnxwCOS9O2UAPVrTZpZJJV3XbtdpK4xzT0+ADiIezrt1aCaw8w6rP1TZOCZ39gIGpOb94Nkp9OwQVXG4Tig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz55jrla; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F87C4CEF0;
	Sat, 30 Aug 2025 01:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756518593;
	bh=YyMsQwc4XjkKqAxJXhMj+Bs1kFDoyhPa07eWi4Gz2cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cz55jrlatT3n3kFw8vg5rA9cZ5cP2uChUYag58yPB6xRzZKrlcgwT7W55M60lV4Ee
	 3l0IbcIYytBpsNyRWyyyNNZFuaAYAUzy/BFIOCtHYZR2ezu9cvo7T6xLee1QmFRVUB
	 FyAijRsWbmvOEtfjtceQCpY2rlwnqK/umcEaaLL/zEC8fiGAvmHmNjRNn2MagLMQMR
	 8wPQID8rW6TrjUTxwY3AzyYKCgaZC4LX560H4cN/yPm+BgghtxjUC8qIMlzsHWVs72
	 KV3ZCeqk5o6OHCF1YsvwA8YuxPjJvhOgMmJ3baje1tseYA7XPTTrCylopF9/vJ7P6W
	 eYmtvt89i3NcA==
Date: Fri, 29 Aug 2025 18:49:53 -0700
From: Kees Cook <kees@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Marco Bonelli <marco@mebeim.net>, Petr Vorel <pvorel@suse.cz>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kconfig: Add transitional symbol attribute for migration
 support
Message-ID: <202508291848.AE848AFB4F@keescook>
References: <20250830014438.work.682-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250830014438.work.682-kees@kernel.org>

On Fri, Aug 29, 2025 at 06:44:43PM -0700, Kees Cook wrote:
> +static int transitional_check_sanity(const struct menu *menu)
> +{
> +	struct property *prop;
> +
> +	if (!menu->sym || !menu->sym->transitional)
> +		return 0;
> +
> +	/* Check for depends and visible conditions. */
> +	if (menu->dep && !expr_is_yes(menu->dep)) {
> +		goto error;

This is what I get for not rebuilding after "obvious changes".

I've got missing "}"s... *sigh* v2 coming...

-- 
Kees Cook

