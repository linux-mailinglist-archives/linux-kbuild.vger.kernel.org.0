Return-Path: <linux-kbuild+bounces-2567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4205933E17
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 15:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D47831C20EDB
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 13:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11FE1802A4;
	Wed, 17 Jul 2024 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KE9N9A5A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82AD566A;
	Wed, 17 Jul 2024 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224669; cv=none; b=Eb1Ni0PKx6YjIJW0xF8RMVelkEvZAEHyDnkKG5LZmrJhtLE78hg+zsClWhUtyV9GW7ou6oDlyxdTB3w/pWf7jd+Dez5Itq2ODz5pS8qb2Yq8Fp6AkOCmWGEslftVZTpo7I453S+vhvheQ/hQywZJFON7xbdKVA2XprtF3yvW0dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224669; c=relaxed/simple;
	bh=WTDYTC4j9QxgDS55lJZ6UHk83ICcMmBkNZj6P0bitLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIoGkqSCkTEechZHtKi8Ua6t/uuxdYwrDkCT1vZDE6QQWqiLAV/WE2k0RzI3QIDJl3Fbrt3lGcq+7aDMPbA8mJMdOpgGKSNcw7HDzoMGPg8GJdW++sZKOXIjN9kgfcLuRgRsmgnmZOh/3OdU7EazBxoo92fpW2dF/wR1q8G3280=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KE9N9A5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF203C2BD10;
	Wed, 17 Jul 2024 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721224669;
	bh=WTDYTC4j9QxgDS55lJZ6UHk83ICcMmBkNZj6P0bitLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KE9N9A5AZ96hBtGFEGL4RSQZCg7pqn5VXRR/yS3ahvW4Xc3YrO7xa3Yz9uwv9xQfP
	 T10f7yqFEr+jGsgdOQ29JS49ShRohTCwlZCWZxH9JVLob2hjTzuTAo5Eijg38YmKY8
	 U+4xU2LxhJt3n0JDjJ4wTeBA9IPy56KLd8oQf2Rb6f8XTpziqWm0gz438QcKyoIqwW
	 U9qaoKkmbKY2BoQI2wPHcR4MlZG5FVadP/Jky4VkGyjssgAasJMSdTm/nM2ff2zsoB
	 4kWPL7DMUsz1zu0KJ+G21utz6kBPjtGXdn4+sRf4LWIcpGkess5MU5tETOqfCjh9iv
	 nO3dXhoat10iA==
Date: Wed, 17 Jul 2024 06:57:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: add script and target to generate pacman
 package
Message-ID: <20240717135747.GC24892@thelio-3990X>
References: <20240716-kbuild-pacman-pkg-v6-1-d3a04e308013@weissschuh.net>
 <20240717011515.GA1230090@thelio-3990X>
 <CAK7LNARYNqjcMkdnaY2oAkxttFTtTEgJ9VuOZOn0i4AuXp-How@mail.gmail.com>
 <CAK7LNARGWu8q5dAW5tYzfiSKKtZ9t8Dm9FzRoaoZhU4d-TWswQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARGWu8q5dAW5tYzfiSKKtZ9t8Dm9FzRoaoZhU4d-TWswQ@mail.gmail.com>

On Wed, Jul 17, 2024 at 05:51:21PM +0900, Masahiro Yamada wrote:
...
> > > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > > new file mode 100644
> > > > index 000000000000..eb3957fad915
> > > > --- /dev/null
> > > > +++ b/scripts/package/PKGBUILD
> > > > @@ -0,0 +1,99 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > +# Maintainer: Thomas Weiﬂschuh <linux@weissschuh.net>
> > > > +# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > > > +
> > > > +pkgbase=linux-upstream
...
> Perhaps, this may make sense.
> 
> Currently,
> pkgname=("${pkgbase}" "${pkgbase}-headers" "${pkgbase}-api-headers")
> is hard-coded.
> 
> I do not think linux-upstream-headers make sense
> when CONFIG_MODULE is disabled.
> 
> scripts/package/mkspec turns off with_devel
> when CONFIG_MODULE is disabled.

Yes, I think that is a reasonable change to make. In the face of that
potential change, would it make sense to slightly adjust the
makedepends? pahole is only needed when CONFIG_DEBUG_INFO_BTF is enabled
but I guess no other package building infrastructure makes dependencies
conditional in that manner.

Another thing I wonder about would be allowing the user to customize the
value of pkgbase, like

  pkgbase=${PACMAN_PKGBASE:-linux-upstream}

because unlike Debian and Fedora, multiple versions of the same kernel
package cannot be installed at once. If I wanted to build a package
against mainline and -next and install them side by side, I could only
do so if they are named differently. This would allow one to provide
PACMAN_PKGBASE=linux-mainline and PACMAN_PKGBASE=linux-next to
accomplish that. Might be a hyper specific use case though, so I am not
opposed to disregarding it.

Cheers,
Nathan

