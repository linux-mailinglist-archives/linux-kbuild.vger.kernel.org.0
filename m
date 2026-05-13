Return-Path: <linux-kbuild+bounces-13136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MHWEUacBGr3LwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13136-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 17:44:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9753660B
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 17:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E57523019FC0
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2026 15:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43F9349CCD;
	Wed, 13 May 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abon4X9K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8010288C2C;
	Wed, 13 May 2026 15:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778685796; cv=none; b=V9lowxsDLOGUAEjrVnPkf/g2ZaitS1QDazjZLzVJoxzCAXRiu5jldB79SIAvxEwliIIpvE7as2coO/f8NLgoreztT7Bo7h/CIv+dmI6ANxdp1y95sQRvbtjl8iBTe2Xrje/gvR5Y+mzlM2lapdxuXD8bf0DfBHXMBxDPQQFVFto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778685796; c=relaxed/simple;
	bh=qN2lrWAgjX43cjl92+7M1Z5hN3KqIl7NaSt5MT1B4u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1F8a10zE90wjs83nFHfBlPpyrIhv//+V4LmqD8QsCVxT7XfY3B+XbPJIoFoSn0HtM6ugybFI1OlhkMIgY428dZt3iOWCtNU/fyvEUvu1yYjFQSTB7TTs4nILgSwLLoumeF17tpbgxpb4hvDaK065oDHwJEM/CBVzNpT6xRhwqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abon4X9K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C15C19425;
	Wed, 13 May 2026 15:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778685796;
	bh=qN2lrWAgjX43cjl92+7M1Z5hN3KqIl7NaSt5MT1B4u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=abon4X9KNmscCUa7tvEUCgmZ+55unonlpL4oFgPZaQi22dMq+ScR/x4pcX/jkTz1i
	 qiTXb+yJIBXelk3IW7KEpDbmEmDYg2stqgFdpDmM5nIM/5rs+3tGgkzkfSRBnsFsIj
	 JGrUG/3MPMck7xAlyMmW2DytxKe4g5pglusyHshP2BlpD73weRxTYeERUpj3T+LJD8
	 A1YcRo6Wzw9YzNR9l/hre1iPbTct8pEo2kurzhfdqjPjjuLKCevC24b1QLlWOIyyV+
	 Sg9bdUchEf2uRt0LJMKY2BJOzIP1bPHZXz74o0ribWQN8GiwEhfD6PU4SLAGPg8xYz
	 Do9gjAetAOtNg==
Date: Wed, 13 May 2026 17:22:32 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, jani.nikula@linux.intel.com,
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org, masahiroy@kernel.org,
	ojeda@kernel.org, corbet@lwn.net, qingfang.deng@linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC v2 0/2] add kconfirm
Message-ID: <agSXOHvQqTxSsArW@levanger>
Mail-Followup-To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org,
	jani.nikula@linux.intel.com, akpm@linux-foundation.org,
	gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
	corbet@lwn.net, qingfang.deng@linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509203808.1142311-1-julianbraha@gmail.com>
X-Rspamd-Queue-Id: B0C9753660B
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
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13136-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,crates.io:url]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 09:38:06PM +0100, Julian Braha wrote:
> Hi all,
> 
> kconfirm is a tool to detect misusage of Kconfig. It detects dead code,
> constant conditions, and invalid (reverse) ranges. There are also optional
> checks to detect config options that select visible config options, and to
> check for dead links in the help texts.
> 
> The full patchset (with the vendored dependencies) is available in my
> linux fork, git branch 'kconfirm_rfc2', and is based on linux v7.1-rc2:
> https://github.com/julianbraha/linux/tree/kconfirm_rfc2

Thanks!  I like the idea of having a static analyser for kconfig!



I guess the github branch is expected to work out of the box, but on my arm64
system this fails with:

    kconfirm$ make -j8 kconfirm
    error: no matching package named `env_logger` found
    location searched: crates.io index
    required by package `kconfirm-lib v0.9.0 (/data/kbuild/kbuild-fixes/kconfirm/scripts/kconfirm/kconfirm-lib)`
    As a reminder, you're using offline mode (--offline) which can sometimes cause surprising resolution failures, if this error is too confusing you may wish to retry without the offline flag.
    make[2]: *** [Makefile:17: kconfirm] Error 101
    make[1]: *** [kconfirm/Makefile:2244: kconfirm] Error 2
    make: *** [Makefile:248: __sub-make] Error 2
    [exit code 2]

and if 'kconfirm' does not need a .config file, you want to add 'kconfirm' to
the list of 'no-dot-config-targets' in top-level Makefile.


FTR: the 'kconfirm' and 'kconfirmclean' targets need some love: both do not
really integrate in kbuild, yet: 'kconfirm' is not working with out-of-source
builds (O=...), 'kconfirmclean' should not be required if 'make clean' is
supported correctly, and 'make mrproper' removes the whole scripts/kconfirm
tree due to the change in 'scripts/Makefile'.  (Tested?)

> 
> The patches sent here with the RFC include everything other than the
> vendored dependencies, including the tool's code, the documentation, and
> the makefile changes.
> Following this discussion:
> https://lore.kernel.org/all/20260405122749.4990dcb538d457769a3276e0@linux-foundation.org/
> in which Andrew brought up the possibility of moving kconfirm in-tree,
> I've prepared this RFC to do so. See also kconfirm's introduction to the
> mailing list:
> https://lore.kernel.org/all/6ec4df6d-1445-48ca-8f54-1d1a83c4716d@gmail.com/

The large amount of changes has been mentioned often enough;  even if all the
vendored dependencies could be dropped, I am not convinced yet, that it is a
good idea to maintain kconfirm in-tree due to its project size.

IMO, we need at least someone who steps up for maintaining kconfirm and
registers in a dedicated MAINTAINERS entry.  (My own rust knowledge is not good
enough for appropriate review, I can only offer some initial testing and
frequent use when it is working/integrated.)

Kind regards,
Nicolas

