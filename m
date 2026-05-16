Return-Path: <linux-kbuild+bounces-13177-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OueLkaOCGr4uwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13177-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 17:33:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F3B55C6A4
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 17:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B72AD300FB5A
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 May 2026 15:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF5212C11E1;
	Sat, 16 May 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghZde8Hw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB5B26CE2C;
	Sat, 16 May 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945602; cv=none; b=YTD8sgVnGAE66qL6rGWb5Wxu75orRWr9EL14vdDgdolrozcYaCCf1SXCgVXG+so4orL/JiFiyEhG7OU3tWzGo1yVBpKwvVQFCpzYvh214GbM3FuQD069KiCRRoVSi8T6NVfZEChubQkx5f5E1pY2lnRtpUKzJ0S7RTEWNSejUa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945602; c=relaxed/simple;
	bh=rXyUXkBU2Szrftesk5CYb0s9zWXk86bAPOVucK4a/0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFhQmIhQA3eBI5Hx+JmJZs6zmmjOBi+GciEGOfoDQL0dSXdMVUosXntVABZc0LvQJpItselLdExd1vdf+fnZsjYPe4Ur+MVtK+76rLe5hA8dChJGTcfl3AiotCS0Ztv7H6exevs14s8XilyayOjsNH6FLlZ7ni2ueUaARjXvftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghZde8Hw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAF1C19425;
	Sat, 16 May 2026 15:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778945602;
	bh=rXyUXkBU2Szrftesk5CYb0s9zWXk86bAPOVucK4a/0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghZde8Hw+I4PNOjsPLXusLssB7Sn/+tkK1FnVYJEKwp6Gb+0NcDCLPtzBbLY7iPB+
	 wq7yCGI7H/DeP8ZW+TCt7nsXZ5jto9/c4IdZBSauCA2H4Ry7KdmATVKG3tkaiT/JHG
	 X5dlnzzM8J3z80WNa6y+TTyNShwZt6ciadLdYhULg4o6yjJ+p5CRSieTysWOiiiWig
	 AWEGw2IflNTd9ipMwK/eSLHxGA4cywapcqRIbkdVztyFpJGTwtEwyAxRZe8Hg5j2Ej
	 d4onDqdL1KJcD4IxAOuGup1WDas0hvERSdQUbZrOVyWdDpUcK6bNZwcnm2vKFjLrwr
	 pPO7afJr1uVAA==
Date: Sun, 17 May 2026 00:33:17 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Viktor =?iso-8859-1?Q?J=E4gersk=FCpper?= <viktor_jaegerskuepper@freenet.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: pacman-pkg: make "rc" releases adhere to
 pacman versioning scheme
Message-ID: <20260516153317.GA311940@ax162>
References: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
 <bbed7fb2-11f7-4396-a89d-881972565f06@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bbed7fb2-11f7-4396-a89d-881972565f06@freenet.de>
X-Rspamd-Queue-Id: 38F3B55C6A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[freenet.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13177-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,freenet.de:email]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 04:27:39PM +0200, Viktor Jägersküpper wrote:
> On 5/15/26 23:58, Viktor Jägersküpper wrote:
> > The package versioning scheme does not enable smooth upgrades from "rc"
> > releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
> > because pacman considers that a downgrade due to the underscore in
> > pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
> > package version comparison used by pacman. Package versions which are
> > derived from said releases (e.g. built from git revisions) are
> > similarly affected. Fix this by modifying pkgver in order to remove the
> > hyphen from kernel versions containing "-rcN", where N is a
> > non-negative integer.
> > 
> > Acked-by: Thomas Weißschuh <linux@weissschuh.net>
> > Signed-off-by: Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>
> > ---
> > v1 -> v2:
> > - make the substitution more restrictive
> > - enhance commit message accordingly
> > - add Acked-by tag
> > 
> > v1: https://lore.kernel.org/linux-kbuild/20260513231745.51780-1-viktor_jaegerskuepper@freenet.de/
> > 
> > BTW this also works for something like "5.10.248-rt143-rc1" which is a
> > recent example of an "rc" release of a realtime kernel.
> > 
> >  scripts/package/PKGBUILD | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > index 452374d63c24..1213c8e04671 100644
> > --- a/scripts/package/PKGBUILD
> > +++ b/scripts/package/PKGBUILD
> > @@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
> >  	pkgname+=("${pkgbase}-${pkg}")
> >  done
> >  
> > -pkgver="${KERNELRELEASE//-/_}"
> > +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"
> 
> I will send a v3 patch later with the first substitution changed to
> match "-rcN" where N is a strictly positive integer because this is
> what we really had in the kernel so far, at least as far as I can
> remember.

Do you mean dropping the '\+' portion of the regex? If so, I think I
would rather keep what you have here since while an -rc10 is incredibly
unlikely nowadays (we pretty much never go past -rc8), it has happened
once before in 3.1:

  $ git tag -l | grep -- -rc10
  v3.1-rc10

We can leave the Debian case you pointed at earlier the way it is for
now but if we are making a change here, we might as well make it as
future proof as possible. If you (or others) really feel strongly
otherwise, feel free to ignore me :)

-- 
Cheers,
Nathan

