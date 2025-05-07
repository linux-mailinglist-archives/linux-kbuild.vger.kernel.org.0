Return-Path: <linux-kbuild+bounces-6996-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A886AADEC8
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 14:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406549C0772
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DDE425B67A;
	Wed,  7 May 2025 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qJMnoz3T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FBE25C80F
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 12:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620100; cv=none; b=t4kXdnMVZOhVX/yz/0Nofdee+FybdQScVhy1aYAcEG8/jGz7RVbvjJTwoBhNtDraS2GMfvFY4m6hXZ1WgLz/0eVDVj2TMdEkgs4aFDV8CAicENUAW5fI1pHRqT/pVOR4ipyQHIubuXp5SnWb4Q9xQH3F6AMNZ/q3vo9GHpMi3jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620100; c=relaxed/simple;
	bh=iiyFqjFV+FBMamxUoQ9fowPeGDOc/bEQD8kMCuJQ5IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMggSGDQXgrhlo55MY7GWerpoydh6YKUeuX8K899Y7Cqe3ubboanTDuX2KEFziYZbfxujDek+Lpi0gNMBWIZcUQ0bMcRT/2jRApe4XColVn3Ws5121RJvkMdsQcXT+lsBkDr23N6DBIxfp8rMYSqlZ7rfpAUhMGevKXS64NqsUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qJMnoz3T; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 7 May 2025 14:14:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746620095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9XqY7YuOdihrc7IqXrXm7afvm5cHVdOv9tTA20piJDQ=;
	b=qJMnoz3TCVgFT90wHbgAuMARE4tyDEdTXu1GGiUMEmfWvmobyWu21eqoz3fkQf21QXpM1J
	HI7dPUd/tij0tLll0xPsc1vuByJezmA3I/1mLDNlYuy32AhhZ5rvSWpa1CMiS4izgo+QBc
	EaVWT6caCiWno+XisCIPNUYx5sVyOjM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 2/3] randstruct: Force full rebuild when seed changes
Message-ID: <20250507-righteous-turquoise-bustard-4fca48@l-nschier-aarch64>
References: <20250503184001.make.594-kees@kernel.org>
 <20250503184623.2572355-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503184623.2572355-2-kees@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Sat, 03 May 2025, Kees Cook wrote:

> While the randstruct GCC plugin was being rebuilt if the randstruct seed
> changed, Clang builds did not notice the change. This could result in
> differing struct layouts in a target depending on when it was built.
> 
> Include the existing generated header file in compiler-version.h when
> its associated feature name, RANDSTRUCT, is defined. This will be picked
> up by fixdep and force rebuilds where needed.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  include/linux/compiler-version.h | 3 +++
>  include/linux/vermagic.h         | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
> index 74ea11563ce3..69b29b400ce2 100644
> --- a/include/linux/compiler-version.h
> +++ b/include/linux/compiler-version.h
> @@ -16,3 +16,6 @@
>  #ifdef GCC_PLUGINS
>  #include <generated/gcc-plugins.h>
>  #endif
> +#ifdef RANDSTRUCT
> +#include <generated/randstruct_hash.h>
> +#endif
> diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
> index 939ceabcaf06..335c360d4f9b 100644
> --- a/include/linux/vermagic.h
> +++ b/include/linux/vermagic.h
> @@ -33,7 +33,6 @@
>  #define MODULE_VERMAGIC_MODVERSIONS ""
>  #endif
>  #ifdef RANDSTRUCT
> -#include <generated/randstruct_hash.h>
>  #define MODULE_RANDSTRUCT "RANDSTRUCT_" RANDSTRUCT_HASHED_SEED
>  #else
>  #define MODULE_RANDSTRUCT
> -- 
> 2.34.1
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Nicolas Schier <n.schier@avm.de>


