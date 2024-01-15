Return-Path: <linux-kbuild+bounces-567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798F982DBF3
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 15:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9ED801C21592
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jan 2024 14:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A18F175AD;
	Mon, 15 Jan 2024 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="W8mB2C2H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0370D17586;
	Mon, 15 Jan 2024 14:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gGX9KEHykbwFhkF9N2tF2b8f9mlGDUbi3chxVhobOkA=; b=W8mB2C2HlW320SaZWUGIoM/G40
	TIOcwjrgpKhulvZelh63uuaYnGVnxBItCtgz+Y+4LngjAAC09A1QFJdPePQZVmZ0E+rGP8OEthIcj
	uhW4k7fVlyghaPc+3tWYDA4IAQeUBtY+tQNLy3nMlb/Fgz8tIgfRLWWJKyL6NXNFVB0OJOfeJ89Sk
	x+FXEIBwhEhipdvPQT+csrJq0mHYQNA98bDpu/sWatuuDgVuQSLcoUha4ReV2W8ZZVjNrErqNzxEq
	/q3LwX79lT0E4t5mnjf0OHCzo15WIZXWrANfRnnRqVgyVanSIhOeuYjzYDEbV+7SDr0YUOsw9KS9M
	V85j+Brg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40484)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rPOOr-0002Uz-0U;
	Mon, 15 Jan 2024 14:57:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rPOOq-00032D-Dw; Mon, 15 Jan 2024 14:57:16 +0000
Date: Mon, 15 Jan 2024 14:57:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: detect depmod version to exclude new SHA3 module
 signing options
Message-ID: <ZaVHzCpjELFlGTPQ@shell.armlinux.org.uk>
References: <E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk>
 <ZaUo7ctf5H/qqqkG@shell.armlinux.org.uk>
 <CADWks+a7jBSqWZh-MJSp9x8vTUFvzu6c2GTHc8eQaMNE5VDrQg@mail.gmail.com>
 <ZaVAaScCdwpWuAH0@shell.armlinux.org.uk>
 <CADWks+YDgxa1EgM1NqKBtQ5VOF2=e62q7SPGkHQ2MLjrvK0Kxw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADWks+YDgxa1EgM1NqKBtQ5VOF2=e62q7SPGkHQ2MLjrvK0Kxw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jan 15, 2024 at 02:39:05PM +0000, Dimitri John Ledkov wrote:
> On Mon, 15 Jan 2024 at 14:25, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Jan 15, 2024 at 01:09:25PM +0000, Dimitri John Ledkov wrote:
> > > On Mon, 15 Jan 2024 at 12:45, Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > Ping?
> > > >
> > >
> > > The intent is good.
> > > The implementation is incomplete.
> > >
> > > Please respond or address review feedback emailed previously. See
> > > https://lore.kernel.org/all/CADWks+Z5iZ=P_OAanA-PiePFbMpwtRe3_dF8wRTak8YAi87zvQ@mail.gmail.com/#t
> >
> > > Did you test that things are successful wtih kmod 29, 30, 31?
> >
> > No I didn't. See my comment below the "---" line:
> >
> > "I don't know what the minimum requirement is for SHA3 to work, so I
> > have chosen a minimum of version 29 for the purposes of this patch."
> >
> > > The code to correctly support sha3 in kmod was committed after 31 was
> > > tagged, and there is no newer tag yet hence the revision that has the
> > > correct code is v31-6-g510c8b7f74.
> >
> > Thanks for the information.
> >
> > > If such check is desired, kmod 32 should be tagged and check should
> > > check for 32.
> >
> > "If such a check is desired" ? You mean you prefer systems to segfault
> > during the installation step when the build system doesn't have a new
> > enough kmod?
> >
> > > If possible please use min-tool-version.sh to set the lower bound of
> > > kmod that is supported by the build. Assuming module signing is
> > > generally desired to be supported, the minimum required kmod should be
> > > set to 26. Otherwise at least modinfo doesn't work.
> >
> > That's a separate issue though, and has build-breaking ramifications.
> > Enforcing a minimum kmod 26 will mean that the kernel will fail if
> > kmod isn't new enough, whereas someone may be building with module
> > signing disabled and thus be fine with older kmod.
> >
> > These are two separate issues, and I think _this_ _fix_ needs to be
> > first because the issue is already there and affecting people (me),
> 
> I don't believe the fix you desire is as critical as you think it is.
> 
> Majority of people do not compile and install bleeding edge kernels,
> on an EOL release with a 5 year old kmod, when both are released by
> the same upstream project (more or less).
> Also your fix will prevent people to use EOL release for kernel
> compilation (or introduce requirement to have kmod installed on the
> build host), when they do not execute install on the same system (but
> transfer the files into a packaging format / execute depmod using up
> to date kmod not in path). Thus you may actually break even more
> people with this change, as kmod versions have never been enforced
> before.
> 
> I am still waiting for a response from you:
> 1) why you attempted this given non-default configuration build -
> given your obsolete kmod in the installation target system
> (intentionally attempting to choose config options to suitable for
> your target)
> 2) why you want people to prevent compiling such a build, which they
> can install later on with a compatible kmod (when their build-time and
> install-time systems are different)
> 
> Which you have ignored responding to, in the previous emails.
> 
> I am trying to politely help you, and yet the tone of your emails are
> very aggressive and very dismissive to me.

Your responses have been confusing, and suggest that you don't know
what you're talking about. For example:

1) your initial response started talking about the target host OS
   when I clearly stated that the problem was while _building_
   which means the (build) host. I interpret "target host" to be
   confusing, since "target" is the platform that will _run_ the
   kernel and "host" is the build host.

2) your second response contained:
   "the kernel configuration you use, should target the operating system
   you are planning to use the given kernel on."
   factually and demonstrably incorrect (if it were true, I wouldn't
   be seeing the segfault.)

   This statement is also demeaning, since you are implying that I have
   no idea how to configure the kernel - given that I've been a kernel
   contributer and maintainer since the early days I have much more
   experience than you do.

So your responses make no sense to me, sorry.

This is the first feature where some other kernel developer seems to
be saying "yes, it's fine if we get a segfault while doing normal
operations with the kernel build system." To me, that is totally not
acceptable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

