Return-Path: <linux-kbuild+bounces-13744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5QBuGi82LWoAeAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13744-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 12:51:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C647C67E63E
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 12:51:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OCkwsNCo;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13744-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13744-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4F613045476
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2026 10:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DC33C141A;
	Sat, 13 Jun 2026 10:50:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6736B3B2FD8;
	Sat, 13 Jun 2026 10:50:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781347848; cv=none; b=N0dkh3WnuRjtFMeVtamK9lJSdNqDxyuOguXnmEYaGi7XnpcjmZTjai+gyO494x4mONVhl9OCrGOSv8YNmiVC+9zgF6OjtMKz8ekEDes1lds3ndMcx2rxiV0AdDV26+VDmQG9sXoYNiwflnid6SMM/x2quFjPBIn+i3xoiypbEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781347848; c=relaxed/simple;
	bh=i98HnDWvV1SvE04oSmzxW6qW4ur9A8QodlcaztyhUWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiSnsS9VIWzWQvqsXSh8NQr1vXRXp3VZpQOcYr/VtVrG4oY8xwSWxDl96Z9/0U8FuVZS0FlIjJXMZ29lOtoFSlAOZ7Z2+pXZD1k99XcCAoce0F8B2lXOWaFxFQPGR9al8MCHYpayClyGmXKbu6hvIKRsWFGi62nAFjNxou0tY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCkwsNCo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 99B371F000E9;
	Sat, 13 Jun 2026 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781347847;
	bh=0vuwlRMgcSnJDb6dyIOOaRlXeq2n7gGGILVk+Jx0DiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OCkwsNCokpcv00kLd333MiVjAZSo8lSmgG1AfbZAF0fQ/lYhx1DTPAIzI33LEJSH4
	 LO5q6+CUlCgktktnFXoOnKLdh+/8veq9JJLgW94MJ6vh3upedtOnDDfAJ4fUyJQpCD
	 ZCatECeDqnPMLaJI+ddeHE71AxEohhJ/W/lrwfVkVGAXfd5UBCpYGFHOtEyjffcqIx
	 JCgADwlW0p9iUwbZUn/E6H4a7oIHJNIrNEp2h52KoUywEeBZBvTp0HLEb+Bv7Fisho
	 A8s9cp712eY+grtAHPqvkHIuC2tnYI5yMENb7irzWxq5WyKrXfhxkMo0k1a5i7MNM/
	 D2FCO++HeF5xA==
Date: Sat, 13 Jun 2026 12:13:53 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <ai0tYULNorM5UDqd@levanger>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <20260313235618.GA4171564@ax162>
 <3d6608fe-be15-497a-85a3-e6af2dbded0a@t-8ch.de>
 <20260324183501.GA3704429@ax162>
 <a31f2655-2ce8-4029-a63d-321c849730f7@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a31f2655-2ce8-4029-a63d-321c849730f7@t-8ch.de>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13744-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:nathan@kernel.org,m:arnd@arndb.de,m:macro@orcam.me.uk,m:sef1548@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,orcam.me.uk,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[levanger:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C647C67E63E

On Tue, Mar 24, 2026 at 08:58:08PM +0100, Thomas Weißschuh wrote:
> On 2026-03-24 11:35:01-0700, Nathan Chancellor wrote:
> > On Tue, Mar 24, 2026 at 06:05:34PM +0100, Thomas Weißschuh wrote:
> > > On 2026-03-13 16:56:18-0700, Nathan Chancellor wrote:
> > > > It sounds like the "< GCC 3.0" part of that might not be true based on
> > > > Maciej's research?
> > > > 
> > > >   https://lore.kernel.org/alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk/
> > > 
> > > Yes, indeed. In my opinion the consistency aspect is still sufficient
> > > to have this change. What do you think?
> > 
> > Yes, I think so. Will you keep it as going from __ASSEMBLY__ to
> > __ASSEMBLER__? It probably makes more sense that way given there should
> > be no regressions on the compiler side and that is the intended end
> > result?
> 
> I would have stuck to the old name '__ASSEMBLY__', just for robustness
> and because we are late in the cycle.
> Then we can switch it early in the next cycle.

What's the state with this?  Shall this show up in linux-next early this
cycle?

-- 
Nicolas

