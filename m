Return-Path: <linux-kbuild+bounces-11035-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKn9BWCOg2lCpQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11035-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 19:22:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FEEB969
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 19:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 238E4300A13F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 18:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2859D347FC3;
	Wed,  4 Feb 2026 18:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVT9/HVE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3427A465;
	Wed,  4 Feb 2026 18:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228843; cv=none; b=ejzYG7lkySlgQT7XxG1YhqPD2VByuakuj8rAR0o2BeWB34IeVL/LHlrilokuDyKFa6v5oyQbmtgrWsXbH/ZJEn5iynm4a1KlqP29E5VhU40dVGjGbrID8LosqOBYhQv7SGVZ9SxmQEWpy4E72DRdFgl+cr4roT5NwGOIAoheO4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228843; c=relaxed/simple;
	bh=OJAn/nk18U9lt++VS0HtzdboxZ3Dns6CqLdxWvpKzb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zc9rp2HIIzBa5RQ2kcehW1RxifeRZ5/xOhrjS5lYqTM1F/r4uyEEMbxeIyW4gS6QIKPDGPCIAgQmhPdWH6hhrYOvfjv0aaBfEevQ7KqQbqRp2hlvnzHQu94nopPmR3uPdgC0O8I0u/vykZt6d0XwfyWjVM20BdeK1VzKCYGbAIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVT9/HVE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BC5C4CEF7;
	Wed,  4 Feb 2026 18:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228842;
	bh=OJAn/nk18U9lt++VS0HtzdboxZ3Dns6CqLdxWvpKzb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVT9/HVExBrZUevY2tvXU4LY1HfBuAmdORSGIBlCSpcZP6Y8BzJx5ol0yrGmzIY1u
	 OYA1vOpbmSlxcD/P6zGDrkX9JUCR7FuEjeM5CvYkF2hb4kdyvsEGIgkUqok+oF11hM
	 8t6mZq8msr6A8zvMcowoBt926PsAfTdWz22H8P5TuYZqbi3WY7qj/vEVDLL5T6+NBn
	 WDpAv1W3u9XStIOxzDmr5tqGbEAc4Dn9dSRNkwloRU6F5xc5pHaqFvk0Uab1ysrS+9
	 eivzZdY/UqdKfPeIZYs3Fr3rrm8aTytwS8QKLuHejCsUN2fWWUwnKaaiwvuW53sdgs
	 CPvIas4RnRy6Q==
Date: Wed, 4 Feb 2026 11:13:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
	WangYuli <wangyuli@uniontech.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	James Le Cuirot <chewi@gentoo.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: do not exclude
 scripts/dtc/libfdt/
Message-ID: <20260204181356.GA2132823@ax162>
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
 <20260204021603.GA2646832@ax162>
 <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
 <ed9cd9a5d1f51b83c46ada7adb942e611c0c8a41.camel@icenowy.me>
 <20260204084517.GA3900164@ax162>
 <CAL_JsqJdS77S8VD-smpBi_mSZ6s3C66mvh5OCzQNhWMTyvjp-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJdS77S8VD-smpBi_mSZ6s3C66mvh5OCzQNhWMTyvjp-w@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11035-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[icenowy.me,kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,rong.moe];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 795FEEB969
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 07:31:57AM -0600, Rob Herring wrote:
> On Wed, Feb 4, 2026 at 2:45 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > Ah, thanks for that information. Moving the libfdt.h bits out of
> > bootinfo.h does not seem like it would be too difficult but I am less
> > sure about asm/machine.h. Alternatively, maybe this could be avoided by
> > separating out what you would need from bootinfo.h into its own header
> > but I did not look too hard.
> 
> There shouldn't be that many locations using libfdt functions. Add the
> header where it is used. IWYU
> 
> > As for a solution within install-extmod-build, maybe the libfdt headers
> > could be included so that inadvertent inclusions of libfdt.h do not
> > break the build but the link fails if the module actually tries to use
> > any libfdt functions?
> 
> You do this and then we get to keep the work-around forever as no one
> will care. MIPS is a mess that needs to be cleaned up.

Yeah, that is a valid perspective, I won't push that further. Thanks for
chiming in.

Cheers,
Nathan

