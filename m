Return-Path: <linux-kbuild+bounces-3198-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5BA95DDCE
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 14:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0665FB217FA
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Aug 2024 12:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5D71DFFB;
	Sat, 24 Aug 2024 12:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="Hf7eyqrb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763463B9;
	Sat, 24 Aug 2024 12:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724502825; cv=none; b=qG13byE9KM27h4eqROKeTE3SzqZ+CIoV2NRoyWHmYuBIXUqh29pbuLD0Aong4xYYor08Blmm2r/U5QWq2q0RAQD+USWC1nwM7iPBh6czwRLHyPL7Rx2HYzJN3ANr2hPSBLPW+/BDnJLPaLJynCS45Yni2q/lGZjU+NcgLgYpat0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724502825; c=relaxed/simple;
	bh=kLMQKD6AlTLCvz2M0eF3JeZm2EiHAr4BO41+tVt+JpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vew8Rsvsgnyy+dN7VXWEP16p50OXECTnwJml4Ki7v0O1eq0EFh/mY91YqmdAopIeyH9MikPOevqVT1GidjZj1E6Jy6XCie7GqRs43WDz4m8ChQf5MyOkQcCjRYB0S15Or9yDF0au7TZRWfTcf/kj2K7BBShnWHDaJDwpRtqU0YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=Hf7eyqrb; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1724502433; bh=kLMQKD6AlTLCvz2M0eF3JeZm2EiHAr4BO41+tVt+JpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hf7eyqrbDJNO9naH9LQDSaxpNoFo+fKisKefIB9a6dpuVZ5eZ2BIWZJM64VoGcPdQ
	 ecZmtuTh8trrXWk6zn9d+m2rObJl0kTtGbntkRdCevjRc6AmgfWnXMU7rxatPdg/AT
	 Ga7OQjO/BCtXM4fS5zkozddPi8haFUB3zQOYpGi0=
Date: Sat, 24 Aug 2024 14:27:12 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 3/4] kbuild: slim down package for building external
 modules
Message-ID: <7186b180-6b1f-4b64-9bab-78068822024b@t-8ch.de>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
 <20240727074526.1771247-4-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727074526.1771247-4-masahiroy@kernel.org>

Hi Masahiro,

On 2024-07-27 16:42:03+0000, Masahiro Yamada wrote:
> Exclude directories and files unnecessary for building external modules:
> 
>  - include/config/  (except include/config/auto.conf)
>  - scripts/atomic/
>  - scripts/dtc/
>  - scripts/kconfig/
>  - scripts/mod/mk_elfconfig
>  - scripts/package/
>  - scripts/unifdef
>  - .config
>  - *.o
>  - .*.cmd
> 
> Avoid copying files twice for the following directories:
> 
>  - include/generated/
>  - arch/*/include/generated/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/package/install-extmod-build | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> index 8cc9e13403ae..cc335945dfbc 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -9,15 +9,22 @@ is_enabled() {
>  	grep -q "^$1=y" include/config/auto.conf
>  }
>  
> +find_in_scripts() {
> +	find scripts \
> +		\( -name atomic -o -name dtc -o -name kconfig -o -name package \) -prune -o \
> +		! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o -type l \) -print
> +}
> +
>  mkdir -p "${destdir}"
>  
>  (
>  	cd "${srctree}"
>  	echo Makefile
>  	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
> -	find include scripts -type f -o -type l
> +	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
>  	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
> -	find "arch/${SRCARCH}" -name include -type d
> +	find include \( -name config -o -name generated \) -prune -o \( -type f -o -type l \) -print
> +	find_in_scripts
>  ) | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${destdir}"
>  
>  {
> @@ -25,12 +32,15 @@ mkdir -p "${destdir}"
>  		echo tools/objtool/objtool
>  	fi
>  
> -	find "arch/${SRCARCH}/include" Module.symvers include scripts -type f
> +	echo Module.symvers
> +	echo "arch/${SRCARCH}/include/generated"
> +	echo include/config/auto.conf
> +	echo include/generated
> +	find_in_scripts

This now excludes include/config/kernel.release which is used to set
KERNELRELEASE, which is commonly used by Makefiles.
See Documentation/kbuild/modules.txt, other users also seem not unlikely.

IMO this specific file should be added back.


Thanks,
Thomas

