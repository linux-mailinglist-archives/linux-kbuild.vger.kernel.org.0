Return-Path: <linux-kbuild+bounces-2465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D392D3EF
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 16:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EE501F21119
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 14:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A784193448;
	Wed, 10 Jul 2024 14:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="hHMwefW7";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="blcN5B9K";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="bPkwb7ts"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F6193085
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2024 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720620868; cv=none; b=o0G4WD+YhmNpA6v7RMvyu6t8F+Fw0txJJYfs458iSV9ljmZ42/ECgViJoYlP8IB2XXh8mYgJwDc/YI56K8u3xA7kxLUjyWnws2Cj76nEbf+QQ2qNrmLZUzg4n5bvuRVpce9oUvGwZCxjN8bEAnCBsy+v2KELqN6grbjLiPTbQ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720620868; c=relaxed/simple;
	bh=ylJvQe6yXouhmyqUSCrQeKd2FVJi8wNyp4Lk/QcsRHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+qZokVgCaSTH6tNF2lqdsDIGwDEUWklrOYEgN7Ewc66yYXkXbkwAEU9HoOEIJN1+S43hGfGgiKSaP68FUYnPuLaWvdahG1YOrzs2UWdPigcB6j373PvdLFOVTxwCMniQkHgaeDqBr9jhYyRTvbsSlaWJU/c8AuFUiPdVrHXelA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=hHMwefW7 reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=blcN5B9K; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=bPkwb7ts; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1720621762; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=B95DLpOylAGhXz+VZW5A2sqA7NLZQCORkGzGzk+hZlI=; b=hHMwefW7Q1jvMUNueWG2vJhbYZ
	e0EMv2e1alrH8n8Z6KR+Di/WRisUnF51JsjDwojevz1UFEdJkhS+c+ilYwjmi7x+PATPs86Qz/Uq5
	8crfehx16clv7/c1KrfnnDuW5o1tmbyoS10qE+rWRLGiySmba6FC1O0E+0KH+26dl/AeabboMUFOi
	UDtJPjmmRS+iKa9A0OGb1C39edQ0tM+ToN+h8SN2kXzJvEhs3EIarbw6nhK0j/d6i4KmUI3mtR12f
	58DN2k+XYdMRxwM5Yxrn+KaSbFUx0SXi9LmEU3oFBeDMQqQuYFexAcfHkzTbxlj3CA4KG7b/8rmDk
	xdVfjruw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1720620862; h=from : subject :
 to : message-id : date;
 bh=B95DLpOylAGhXz+VZW5A2sqA7NLZQCORkGzGzk+hZlI=;
 b=blcN5B9KzAJVXgVtIT6mx3ga8EPO4ZmgnXUIZgf+E0DmICZJ2DVgy2/lQz7fomVkzSyKF
 KO4Qi8CKqSbithIz+Iv/mgP0NoN1aVOzQk/kFF2Mcogg4X+urcRzxlg8vicpwv1U2jgUQR+
 ehVnQS/vW3Y83tBh/2zE8i43Mn3v216j9vx6DwHzSUr5y0/8i883CYKly4np6ClVUZvLqCD
 7VxpuQ9Bzo8+dUWjcOrCxb5nH5RICDW8Q4qqLunaLVYfnGpF894+2NB3cKls4MbI9ev+QIH
 /6jV9Bb6HsKNQJ5Aob9soXVeKJ01YS9cbNMFUiSj3PtOWQgKu071dmETXNiw==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sRY4W-TRk40I-G0; Wed, 10 Jul 2024 14:13:29 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sRY4V-4o5NDgrfRah-kvCR; Wed, 10 Jul 2024 14:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1720620805; bh=ylJvQe6yXouhmyqUSCrQeKd2FVJi8wNyp4Lk/QcsRHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPkwb7tsmdh0wR6PQbfXsJZHLuzG/mpHDAf+JosnWnckle4q8Y5E5s4lvNoJIKaXX
 7Sldr6FqT6x64ZpPU7uwJLXGe6wu7xU4Ch3JZj5GK2Nsps7mzAjlOBMQIwc4ODc5RO
 QhM1aQyC3dHd1lKHh/s/NQvACT+/lMLrxqK6Q/88=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 328623E8DB; Wed, 10 Jul 2024 16:13:24 +0200 (CEST)
