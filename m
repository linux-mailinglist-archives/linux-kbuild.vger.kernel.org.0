Return-Path: <linux-kbuild+bounces-11819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NBAATgfsWmOqwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11819-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:52:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16125E392
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 08:52:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26BA630CBD4B
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2026 07:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C52E3B3884;
	Wed, 11 Mar 2026 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XImaoZki"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4D1B6D1A;
	Wed, 11 Mar 2026 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773215434; cv=none; b=VlEXgjBS1ojNv1YUc0WrjbUe4xT5PWwJRz8qGER5fZslTAwHNRNq3vSwUcOWvt6tOuPNfUBu5DbClpHveiP0TPF1OlngCJw1kPD+sSNEvXID26ZIEsMZ6i7WRu0ZypRw1pD3+87/iuXeUEXUQW33JNh7DC1GjBk0cAQXqXa8Ek4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773215434; c=relaxed/simple;
	bh=TPqfF6jw0R5g2O3GUs8yhxDT+n1cNC2GAS1b6xHgG50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpbz5R2nc02RqkXN1zC9ioYDZI1VLwiOZl3mPc26FWEEvBkTjWtTgVRCMVwJ0+SgUbx/6Z2H8SbFBBYvsr5WjFAhEDhwI+r7PYbTSA9scD7/g6/wKq/c3u6o+RfeK7eDFnQXc6NSK9sXwDSbcABzfirW1UqCD0rW2sQkbYez5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XImaoZki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80AE4C4CEF7;
	Wed, 11 Mar 2026 07:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773215434;
	bh=TPqfF6jw0R5g2O3GUs8yhxDT+n1cNC2GAS1b6xHgG50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XImaoZkiXWLydeA+8FYf2g/zyWxQ6B36Kt6xwfoecNYLdqz0EzBTQb/93D7xZ1fIp
	 704rq3A0Jj5t+oUJVcpZFRjmRBerdpxiUX4I9fEYbWK/ogZwPiArjPh7QDPSmc8iKv
	 Hcg0qSpuxpC4dzCt8p5FrVKpo7BW7KJ/iom/sewQ3RKxNKINmIpuoOKjQFjm+LGlWC
	 QcXQIvrRpZhyq6hPBmesnPSZIp2RN5hprnNkyLO876dn3spMNDNRVouKoKLT5tteWl
	 lBsfjshuv8DknjVqNvFAKqAuWPmWlSCUQAMecNLAtWIHe/HzkdpY09isApqIc4uS7h
	 hUoDKfcwXEKYw==
Date: Wed, 11 Mar 2026 00:50:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH 0/3] Fix merge_config.sh
Message-ID: <20260311075029.GB1996626@ax162>
References: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-fixes-merge-config-v1-0-beaeeaded6bd@samsung.com>
X-Rspamd-Queue-Id: 7B16125E392
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11819-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,samsung.com:email]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 12:36:22PM +0100, Daniel Gomez wrote:
> Restore empty base file support introduced by a26fe287eed1 ("kconfig:
> merge_config: use an empty file as initfile") broken by the awk
> refactoring in 5fa9b82cbcfc ("scripts: kconfig: merge_config.sh:
> refactor from shell/sed/grep to awk"). Also fix POSIX compatibility for
> non-bash /bin/sh and clean up whitespace.
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> ---
> Daniel Gomez (3):
>       scripts: kconfig: merge_config.sh: pass output file as awk variable
>       scripts: kconfig: merge_config.sh: fix indentation

Thanks, I have tentatively applied these to kbuild-fixes-unstable,
pending further comments and reviews from folks. I will send out a
message when they are formally applied to kbuild-fixes.

>       scripts: kconfig: merge_config.sh: use POSIX test operator

Someone else submitted a patch a couple of days ago for this, it is
already in kbuild-fixes:

  https://git.kernel.org/kbuild/c/3b4a3a00de8770f3a60c1fa483921ce37415132d

Cheers,
Nathan

