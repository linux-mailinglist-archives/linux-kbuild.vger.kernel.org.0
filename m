Return-Path: <linux-kbuild+bounces-12316-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDeZFnJcxmm+JAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12316-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 11:31:14 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D7634291A
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 11:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E7B13165B47
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 10:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90BF3B2FC2;
	Fri, 27 Mar 2026 10:24:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E23AA4ED
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 10:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607054; cv=none; b=BmXx+Szuozx/hlPsfETFv6JO0WejyVs8KCknzxRh7U6Alsc/z1eh135jdZOzpO1sIThlrtzbrZp8vng/NkeBQ1gqBOXdRrTdPFENrM8NZRSNpcHTfkwa8RhnGRVPssiyNZJkAtX4dN97kxaeYMAn84ZYhqv4+pqQNqOQmX8cI28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607054; c=relaxed/simple;
	bh=nWYlOMgtW9PYTaMfr7s+wxi9OgIs++O4f495sV6svJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGxArIlzPkdmzFDTtZPXRJYxMT2wgDS2kmyZNklnVc9d1oqUUYQ0BGdxXGeCU+YLEv6lWySolbgDVPAUgBdQuOGyDyhDaQ33ldsz2CVj7xSXh+Jg9z12HhDM6WmrWNEmzavhfXU8CRqfYn7a2xAK5rImJsHgzbD+d7SkXQ1p3d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1w64MD-0003WQ-MY; Fri, 27 Mar 2026 11:24:01 +0100
Message-ID: <2c770b8e-985d-4182-8392-cfbee745e600@pengutronix.de>
Date: Fri, 27 Mar 2026 11:24:00 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
To: Janne Grunau <j@jannau.net>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simon Glass <sjg@chromium.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:mid,pengutronix.de:url,jannau.net:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,systemd.io:url,chromium.org:email,linutronix.de:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[a.fatoum@pengutronix.de,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-12316-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: D1D7634291A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/27/26 9:30 AM, Janne Grunau wrote:
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
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Thanks,
Ahmad

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
> Janne
> ---
> Changes in v3:
> - Drop comment added in v2, change is straight forward after dropping
>   the repeated slash prevention
> - collect Thomas' and Nathan's Rb:
> - Link to v2: https://lore.kernel.org/r/20260325-kbuild-modules-cpio-pkg-usr-merge-v2-1-339ac87d82ea@jannau.net
> 
> Changes in v2:
> - drop pointless avoidance of repeated slashes
> - comment the changed Makefile rule
> - break long modles-cpio-pkg help text to 2 lines
> - imported Simon's Rb:
> - add fixes tag for commit 2a9c8c0b59d3 ("kbuild: add target to build a cpio containing modules")
> - Link to v1: https://lore.kernel.org/r/20260320-kbuild-modules-cpio-pkg-usr-merge-v1-1-cee1ad1bb7cb@jannau.net
> ---
>  scripts/Makefile.package | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 0ec946f9b905f74f8698d8d6967d22f5b76f64e0..6d36786ba31cefaf5ae2c6e2537d421b5bfb7a06 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -195,7 +195,7 @@ tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>  .tmp_modules_cpio: FORCE
>  	$(Q)$(MAKE) -f $(srctree)/Makefile
>  	$(Q)rm -rf $@
> -	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
> +	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@/$(INSTALL_MOD_PATH) modules_install
>  
>  quiet_cmd_cpio = CPIO    $@
>        cmd_cpio = $(CONFIG_SHELL) $(srctree)/usr/gen_initramfs.sh -o $@ $<
> @@ -264,6 +264,7 @@ help:
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

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


