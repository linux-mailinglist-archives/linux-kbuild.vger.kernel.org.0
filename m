Return-Path: <linux-kbuild+bounces-2575-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB03934084
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64B91B22197
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 16:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C629A181B99;
	Wed, 17 Jul 2024 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PQGwxwrR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E5224FA;
	Wed, 17 Jul 2024 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721234014; cv=none; b=TfoXKOlc/e0V21bkWdfK+07BmkrB1m8qDu/mgqyLfIsCZNAJ9tQJFjoJTJ9G/2nvRTi/gVbYr7TKPg0LMm6L6md1i259HJLhN3kga/dhFYc4t1NBl8KU0KDb4eRLz67MTYnD6Fjj6wZN9jZThaObu/OFaC4VWVdDqpdRottk5DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721234014; c=relaxed/simple;
	bh=UkC0sAZpE7/WRdVikjHbnqPQTCDC+XxSCjuX8q3pfp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRX/Tn3Vv/nk4GLEAjvh0lO7gq3VVpEDDYfZ+n8teVa4wB3ue22SnEKBsYtsMMoR13oAnKPnLjOPq3Vq2sAWs6XwyrwEOXRyAZEk4YfSvIcBitEWZAQoD0+BDRebATmZDWsc1sndr67aFaGlG0FQL7462LDMfXDYPBs7FhAc4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PQGwxwrR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1721234008;
	bh=UkC0sAZpE7/WRdVikjHbnqPQTCDC+XxSCjuX8q3pfp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQGwxwrRVZyGcGPG8VdfyoeXjmAWRfFso6dpzGonGXqWZ/2nWrhSgLaBJopa/qzHX
	 g3KMQMDA9gWTXx44KaHXtxXp0/KBUmieI+x6oEuL4PpaShvPVpp2jvf5sZdppfxMjM
	 wQNhAhQuyjWfy5oMiaK1xYwXXI3sYPRbWlYp/V0Y=
Date: Wed, 17 Jul 2024 18:33:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <41cf1da7-ef13-4586-9e9a-f1f8f3b34d8e@t-8ch.de>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <20240717011515.GA1230090@thelio-3990X>
 <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
 <CAK7LNARGWu8q5dAW5tYzfiSKKtZ9t8Dm9FzRoaoZhU4d-TWswQ@mail.gmail.com>
 <20240717135747.GC24892@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240717135747.GC24892@thelio-3990X>

On 2024-07-17 06:57:47+0000, Nathan Chancellor wrote:
> On Wed, Jul 17, 2024 at 05:51:21PM +0900, Masahiro Yamada wrote:
> ...
> > > > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > > > new file mode 100644
> > > > > index 000000000000..eb3957fad915
> > > > > --- /dev/null
> > > > > +++ b/scripts/package/PKGBUILD
> > > > > @@ -0,0 +1,99 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > +# Maintainer: Thomas Weißschuh <linux@weissschuh.net>
> > > > > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > > > > +
> > > > > +pkgbase=linux-upstream
> ...
> > Perhaps, this may make sense.
> > 
> > Currently,
> > pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
> > is hard-coded.
> > 
> > I do not think linux-upstream-headers make sense
> > when CONFIG_MODULE is disabled.
> > 
> > scripts/package/mkspec turns off with_devel
> > when CONFIG_MODULE is disabled.

Ack.

> Yes, I think that is a reasonable change to make. In the face of that
> potential change, would it make sense to slightly adjust the
> makedepends? pahole is only needed when CONFIG_DEBUG_INFO_BTF is enabled
> but I guess no other package building infrastructure makes dependencies
> conditional in that manner.

The pahole dependency optimization seems like an overcomplication.
Arch Linux in general is not hell-bent on minimizing dependencies,
for example there are no dev-packages at all.
Also if the kernel will require pahole in more cases it will create
churn.

> Another thing I wonder about would be allowing the user to customize the
> value of pkgbase, like
> 
>   pkgbase=${PACMAN_PKGBASE:-linux-upstream}
> 
> because unlike Debian and Fedora, multiple versions of the same kernel
> package cannot be installed at once. If I wanted to build a package
> against mainline and -next and install them side by side, I could only
> do so if they are named differently. This would allow one to provide
> PACMAN_PKGBASE=linux-mainline and PACMAN_PKGBASE=linux-next to
> accomplish that. Might be a hyper specific use case though, so I am not
> opposed to disregarding it.

Ack.

FYI linux-upstream was picked to be consistent with pkg-debian and not
to conflict with the existing linux-mainline package in AUR [0].

[0] https://aur.archlinux.org/packages/linux-mainline

