Return-Path: <linux-kbuild+bounces-7573-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24834AE0AF4
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 18:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 563575A2FE6
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jun 2025 16:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB62023B612;
	Thu, 19 Jun 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlTbdfTm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7573085B2;
	Thu, 19 Jun 2025 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348862; cv=none; b=koPXd8SztQk6RgZ40pUc4pFfVwbLEwf5TVbGgNH7fnMFN99AMEHk+RCgz4V6rjq9HkaRbLVgUwIFhw08rmJnfnEKtKxz4Z79EsG77SEPVKgGgq55XzRGaVprNCXNnYU2VAYp4vxllRzTFHold/M7zGLcv1Ua7ryUHQbBkTKM904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348862; c=relaxed/simple;
	bh=VezOswhZtjHjhkzkvqMrgVzG9huxnG7ySdnWirVyEYA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/F+kPJFWVCorjC/cdRUztsMoYQflJtnmXbni0Jk2uhsI2h8I0QjDLh5mIVjkeykBDcswMp9rdOJHVsbf9IsOVBtzjI9pYQlVrEZkty4NiW+/eGEMxpy1BjbFM3c6Gd0C+e6F9gGwSqf8GWmCYDss+KBtTw2bP/JxCo/WdtsBH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlTbdfTm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2D0C4CEEA;
	Thu, 19 Jun 2025 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750348862;
	bh=VezOswhZtjHjhkzkvqMrgVzG9huxnG7ySdnWirVyEYA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dlTbdfTmEw8bBM8smCGbXBd5GJlOtiUmfIDuzwtyBpRPkK1t4SGMc32dkf8gxxr6Q
	 TEY2CGOJL7KDJUcaVlMMHsfIlaJvMt/5zAytMyZYCFQ8ppvkrwI8AoDeOORnEZdDVY
	 KLRzYIpRSzH6iQwy/4Z/SFnfbTIIMoLW1GHETD3U/8/rdXEq9zHnx81drh399CM8KT
	 +5fkgtlRPWUE6Xhw1wEHh7NjgUjTUR9qOi02nS/GwzR/b3x1lRKNmttRku5C4wn4yc
	 hZuqxi/Uw7vrxp+Zh4oNUGgwkPolIAWxY+gZ/uIUJLStWYOvFpbHH8ebOcrxq52Gpv
	 zBS6iJQPsFmqw==
Date: Thu, 19 Jun 2025 09:01:00 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: [PATCH v2 3/4] scripts/misc-check: check missing #include
 <linux/export.h> when W=1
Message-ID: <20250619090100.39e37c5a@kernel.org>
In-Reply-To: <20250601133230.4085512-3-masahiroy@kernel.org>
References: <20250601133230.4085512-1-masahiroy@kernel.org>
	<20250601133230.4085512-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  1 Jun 2025 22:31:29 +0900 Masahiro Yamada wrote:
> The problem was described in commit 5b20755b7780 ("init: move THIS_MODULE
> from <linux/export.h> to <linux/init.h>").
> 
> To summarize it again here: <linux/export.h> is included by most C files,
> even though only some of them actually export symbols. This is because
> some headers, such as include/linux/{module.h,linkage}, needlessly
> include <linux/export.h>.
> 
> I have added a more detailed explanation in the comments of
> scripts/misc-check.
> 
> This problem will be fixed in two steps:
> 
>  1. Add #include <linux/export.h> to C files that use EXPORT_SYMBOL()
>  2. Remove #include <linux/export.h> from header files that do not use
>     EXPORT_SYMBOL()
> 
> This commit addresses step 1; scripts/misc-check will warn about *.[ch]
> files that use EXPORT_SYMBOL() but do not include <linux/export.h>.
> This check is only triggered when the kernel is built with W=1.
> 
> We need to fix 4000+ files. I hope others will help with this effort.

IIUC you made the kernel spew nearly 5000 warnings on every W=1 build
to "encourage" others to help fix a fairly innocuous problem. 
I appreciate the work that goes into separating the headers but it's
hardly urgent enough to force others to scroll thru 5k warnings.

Please LMK if I'm missing some context here, otherwise I think this is
quite antisocial behavior, and the warnings should go back to W=2 until
someone actually cares to fix most of them.

Happy to hear from others.. CC: workflows

> diff --git a/scripts/misc-check b/scripts/misc-check
> index 21551d721079..edc0e44d96de 100755
> --- a/scripts/misc-check
> +++ b/scripts/misc-check
> @@ -9,4 +9,47 @@ check_tracked_ignored_files () {
>  		sed 's/$/: warning: ignored by one of the .gitignore files/' >&2
>  }
>  
> +# Check for missing #include <linux/export.h>
> +#
> +# The rule for including <linux/export.h> is very simple:
> +# Include <linux/export.h> only when you use EXPORT_SYMBOL(). That's it.
> +#
> +# However, some headers include <linux/export.h> even though they are completely
> +# unrelated to EXPORT_SYMBOL().
> +#
> +# One example is include/linux/module.h. Please note <linux/module.h> and
> +# <linux/export.h> are orthogonal. <linux/module.h> should be included by files
> +# that can be compiled as modules. In other words, <linux/module.h> should be
> +# included by EXPORT_SYMBOL consumers. In contrast, <linux/export.h> should be
> +# included from EXPORT_SYMBOL providers, which may or may not be modular.
> +# Hence, include/linux/module.h should *not* include <linux/export.h>.
> +#
> +# Another example is include/linux/linkage.h, which is completely unrelated to
> +# EXPORT_SYMBOL(). Worse, it is included by most C files, which means, most C
> +# files end up including <linux/export.h>, even though only some of them
> +# actually export symbols. Hence, include/linux/linkage.h should *not* include
> +# <linux/export.h>.
> +#
> +# Before fixing such headers, we must ensure that C files using EXPORT_SYMBOL()
> +# include <linux/export.h> directly, since many C files currently rely on
> +# <linux/export.h> being included indirectly (likely, via <linux/linkage> etc.).
> +#
> +# Therefore, this check.
> +#
> +# The problem is simple - the warned files use EXPORT_SYMBOL(), but do not
> +# include <linux/export.h>. Please add #include <linux/export.h> to them.
> +#
> +# If the included headers are sorted alphabetically, please insert
> +# <linux/export.h> in the appropriate position to maintain the sort order.
> +# For this reason, this script only checks missing <linux/export.h>, but
> +# does not automatically fix it.
> +check_missing_include_linux_export_h () {
> +
> +	git -C "${srctree:-.}" grep --files-with-matches -E 'EXPORT_SYMBOL((_NS)?(_GPL)?|_GPL_FOR_MODULES)\(.*\)' \
> +	    -- '*.[ch]' :^tools/ :^include/linux/export.h |
> +	xargs git -C "${srctree:-.}" grep --files-without-match '#include[[:space:]]*<linux/export\.h>' |
> +	xargs printf "%s: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing\n" >&2
> +}
> +
>  check_tracked_ignored_files
> +check_missing_include_linux_export_h


