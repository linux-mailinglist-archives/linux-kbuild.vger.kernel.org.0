Return-Path: <linux-kbuild+bounces-13695-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OHLWKIp7KWqcXgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13695-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:58:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E82BE66A802
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 16:58:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=vB0w3on8;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13695-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13695-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 531C730E6906
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2026 14:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15287416CE7;
	Wed, 10 Jun 2026 14:50:32 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3741325E;
	Wed, 10 Jun 2026 14:50:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781103032; cv=none; b=gzbXe246vHtsPSliiJjrS7RpDFIcjepkVt3AWPnWEf0h0hK/njV+TgV5eEn0U7ApDIpFJ0H4tu41RYChuF3k4dnhR06agX6mLrzz9L+zaYHCG4gPiyiOxMr8rBfq7F3yzQFpfh28Sx3vFZv57gDBAwXGuK1kXpdEam7cl8ZYg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781103032; c=relaxed/simple;
	bh=kEmwiT7ztaLKTE/AXyDw16pOXNuEA+bcUkuEUtNrnXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xg2YImxQTZEqorogyMzSxFtnr5GfnG8IpI8TxWWCyTSK0yrCyi/51tRWw1xx65QOClS2G+NM7qc1H5hkDmDv8bNSWSohSgdWRwcv+8fLU6gN3kneep+HHFJTQ4F6yb5KAZMO+aSJahlryOUjPkJMgAG+7AMGiZxpvrQPYanTreQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=vB0w3on8; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6cBb/7PfPr18seAAc+jd6aknLhtzGWH29hDyeS4Ef0o=; b=vB0w3on8CW+4+m7XCQiAD0sE2W
	2jix2Do0ndAYMaX/PguTiuR6HZ+hL3mBxD+DgRlz2KI2Kwebsf7uUf8CN6s3tof2Z/GpwpcRGWNe1
	+A2lHI+MheKIWTdxsIE71tUH7Gw+hk3COooxfpKhhJFfDj/1yEEB1e7Xcm4vHPj92/p8O1rQgJ0Lq
	cDijR2vtpBHqlTYjlSMvhB9sTwqT+hHHwUH0e4Oj0TOVd9WkkDS/XOO549/fKgvs7hDr/xMAX0yuk
	ZTnXYoj6iKaTP81n3Ic8LaHeFezf4ovtqypav/Lbpz6OnJnj6Z1NFUnJmBASMLO6iV+33+La4nXxY
	CAWz81Bg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wXKFx-009GU7-0L;
	Wed, 10 Jun 2026 14:50:13 +0000
Date: Wed, 10 Jun 2026 07:50:07 -0700
From: Breno Leitao <leitao@debian.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v4 3/7] bootconfig: render embedded bootconfig as a
 kernel cmdline at build time
Message-ID: <ail5fuwSj_cOHOn_@gmail.com>
References: <20260609-bootconfig_using_tools-v4-0-73c463f03a97@debian.org>
 <20260609-bootconfig_using_tools-v4-3-73c463f03a97@debian.org>
 <ebb4fb1d-effe-44c6-82dd-8223b36419a1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ebb4fb1d-effe-44c6-82dd-8223b36419a1@gmail.com>
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13695-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E82BE66A802

Hello Julian,

On Wed, Jun 10, 2026 at 02:44:52PM +0100, Julian Braha wrote:
> On 6/9/26 11:28, Breno Leitao wrote:
> > +	depends on BOOT_CONFIG_EMBED
> > +	depends on BOOT_CONFIG_EMBED_FILE != ""
> 
> Hi Breno,
> 
> Just an FYI, this dependency on BOOT_CONFIG_EMBED is redundant because
> the:
> BOOT_CONFIG_EMBED_FILE != ""
> is only possible when BOOT_CONFIG_EMBED is enabled.

Good catch, thanks. BOOT_CONFIG_EMBED_FILE itself already depends on
BOOT_CONFIG_EMBED, so the explicit line is redundant. I'll drop it!

Thanks for the review,
--breno

