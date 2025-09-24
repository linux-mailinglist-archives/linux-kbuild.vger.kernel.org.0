Return-Path: <linux-kbuild+bounces-8954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0882BB9AE43
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 18:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6943B178D28
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 16:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D228B31355C;
	Wed, 24 Sep 2025 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLlCHXoy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDEF313545;
	Wed, 24 Sep 2025 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758731914; cv=none; b=jR9wtZyEz5IYPAkvDQ3jR8mPbzAKNWDRekOhb2hUtUfr58A2FH2zMi28Md56DtniUjBORs8TlkuPYuH3ybopVfoI+QLDbPfeg+2FIvgikDllZrTKaE0B52exKcZxa7I9rTByKYQiD2GKUYeNAxsvK3puLjsSQq/hle+tv4RueB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758731914; c=relaxed/simple;
	bh=79B0hsY4qoLvZ0g24jN911N9xdxeLSEg1XJ04X6Ze64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzbE/rqztTzpH/NWuF7zLA6PBmR9HV8E1zv2i7uK3K+hwktwkImpRakzMMQe5du8z7nM8tVIHff6Pp7x6BJHrgMUz7rZ4BW6BgGjGM/DmPXHCxcYouOMeky20Q0J2EF5V/2KAUm9PHkhknnyhLrDwwTdr9V/YIjh/9ADE7py+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLlCHXoy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E71CC4CEE7;
	Wed, 24 Sep 2025 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758731914;
	bh=79B0hsY4qoLvZ0g24jN911N9xdxeLSEg1XJ04X6Ze64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VLlCHXoyjX9KGPT41ZUPNyILqDodQS4B1BbiqTQvHZZKps2onv0nQneL6DldRCZsR
	 10JIAz/ktm4R8+081bakwxkKsltx6D64Jdzz5amcvHQqBKzFa9CcYbsVMzRzVJZ8P4
	 CE2pCYcmzIEesrO29t8+jpzKRgzhgj+tCvvi4UGRjdGmoVqnb3qVQ5k2EbiSu/VGs/
	 pDk50DXWjTW/wHtkg5os+uKi15WXrebSuwnqNFJMgBU6/VdQNTHBvQznK4r3DZ5/cG
	 SdujHLgmcVO+oB/8fZtrYcmTTw12QIBqVduhidfvb5ykKjeM7c79bATPabSf79wzzl
	 GadflE/mtYo6g==
Date: Wed, 24 Sep 2025 09:38:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Puranjay Mohan <puranjay@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] kconfig: Add transitional symbol attribute for
 migration support
Message-ID: <20250924163827.GA3322486@ax162>
References: <20250923213120.make.332-kees@kernel.org>
 <20250923213422.1105654-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923213422.1105654-2-kees@kernel.org>

On Tue, Sep 23, 2025 at 02:34:18PM -0700, Kees Cook wrote:
> During kernel option migrations (e.g. CONFIG_CFI_CLANG to CONFIG_CFI),
> existing .config files need to maintain backward compatibility while
> preventing deprecated options from appearing in newly generated
> configurations. This is challenging with existing Kconfig mechanisms
> because:
> 
> 1. Simply removing old options breaks existing .config files.
> 2. Manually listing an option as "deprecated" leaves it needlessly
>    visible and still writes them to new .config files.
> 3. Using any method to remove visibility (.e.g no 'prompt', 'if n',
>    etc) prevents the option from being processed at all.
> 
> Add a "transitional" attribute that creates symbols which are:
> - Processed during configuration (can influence other symbols' defaults)
> - Hidden from user menus (no prompts appear)
> - Omitted from newly written .config files (gets migrated)
> - Restricted to only having help sections (no defaults, selects, etc)
>   making it truly just a "prior value pass-through" option.
> 
> The transitional syntax requires a type argument and prevents type
> redefinition:
> 
>     config NEW_OPTION
>         bool "New option"
>         default OLD_OPTION
> 
>     config OLD_OPTION
>         bool
>         transitional
>         help
>           Transitional config for OLD_OPTION migration.
> 
> This allows seamless migration: olddefconfig processes existing
> CONFIG_OLD_OPTION=y settings to enable CONFIG_NEW_OPTION=y, while
> CONFIG_OLD_OPTION is omitted from newly generated .config files.
> 
> Added positive and negative testing via "testconfig" make target.
> 
> Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> Signed-off-by: Kees Cook <kees@kernel.org>

This seems reasonable to me but I am by no means a Kconfig expert.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

