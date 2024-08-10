Return-Path: <linux-kbuild+bounces-2929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F02994DB41
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 09:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8A911C2101A
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2024 07:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC8D13D61B;
	Sat, 10 Aug 2024 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="hmtiIhQd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03E42F5E;
	Sat, 10 Aug 2024 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723276498; cv=none; b=LzKZftKGvsx93bZ0he3CmHNhhAGl95V2NFNVgRj0HrkhgKh6DQPlENRuetWzwXTdA4NQd4IQrBeIW2P3YcTWbmW8jNdXwM2/uchz9hh9Hp7q77uKSBubZf3L93DPy5OVzLzXagISMy0X5ZJaCU7ILzGmFmpBt9wEhzCc6YRRjKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723276498; c=relaxed/simple;
	bh=Gj2/LU1fn1ts1+xFvoPFkT9HHYcdH9RWtfsun/iJSHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZOW56hU0Jy/Sr9pcIAysVA24pQ5e/Eny40TZi2RFIyyw3U/zpP6bfjLoLX6RmUnVYYoX0/buQaQB1SXDL0BFhqrUciRT4zMxBqFNS4kySuEO6qbh+3Ox4k+HjgbYV/FmBzMoqoB/xvum5T+H4zisKAz3OpyKZXM3dIDbN+Z3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=hmtiIhQd; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723276487;
	bh=Gj2/LU1fn1ts1+xFvoPFkT9HHYcdH9RWtfsun/iJSHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hmtiIhQdkxLFZj/uSClqoPqAaFG/4Jm2DAeK+xfOW6sjBBAAIZ/Awl6HwRZozyhBH
	 oscusCZ211sB8lUL5dTD2vBuF35diyUdb2j9aNrKDxYa4/hjH7W+Qoe3K88RgKIQxV
	 C+6h91lwu9KBqAG8UA7vuJibxzCjCQwvc/DNI7Qs=
Date: Sat, 10 Aug 2024 09:54:46 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <7e3cd6a0-a493-40bc-af2d-23fd1d344b6c@t-8ch.de>
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
 <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
 <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de>
 <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>
 <66ef2ce9-5e7d-48fd-abeb-96e463d575ad@t-8ch.de>
 <nbr7h4owyxfdyd4olis7ccrh3ljz6gco6qf7p7uzttw5ijsquj@ws7iqib576rm>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nbr7h4owyxfdyd4olis7ccrh3ljz6gco6qf7p7uzttw5ijsquj@ws7iqib576rm>

On 2024-08-09 18:16:36+0000, Jose Fernandez wrote:
> On 24/08/07 07:31PM, Thomas Weißschuh wrote:
> > On 2024-08-08 02:02:59+0000, Masahiro Yamada wrote:
> > > On Thu, Aug 8, 2024 at 1:41 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > > On 2024-08-07 22:37:47+0000, Masahiro Yamada wrote:
> > > > > On Wed, Aug 7, 2024 at 11:28 AM Jose Fernandez <jose.fernandez@linux.dev> wrote:
> > 
> > <snip>
> > 
> > > > > Lastly, I will never accept new error messages
> > > > > with CONFIG_MODULES=n.
> > > >
> > > > Could you elaborate?
> > > > For me this works fine with CONFIG_MODULES=n.
> > > > (After having fixed the above issues so all subpackages are built)
> > > 
> > > $ make  allnoconfig pacman-pkg
> > > 
> > > Check the linux-headers log closely.
> >  
> > I see now, previously I was not on kbuild/for-next and had an old
> > Module.symvers sitting around, hiding the issue.
> > 
> > ==> Starting package_linux-upstream-headers()...
> > Installing build files...
> > tar: Module.symvers: Cannot stat: No such file or directory
> > tar: Exiting with failure status due to previous errors
> > Installing System.map and config...
> > Adding symlink...
> > ==> Tidying install...
> > 
> > (coming from scripts/package/install-extmod-build)
> > 
> > linux-upstream-headers also contains .config and System.map which are
> > useful without modules.
> > So either we completely disable linux-upstream-headers or skip
> > install-extmod-build when CONFIG_MODULES=n.
> > And maybe move System.map and .config to some other package,
> > which would then deviate from the original PKGBUILD.
> > 
> > Neither option feels great, but it probably won't make a big difference.
> > If you have a preference, let's go with that.
> 
> Thomas, Masahiro,
> Thanks for the feedback. It seems that System.map and .config are commonly
> included in -header Arch packages. To avoid deviating too much and to address
> the issue with install-extmod-build when CONFIG_MODULES=n, how about considering
> something like this:
> 
> mkdir -p "${builddir}" # needed if install-extmod-build is not run
> if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> 	echo "Installing build files..."
> 	"${srctree}/scripts/package/install-extmod-build" "${builddir}"	
> fi
> 
> echo "Installing System.map and config..."
> cp System.map "${builddir}/System.map"
> cp .config "${builddir}/.config"

Sounds good to me.


Thomas

