Return-Path: <linux-kbuild+bounces-12319-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBGaLtvWxmmtPAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12319-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 20:13:31 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC7A349F89
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 20:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 233EE303C26A
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Mar 2026 19:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C1434CFDA;
	Fri, 27 Mar 2026 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+GfUrat"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020C52248A3;
	Fri, 27 Mar 2026 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774638695; cv=none; b=eVJ4vBm5wAF9AczbtL2x9hVtdfv6PK7Wik4v1uJL/mIaLXqkygXtNHqMyOICDE158vY9f408Xsf9YKwmXwVYIgYC2mCK9D+pglQeQYSQ/mekAcGXfZGeayCBtEwRNZPwK20rAkBDn9I6mpyvLhD3qon6eR4CT15v49J9iEg42kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774638695; c=relaxed/simple;
	bh=t8Yr6+ZLvGtmAjyiVKHKGVaZC9GwRGsV2qawDIHvUE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjlbBssKgHwjvIdFSVgmntMW0ArQbIQDHDU6uWg4BJYo1Ubeec8EEfOuflhayZHJvwyfN1rq+RsTFVr6QTBJnINRDB2mCbHKwaZastfwdurkcX2TZp96jWWdaQ+4TSjfryozeNWwwrOFV23rueUKM+T4j8T9J5krHHNHI3BT1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+GfUrat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F08C19423;
	Fri, 27 Mar 2026 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774638694;
	bh=t8Yr6+ZLvGtmAjyiVKHKGVaZC9GwRGsV2qawDIHvUE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+GfUratGpESdGIj8JQK9CmlGpyY2f5RSHcSHSOiNGoK624fq0dDRt7r3atKyoLbt
	 MMOAUcMMtKcnS7tr8s4/3177/kRn3qsDdHoJDtZBT8IxXguy5jkP8MEgANVRwj39VZ
	 eZ/BBHRKEJudYPAo5s1nIsfaqDw0bmvvFeHKhdeh+tWF//TdhCcspj+/Np431ec3IZ
	 o9X/LJ6TMwEkw0L3QAIDmJRUjI99MEjdx9XO+ldzPZO0VLJxqXEmpo0VFDitdlk+50
	 VJoL439a4FBDlrgYWcqH6aJwfoVTNiFvRcj4ZmK0DRXTMJXhOWqW8GHKP5AosZRKq8
	 5am1xd5oJCR8A==
Date: Fri, 27 Mar 2026 20:11:14 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: modules-cpio-pkg: Respect INSTALL_MOD_PATH
Message-ID: <acbWUo2DTs8-ljEA@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Janne Grunau <j@jannau.net>, Nathan Chancellor <nathan@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-kbuild-modules-cpio-pkg-usr-merge-v3-1-ef507dfa006c@jannau.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12319-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email]
X-Rspamd-Queue-Id: 4BC7A349F89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:30:29AM +0100, Janne Grunau wrote:
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
> Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
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

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

