Return-Path: <linux-kbuild+bounces-12282-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGoZK6MxxWkP8AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12282-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 14:16:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF0335CCA
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 14:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B492930D2ECB
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 13:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF9E224B15;
	Thu, 26 Mar 2026 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYOd/acu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DFF50276;
	Thu, 26 Mar 2026 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774530591; cv=none; b=o5izMUM12Ry8Ht8BiN2YUpaIQ+Oq33REMwIRQ+079TkWjmCeMc0IXLmDb/1CqPl5hy+RnjpC4N1oSRiu4ugwdKJEbao7iwqrfuakMYJa/MRGXp6FxgPHfoEQS9TlOtwTLoOJZcxI25C2+bXrPzq7lsY3JqNFynfr0YL3UCAKebk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774530591; c=relaxed/simple;
	bh=er3KzhSuAGfHatEh8lJMvE7A0kqZ7oRX7FqUVAt4bY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIwdB+9Mo4pXWvF6Z5gQmmv/7q0fx90s7y3IV+5AP7Pv+ycnCVAZAfIgZ4lJUI6huYNQDsgQmizc6cmMNPP5XdIGTnKfsCKxFsUHOel735e+SYzDm/vGCxaAXoLsGz+kwxWJBobsEQxc5LxkN98/Dq8wfkLJxZ1H43gXWJBXIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYOd/acu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FA6C19424;
	Thu, 26 Mar 2026 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774530591;
	bh=er3KzhSuAGfHatEh8lJMvE7A0kqZ7oRX7FqUVAt4bY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYOd/acuH2hB+D5XL8xFR1uRx5UTQvLtDsOhF76D/IEBt9Kc4VPkxqjdAuQ/dIvwf
	 Cd5kGEoQfNqHN35P9EJfqaw3f5YzSdr0VEtKElZdzzL33v0gwvb8GlmoYVAfbf3Hko
	 g/rmb1Wi+FgMtysUIe0UCWkrGWfYL6LidzzRJKcfQlh+zlakgTbbUFcL3zI+ThkWhS
	 4sDaft9JZs6HASwxpTPaSFjq1ez3apPWpdDPieYGYZf0sOj8yB+Nc1gV1wHCKpjsdB
	 YhKr9Gfz/X09xL3QAdCwU4m29GDh8YDDQZDchFvgUd6YE4Mvy6j+I3r7qjBYOS7yrO
	 SyLnF6btI1obA==
Date: Thu, 26 Mar 2026 14:09:27 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <acUwBwms3Gjrujwn@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Janne Grunau <j@jannau.net>, Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
 <20260326104557.GC2137845@robin.jannau.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326104557.GC2137845@robin.jannau.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12282-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 15BF0335CCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 11:45:57AM +0100, Janne Grunau wrote:
> On Wed, Mar 25, 2026 at 03:57:25PM +0100, Janne Grunau wrote:
> > The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> > target to build a cpio containing modules") is incompatible with
> > initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> > be a link and directory at the same time.
> > Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> > that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> > module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> > 
> > Tested with Fedora distribution initramfs produced by dracut.
> > 
> > Link: https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/ [1]
> > Fixes: 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Simon Glass <sjg@chromium.org>
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> > Hej,
> > 
> > this patch allows to produce modules-cpio initramfs which are compatible
> > with initramfs with merged /lib and /usr/lib (/lib as symlink to
> > /usr/lib). I expect initramfs of distributions with merged /usr to have
> > a merged /usr as well. This is at least true for Fedora initramfs built
> > with dracut.
> > 
> > Janne
> > ---
> > Changes in v2:
> > - drop pointless avoidance of repeated slashes
> > - comment the changed Makefile rule
> > - break long modles-cpio-pkg help text to 2 lines
> > - imported Simon's Rb:
> > - add fixes tag for commit 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> > - Link to v1: https://lore.kernel.org/r/20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net
> > ---
> >  scripts/Makefile.package | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..c19b88b346d0632cc99e74617d79b07d81d48635 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -195,7 +195,8 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
> >  .tmp_modules_cpio: FORCE
> >  	$(Q)$(MAKE) -f $(srctree)/Makefile
> >  	$(Q)rm -rf $@
> > -	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> > +	# Prepend INSTALL_MOD_PATH inside the staging dir
> 
> The comment needs to be indented with spaces. With a tab it gets printed
> to the shell.
> 
> I'll send a v3 tomorrow
> 
> Janne

Please just remove the comment.  With v2 the change is such simple that
it's obvious what is done here.

-- 
Nicolas

