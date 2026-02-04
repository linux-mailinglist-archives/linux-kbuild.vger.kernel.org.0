Return-Path: <linux-kbuild+bounces-11034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE0jImVKg2m0kwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11034-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 14:32:21 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF5E6720
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 14:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB6A6300D9D8
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 13:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9A02417D9;
	Wed,  4 Feb 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvqKVw8F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC66335BA
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211930; cv=none; b=OqIDARHykX2LBMKIl85pAoXbbyrokyPUXQY2T7BCnTaJmm8+mpwYN4xyo/L0Iwcgk3XLQOaKHrtI130AlTBIrrPCgKAVQJT4m5UZYUtsDR1VDMjldgBRI4SpYOgrrrgU3VQl7+xQeZK1lM1mvP68WE6TjEbInmE3qgYtV1xEJPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211930; c=relaxed/simple;
	bh=Pq6UEhrJGx8+x2d0JVw7opgY4dyWUbUN1cqSbXcoGkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPOKXICQpAdb/gRj8Zk/PDYGnRoZxR78oQDjZkCt/OwF6rF9r85hxaFmKinBF+OXg2Ye0WwDGCFoHEgHKftcDGD8W6PrUZpNNmpFo2u/Ijn+B4ms+NZLyGsM09lOiAWUPVK45oRRysunRXHxjCAHeouktNcrM17eWmk3OpUVeU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvqKVw8F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95136C2BCAF
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770211930;
	bh=Pq6UEhrJGx8+x2d0JVw7opgY4dyWUbUN1cqSbXcoGkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cvqKVw8FLXj6Y7r9/TUmsfdxWvSZF34aAWLLSmbzD0Pee1OHNdGVSLyNNIq/vM2k9
	 C7UpNeZ0xuspBror64OJqYJiiqHcgzcmv7OKYpeWpN0cwAKawOdDv7ibSJW7GoNxHT
	 vfI5+HMoXuLHZqgZ/iylqUGqvE2GPOsG+NtEH28Emd07ZUHE+75eVQPTt/5B6IaZsm
	 8qWb3CVOxxAR8BU0OHttTSFoiut6z3GFaO45IWJeaJ9L7phJwX8IEU4DoxKuTb9NX8
	 62rDa+eWAynCiOcdsDcCEDe6sV2PfeSmdzpc1Um7CT1DLZCR7JULIR6TdLe+/fL/Pl
	 DvvWzDU24uwQA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b9dfc146fso1478298a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Feb 2026 05:32:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJkdb2bQyWEQd6YIt5WtZN6LSR1RqB6JmYaxnJQK403lnOn6wyPmHNkiZT9LFYwvogqkzqcOP29I8YiTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMVIjkyoUYpL1+9lOAG33fFCsRqz258HX0D4YwVrsQz2rpXQ+F
	kAWfNpXJ3vtBRVjuPdOh+lw1/NqEKq1HLBW3cR8OeRC3BT44sUsqyEFl/22IXTpF0uW5HX0nNVU
	bwzraeeq3HBwpzVL/gr79I68v95xLHg==
X-Received: by 2002:a05:6402:5208:b0:658:bd60:43de with SMTP id
 4fb4d7f45d1cf-6594aa326d3mr2019451a12.13.1770211929106; Wed, 04 Feb 2026
 05:32:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
 <20260204021603.GA2646832@ax162> <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
 <ed9cd9a5d1f51b83c46ada7adb942e611c0c8a41.camel@icenowy.me> <20260204084517.GA3900164@ax162>
In-Reply-To: <20260204084517.GA3900164@ax162>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Feb 2026 07:31:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJdS77S8VD-smpBi_mSZ6s3C66mvh5OCzQNhWMTyvjp-w@mail.gmail.com>
X-Gm-Features: AZwV_QiKOw3uITKc60sbhZpliAa-2DuV16x0HaNs9Zf9egNmPHLoP-jjsAKLTUs
Message-ID: <CAL_JsqJdS77S8VD-smpBi_mSZ6s3C66mvh5OCzQNhWMTyvjp-w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: install-extmod-build: do not exclude scripts/dtc/libfdt/
To: Nathan Chancellor <nathan@kernel.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Mingcong Bai <jeffbai@aosc.io>, WangYuli <wangyuli@uniontech.com>, 
	Inochi Amaoto <inochiama@gmail.com>, James Le Cuirot <chewi@gentoo.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>, 
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11034-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[icenowy.me,kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,rong.moe];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: F2DF5E6720
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 2:45=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> On Wed, Feb 04, 2026 at 11:27:24AM +0800, Icenowy Zheng wrote:
> > =E5=9C=A8 2026-02-04=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 11:26 +0800=EF=
=BC=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> > > =E5=9C=A8 2026-02-03=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 19:16 -0700=
=EF=BC=8CNathan Chancellor=E5=86=99=E9=81=93=EF=BC=9A
> > > > + Rob, Saravana, and devicetree@ since this concerns files they
> > > > own.
> > > >
> > > > On Sun, Feb 01, 2026 at 09:02:59PM +0800, Icenowy Zheng wrote:
> > > > > There exists a header file in include/linux/ called libfdt.h that
> > > > > is
> > > > > just a wrapper for libfdt header file in scripts/dtc/libfdt/.
> > > > > This
> > > > > makes
> > > > > the headers inside libfdt copy at scripts/dtc/libfdt/ part of the
> > > > > kernel
> > > > > headers for building external modules.
> > > > >
> > > > > Do not exclude them, otherwise modules that include
> > > > > <linux/libfdt.h>
> > > > > will fail to build externally.
> > > > >
> > > > > Fixes: aaed5c7739be ("kbuild: slim down package for building
> > > > > external modules")
> > > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > >
> > > > This does indeed bring back scripts/dtc/libfdt back into the
> > > > headers
> > > > package that I examined. However, how does including libfdt.h in an
> > > > external module actually work, even with this change? libfdt
> > > > appears
> > > > to
> > > > be built into vmlinux IIUC and I do not see any EXPORT_SYMBOLs in
> > > > the
> > > > list, so how can you actually use any of the functions from libfdt
> > > > within the module? Would you just build and link the pieces that
> > > > your
> > > > module needs using the other source files?
> > >
> > > To be honest what I met is quite weird -- my module [1] does not use
> > > libfdt at all. However, as a MIPS platform-specific module, it
> > > includes
> > > arch/mips/include/asm/bootinfo.h, which pulls in libfdt.h.
> > >
> > > Or maybe I should prevent libfdt.h inclusion from other kernel
> > > headers?
> > > It looks like only two headers in MIPS architecture-specific code
> > > includes libfdt.h, asm/bootinfo.h and asm/machine.h .
>
> Ah, thanks for that information. Moving the libfdt.h bits out of
> bootinfo.h does not seem like it would be too difficult but I am less
> sure about asm/machine.h. Alternatively, maybe this could be avoided by
> separating out what you would need from bootinfo.h into its own header
> but I did not look too hard.

There shouldn't be that many locations using libfdt functions. Add the
header where it is used. IWYU

> As for a solution within install-extmod-build, maybe the libfdt headers
> could be included so that inadvertent inclusions of libfdt.h do not
> break the build but the link fails if the module actually tries to use
> any libfdt functions?

You do this and then we get to keep the work-around forever as no one
will care. MIPS is a mess that needs to be cleaned up.

Rob

