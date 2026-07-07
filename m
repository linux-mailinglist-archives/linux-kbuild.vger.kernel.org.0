Return-Path: <linux-kbuild+bounces-13944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bpSZAaePTGrfmAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13944-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 07:33:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 529DD717781
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Jul 2026 07:33:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Oi6peX1U;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13944-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13944-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2BF93027958
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2026 05:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B3478F39;
	Tue,  7 Jul 2026 05:31:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9E5420880;
	Tue,  7 Jul 2026 05:31:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402309; cv=none; b=uRaYeskrCDhBqwJL+uAQAmkhDllOrRes2T8QpOyjn08I4ipmMfJIp/uC2/DaIlCN9x/HALtKjvC9GNHO1m4LePk/uIPR0CbxWPmzvwOOI2AEYHXEHYc8hBTJUdG3Xl9zByp7upgbn+wyy11HK+6XF7vTakdwSgbtnffp6G5PPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402309; c=relaxed/simple;
	bh=x8TfPlVlWLucQQd+QJwiZYXy5IFMyprVf4wCHapXnDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VElZuqGPiDwr3RW4eo2JN9w1wDhhc2efS2eaJP5/k7FoLz3RqFdPJtfRqB5kCAQsdGrZx3YqKQGM5IfQLDcsV+bVTmhBZKL6L0LH+cg7tRNSkX1/iblXDLbGKisgz+z0Vt44s8dCRaWqsdxUJRqR0Py2mxaeoXNDYinJbEc5Okk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oi6peX1U; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B76E31F000E9;
	Tue,  7 Jul 2026 05:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783402307;
	bh=dhZb+HdxMV4mO9MBdmfLIaIMNojivSTO235JieamV6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Oi6peX1ULdicNwmDuwOQMwyz+5Qv3aICjvoEOOHzT1WBewk4TgyJOa/dzPfSaxgiX
	 vhkOykXaf8fr/QEdRkIw+S5PBNZuz1p761SM42QaNlONdJl/3oAjBFBhv6AgBnMWn0
	 8asYV0vdDfmEQrFrphbqVQXaRmQL91eZjWeia74XJw8yRli0Yhn9CL8CqwTXg099Fn
	 eXxh2GQ0Vr+BmzisW8pc7YNGPdRXwOCNxlBPssHLFA0t8aQRHEtJ4fxyg9ennptfju
	 xu+xgQeLGHXijgXn/eTJL58v7HU39pQFvmeNUtePDaqv3rO/R4hW6DaSi44fiQgbmX
	 Dk8QzXfOc6Cug==
Date: Mon, 6 Jul 2026 22:31:43 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org,
	grahamr@qti.qualcomm.com, nico@fluxnic.net,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kconfig: warn on dead default
Message-ID: <20260707053143.GA1381193@ax162>
References: <20260606140008.271929-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606140008.271929-1-julianbraha@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julianbraha@gmail.com,m:nsc@kernel.org,m:rdunlap@infradead.org,m:masahiroy@kernel.org,m:grahamr@qti.qualcomm.com,m:nico@fluxnic.net,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-13944-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 529DD717781

Hi Julian,

On Sat, Jun 06, 2026 at 03:00:08PM +0100, Julian Braha wrote:
> The dead default check was originally introduced with kconfirm:
> https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/
> 
> While I'm still working on that tool, it's not yet ready for inclusion
> into the tree. I am currently waiting for common distro packagers to
> package the parsing library before submitting the next RFC iteration.
> 
> However, the dead default check is more impactful than the other checks:
> all 4 dead defaults that were detected should not have been dead and could
> cause misconfiguration bugs. But fortunately, these were just for kunit
> tests. The 3 patches to fix them have all since been merged:
> commit aef656a0e6c0 ("powerpc: fix dead default for GUEST_STATE_BUFFER_TEST")
> commit 30cc5e2ad826 ("s390/Kconfig: Cleanup defaults for selftests")
> commit df75430515c3 ("drm: fix dead default for DRM_TTM_KUNIT_TEST")
> 
> We can actually check for dead defaults while evaluating Kconfig, which
> should be even more effective at preventing future instances than keeping
> it in a static checker.
> 
> Note that this patch will only trigger a warning when the default values
> are different, in other words, pure duplicate defaults won't cause a
> warning, as they are simply redundant.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Nicolas pushed this into -next, where it fires several times for me. I
have not looked at these closely yet, I just wanted to get the report
out so that more eyes could be on it.

ARCH=powerpc allmodconfig:

  arch/powerpc/platforms/Kconfig.cputype:269:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
  arch/powerpc/platforms/Kconfig.cputype:270:warning: default for 'TUNE_CPU' has the same condition as the earlier default at arch/powerpc/platforms/Kconfig.cputype:268
  lib/Kconfig.debug:1083:warning: default for 'PANIC_TIMEOUT' is unreachable: earlier default at arch/powerpc/Kconfig:350 is unconditional
  arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/powerpc/Kconfig:482 is unconditional

ARCH=s390 allmodconfig:

  arch/Kconfig:1194:warning: default for 'PGTABLE_LEVELS' is unreachable: earlier default at arch/s390/Kconfig:295 is unconditional
  lib/Kconfig:372:warning: default for 'HAS_IOMEM' is unreachable: earlier default at arch/s390/Kconfig:760 is unconditional

When building with clang-23, which supports '-fms-anonymous-struct':

  init/Kconfig:978:warning: default for 'CC_MS_EXTENSIONS' is unreachable: earlier default at init/Kconfig:977 is unconditional

I think the init/Kconfig and arch/powerpc/platforms/Kconfig.cputype ones
are intentional due to how cc-option works but I know those might be
hard to silence because they are already evaluated by this stage if I
understand correctly? Not sure about the other ones (apologies if they
are already known or have fixes).

-- 
Cheers,
Nathan

