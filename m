Return-Path: <linux-kbuild+bounces-12699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE4UBoEL1GmYqQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12699-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:37:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 101403A6AC1
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 21:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9F8B3025A6D
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 19:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862943976A0;
	Mon,  6 Apr 2026 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g7bPrbm7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61921397691;
	Mon,  6 Apr 2026 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504233; cv=none; b=BT+gywCUW2Hr8LmQIimr+JNLeNdTs4a3lHXnuEOtDZcN1PKdBm+ONbfl4qJXV71HrTLtyuKSiRxmKGPHVPXTc/IyfBVezIwz+KyOg4aYR5izktyUJgWL1tGS/4N50t8NEcfko848dhCxURP+wuynY2J+/Lt9vRC6QRW5MaDY+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504233; c=relaxed/simple;
	bh=WSuUaWdeAPySZhwWI4AMZtbrmFI3zg6JIlnbxz/mTtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hjo83p7oSNKLxrVsPN4FnAD0HFuaVr0vZ4NfPbZ36p9uhymDY9SBRDgR3SSCrR+t0zyaHjEK4gbQYcj37HdplBZW4lKNxxeIP1Xh21GMtZgmCWDBJsKGyaIuIvTW85MjgFbyH5o4bgFPMBC2yI5CERHwdlW+24Bkc3qsT1NlWMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g7bPrbm7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7CFC4CEF7;
	Mon,  6 Apr 2026 19:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775504233;
	bh=WSuUaWdeAPySZhwWI4AMZtbrmFI3zg6JIlnbxz/mTtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g7bPrbm7oPcAKTH8YTQQpbEi1d0dFhHea8jKbkXmfW4EB0lTCj3tIddJbnZjcnOrm
	 Z8BSwh64cLDyoTpbCgt71WY2bTKyj8KZLpIzUVksAZyVqYUXOvsaGJQKlirTOQgl69
	 3CHumBfAA5Kbvh6XzKlxOpkuApIv+5ma3YkG+bix2HjeTDQIAhj40wWNn6USM+f0Cv
	 Z3lYn9eQItoz7vIS1PsEfhq02nwV1BCLgHjZ9GwMOhS9uQubxjvZGPziqj3h4ZwA/8
	 6EWqo0fG+nixIBSLj6ViF0jPA6erOIAv62X+2GSE2nd4+nDAzwmbl/0k0zCghX3EL3
	 wKxAJSQVNXHZw==
Date: Mon, 6 Apr 2026 12:37:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Cc: Peter Oberparleiter <oberpar@linux.ibm.com>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] gcov: use atomic counter updates to fix concurrent
 access crashes
Message-ID: <20260406193707.GB1319599@ax162>
References: <20260402141831.1437357-1-khorenko@virtuozzo.com>
 <20260402141831.1437357-2-khorenko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402141831.1437357-2-khorenko@virtuozzo.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12699-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 101403A6AC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 05:18:31PM +0300, Konstantin Khorenko wrote:
> GCC's GCOV instrumentation can merge global branch counters with loop
> induction variables as an optimization.  In inflate_fast(), the inner
> copy loops get transformed so that the GCOV counter value is loaded
> multiple times to compute the loop base address, start index, and end
> bound.  Since GCOV counters are global (not per-CPU), concurrent
> execution on different CPUs causes the counter to change between loads,
> producing inconsistent values and out-of-bounds memory writes.
> 
> The crash manifests during IPComp (IP Payload Compression) processing
> when inflate_fast() runs concurrently on multiple CPUs:
> 
>   BUG: unable to handle page fault for address: ffffd0a3c0902ffa
>   RIP: inflate_fast+1431
>   Call Trace:
>    zlib_inflate
>    __deflate_decompress
>    crypto_comp_decompress
>    ipcomp_decompress [xfrm_ipcomp]
>    ipcomp_input [xfrm_ipcomp]
>    xfrm_input
> 
> At the crash point, the compiler generated three loads from the same
> global GCOV counter (__gcov0.inflate_fast+216) to compute base, start,
> and end for an indexed loop.  Another CPU modified the counter between
> loads, making the values inconsistent — the write went 3.4 MB past a
> 65 KB buffer.
> 
> Add -fprofile-update=atomic to CFLAGS_GCOV at the global level in the
> top-level Makefile.  This tells GCC that GCOV counters may be
> concurrently accessed, causing counter updates to use atomic
> instructions (lock addq) instead of plain load/store.  This prevents
> the compiler from merging counters with loop induction variables.
> 
> Applying this globally rather than per-subsystem not only addresses the
> observed crash in zlib but makes GCOV coverage data more consistent
> overall, preventing similar issues in any kernel code path that may
> execute concurrently.
> 
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
> Tested-by: Peter Oberparleiter <oberpar@linux.ibm.com>
> Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>

While this is obviously a fix, what are the chances of regressions from
this change? As this should only impact GCOV, this could go via whatever
tree carries GCOV patches. If Kbuild is to take this change, my vote
would be to defer it to 7.2 at this point in the development cycle so
that it can have most of a cycle to sit in -next.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 6b1d9fb1a6b4..a55ad668d6ba 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -806,7 +806,7 @@ all: vmlinux
>  
>  CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
>  ifdef CONFIG_CC_IS_GCC
> -CFLAGS_GCOV	+= -fno-tree-loop-im
> +CFLAGS_GCOV	+= -fno-tree-loop-im -fprofile-update=atomic
>  endif
>  export CFLAGS_GCOV
>  
> -- 
> 2.43.5
> 

