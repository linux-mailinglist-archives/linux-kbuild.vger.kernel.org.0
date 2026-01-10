Return-Path: <linux-kbuild+bounces-10478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE86D0DE3A
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 22:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 949BD3017F00
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 21:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8826B23EA8C;
	Sat, 10 Jan 2026 21:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEJSVIqI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6522C1917CD;
	Sat, 10 Jan 2026 21:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768082203; cv=none; b=C0LWgdaCvt4MgxQJhDoGukEF0lvyiw02pLeCyON7kEHk5JZFsQ3xt2WKsNSPISwpvTiL0dSP4HR/zLNeg7lWSZ+P2jJaHm3+yc9e2/Dr5cWathcafIpJiQCrtg7Pk5gOiuR9prmFQVA+R0kyB+GlSbzmkiA/e+xY1jDLeq78vuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768082203; c=relaxed/simple;
	bh=6et8w84YD2+g60x0Oqba7qSYohgjjTuhKm9ovWqHLnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1vq842GxplAjhrUxRd+Vuu99KGQGWzNCKxDon8uTf0s2WNP2qujl/e136/iiPEk18QDAT+E+TNR208zxoQRJs96wscZmJroqZ9xuwernp/JyXSyI1J/lmhE9qdRDV2Uo30CKnjN6hCdJiqc0sPewftaprCRdsvNnRtPstHGVGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEJSVIqI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9107EC4CEF1;
	Sat, 10 Jan 2026 21:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768082203;
	bh=6et8w84YD2+g60x0Oqba7qSYohgjjTuhKm9ovWqHLnQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEJSVIqIzA3zE56g4Dd3RxBLGntPLuyRWvvT7jXuqgRM3vligQiOYD94oL2Z9YQO4
	 19MIlYkNUbnfzxilEImsQ2m2ghLNqWdHtYV+bWLPXkVAzLANelD0ljzLsjCmF00HND
	 1bpBx0KMVHCwkbhMrvv0MZoQA1kP65ptt4sD+OWok5bJpqFtNnGUQIuEuUDJMeMXjJ
	 yy4GFj7cKeKVGYnhTmWfHuD01TgXxIkVd3VPTA9JcP344YlS1Vwzt7XJ82k1uhQ8T/
	 01J4KyFYa9R4ty5CfbD5BJytTk6bes4C5IqyFlS9nRukIyJyLOy+5REPAfAVzCXjOk
	 3djSHsJh0oaaA==
Date: Sat, 10 Jan 2026 22:34:24 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Uday Shankar <ushankar@purestorage.com>
Subject: Re: Since 6.18.x make binrpm-pkg does not sign modules
Message-ID: <aWLF4BwQemwIZMMp@levanger>
Mail-Followup-To: Holger Kiehl <Holger.Kiehl@dwd.de>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Uday Shankar <ushankar@purestorage.com>
References: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de>
 <aWFt34dkIvlu1EYI@derry.ads.avm.de>
 <71bc53a4-9b54-c15a-96e-23fb338ac71@praktifix.dwd.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71bc53a4-9b54-c15a-96e-23fb338ac71@praktifix.dwd.de>

On Sat, Jan 10, 2026 at 12:43:26PM +0100, Holger Kiehl wrote:
> On Fri, 9 Jan 2026, Nicolas Schier wrote:
> 
> > On Fri, Jan 09, 2026 at 03:04:33PM +0100, Holger Kiehl wrote:
> > > Hello,
> > > 
> > > when building kernel with 'make binrpm-pkg' the modules in the
> > > /lib/modules directory of the rpm package are no longer signed
> > > although one sees the following during the build process:
> > > 
> > >    .
> > >    .
> > >    INSTALL /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
> > >    .
> > >    .
> > >    SIGN    /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
> > 
> > thanks for your report; well, that's interesting.  The modules signed
> > during the package build preparations ("SIGN    .../rpmbuild/BUILD/...")
> > is significantly larger than the one in the build tree (as expected, as
> > the latter is unsigned); but the one that lands in the rpm package is
> > _smaller_ than the module in the build tree.
> > 
> Reading the comment in scripts/package/kernel.spec
> 
>    # later, we make all modules executable so that find-debuginfo.sh strips
>    # them up. but they don't actually need to be executable, so remove the
>    # executable bit, taking care to do it _after_ find-debuginfo.sh has run
> 
> I would think that find-debuginfo.sh also strips the signature of the
> modules.

As the signature is just appended and not part of the actual ELF file,
that makes sense -- and signature would have become invalid due to the
stripping.

> As a quick test I replaced scripts/package/kernel.spec and
> scripts/package/mkspec in the 6.18.4 tree with those from 6.12.64 and
> then did a 'make binrpm-pkg'. Then the signature of the modules in
> the rpm package are not removed.

Thanks for the further debugging!
> 
> Looking back, it looks like this change was introduced with 6.15-rc1:
> 
> https://github.com/torvalds/linux/commit/a7c699d090a1f3795c3271c2b399230e182db06e
>    or
> https://lkml.org/lkml/2025/3/31/1313
> 
> The module signatures are needed if you run the kernel in lockdown mode.
> The kernel refuses to load unsigned modules.

Sure, signed modules should be supported by *rpm-plg targets.

A simple solution might be to call modules_sign target after the
find-debuginfo.sh run; but commit 16c36f8864e3 spunds to me as if we
should rather do something similiar as for the Debian packages:
modules_install with INSTALL_MOD_STRIP=1 and then install only the debug
infos manually.

Does that make sense?

Kind regards
Nicolas


