Return-Path: <linux-kbuild+bounces-2221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3122990E957
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 13:25:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0366286110
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 11:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA4B13C3CC;
	Wed, 19 Jun 2024 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="o03NThbF";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="d4VuSEDO";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="ZZEmhqtw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5861A13A3E7
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Jun 2024 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796258; cv=none; b=DAcEDYjaeSR14+cA2hjzvGpBTWvGNl+oINuXNshyQPq4b++aw4mTlM3QZko2djepP6+W56r2TxpRC4exq2ROTvypHNM4VRNtMPhSA7Z7Qfsv3pwD4AyUxO2ds5QjhhX2c5adb5lhU0059ypZFtTms9fktbjfpipuwfsSzjzAH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796258; c=relaxed/simple;
	bh=NAutyFxSP4VjKXvLicjq/fyIJbqML+ZifForgpCt1b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHV8BppxVwONMEHKUJE4z3jv9nmx2qVK+qxg3UvAoGAswQTTxfWZwyX5tQegnlDKLMh1I5u24X7Z3zKOMQKjNsZmaxB9Q7MNRLqJdwk8UZU4tbWIm+ND6NRL+hRCFsv6cPYRjJ2qVHDO6OMoXE7T1t2ToXxkCFRfHf9JHWuqhSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=o03NThbF reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=d4VuSEDO; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=ZZEmhqtw; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1718797146; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=yP8g0Jw2Gy5q84RTF1sYxILlGkYZB2hJ+cHDUm8IPUE=; b=o03NThbFMd29Lx3JUFSmrAO79b
	D5SCX0sbqWMnxnsDxxfU0QO8GTH1EACiIwh5ErUViDNDp2mEj28xQyY3VAQ5yromhjVhA6wX/igs4
	R9TegkOEPwHx3k7qBnPVnxRqzykBoiMyMMM6ODFEvEWfHuSvRrTeOyLstZT2XCqIeht/Z1qf2nhZh
	0fhDG+ySLfktkGAgHCsIyMr9JzqOkGkr3mS7mKOW/mkq5ucmlLBxxu9LGhAm+wDLK5dZAqSzlrCbU
	wUt3HOgQibL4j0Wm1Bbb5FyPo7OvOMjQgIT+VvihO3eR8iu3eYgS2MTS0AtwR9WCeMDdEqy7/GJLs
	g5SDfq5w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1718796246; h=from : subject :
 to : message-id : date;
 bh=yP8g0Jw2Gy5q84RTF1sYxILlGkYZB2hJ+cHDUm8IPUE=;
 b=d4VuSEDOfSkaPnnQIcmEEvjTmsimQ7jGN7cKZooRFa6gnVcCw+XXw1iGhvpA6N1USYljf
 ZqFEAPEPncoWUnJKkGk+0x5B5uSdiDdknQ9ZiQP7D8AOh0N/nqQlbGSFtZObsmdeIN/5uPG
 DS7KRNjySS/M09FZin6E6VlvpsKolr/6W2n5YV8/DCEs1yeEpkSKxrHP6CA2UBxrKKbRxQQ
 jTbugrt0MX0UQPOvDkvo6TUPF0dbmKvvXXGYArtrCFJ1unW9k1c92e8qwLzAccAvgwPiM+V
 uEoqcy+oEB7CH7ihcH4JpJyYWEb1U1pL4EyrNYF/nXoaV2bS//7osF1tPnGg==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sJtOa-TRk6ya-D7; Wed, 19 Jun 2024 11:22:33 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sJtOb-4o5NDgrtWcB-kWHs; Wed, 19 Jun 2024 11:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1718796149; bh=NAutyFxSP4VjKXvLicjq/fyIJbqML+ZifForgpCt1b8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZZEmhqtwqS2x5F5aTxHhkZ1xnS+1M6nDigDUWHMrfdZt9gqvWLN9Wi9VdXSBIJkRF
 Qu5CXSdmsmFde40Tmouy0mogaiiWWdoirTAkdhRE3zesg8nhzWwhiZ/FsTYf95GWQ2
 Gagqq2ObQW1vnQnDZ5s5AiEu7C3caxSlAbugzq8E=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 995503E76F; Wed, 19 Jun 2024 13:22:28 +0200 (CEST)
Date: Wed, 19 Jun 2024 13:22:28 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linux-kernel@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Brian Norris <briannorris@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] Makefile: add comment to discourage tools/* addition for
 kernel builds
Message-ID: <ZnK_dHxuj9SNmH8u@fjasle.eu>
References: <20240619062145.3967720-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619062145.3967720-1-masahiroy@kernel.org>
X-Smtpcorp-Track: CJ12NQJtZpzd.RYKjA-XECpgq.bq9kmww47uz
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sOfuMnkZRi
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Wed, Jun 19, 2024 at 03:21:42PM +0900 Masahiro Yamada wrote:
> Kbuild provides scripts/Makefile.host to build host programs used for
> building the kernel. Unfortunately, there are two exceptions that opt
> out of Kbuild. The build system under tools/ is a cheesy replica, and
> is always a disaster. I was recently poked about a problem in the tools
> build issue, which I do not maintain (and nobody maintains). [1]
> 
> Without a comment, somebody might believe this is the right location
> because that is where objtool lives, even when a more robust Kbuild
> syntax satisfies their needs. [2]
> 
> [1]: https://lore.kernel.org/linux-kbuild/ZnIYWBgrJ-IJtqK8@google.com/T/#m8ece130dd0e23c6f2395ed89070161948dee8457
> [2]: https://lore.kernel.org/all/20240618200501.GA1611012@google.com/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 471f2df86422..ba070596ad4e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1331,6 +1331,11 @@ prepare: tools/bpf/resolve_btfids
>  endif
>  endif
>  
> +# README
> +# The tools build system is not a part of Kbuild. Before adding yet another
> +# tools/* here, please consider if the standard "hostprogs" syntax satisfies
> +# your needs.
> +

Perhaps add a "See Documentation/kbuild/makefiles.rst for details." ?

I do understand the need for clarification.

Acked-by: Nicolas Schier <nicolas@fjasle.eu>

