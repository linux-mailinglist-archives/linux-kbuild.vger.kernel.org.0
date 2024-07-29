Return-Path: <linux-kbuild+bounces-2714-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AE93ED38
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 08:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739DBB2193C
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 06:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C725784A40;
	Mon, 29 Jul 2024 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hFFoWZfF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8934D7E1;
	Mon, 29 Jul 2024 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722233624; cv=none; b=rKU1Tnztu2JHIVzcfmJYyZfnPfScteRxtksTydKUgauVBRom+6StnWAVFSzwLjItyusJBQJNnuE1qax2f49ddUlp+4qIiphyFk878WtnRwnsXtM7o3qycmnKds13mFZiA2GaL+bsAXJaB+bCFdJdwWJjpb5DSeanfUoCxyQHG8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722233624; c=relaxed/simple;
	bh=N4vul3hw0zjZM/5Ktq+B0LXqvGDfrP0hLra/k+iE0j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcFShuAAmcwu2W8Ty+JzWBNTZ3Nmlr7EceqK5dqQaAQRO3Rpp8CEntp9PzXXApNDUL6gR+lfUkQpeIap6eGkVD61P7Q3yTsr6zj7ksSJKw4TTH62K7UNABdKISpG7px5SpFtKh20AtQWvBrGi8EGLPI0KZmYYWvFleSoqAGXYYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hFFoWZfF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83593C32786;
	Mon, 29 Jul 2024 06:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1722233624;
	bh=N4vul3hw0zjZM/5Ktq+B0LXqvGDfrP0hLra/k+iE0j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hFFoWZfFc3LjTEQC3QdH1enwgYjR31isGvoBkKsyTlw5xDNBigAkmJIR0lMRuyJUU
	 JmfXGeOgtwzCF5+4zJrKSuSiIxnXD/quxb1jzvEhYTmDuSPJL2b+mzWn0Cffa7Tync
	 31pIfflPHr2qZyj0mVHOJATQKgNFtlq5arGz2bU4=
Date: Mon, 29 Jul 2024 08:13:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	UNGLinuxDriver@microchip.com, davem@davemloft.net,
	edumazet@google.com, f.fainelli@gmail.com, kuba@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, lucas.demarchi@intel.com,
	masahiroy@kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, woojung.huh@microchip.com
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
Message-ID: <2024072923-galleria-gumdrop-5c56@gregkh>
References: <bcc81ea0-78e1-476e-928c-b873a064b479@lunn.ch>
 <20240726121530.193547-1-jtornosm@redhat.com>
 <b96d9801-d370-4ddd-97fd-5eac2a2656f4@lunn.ch>
 <931b582808f237aa3746c5b0a96b3665@manjaro.org>
 <3e895811-ad23-4687-b440-5375ad2af2ff@lunn.ch>
 <a520ee4da331c8edb99f2c14d22a3531@manjaro.org>
 <3a3f49b5-45b2-4999-a364-60d035bbd11f@lunn.ch>
 <98d200777d62dc9b447557b2758613e5@manjaro.org>
 <3a6ef66a-e98f-44df-9fef-3b26bede4c07@lunn.ch>
 <36bfb8da08b90fb14108e99853f49d0f@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36bfb8da08b90fb14108e99853f49d0f@manjaro.org>

On Mon, Jul 29, 2024 at 06:43:40AM +0200, Dragan Simic wrote:
> On 2024-07-28 22:57, Andrew Lunn wrote:
> > > In other words, this patch doesn't subtract anything.  Instead, it
> > > just
> > > adds a weakdep link between the lan78xx and micrel modules, so the
> > > kernel
> > > itself can report that dependency, which may actually result in one
> > > more
> > > PHY driver added to a generated initial ramdisk.
> > 
> > So at the moment, does the initramfs contain all PHY modules? I guess
> > it does, because you have no knowledge which are actually needed. And
> > this does not help you in any way, as you said, it does not subtract
> > anything.
> 
> Basically, an initial ramdisk shouldn't contain any PHY modules that
> aren't automatically detected as needed on a particular system, for
> which the initial ramdisk is built.  That's how selecting modules
> while building the initial ramdisks works.  On the other hand, if it's
> some initial ramdisk built by a Linux distribution and intended to
> support multiple systems or boards, it may contain whatever the
> distribution sees fit.
> 
> Having weakdeps defined actually does help here.  For example, a Linux
> distribution mentioned above no longer needs to hand-craft the rules
> for initial ramdisk generation for the PHY modules that should be put
> into an initial ramdisk together with the lan78xx driver, if the Linux
> distribution chooses to include the lax78xx driver.  Having weakdep(s)
> defined makes the kernel do that instead.  Also, there's no point in
> including every single PHY driver module, because not all of them are
> needed for a particular selection of MAC drivers, which comes from the
> intended purpose of the initial ramdisk built by a Linux distribution,
> i.e. the target architecture, supported board category, etc.
> 
> Let's also keep in mind that including all PHY modules into an initial
> ramdisk inevitably makes it larger, which often isn't an option for
> resource-constrained embedded systems.
> 

resource-constrained embedded systems know their dependancies and their
hardware configurations, so I don't see how the weak-deps help at all
here.

You are arguing two different things it seems, neither of which this
change helps out at all with, so I will provide a:

  Nacked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

here until it gets straightened out.

thanks,

greg k-h

