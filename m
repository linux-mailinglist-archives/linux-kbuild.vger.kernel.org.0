Return-Path: <linux-kbuild+bounces-6998-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C13A4AADEF4
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 14:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4701881F8A
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 12:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FA625D91E;
	Wed,  7 May 2025 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="miau027A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05B2594B7
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620516; cv=none; b=X7JvgFUZgFsIQoGA8KqT3KcCcNOEKi9PaiLx5rjLuLsmSLPutpzpLFgDCHAekcQGe1FxMF03FHKEA+GhQLiEBAPuHwNvKdUi4JBfdRbcLA9tLZ7mwFndkfW5E/JPDEofUeLi5vtqkuc7inBQpruWAKICLOh/mZ99zl8uWkna/A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620516; c=relaxed/simple;
	bh=OrVUBAduC66EM+Jy5ubOZJRLtPoNQLKUZOMruFW9g5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+hqH8MCLiSqG8t3slqibWeiRleTFrRjiO4bH12Z3xPD0mSC0wSpnVU4qLFmEpEpx9so5mACcDh2UJXj2l9IxirfsNeKqxPIvIQc+J4xreRWeeMVYUg8VM5wUfvy8R3DV8OPvzsa9TnPFeCVtBd9eC2kbSAIE8CigfV9aa96E04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=miau027A; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 7 May 2025 14:21:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746620512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DpPHSAGatCtkUGCaP/yd2Qyr3LuW/jp4fovDif5/S4M=;
	b=miau027A/ds+uz1cHnS94jFw15X1wRBY3OGmNorw1Q5T0CDrb9MfiGEUwixSA4NcBf5fSh
	U0/lnSeOScqRZQE5E5E9JVBQnkLcpbv5EELOm/sVPMXKnMgi0Dlqw0hK4bukgvlf7R6Koo
	jScoCjrpPLs11OO6fs5Fm8t3UFHHyAo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 3/3] integer-wrap: Force full rebuild when .scl file
 changes
Message-ID: <20250507-piquant-fascinating-pug-7ce4cd@l-nschier-aarch64>
References: <20250503184001.make.594-kees@kernel.org>
 <20250503184623.2572355-3-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503184623.2572355-3-kees@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Sat, 03 May 2025, Kees Cook wrote:

> Since the integer wrapping sanitizer's behavior depends on its associated
> .scl file, we must force a full rebuild if the file changes. If not,
> instrumentation may differ between targets based on when they were built.
> 
> Generate a new header file, integer-wrap.h, any time the Clang .scl
> file changes. Include the header file in compiler-version.h when its
> associated feature name, INTEGER_WRAP, is defined. This will be picked
> up by fixdep and force rebuilds where needed.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Marco Elver <elver@google.com>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: <linux-kbuild@vger.kernel.org>
> Cc: <kasan-dev@googlegroups.com>
> Cc: <linux-hardening@vger.kernel.org>
> ---
>  include/linux/compiler-version.h | 3 +++
>  scripts/Makefile.ubsan           | 1 +
>  scripts/basic/Makefile           | 5 +++++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
> index 69b29b400ce2..187e749f9e79 100644
> --- a/include/linux/compiler-version.h
> +++ b/include/linux/compiler-version.h
> @@ -19,3 +19,6 @@
>  #ifdef RANDSTRUCT
>  #include <generated/randstruct_hash.h>
>  #endif
> +#ifdef INTEGER_WRAP
> +#include <generated/integer-wrap.h>
> +#endif
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 9e35198edbf0..653f7117819c 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -15,6 +15,7 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined
>  export CFLAGS_UBSAN := $(ubsan-cflags-y)
>  
>  ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
> +	-DINTEGER_WRAP						\
>  	-fsanitize-undefined-ignore-overflow-pattern=all	\
>  	-fsanitize=signed-integer-overflow			\
>  	-fsanitize=unsigned-integer-overflow			\
> diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
> index dd289a6725ac..fb8e2c38fbc7 100644
> --- a/scripts/basic/Makefile
> +++ b/scripts/basic/Makefile
> @@ -14,3 +14,8 @@ cmd_create_randstruct_seed = \
>  $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
>  	$(call if_changed,create_randstruct_seed)
>  always-$(CONFIG_RANDSTRUCT) += randstruct.seed
> +
> +# integer-wrap: if the .scl file changes, we need to do a full rebuild.
> +$(obj)/../../include/generated/integer-wrap.h: $(srctree)/scripts/integer-wrap-ignore.scl FORCE
> +	$(call if_changed,touch)
> +always-$(CONFIG_UBSAN_INTEGER_WRAP) += ../../include/generated/integer-wrap.h
> -- 
> 2.34.1
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>


