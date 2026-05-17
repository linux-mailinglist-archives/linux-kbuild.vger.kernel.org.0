Return-Path: <linux-kbuild+bounces-13203-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFL2OFaXCWqXgwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13203-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 12:24:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4948656074F
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 12:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D222F300A8D9
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 10:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5DB34F49F;
	Sun, 17 May 2026 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uPt31HNN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7C224AF1;
	Sun, 17 May 2026 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779013459; cv=none; b=ZubYyvMjuNYry4F4kMy6eM2MKhyDRg9A/CzhETFlnyY/IkY2JHy1YDCQCMZMdkXlZyZD/hrwM+/5mMeVaPnICztqqMQP+vz12CsXTvhaCSJYnRptSpdyUj4F8WEgbEoXcmDs4/PHol4n+cdXWhHI5uZAgjI3MMuchrdTLQR1Qu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779013459; c=relaxed/simple;
	bh=An+8CvfiXuYtMX7uVmnOB4QJrSlcoZPJB8t/6H5/Mz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw+jKbq8PqQcPvOE9ZS2XXZ2pyNp+96y5Pik6q5zN7DEMiSoH5Z5Jv8xN76Wux3aRZxEdkyeqJmRlg0TmaCm0Du7vo3L2MCmK8v2wv5jMuoDGZg1Zzr5IOnqqKx3DLOmgQHCykJ0eHXrphMgSSh3S8hlbr95fo7AKwefR5h/b5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uPt31HNN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3A2C2BCB0;
	Sun, 17 May 2026 10:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779013459;
	bh=An+8CvfiXuYtMX7uVmnOB4QJrSlcoZPJB8t/6H5/Mz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPt31HNNmBrLphjw9K10R6Qg/CVMJmY1purGEw6920hTrFacYlKGzd+tk9fBkZRbI
	 /MfbQmVxzHwrEjbh+d+x76kvXo5lk3DUiU5m4SLtx8o8yGcQYSEJj0+sawm+fW6mWD
	 K5cFek6mp5eZJppXmtJXHVzvjwehvko3HE9D3xT6iN/j2zcCIDbnNp9QkayJ9APpDm
	 Cl9/n29NGKk9NTNgKOI9NYgexfD8LzvS8KcESK+AxYk40Kj4urM/tnE3CFzHLaSwZf
	 RNfMA5rYqRVxC0NAUXTgauDE3+BBu9gNZOSRvuHMiHG+wyHLbfr250+d745UkT0o0D
	 XIipeNLUH8X0g==
Date: Sun, 17 May 2026 19:24:15 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Viktor =?iso-8859-1?Q?J=E4gersk=FCpper?= <viktor_jaegerskuepper@freenet.de>,
	Nicolas Schier <nsc@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Heusel <christian@heusel.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: pacman-pkg: make "rc" releases adhere to
 pacman versioning scheme
Message-ID: <20260517102415.GA1866872@ax162>
References: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260515215913.92481-1-viktor_jaegerskuepper@freenet.de>
X-Rspamd-Queue-Id: 4948656074F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[freenet.de,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13203-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,freenet.de:email]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 11:58:45PM +0200, Viktor Jägersküpper wrote:
> The package versioning scheme does not enable smooth upgrades from "rc"
> releases to the corresponding stable releases (e.g. 7.0.0-rc7 -> 7.0.0)
> because pacman considers that a downgrade due to the underscore in
> pkgver (e.g. 7.0.0_rc7), see e.g. vercmp(8) for an explanation of the
> package version comparison used by pacman. Package versions which are
> derived from said releases (e.g. built from git revisions) are
> similarly affected. Fix this by modifying pkgver in order to remove the
> hyphen from kernel versions containing "-rcN", where N is a
> non-negative integer.
> 
> Acked-by: Thomas Weißschuh <linux@weissschuh.net>
> Signed-off-by: Viktor Jägersküpper <viktor_jaegerskuepper@freenet.de>

Nicolas, do you want to take this as a fix for 7.1 (since it seems
reasonable to correct this for folks building from upstreaam sooner
rather than later)? If so:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

Otherwise, I can pick it up for 7.2 when I am fully back online in a
couple of days.

> ---
> v1 -> v2:
> - make the substitution more restrictive
> - enhance commit message accordingly
> - add Acked-by tag
> 
> v1: https://lore.kernel.org/linux-kbuild/20260513231745.51780-1-viktor_jaegerskuepper@freenet.de/
> 
> BTW this also works for something like "5.10.248-rt143-rc1" which is a
> recent example of an "rc" release of a realtime kernel.
> 
>  scripts/package/PKGBUILD | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 452374d63c24..1213c8e04671 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -10,7 +10,7 @@ for pkg in $_extrapackages; do
>  	pkgname+=("${pkgbase}-${pkg}")
>  done
>  
> -pkgver="${KERNELRELEASE//-/_}"
> +pkgver="$(echo "${KERNELRELEASE}" | sed 's/-\(rc[0-9]\+\)/\1/;s/-/_/g')"
>  # The PKGBUILD is evaluated multiple times.
>  # Running scripts/build-version from here would introduce inconsistencies.
>  pkgrel="${KBUILD_REVISION}"
> 
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> 
> Best regards,
> Viktor
> -- 
> 2.54.0

-- 
Cheers,
Nathan

