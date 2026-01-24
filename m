Return-Path: <linux-kbuild+bounces-10858-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aioaLzQgdWliBAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10858-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 20:40:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 572757EBD3
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 20:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5490E3001FE6
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jan 2026 19:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3A126A1AF;
	Sat, 24 Jan 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMG5/o3C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE61C84CB
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Jan 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769283632; cv=none; b=FebrXjkkx8bqoMufYzgwLWC3kaXzJOa5MRfI4QEj5gZ1Do/AJfe0PYjueneIG5o2kacoGk9Na4zBlrJb5UNok/ovWX6rj32/9Y1Z5IA1ZkEepmxK1e1UecMBT/+P9Zy6q1OKQyLz/ARTTNJlbZPSQCF1iNDidwpUhbk61l+FYAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769283632; c=relaxed/simple;
	bh=JzgGaoqhFcr+mQ+edMrcacm5xDkQgBC2RkwsE8+1KNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs5896bSIznPUdJG7+Pim4w8nCff/IEmDBRmlqQIHSdoqR1JKV2gOpG3oRjFcsFEg1hMjYtPzonXNHYgfQ92o0SU7CLDWJTgB1aXOCul0xxldtlwc1rm3dHKsNeUb5dd6pvflZJygw9lLIpNaYMFO9W3it1W4P/9y7yQpjVAqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMG5/o3C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2990C116D0;
	Sat, 24 Jan 2026 19:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769283632;
	bh=JzgGaoqhFcr+mQ+edMrcacm5xDkQgBC2RkwsE8+1KNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMG5/o3CECvPsCgLRq8t1zMw1V6MZ499WHVlK/jSQYFHSkVON8XF2HwXwaZVtvLMI
	 qMPJQmuLhI1dNXQkhsm4EhznlegjoVDp6e7uEBI6byzdaYMqZol4uY+IpI53GfPBm5
	 OKV+JCvgvdPDwh5s1YvjMSVe01O5MYirGGxso/plK5gi6Mm1/j+J9ZaR1LUvNnsJee
	 NokU642ZoblV5kmTMgrYFzygFTIvbqky5ZEPmujGYtAUn2BZ+bYIgmuo9QvJ9KDC+K
	 Vv5lvY+FlOfoJHMTTiY8okILC9I859egt7Tg+J0Dq9D4GZg0+aYEfrouyWd034bhgx
	 uxx8BNHfLxXRA==
Date: Sat, 24 Jan 2026 20:36:24 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: make olddefconfig surprises
Message-ID: <aXUfOK38XIapv1Ak@levanger>
Mail-Followup-To: Song Liu <song@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
References: <CAPhsuW48m9pPbKsiiNDnagrtF2vLYwHSZWUASirhFKgUSVrzQQ@mail.gmail.com>
 <20260123205359.GA95167@ax162>
 <CAPhsuW5XfLkAkEWVosGQFhgKj4f_Fez0G0fsT_6D1dbZuudr4w@mail.gmail.com>
 <20260123234418.GA206716@ax162>
 <CAPhsuW54fjr1tP+khcMYQ3qTjN_Eff_rm0dM4h3=TpFVwAdh5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW54fjr1tP+khcMYQ3qTjN_Eff_rm0dM4h3=TpFVwAdh5w@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10858-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 572757EBD3
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 03:57:59PM -0800, Song Liu wrote:
> On Fri, Jan 23, 2026 at 3:44 PM Nathan Chancellor <nathan@kernel.org> wrote:
> [...]
> > I do not think something like this exists (maybe a SAT solver? :P), at
> > least not as part of the kernel tree. This is basically the same thing
> > as not being able to turn on a configuration in menuconfig until you
> > have gone through and enabled all of its dependencies. I personally use
> > menuconfig when trying to create a configuration fragment for minimized
> > reproducers on top of defconfigs because it is easy to see the final
> > diff when everything is switched:
> >
> >   $ make defconfig
> >   $ make menuconfig
> >   $ git diff --no-index .config.old .config
> 
> I also use menuconfig to figure out the dependencies. The problem of
> this approach is that, if defconfig changes, specifically, if a dependency
> is changed from y to n in defconfig, the fragment may stop working.
> IOW, the fragment assumes some dependency is enabled by default,
> but there is no guarantee that the dependency will always be y in
> defconfig. This should happen rarely though.
> 
> I guess figuring out all dependencies is not too difficult? But I guess
> the reward is not very big either.
> 
> > You could start with defconfig or a more minimal configuration like
> > allnoconfig depending on how the selftests config is expected to be
> > used (as a base or merged into other configs).
> 
> Thanks for sharing these tips.
> 
> Song
> 

Have you tried to use something like

  make KCONFIG_ALLCONFIG=whatever/minimal.config make allnoconfig

?

Kind regards,
Nicolas

