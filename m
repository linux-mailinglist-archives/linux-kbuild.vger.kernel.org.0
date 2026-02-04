Return-Path: <linux-kbuild+bounces-11014-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD5/N6G1gmnwYgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11014-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 03:57:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE46E10ED
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 03:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FBC930773DD
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 02:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430C62D9484;
	Wed,  4 Feb 2026 02:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBb0V0wT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60D24336D
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 02:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770173829; cv=none; b=Kq8+9wyRMX+3qMuRGKFAM8Xo3L4lcPk6kEUnJ+99O7JFUofBYi15vdGahq9QZ7wlaCgWs9hzOzf7WO/0PAuqgXtZV4leXsW0tjsHam9ZvwS0o4siWGo8JlcqhrwHy6fc3bcRnz6HarulPLOd8wGQQSHZNM/HolKPGjAPaYzX8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770173829; c=relaxed/simple;
	bh=DlbWwEiVbgBsKHoC/WuJ822uchtEINuII+F+V5KaLWA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JM1ZxSbMt+ajHiKFzt+fl3ji4BSfeFqRXS1OJLrhpG0q1Aw9PwAE33d1m7Seu5cLOlpwjDQ7DYjrCNZ4JYhZDmAHFCqPzqlBGOfTe8AacydMH+LGLKdnfpKEg3QzG2t+P2+MMKmS3bI4gxFUZxv8V3FyIhlbnAzXKnpl2IUrPbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBb0V0wT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC39C2BC87
	for <linux-kbuild@vger.kernel.org>; Wed,  4 Feb 2026 02:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770173828;
	bh=DlbWwEiVbgBsKHoC/WuJ822uchtEINuII+F+V5KaLWA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FBb0V0wTB+oDTs5KhUoQ4KIqc2MKsPHzrMX6FojcNQutRnRoIVO8kbOIJczSKSd3B
	 8jBfoUuorZQ/SF9QkeAUGs4bZdHcFDU1SwNCeRyZIMhxD68j7KxQRAfLzryOINNeY0
	 gXICSTEfq04nDjUKK372WhcXThL4qAD7GK3TRKKhWjVuzsGxJnXtqfhosbQRWPHwil
	 9ZK9DtiafBwaAmMhfxsJtx2n1fovlEOrPd3zq1r3Cns5rEVYpifbSQvHF4yRoms2y6
	 jAY+ho4GkImYnPYV501mZPy2IEIM36kKYifals35dLSn3oOEySNyxbA25/H5ySk+52
	 ILj+vI8Vt0oeA==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so10174229a12.2
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Feb 2026 18:57:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpYz/Of37wk3/Zp7RRuPKeGUrusCggioME4rHHd5zXJu3/JA8GgbtJDH3NP8uSmLuO9Lq/+McrpbDubNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH11Dvt/TzlUuCowl82kHmk7Pq3G891pbdIOG2p+lNUTztVOFs
	z3r6qnP7xh0z8QSRaMcSnbgWuLu6ZeEvMjhywmomjjirgcnO1fKWqXH6jW14Bi05DFWfVKVi3ed
	sJ63UGrCeBRObp1S2RtIKPkWMHFNODQ==
X-Received: by 2002:a05:6402:1ed3:b0:658:cc59:1624 with SMTP id
 4fb4d7f45d1cf-65949ab2213mr1099322a12.5.1770173827362; Tue, 03 Feb 2026
 18:57:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn> <20260204021603.GA2646832@ax162>
In-Reply-To: <20260204021603.GA2646832@ax162>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Feb 2026 20:56:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+t4JtiZRpqVOC8D=3u3jBq2Z+CtkiCz2tt=x0JP3tj7Q@mail.gmail.com>
X-Gm-Features: AZwV_Qgk3A6AQ8YJHxr4HYROglahLLg_INfrZ2CxOFdR292eieH-ggxxCd7PjJ4
Message-ID: <CAL_Jsq+t4JtiZRpqVOC8D=3u3jBq2Z+CtkiCz2tt=x0JP3tj7Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: install-extmod-build: do not exclude scripts/dtc/libfdt/
To: Nathan Chancellor <nathan@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Nicolas Schier <nsc@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Mingcong Bai <jeffbai@aosc.io>, WangYuli <wangyuli@uniontech.com>, 
	Inochi Amaoto <inochiama@gmail.com>, James Le Cuirot <chewi@gentoo.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>, Rong Zhang <i@rong.moe>, 
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11014-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,icenowy.me,rong.moe];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8AE46E10ED
X-Rspamd-Action: no action

On Tue, Feb 3, 2026 at 8:16=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> + Rob, Saravana, and devicetree@ since this concerns files they own.
>
> On Sun, Feb 01, 2026 at 09:02:59PM +0800, Icenowy Zheng wrote:
> > There exists a header file in include/linux/ called libfdt.h that is
> > just a wrapper for libfdt header file in scripts/dtc/libfdt/. This make=
s
> > the headers inside libfdt copy at scripts/dtc/libfdt/ part of the kerne=
l
> > headers for building external modules.
> >
> > Do not exclude them, otherwise modules that include <linux/libfdt.h>
> > will fail to build externally.
> >
> > Fixes: aaed5c7739be ("kbuild: slim down package for building external m=
odules")
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>
> This does indeed bring back scripts/dtc/libfdt back into the headers
> package that I examined. However, how does including libfdt.h in an
> external module actually work, even with this change? libfdt appears to
> be built into vmlinux IIUC and I do not see any EXPORT_SYMBOLs in the
> list, so how can you actually use any of the functions from libfdt
> within the module? Would you just build and link the pieces that your
> module needs using the other source files?

Right. Modules should not use libfdt functions.

Rob

