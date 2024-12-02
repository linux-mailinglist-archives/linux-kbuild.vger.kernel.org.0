Return-Path: <linux-kbuild+bounces-4940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4899E0A5D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 18:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C3F1B2CDDA
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9606017A5A4;
	Mon,  2 Dec 2024 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AM3jWJZp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F75AD51;
	Mon,  2 Dec 2024 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156173; cv=none; b=NDfjiCF4ZU8yKKzFqGVDr17zKpR/85FWTRhh6nZVvAiTBa0BMqCJCc6bbXVbyv5Sy+bkb891qxpOB9+zxi8zVejiHguNFVG0wUD/aRtoUzjbL6fIPnr/+FtCtlCa7tiuCDpmqzGGmh+v/CK2+M8f7/BZqYioBFhcaaTDCdzpc9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156173; c=relaxed/simple;
	bh=xlQywIlZNQT5qCo7G3nLeY962rjjbO5Mq7s9hOqzSTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ot4eBzmD8mZ+3Q8KbdXoVR0Cifc3qHC4N6G4FBjzE7GGelK1JMlwCLrZrlN1VuNUpGGMC+a7y7S/DQbu8eyOoCbHkahMfHIb/0ewlDQO8ksg/oA1FLOxAv8zcCj5hldnrjeItdxgAWEvf4Cr90ZVjTnptN/OXhwjWe9pTAnTjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AM3jWJZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41270C4CED1;
	Mon,  2 Dec 2024 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733156172;
	bh=xlQywIlZNQT5qCo7G3nLeY962rjjbO5Mq7s9hOqzSTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AM3jWJZp/CgkhVFK3t4ZwOl6h+mOxDJCQGTmx11N/Hf/ImgkXc1kb1eUP5yFTTFkj
	 C542BBLgdoRljc3cFThdDsZ72G6r/Wt+ZH1IQ0idZd/D9REB3bX7SWEpc9Sd/kIzHD
	 9LAH3oMX8fddnzb7a9+AAFjcVrMUX2A3zUUUo4ec8CCiOjAH/qlsIEPn+5yPXSFXDH
	 ub4vRhdTZyhfDZGdmUIwXyWBgmFF1qIMNm2zk0nzZkXpRvLQyz13Re+7H5HqORoTMg
	 wTfKHqx+3iafT5IrwnauhRgnYebgSmavAeFUPCkVaOr1VCOuP/iXxvcwW4NGGRMm6H
	 inpEPVj9t2ItQ==
Date: Mon, 2 Dec 2024 09:16:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Aleksei Vetrov <vvvvvv@google.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Move -Wenum-enum-conversion to W=2
Message-ID: <20241202161610.GA2845796@thelio-3990X>
References: <20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org>

Masahiro, could you please pick this up? The lore link is below in case
it is no longer in your inbox (or I can resend).

https://lore.kernel.org/20241017-disable-two-clang-enum-warnings-v2-1-163ac04346ae@kernel.org/

On Thu, Oct 17, 2024 at 10:09:22AM -0700, Nathan Chancellor wrote:
> -Wenum-enum-conversion was strengthened in clang-19 to warn for C, which
> caused the kernel to move it to W=1 in commit 75b5ab134bb5 ("kbuild:
> Move -Wenum-{compare-conditional,enum-conversion} into W=1") because
> there were numerous instances that would break builds with -Werror.
> Unfortunately, this is not a full solution, as more and more developers,
> subsystems, and distributors are building with W=1 as well, so they
> continue to see the numerous instances of this warning.
> 
> Since the move to W=1, there have not been many new instances that have
> appeared through various build reports and the ones that have appeared
> seem to be following similar existing patterns, suggesting that most
> instances of this warning will not be real issues. The only alternatives
> for silencing this warning are adding casts (which is generally seen as
> an ugly practice) or refactoring the enums to macro defines or a unified
> enum (which may be undesirable because of type safety in other parts of
> the code).
> 
> Move the warning to W=2, where warnings that occur frequently but may be
> relevant should reside.
> 
> Cc: stable@vger.kernel.org
> Fixes: 75b5ab134bb5 ("kbuild: Move -Wenum-{compare-conditional,enum-conversion} into W=1")
> Link: https://lore.kernel.org/ZwRA9SOcOjjLJcpi@google.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Move -Wenum-enum-conversion to W=2, instead of disabling it
>   outright (Arnd)
> - Leave -Wenum-compare-conditional in W=1, as there are not that
>   many instances, so it can be turned on fully at some point (Arnd)
> - Link to v1: https://lore.kernel.org/r/20241016-disable-two-clang-enum-warnings-v1-1-ae886d7a0269@kernel.org
> ---
>  scripts/Makefile.extrawarn | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 1d13cecc7cc7808610e635ddc03476cf92b3a8c1..04faf15ed316a9c291dc952b6cc40fb6c8c330cf 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -130,7 +130,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
>  KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
>  KBUILD_CFLAGS += $(call cc-disable-warning, unaligned-access)
>  KBUILD_CFLAGS += -Wno-enum-compare-conditional
> -KBUILD_CFLAGS += -Wno-enum-enum-conversion
>  endif
>  
>  endif
> @@ -154,6 +153,10 @@ KBUILD_CFLAGS += -Wno-missing-field-initializers
>  KBUILD_CFLAGS += -Wno-type-limits
>  KBUILD_CFLAGS += -Wno-shift-negative-value
>  
> +ifdef CONFIG_CC_IS_CLANG
> +KBUILD_CFLAGS += -Wno-enum-enum-conversion
> +endif
> +
>  ifdef CONFIG_CC_IS_GCC
>  KBUILD_CFLAGS += -Wno-maybe-uninitialized
>  endif
> 
> ---
> base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
> change-id: 20241016-disable-two-clang-enum-warnings-e7994d44f948
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

