Return-Path: <linux-kbuild+bounces-12115-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJiFA5G3vmmiYQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12115-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 16:21:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6105F2E6032
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 16:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15862300B9F7
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Mar 2026 15:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE05318BA8;
	Sat, 21 Mar 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrKAXgM1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00A40DFC5;
	Sat, 21 Mar 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106510; cv=none; b=b7JZn+aaRbxrgg/rOoix9eY3HGB68pBvQSC9d1QbPQgSksS5B/cEdKFXTabL0ckRY7xddffIEMWH9vEi4Kw+zJ7nHJIT6NOpfv+cFn1ZQ+09Phckj0JpJUL4eAuK52PDNMoeOAQkhqhAMZCbxhNM8t5pplIzLDzqetxBmHf3A78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106510; c=relaxed/simple;
	bh=907u5WBCJ4s8WuOb30TbiGpm7LvyoNFeDrgDS4NmWzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FplzlKyanS1+jncivg6coZf1Rjq+jxx7RWn433HcwY+BY3WLee/5bprYeH47f91AKfOwD68Mx6AJcWS+CqqyKyRDlWXKXe+N63vmr3mz75+zerf+vJ1CCTbjacNNFYLUz8NrpEuF1OHedEgO6vzHbnzNU3bFWSJWrtDTWbio2fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrKAXgM1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF32CC19421;
	Sat, 21 Mar 2026 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774106510;
	bh=907u5WBCJ4s8WuOb30TbiGpm7LvyoNFeDrgDS4NmWzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XrKAXgM1MQfaHBiUYnCvCQijcQT/EhuXFbGOTnziudhMXRglCcTvxpURssUxCvBUW
	 VYX2EwBxwVPCT5l8A1s8vLogFImTgLeLKWQ6KaCsoAo2t1+Il2JHRDLsNHg50Ax5Vz
	 HftT6D8DmlSTHOMyNedci4+bQ2KQUnISrJmUof6begXedwnpwAjD4Atk6qNoDG72HO
	 sROZHlzpNJI2c20SB211Z+KO5U+G229+XxFzgyhX+ihpugyZXaaTRTNNxiC36USlMU
	 leyGstbzTakF21AwNHriFxbqogRGZv0g7zlhBz7TUvdXEmk7bmTB8kXKboAwwbL9Sa
	 0KihXbIYMPOVg==
Date: Sat, 21 Mar 2026 16:18:46 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <ab621gToQqSAGHsw@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Janne Grunau <j@jannau.net>, Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net>
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
	TAGGED_FROM(0.00)[bounces-12115-lists,linux-kbuild=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,systemd.io:url,jannau.net:email]
X-Rspamd-Queue-Id: 6105F2E6032
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 03:30:32PM +0100, Janne Grunau wrote:
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
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hej,
> 
> this patch allows to produce modules-cpio initramfs which are compatible
> with initramfs with merged /lib and /usr/lib (/lib as symlink to
> /usr/lib). I expect initramfs of distributions with merged /usr to have
> a merged /usr as well. This is at least true for Fedora initramfs built
> with dracut.
> 
> I'm not sure whether the trickery to avoid repeated '/' is justified. It
> is necessary to add a slash between "$@" and a non empty
> $(INSTALL_MOD_PATH) to avoid make failures due to non existing
> .tmp_modules_cpio when INSTALL_MOD_PATH without leading slash is used.
> modules-cpio-pkg`.
> 
> Better or shorter ways to document this not completely obvious behavior
> would be appreciated.
> 
> Janne
> ---
>  scripts/Makefile.package | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..ab18cf81622ae319380528c401f9aeb6d32070c6 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -195,7 +195,9 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>  .tmp_modules_cpio: FORCE
>  	$(Q)$(MAKE) -f $(srctree)/Makefile
>  	$(Q)rm -rf $@
> -	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> +	$(Q)$(MAKE) -f $(srctree)/Makefile \
> +		INSTALL_MOD_PATH=$@$(if $(INSTALL_MOD_PATH),/$(INSTALL_MOD_PATH:/%=%)) \
> +		modules_install

Thanks for the patch along with its detailed description!

For completeness: I'd rather use $(addprefix):

    INSTALL_MOD_PATH=$@$(addprefix /,$(INSTALL_MOD_PATH:/%=%))

but as POSIX states:

| Multiple successive <slash> characters are considered to be the same
| as one <slash>, except it is implementation-defined whether the case
| of exactly two leading <slash> characters is treated specially.
https://pubs.opengroup.org/onlinepubs/9799919799.2024edition/
    
there is no need for handling possible repeated slashes here.  So, from
my point of view we can keep it as simple as:

    INSTALL_MOD_PATH=$@/$(INSTALL_MOD_PATH)

as a trailing slash in INSTALL_MOD_PATH should not be a problem here.



>  
>  quiet_cmd_cpio = CPIO    $@
>        cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
> @@ -263,7 +265,7 @@ help:
>  	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
>  	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
>  	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
> -	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
> +	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive (modules installed in INSTALL_MOD_PATH (default: /))'

Please break that line, e.g.:

	@echo '  modules-cpio-pkg    - Build the kernel modules as cpio archive'
	@echo '                        (modules installed in INSTALL_MOD_PATH (default: /))'


Fixes: 2a9c8c0b59d3 (\"kbuild: add target to build a cpio containing modules\")

Kind regards,
Nicolas


