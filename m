Return-Path: <linux-kbuild+bounces-4482-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 858C69BA27D
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 22:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41DFB28177A
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 21:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6188214AD3F;
	Sat,  2 Nov 2024 21:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="3NGpoynz";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="BjqJSW96";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="KKzTCGa+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i702.smtp2go.com (e2i702.smtp2go.com [103.2.142.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279E1AB6DA
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730581790; cv=none; b=q8JHv6djGbo/TqV3LwJaZjHfFVNQvopReOwpS8WSpbdtUgNErwrtyYkOybw8zC4INoafYMLkxT7JxCEkz/kQOcPD/IThk2J2e71NP8xq4d9xnta7HhP8K+RKGPiVvVJoEKiXeq/Z6HLe/Qt9tAMSw3zwOBmvZ9GK4ZNQTX7qiFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730581790; c=relaxed/simple;
	bh=tiwcA2mc1WQr+R6jsbhIDkfhLen55n2x5iNFaolg2H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7QTe8tqSWrVZX5FMWwPsrlGsSEXtk9rLTFNpUfLWHpB+ooNU/Xq7nZ6+ss2BjM54o+PrldleWO8g8VUc6lHKuQKdDuLoExLi+VxuPACpZSgTuMz42zaJWgGkMXN2gChlG4Bs0KMa3cH8mIXyJMNSuCIj2LGVsKYR8n7tCBYBKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=3NGpoynz reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=BjqJSW96; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=KKzTCGa+; arc=none smtp.client-ip=103.2.142.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1730582681; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=cYbGCdWLDcK/fa4xMH76drWxCLb/A8Fth5w9QGl8Hsg=; b=3NGpoynzTSPpa/iHNoOAfPz6TJ
	nMd6+KiiPcXcqsVPXdLOp8pragXPKpv+bJE8B8g9xrEOCiy1FlfWYYwOU91o2/rQRhD7eL+tqs/lt
	6JGqJgU+QLH1iARfL6ctEeCl6tJ7Zzr8frIuUNj535xVrg1R/wLxY0pyMXuhzGyGFKEqRueNE55C+
	+EbIgqvQdyTYVXCjRRi+Aw1Va8kBFgCvM/WbJ+4rg4dqM0kUIUa/edo6urkzUvZ53Z9B7yHlrIbJb
	0dFhM7/F/2R+w5xyMkJnuWUR57zj6QWEuVTdWQS9w/mHnyKiJ/ghjMBrvyooZk7jzrS+Czsfr0Xjl
	EreBpOPQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1730581781; h=from : subject :
 to : message-id : date;
 bh=cYbGCdWLDcK/fa4xMH76drWxCLb/A8Fth5w9QGl8Hsg=;
 b=BjqJSW96Pa88gIYSE3lnaUGoRkebWfEiT1Dfofvj8DCxlAbyg8qzQgyFWoxqbvZWH8RLR
 Zt7UdaSzkU0jWkeKjxndNgtQz6+Ju8jpsqjT8yJNjYgNEHSQeT1drAoj25xYiNXSaCZM3hf
 JY+BTRtuREJppMvIyFyGGW73LcQOCM923aXFgNhkAO+I8HpvYL0/ZnEbynwUv+PFdUuCYGU
 Z7BOR7GVBgvl5flJZkzFMtAY4qgSSaKLaQZcOsIAREPNn7z7zrOJKggh2PpnB/8mxn5pmdm
 IRxuRPW5UjPTIxUwYr3LuYsOWia0hVuRZTz+fTI9q7Ojo0al9OJvHwrjqL8Q==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LMB-qt4Fb8-Sl; Sat, 02 Nov 2024 21:08:27 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1t7LMB-AIkwcC8v4Ux-Hfs8; Sat, 02 Nov 2024 21:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1730581706; bh=tiwcA2mc1WQr+R6jsbhIDkfhLen55n2x5iNFaolg2H0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KKzTCGa+sgXnFOgggLGu/fZqjXcZCUvxX/DsNRirEybtXHfaxO82ubl4ViItX9l85
 2RqpaaVaLqVf+dhmMl9m+GOJwELkZapdPD0eeVE6v1xEZRVrmt3ePVICd/bFXSqkgL
 TznTGE3FudC5CYs5TwxJKbSDWdkilYOsAIs94jLw=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 1CD713D7A3; Sat,  2 Nov 2024 22:08:18 +0100 (CET)
Date: Sat, 2 Nov 2024 22:08:18 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Morten Linderud <morten@linderud.pw>,
 Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
 Kees Cook <kees@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org,
 Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>
Subject: Re: [RFC PATCH 04/11] kbuild: don't execute .ko recipe in --dry-run
 mode
Message-ID: <ZyaUwuYIGOhZ58lS@fjasle.eu>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
 <20240819160309.2218114-5-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819160309.2218114-5-vegard.nossum@oracle.com>
X-UID: 188
X-Smtpcorp-Track: 9uiCppC_ReWl.4q1UazIgvyKU.tHL-0w2g6vG
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286st5x4QlY7W
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Aug 19, 2024 at 06:03:01PM +0200 Vegard Nossum wrote:
> Prefixing a line in a make recipe with + makes that command execute even
> in --dry-run mode. We don't need that here; remove it.

In case somebody else also wants to know why make behaves that way:
https://www.gnu.org/software/make/manual/make.html#MAKE-Variable

> 
> Fixes: 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled and pahole supports it")
> Cc: Andrii Nakryiko <andrii@kernel.org>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  scripts/Makefile.modfinal | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 696888f0a0bde..2679304f158ad 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -60,9 +60,9 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
>  
>  # Re-generate module BTFs if either module's .ko or vmlinux changed
>  %.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
> -	+$(call if_changed_except,ld_ko_o,vmlinux)
> +	$(call if_changed_except,ld_ko_o,vmlinux)
>  ifdef CONFIG_DEBUG_INFO_BTF_MODULES
> -	+$(if $(newer-prereqs),$(call cmd,btf_ko))
> +	$(if $(newer-prereqs),$(call cmd,btf_ko))

I assumed that some ld might evaluate the jobserver variables (MAKEFLAGS), but
following the discussion in [1], this does not seem to be relevant.

Can you at a note to the commit message, that there is no need to run $(LD) or
$(PAHOLE) in parallel here?

[1]: https://lore.kernel.org/all/20220616104541.16289-1-jslaby@suse.cz/#t

