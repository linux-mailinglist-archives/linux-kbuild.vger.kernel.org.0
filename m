Return-Path: <linux-kbuild+bounces-13945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qq4EFo2YTGpAmwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13945-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 08:11:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC606717CBB
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 08:11:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=c8Hh+TB9;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13945-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13945-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9E693016B94
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2026 06:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC3238735D;
	Tue,  7 Jul 2026 06:11:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE883876B8;
	Tue,  7 Jul 2026 06:11:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783404680; cv=none; b=KQoJp/Rs7KC6p5sbsBc9mJpTbUKChF5nwN/eFA5WQbB2w2Co5psvMOZSaSDB+5WUwy5XqDhxXDlRhwHTwWtV4Vr8sebufsOZCJy66NQloJcirYtcPnoQT68Q3k+GGtbiQwyMFXx7wVGQGsltAeHG4wRsTsMJ+8xcCBYxvBZUAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783404680; c=relaxed/simple;
	bh=sl3E8cC9JWrLW5kispv5DXHFFQtxHogM/QtbdMQLKag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B94uf6MyLQNQFsqJsP6cUTETegx00afmpm5olbHeNvXdjQZtRtvjYUN+Rx0JJ4LPJ5B3nmOJZXA7U7RAFo44Y6tH5sztJGJYjJr8X8Aze1BXmIQgudxb+lnlI2lWpr06OxM1Xy0FRDhbWD+MkHaMzuF4eijmsUjIc1Sek6IqsFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8Hh+TB9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id DA27A1F000E9;
	Tue,  7 Jul 2026 06:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783404679;
	bh=zLjfmSYRzCv4ekRLBX0VSDhcoHRgXCSwEUWbMXTYdNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8Hh+TB9e8hZ/lx1wYsRs5TcAinAJUOFR+4nrbky3ERJSCbbqw84oDZjy9fwn1S8s
	 4kR4eWdJBVANtMEHcrqxQEaGxQSwsgepsQm26cLrEYUSqTyeeQb7IPyPaJx0fQsgOM
	 v45wN7aP+W9HUBu9Mb6dKD4DZaPZINb3s2LJgnb0B85oev01itiaqksWapr9rX+Lru
	 /vBGGqUm/nxzPEB5S+rxEUFziv41Z3swgL3aT2xrRpFxqatZ5QhqfQNxsFN6PX/ei3
	 0qYLVmx/Zza/dRkxUmFRJi4Ntw6Dr3oymU/M1uUeTylX8jWvX10oqQCwpEIIdlrUXT
	 8LHaeRr0wuz9w==
Date: Tue, 7 Jul 2026 08:06:31 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, rdunlap@infradead.org,
	masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: warn on dead default
Message-ID: <akyXZylHRRgzzpDk@levanger>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Julian Braha <julianbraha@gmail.com>, rdunlap@infradead.org,
	masahiroy@kernel.org, grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260606140008.271929-1-julianbraha@gmail.com>
 <20260707053143.GA1381193@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707053143.GA1381193@ax162>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13945-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:julianbraha@gmail.com,m:rdunlap@infradead.org,m:masahiroy@kernel.org,m:grahamr@qti.qualcomm.com,m:nico@fluxnic.net,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,kernel.org,qti.qualcomm.com,fluxnic.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,levanger:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC606717CBB

On Mon, Jul 06, 2026 at 10:31:43PM -0700, Nathan Chancellor wrote:
> Hi Julian,
> 
> On Sat, Jun 06, 2026 at 03:00:08PM +0100, Julian Braha wrote:
> > The dead default check was originally introduced with kconfirm:
> > https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/
> > 
> > While I'm still working on that tool, it's not yet ready for inclusion
> > into the tree. I am currently waiting for common distro packagers to
> > package the parsing library before submitting the next RFC iteration.
> > 
> > However, the dead default check is more impactful than the other checks:
> > all 4 dead defaults that were detected should not have been dead and could
> > cause misconfiguration bugs. But fortunately, these were just for kunit
> > tests. The 3 patches to fix them have all since been merged:
> > commit aef656a0e6c0 ("powerpc: fix dead default for GUEST_STATE_BUFFER_TEST")
> > commit 30cc5e2ad826 ("s390/Kconfig: Cleanup defaults for selftests")
> > commit df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")
> > 
> > We can actually check for dead defaults while evaluating Kconfig, which
> > should be even more effective at preventing future instances than keeping
> > it in a static checker.
> > 
> > Note that this patch will only trigger a warning when the default values
> > are different, in other words, pure duplicate defaults won't cause a
> > warning, as they are simply redundant.
> > 
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> 
> Nicolas pushed this into -next, where it fires several times for me. I
> have not looked at these closely yet, I just wanted to get the report
> out so that more eyes could be on it.
> 
> ARCH=powerpc allmodconfig:
> 
>   arch/powerpc/platforms/Kconfig.cputype:269:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
>   arch/powerpc/platforms/Kconfig.cputype:270:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
>   lib/Kconfig.debug:1083:warning: default for 'PANIC_TIMEOUT' is unreachable: earlier default at arch/powerpc/Kconfig:350 is unconditional
>   arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/powerpc/Kconfig:482 is unconditional
> 
> ARCH=s390 allmodconfig:
> 
>   arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/s390/Kconfig:295 is unconditional
>   lib/Kconfig:372:warning: default for 'HAS_IOMEM' is unreachable: earlier default at arch/s390/Kconfig:760 is unconditional
> 
> When building with clang-23, which supports '-fms-anonymous-struct':
> 
>   init/Kconfig:978:warning: default for 'CC_MS_EXTENSIONS' is unreachable: earlier default at init/Kconfig:977 is unconditional
> 
> I think the init/Kconfig and arch/powerpc/platforms/Kconfig.cputype ones
> are intentional due to how cc-option works but I know those might be
> hard to silence because they are already evaluated by this stage if I
> understand correctly? Not sure about the other ones (apologies if they
> are already known or have fixes).

thanks for the report.  I'll remove the patch from kbuild-for-next
again as there is not obvious immediate solution visible to me right
now.

-- 
Nicolas

