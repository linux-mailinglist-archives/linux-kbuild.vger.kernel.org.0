Return-Path: <linux-kbuild+bounces-2897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5394AEE9
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 19:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B256E283068
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 17:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AD012C465;
	Wed,  7 Aug 2024 17:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="WZgWc2/t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B978C7D3F5;
	Wed,  7 Aug 2024 17:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723051896; cv=none; b=bZmUbdgcvOAcyu9EzEt6XNgbotMeh8qxeBiXtlTnJ3IsQT3LTiMaJRDV7Zb/exR12VDfIZ8fg2JSu0/Dets7TrivMH1EyeNxpOg7w/YgtIhhFvxsNErtmzpSJnFwu8Iv4aJRyKoEWLJzM9f+lWo2/bhrrQMQ44hB+tUarlEwRLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723051896; c=relaxed/simple;
	bh=X5B2jUJXBjR1r8eby7VTQUB3d+SVvMRzoIBMrgb0aaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKZTpKtoabVcSZ/c/AFkvZzkqUU3xy4gY2+9ajSR++6JybcEFLqc7q3s2PhbeNiSH0oxu19MWpEtK0h6Chf2cPXS9A5zHQ0yxe0HuejqrZkwZ9gCLizsbNTeCNvTBLICHd8lx5jXzf6zeuuJ7VI6ZBipCsJmeeDaXtF8g2vy6kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=WZgWc2/t; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723051889;
	bh=X5B2jUJXBjR1r8eby7VTQUB3d+SVvMRzoIBMrgb0aaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZgWc2/twgOFxWoDTtJAn5ivfZ4jD0uk3vKKpXh/zn4i/67ZLVvUIGifGxYY/3XA8
	 I+RZt+D/eQtDbozYktjM2IHV9LEfzorcpdvFfiCbXUhNEQL+QNF6vlyvGi0QkzUD8g
	 AcUfsVyoQonFkn8eeJkpQgR+XRC7iomP0i6/SJHU=
Date: Wed, 7 Aug 2024 19:31:29 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Jose Fernandez <jose.fernandez@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <66ef2ce9-5e7d-48fd-abeb-96e463d575ad@t-8ch.de>
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
 <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
 <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de>
 <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>

On 2024-08-08 02:02:59+0000, Masahiro Yamada wrote:
> On Thu, Aug 8, 2024 at 1:41 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > On 2024-08-07 22:37:47+0000, Masahiro Yamada wrote:
> > > On Wed, Aug 7, 2024 at 11:28 AM Jose Fernandez <jose.fernandez@linux.dev> wrote:

<snip>

> > > Lastly, I will never accept new error messages
> > > with CONFIG_MODULES=n.
> >
> > Could you elaborate?
> > For me this works fine with CONFIG_MODULES=n.
> > (After having fixed the above issues so all subpackages are built)
> 
> $ make  allnoconfig pacman-pkg
> 
> Check the linux-headers log closely.
 
I see now, previously I was not on kbuild/for-next and had an old
Module.symvers sitting around, hiding the issue.

==> Starting package_linux-upstream-headers()...
Installing build files...
tar: Module.symvers: Cannot stat: No such file or directory
tar: Exiting with failure status due to previous errors
Installing System.map and config...
Adding symlink...
==> Tidying install...

(coming from scripts/package/install-extmod-build)

linux-upstream-headers also contains .config and System.map which are
useful without modules.
So either we completely disable linux-upstream-headers or skip
install-extmod-build when CONFIG_MODULES=n.
And maybe move System.map and .config to some other package,
which would then deviate from the original PKGBUILD.

Neither option feels great, but it probably won't make a big difference.
If you have a preference, let's go with that.


Thomas

