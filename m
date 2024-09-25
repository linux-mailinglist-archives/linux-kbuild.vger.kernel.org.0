Return-Path: <linux-kbuild+bounces-3736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA15098615F
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 16:47:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89C94286FF7
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 14:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 270EF1B5839;
	Wed, 25 Sep 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="YYrqZx01"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE761922EB;
	Wed, 25 Sep 2024 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727273413; cv=none; b=Y295sZJWCJWnz14uptga42PY+lVZc/5pTKh+XJ8g26UActkhy6wTj/ODvYFrMUcmG4ow9jHnxBQ37qDA9V3SL2NCqIbdFh2uBgICSPypCGq6gZiDNfwzLNXbDkjsA20uco2ss9esq4strH9g7uNxdnReqNcFG5i9lEp5Mung2ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727273413; c=relaxed/simple;
	bh=jMbh8EIoBcNAiLcYUayH9PzTT/FazOE+eEcWJvKJ1wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fKR/MBzvbdNC+uWzLo0toTfAIE4Adl4JxvGTIdwFEQ+5XDKCn7G3H5eQujNmZJy1cadaGiJ9c73JlWTLGq4E/8yE088dsCDwCslkCMM8c9HqI7qJdQaHwY777IV6bDQLqbvQj5MA1H5MhHepmX+5z5myNwIVmHMpEn/e8Q7qS84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=YYrqZx01; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1727273408; bh=jMbh8EIoBcNAiLcYUayH9PzTT/FazOE+eEcWJvKJ1wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYrqZx01em46u+78Ce9xo15ynsZieKfBZb1lh4stwg7JAxNG1E9gy1SAjCxTPbfth
	 YZt5hygkbNE315aYVSeYQrHEf1hmMDZtB8LlQbObVem2sKXNm1I77bUj5uhfckGg6y
	 0gmkc7nJraWtditRn37FlVttbmsi21TXPz0FBxXs=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 25 Sep 2024 16:10:08 +0200 (CEST)
Received: from l-nschier-nb (unknown [61.8.139.63])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 79A5380515;
	Wed, 25 Sep 2024 16:10:07 +0200 (CEST)
Date: Wed, 25 Sep 2024 16:10:05 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 11/23] kbuild: check the presence of
 include/generated/rustc_cfg
Message-ID: <ZvQZvUEzQAx0aFAl@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-12-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-12-masahiroy@kernel.org>
X-purgate-ID: 149429::1727273408-DA50800A-50DB458E/0/0
X-purgate-type: clean
X-purgate-size: 1624
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:39PM +0900, Masahiro Yamada wrote:
> Since commit 2f7ab1267dc9 ("Kbuild: add Rust support"), Kconfig
> generates include/generated/rustc_cfg, but its presence is not checked
> in the top-level Makefile. It should be checked similarly to the C
> header counterpart, include/generated/autoconf.h.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3f5c273c2901..5700d08c9b57 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -780,7 +780,7 @@ else # !may-sync-config
>  # and include/config/auto.conf but do not care if they are up-to-date.
>  # Use auto.conf to show the error message
>  
> -checked-configs := include/generated/autoconf.h include/config/auto.conf
> +checked-configs := include/generated/autoconf.h include/generated/rustc_cfg include/config/auto.conf
>  missing-configs := $(filter-out $(wildcard $(checked-configs)), $(checked-configs))
>  
>  ifdef missing-configs
> @@ -1187,7 +1187,8 @@ PHONY += prepare archprepare
>  
>  archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
>  	asm-generic $(version_h) include/generated/utsrelease.h \
> -	include/generated/compile.h include/generated/autoconf.h remove-stale-files
> +	include/generated/compile.h include/generated/autoconf.h \
> +	include/generated/rustc_cfg remove-stale-files
>  
>  prepare0: archprepare
>  	$(Q)$(MAKE) $(build)=scripts/mod
> -- 
> 2.43.0
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>

