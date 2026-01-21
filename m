Return-Path: <linux-kbuild+bounces-10779-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M4kOzNgcWkHGgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10779-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:24:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CB85F72D
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1CC145C965B
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 23:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02F1C36828B;
	Wed, 21 Jan 2026 23:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsgHatYv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C829335E529;
	Wed, 21 Jan 2026 23:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769037415; cv=none; b=F0aqs9bUkV5BpYe+kY3zy5/wnQ0emUHB70PhyAzEGiQfTKoZM/ROV+6OU37fcBFIvp0YQPZn+RjKIyHlAPouPtj5pnkywUT9wUCNR8J49uGuVAUtC6ah0MgQxTXwZDBAwIMJN4OvM2zflmfA5qTnjkPLFpakDCm5qjwqdrq2b44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769037415; c=relaxed/simple;
	bh=qKn/84LDlI03uqGng/MoxJxBqbaU1W93TXttFgcxAgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D43XKph9m2SpQBWANSTiqP173mG5NYrcWNy3jXNmYX5GYOAdiBN1ZKmjCSBHNQG/fgMKQK/Q4pzdDAySL1vRHmxCs1mL24U+C0B7tuOkFvXPuAyu1lxUd3LlbgNwxJ7jujF29O611EpnkdgbDw00xksZoC3OX4C9Yvl8XPVz8Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsgHatYv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC19C4CEF1;
	Wed, 21 Jan 2026 23:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769037415;
	bh=qKn/84LDlI03uqGng/MoxJxBqbaU1W93TXttFgcxAgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsgHatYvV6f12kqk2MorJSZSd60noTjOvsN284N1prxq9znLGlZbjzw+4ELqOWvoU
	 jbm31AVd0BlMV3H6nI5blTKjXHPWGXBCaYCQd85sFKBeTSg+MpYfYC8k30CegM5bAQ
	 qRQAkjZEmbpCHVXnkBtXsa25hE3VmBd++hMkQN5L/aSaLsStlr9yrlgKw7gyGqBazg
	 tnHunmYAjIft+rvpuj3tqRh4CV8WRjLQUMHlz7cHz5QLMjJlS5is85tZjxOOSldkmG
	 m4U3hcwBcOoVIhGP9071WRDfmE8wbM0un+Bw0Z3rxjgyyUIqlhyLm5TAZx/HD3XUWf
	 qMPncDu98YpRQ==
Date: Wed, 21 Jan 2026 16:16:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michal Suchanek <msuchanek@suse.de>
Cc: linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: dummy-tools: Add python3
Message-ID: <20260121231651.GA601114@ax162>
References: <20260121105801.1827-1-msuchanek@suse.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121105801.1827-1-msuchanek@suse.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	TAGGED_FROM(0.00)[bounces-10779-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A5CB85F72D
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 11:57:57AM +0100, Michal Suchanek wrote:
> DRM_MSM_VALIDATE_XML depends on a python feature. Add a dummy python
> interpreter to make it possible to configure this option with dummy
> tools.
> 
> Fixes: b587f413ca47 ("drm/msm/gen_header: allow skipping the validation")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Sure, this seems reasonable, as Python may become more used for various
parts of the kernel over time.

I was thinking this could qualify as a fix for Nicolas to take now but
the help text of CONFIG_DRM_MSM_VALIDATE_XML mentions this option is
mostly targeted at drm/msm developers, so we can probably just take this
via kbuild-next.

> ---
>  scripts/dummy-tools/python3 | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100755 scripts/dummy-tools/python3
> 
> diff --git a/scripts/dummy-tools/python3 b/scripts/dummy-tools/python3
> new file mode 100755
> index 000000000000..1f3ac6541dd3
> --- /dev/null
> +++ b/scripts/dummy-tools/python3
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +true
> -- 
> 2.51.0
> 