Date: Wed, 10 Jul 2024 16:13:23 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Fangrui Song <maskray@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: Make ld-version.sh more robust against
 version string changes
Message-ID: <Zo6XAwaC3PJQwVG4@fjasle.eu>
References: <20240707-update-ld-version-for-new-lld-ver-str-v2-1-8f24421198c0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240707-update-ld-version-for-new-lld-ver-str-v2-1-8f24421198c0@kernel.org>
X-Smtpcorp-Track: eTexs5OXSMEY.b2vN8fLEcTUI.NKekfQdZ-Wy
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286s9eurscF3g
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Sun, Jul 07, 2024 at 10:06:47PM -0700 Nathan Chancellor wrote:
> After [1] in upstream LLVM, ld.lld's version output became slightly
> different when the cmake configuration option LLVM_APPEND_VC_REV is
> disabled.
> 
> Before:
> 
>   Debian LLD 19.0.0 (compatible with GNU linkers)
> 
> After:
> 
>   Debian LLD 19.0.0, compatible with GNU linkers
> 
> This results in ld-version.sh failing with
> 
>   scripts/ld-version.sh: 18: arithmetic expression: expecting EOF: "10000 * 19 + 100 * 0 + 0,"
> 
> because the trailing comma is included in the patch level part of the
> expression. While [1] has been partially reverted in [2] to avoid this
> breakage (as it impacts the configuration stage and it is present in all
> LTS branches), it would be good to make ld-version.sh more robust
> against such miniscule changes like this one.
> 
> Use POSIX shell parameter expansion [3] to remove the largest suffix
> after just numbers and periods, replacing of the current removal of
> everything after a hyphen. ld-version.sh continues to work for a number
> of distributions (Arch Linux, Debian, and Fedora) and the kernel.org
> toolchains and no longer errors on a version of ld.lld with [1].
> 
> Fixes: 02aff8592204 ("kbuild: check the minimum linker version in Kconfig")
> Link: https://github.com/llvm/llvm-project/commit/0f9fbbb63cfcd2069441aa2ebef622c9716f8dbb [1]
> Link: https://github.com/llvm/llvm-project/commit/649cdfc4b6781a350dfc87d9b2a4b5a4c3395909 [2]
> Link: https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html [3]
> Suggested-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Move to a pattern matching notation with remove largest suffix to
>   remove everything after just numbers and periods.
> - The LLVM change that prompted this has been partially reverted to
>   avoid this problem, so reword commit message to reflect this is being
>   done defensively. As such, remove 'Cc: stable@vger.kernel.org'. If it
>   is needed there at some point, it can just be manually backported (or
>   it will just get AUTOSEL'd).
> - Add tags for Fangrui's suggestion and review on v1.
> - Link to v1: https://lore.kernel.org/r/20240704-update-ld-version-for-new-lld-ver-str-v1-1-91bccc020a93@kernel.org
> ---
>  scripts/ld-version.sh | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index a78b804b680c..b9513d224476 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -57,9 +57,11 @@ else
>  	fi
>  fi
>  
> -# Some distributions append a package release number, as in 2.34-4.fc32
> -# Trim the hyphen and any characters that follow.
> -version=${version%-*}
> +# There may be something after the version, such as a distribution's package
> +# release number (like Fedora's "2.34-4.fc32") or punctuation (like LLD briefly
> +# added before the "compatible with GNU linkers" string), so remove everything
> +# after just numbers and periods.
> +version=${version%%[!0-9.]*}
>  
>  cversion=$(get_canonical_version $version)
>  min_cversion=$(get_canonical_version $min_version)
> 
> ---

thanks!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

