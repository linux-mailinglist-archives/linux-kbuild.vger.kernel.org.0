Return-Path: <linux-kbuild+bounces-11026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PDULScIg2lLgwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11026-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:49:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209D5E3549
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 09:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25E14301A704
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 08:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5E1C399001;
	Wed,  4 Feb 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDeJ+4Wj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C252D39525A;
	Wed,  4 Feb 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194783; cv=none; b=RWE/Cv97hSWoKREnD5R91kl2x7K5tehkh6R1vQxNdEf+8yEGgjg0uSOXHhUHAQx7LppdRpd9kuVYB73txRgZiVaSyqhXh8pK8MBNkdQDr28sRlu5fV+VYmcESr+cqeU1mSAbPQhcsauymAUBmKNKIaJeMrxvMXPubJNXTrgrC+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194783; c=relaxed/simple;
	bh=gmNMCCI5NZOsnSxNVmd/K1kyzXPGn2eU/LmGenWiOGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR5ipXP/M72eCrIx0DmBviosotzSRxnaGomGMySxaQUdMhIJShSGeZ8U3QCTQXsz7JfvaCF75JPioyitRRUIxdaJODWupk2+V8PkPmwVQdCz59NMxbM01/PgYoyYtWCinXfCCt8ZO2HgdDNVK5GiQv7QsBf8bUcegfnxYgehZ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDeJ+4Wj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EF5C16AAE;
	Wed,  4 Feb 2026 08:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770194783;
	bh=gmNMCCI5NZOsnSxNVmd/K1kyzXPGn2eU/LmGenWiOGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDeJ+4Wj2yC+G7JFjFrm9qnaVc17U5liGPQcgKgvVyxnC2eVJYKT0iw1vJQosft8Y
	 OxvJsG9JLhlbOQkZlX6RLlru8JJfdTcXYMrOa0YUT0NA22q/3Dguk+OV3t3cfj2GmO
	 od/e51+k+o4iChCys4sGUQHGW/LCGjL4g+wgCGcn43yCeBe3+6DhYrTsopqtkgqx2L
	 3DxN4tqyUGBeL3NY2WpWaSzfXz6JpEV1Y8XalvqcAUUvcoThbie7WdqGyvbXq+5E6Z
	 wX4NEC9UUD4XJfkwF/c0moOUWfvCrvnjKEHTK7+/Aj3xhPtxEUW/OkPp39wM1hXF5j
	 6xCdLeefW55Yw==
Date: Wed, 4 Feb 2026 01:46:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
	WangYuli <wangyuli@uniontech.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	James Le Cuirot <chewi@gentoo.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rong Zhang <i@rong.moe>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: do not exclude
 scripts/dtc/libfdt/
Message-ID: <20260204084617.GB3900164@ax162>
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
 <20260204021603.GA2646832@ax162>
 <fc757c51cf9412e03df6e379266ae43bad77a5bf.camel@icenowy.me>
 <ed9cd9a5d1f51b83c46ada7adb942e611c0c8a41.camel@icenowy.me>
 <20260204084517.GA3900164@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260204084517.GA3900164@ax162>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11026-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,rong.moe];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 209D5E3549
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 01:45:23AM -0700, Nathan Chancellor wrote:
> On Wed, Feb 04, 2026 at 11:27:24AM +0800, Icenowy Zheng wrote:
> > 在 2026-02-04星期三的 11:26 +0800，Icenowy Zheng写道：
> > > 在 2026-02-03星期二的 19:16 -0700，Nathan Chancellor写道：
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
> 
> As for a solution within install-extmod-build, maybe the libfdt headers
> could be included so that inadvertent inclusions of libfdt.h do not
> break the build but the link fails if the module actually tries to use
> any libfdt functions?
> 
> > Ah, forgot to place the [1] reference link, although I doubt whether
> > it's really related to the context:
> > 
> > [1] https://github.com/Icenowy/mips-loong-3nod-laptop-driver
> 
> This was helpful for testing the following diff, so thanks for providing
> it still.
> 
> Cheers,
> Nathan

Of course forgot to provide said diff...

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 2576cf7902db..45cc3863e8a7 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -25,6 +25,9 @@ mkdir -p "${destdir}"
 	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
 	find include \( -name config -o -name generated \) -prune -o \( -type f -o -type l \) -print
 	find_in_scripts
+	echo scripts/dtc/libfdt/fdt.h
+	echo scripts/dtc/libfdt/libfdt.h
+	echo scripts/dtc/libfdt/libfdt_env.h
 ) | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${destdir}"
 
 {

