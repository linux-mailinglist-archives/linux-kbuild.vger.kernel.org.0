Return-Path: <linux-kbuild+bounces-12265-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN4iIAWaxGmR1QQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12265-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 03:29:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EA832E5DF
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 03:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEEC0302A2E8
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 02:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0AE390CB2;
	Thu, 26 Mar 2026 02:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byiE6IKy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9E8390C83;
	Thu, 26 Mar 2026 02:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774491937; cv=none; b=dU4+MnwGCXuUDub/lGY5xQZjZL09YQqY8BwTtpnXFE+ddYULA+ngU0SnDgHbER7Gk5UsPFPlyfVXmte1zWspSMj722+HKyDJ1kRxS7pyGjiXrNMqeuCsXRjxbzsnZ6gy/XvHJG9ajsQjdJormZZ5ku6g/71PEKqqClEQC09TR1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774491937; c=relaxed/simple;
	bh=svNjc3sDlG4PKwZSJFpQ4hqOaFOKSePmWQ/NEWEEQpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1y8yd8MLFLBFedGvEVq3Fn6ah4N3Z6Ud2cK3fPmx2Olqw4opLJvnPZvlWKQkIuf9jPqeOX7PfE6kn+V4+jUzGyL9IJAiat01HYk2ynLOPw9Aua+NEb5bOHW4fD9V8WE2k20SM+ngo4JjXB04Mu528LcKxALMd2KcqZkpKAZ45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byiE6IKy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01FCC2BC9E;
	Thu, 26 Mar 2026 02:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774491937;
	bh=svNjc3sDlG4PKwZSJFpQ4hqOaFOKSePmWQ/NEWEEQpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byiE6IKy2YuA0kEWKcbgGfQWgsLC06YsH6+XZbhMXjh/8M64ksOgYp7UGRSsn/Q8v
	 l5pRtTtFEUNMV9NdDAMOh9BjNO1Kwa3wBDlf3oYtsihgdXQGw2YkPG6uMRuw/VR4aK
	 u0QR4tbN5ql6J4p1QQOjzGazOV5Ee7aYEYci9qHXrL6eX27RwZPPOuN3HIyaj5tOuH
	 0VcB6PTdWTtfqIfTc9UdIKbHAh63TpfKAeqEg5y027uW9WoXEHM2pDQEE3kiYvv6eJ
	 kYqd8M6hA9VfakCoLVtt5hNAHWBvxPMv8uEDaruxBcrFwox0J6SgVJRk7Jwsf5ugxu
	 LODrfiS2Krb+w==
Date: Wed, 25 Mar 2026 19:25:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Nicolas Schier <nsc@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <20260326022533.GA2302780@ax162>
References: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net>
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
	TAGGED_FROM(0.00)[bounces-12265-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,systemd.io:url]
X-Rspamd-Queue-Id: D1EA832E5DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 03:57:25PM +0100, Janne Grunau wrote:
> The modules-cpio-pkg target added in commit 2a9c8c0b59d3 ("kbuild: add
> target to build a cpio containing modules") is incompatible with
> initramfs with merged /lib and /usr/lib directories [1]. "/lib" cannot
> be a link and directory at the same time.
> Respect a non-empty INSTALL_MOD_PATH in the modules-cpio-pkg target so
> that `make INSTALL_MOD_PATH=/usr modules-cpio-pkg` results in the same
> module install location as `make INSTALL_MOD_PATH=/usr modules_install`.
> 
> Tested with Fedora distribution initramfs produced by dracut.
> 
> Link: https://systemd.io/THE_CASE_FOR_THE_USR_MERGE/ [1]
> Fixes: 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> Cc: stable@vger.kernel.org
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Hej,
> 
> this patch allows to produce modules-cpio initramfs which are compatible
> with initramfs with merged /lib and /usr/lib (/lib as symlink to
> /usr/lib). I expect initramfs of distributions with merged /usr to have
> a merged /usr as well. This is at least true for Fedora initramfs built
> with dracut.
> 
> Janne
> ---
> Changes in v2:
> - drop pointless avoidance of repeated slashes
> - comment the changed Makefile rule
> - break long modles-cpio-pkg help text to 2 lines
> - imported Simon's Rb:
> - add fixes tag for commit 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> - Link to v1: https://lore.kernel.org/r/20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net
> ---
>  scripts/Makefile.package | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..c19b88b346d0632cc99e74617d79b07d81d48635 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -195,7 +195,8 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>  .tmp_modules_cpio: FORCE
>  	$(Q)$(MAKE) -f $(srctree)/Makefile
>  	$(Q)rm -rf $@
> -	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> +	# Prepend INSTALL_MOD_PATH inside the staging dir
> +	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@/$(INSTALL_MOD_PATH) modules_install
>  
>  quiet_cmd_cpio = CPIO    $@
>        cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
> @@ -264,6 +265,7 @@ help:
>  	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
>  	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
>  	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
> +	@echo '                        (uses INSTALL_MOD_PATH inside the archive)'
>  	@echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
>  	@echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
>  	@echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260320-kbuild-modules-cpio-pkg-usr-merge-4266a460282c
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 

