Return-Path: <linux-kbuild+bounces-2935-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3F494E221
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Aug 2024 18:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D1DF1C20A21
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Aug 2024 16:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A694A14B94E;
	Sun, 11 Aug 2024 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rM6LnKiC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C7E14B091
	for <linux-kbuild@vger.kernel.org>; Sun, 11 Aug 2024 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723392113; cv=none; b=NFfeARM3WVd8VWCOF6YTPPCG83GyJyskvzUQAvP+1pbV2j48w4bsL2m0XkEEXlwRNEQealfnzSL428VFlxonRN/PektFrVprJsN/rneXJLbuQ7UJoi3fQvUAvoNZsWmVdilxVP6Le/cw+ZvIhtu3j9eLbtl9/q1+undYg7cj/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723392113; c=relaxed/simple;
	bh=LMZlGgY3hCfRv6Hf7vl6N47j5E8JwuRohVIMMLtfh0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYQ2m/ZQvnd35DGbK2bwgQGdZSkHMkIOxvXDM6nG30p+CXUWTWCRkPhkzNjinQKKwbEg28Lhj+jELSfnpPvui8DT06PymjWYHzs4Du/nXqlElPAKkTCKHyH5ksM5hlO7xNiX9Kqw74WGLnRouWhKB/pbTWXnG1XDPnMEhcMkfBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rM6LnKiC; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 11 Aug 2024 10:01:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1723392109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4PuclfHAMl6TwUETpxgcTG2AmEoWfAy6tJOk/s/nCbE=;
	b=rM6LnKiCBeGqMIgyimY1vlu0JKNHELYIfw5kM5/0GFQN+NhbdweuQl9CIDtuYNTos/XYGa
	nSQgZBTgG8f6ki9hrL/jyRyO555XBXSLusuVik0FGQf246lH/7E1Uz0A1RyeNrfZ9FAc9E
	zPmINjgjkxJuK/HVbo+k8aKT8Z70fZU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jose Fernandez <jose.fernandez@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <c7ykw75stjqx7pagij4vvpbwxram6m3s5p65h7v4uf6eglshfq@5vur2t6dvmcf>
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
 <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
 <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de>
 <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>
 <66ef2ce9-5e7d-48fd-abeb-96e463d575ad@t-8ch.de>
 <nbr7h4owyxfdyd4olis7ccrh3ljz6gco6qf7p7uzttw5ijsquj@ws7iqib576rm>
 <CAK7LNAQ0CDceJNAhD-RbE3Ph0Q+UOqk1=M6k3tEKb_5j9j2GNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQ0CDceJNAhD-RbE3Ph0Q+UOqk1=M6k3tEKb_5j9j2GNw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On 24/08/10 04:41PM, Masahiro Yamada wrote:
> On Sat, Aug 10, 2024 at 9:16 AM Jose Fernandez <jose.fernandez@linux.dev> wrote:
> >
> > On 24/08/07 07:31PM, Thomas Weißschuh wrote:
> > > On 2024-08-08 02:02:59+0000, Masahiro Yamada wrote:
> > > > On Thu, Aug 8, 2024 at 1:41 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > > > On 2024-08-07 22:37:47+0000, Masahiro Yamada wrote:
> > > > > > On Wed, Aug 7, 2024 at 11:28 AM Jose Fernandez <jose.fernandez@linux.dev> wrote:
> > >
> > > <snip>
> > >
> > > > > > Lastly, I will never accept new error messages
> > > > > > with CONFIG_MODULES=n.
> > > > >
> > > > > Could you elaborate?
> > > > > For me this works fine with CONFIG_MODULES=n.
> > > > > (After having fixed the above issues so all subpackages are built)
> > > >
> > > > $ make  allnoconfig pacman-pkg
> > > >
> > > > Check the linux-headers log closely.
> > >
> > > I see now, previously I was not on kbuild/for-next and had an old
> > > Module.symvers sitting around, hiding the issue.
> > >
> > > ==> Starting package_linux-upstream-headers()...
> > > Installing build files...
> > > tar: Module.symvers: Cannot stat: No such file or directory
> > > tar: Exiting with failure status due to previous errors
> > > Installing System.map and config...
> > > Adding symlink...
> > > ==> Tidying install...
> > >
> > > (coming from scripts/package/install-extmod-build)
> > >
> > > linux-upstream-headers also contains .config and System.map which are
> > > useful without modules.
> > > So either we completely disable linux-upstream-headers or skip
> > > install-extmod-build when CONFIG_MODULES=n.
> > > And maybe move System.map and .config to some other package,
> > > which would then deviate from the original PKGBUILD.
> > >
> > > Neither option feels great, but it probably won't make a big difference.
> > > If you have a preference, let's go with that.
> >
> > Thomas, Masahiro,
> > Thanks for the feedback. It seems that System.map and .config are commonly
> > included in -header Arch packages. To avoid deviating too much and to address
> > the issue with install-extmod-build when CONFIG_MODULES=n, how about considering
> > something like this:
> 
> 
> I am fine.
> 
> 
> >
> > mkdir -p "${builddir}" # needed if install-extmod-build is not run
> 
> This comment might not be necessary if you move this code
> right before copying System.map.

Ack. I will move the command to before copying System.map and drop the comment.

> 
> > if grep -q CONFIG_MODULES=y include/config/auto.conf; then
> >         echo "Installing build files..."
> >         "${srctree}/scripts/package/install-extmod-build" "${builddir}"
> > fi
> >
> > echo "Installing System.map and config..."
> > cp System.map "${builddir}/System.map"
> > cp .config "${builddir}/.config"
> >
> > Thanks,
> > Jose
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

