Return-Path: <linux-kbuild+bounces-5625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69589A273E8
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 15:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24601888B60
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 14:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A51213E76;
	Tue,  4 Feb 2025 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lqQYMe2x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56320F082;
	Tue,  4 Feb 2025 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677127; cv=none; b=hJnhYdQrp41xsAYR78vyjwAbAbUpB0qeG134IJUrLWYxmVQLQa7oRoNQ+e1TVj6nAyIUrfetT322HHExF8wFrNs1JAqIVn0TkQ7sOJB7Dcb+uhnnBVdcaG8zx2DeIymVJ11frJAdHZz8auLiBvMALqwIX/hZDdjw3rvTurFcSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677127; c=relaxed/simple;
	bh=hID8WMBLMfeNex2lw7neHRzziXNYlPbmFHtmRj1zX70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JALvq2dC2q24wlSzONqPIrWsUrDGG/kY4l+/awsj9dJjfDH8KSYoIXCiBvg/RN2U/R3HjcCu5cX4hPhDrWahL0eAfN3EDBeAEd+/fQTy8MLy7bX33eBBUqgW92zlP00AagjHIWSkE4s5+FLRKBxIud/RPcxJOaBJ+uohG4ABa4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lqQYMe2x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDCEC4CEDF;
	Tue,  4 Feb 2025 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738677127;
	bh=hID8WMBLMfeNex2lw7neHRzziXNYlPbmFHtmRj1zX70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqQYMe2x4S93kKMyeDC03NhIRPdTRFlbjLLX0Vt17LSbNyFtgRnvshtBKfQZsZ4NE
	 OQ90Lg3wmqW4tW4L2vKKkomygLljUlF8aepxko24d+sGmh9EE4mx6Wj9zNKJGdz52T
	 tY6ZxzavNh1ugt+XMmd9kPmWl2DUaDurUIMVjlts=
Date: Tue, 4 Feb 2025 14:52:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Salvatore Bonaccorso <carnil@debian.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Parth Pancholi <parth105105@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
Message-ID: <2025020457-nanny-reward-06bd@gregkh>
References: <20241114145645.563356-1-parth105105@gmail.com>
 <2024111442-yeast-flail-fcea@gregkh>
 <20241115083940.GA3971@francesco-nb>
 <2024111541-antiquity-footpath-e221@gregkh>
 <ZzcYLAFqTSlFm2uF@gaggiata.pivistrello.it>
 <CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk1Yiidch9KMxEQ@mail.gmail.com>
 <Z580LZIi2iXGzSv5@eldamar.lan>
 <CAK7LNARFfUexOjoBsr385ECC61k-oNzefRZtTtNhdGV01r-iXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARFfUexOjoBsr385ECC61k-oNzefRZtTtNhdGV01r-iXg@mail.gmail.com>

On Mon, Feb 03, 2025 at 11:44:50AM +0900, Masahiro Yamada wrote:
> On Sun, Feb 2, 2025 at 6:00 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
> >
> > Hi Greg, hi Yamada,
> >
> > On Sat, Nov 16, 2024 at 04:51:48PM +0900, Masahiro Yamada wrote:
> > > On Fri, Nov 15, 2024 at 6:45 PM Francesco Dolcini <francesco@dolcini.it> wrote:
> > > >
> > > > On Fri, Nov 15, 2024 at 10:22:13AM +0100, Greg KH wrote:
> > > > > On Fri, Nov 15, 2024 at 09:39:40AM +0100, Francesco Dolcini wrote:
> > > > > > On Thu, Nov 14, 2024 at 05:02:01PM +0100, Greg KH wrote:
> > > > > > > On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> > > > > > > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > > > > > >
> > > > > > > > Replace lz4c with lz4 for kernel image compression.
> > > > > > > > Although lz4 and lz4c are functionally similar, lz4c has been deprecated
> > > > > > > > upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25, lz4
> > > > > > > > and lz4c have been packaged together, making it safe to update the
> > > > > > > > requirement from lz4c to lz4.
> > > > > > > >
> > > > > > > > Consequently, some distributions and build systems, such as OpenEmbedded,
> > > > > > > > have fully transitioned to using lz4. OpenEmbedded core adopted this
> > > > > > > > change in commit fe167e082cbd ("bitbake.conf: require lz4 instead of
> > > > > > > > lz4c"), causing compatibility issues when building the mainline kernel
> > > > > > > > in the latest OpenEmbedded environment, as seen in the errors below.
> > > > > > > >
> > > > > > > > This change also updates the LZ4 compression commands to make it backward
> > > > > > > > compatible by replacing stdin and stdout with the '-' option, due to some
> > > > > > > > unclear reason, the stdout keyword does not work for lz4 and '-' works for
> > > > > > > > both. In addition, this modifies the legacy '-c1' with '-9' which is also
> > > > > > > > compatible with both. This fixes the mainline kernel build failures with
> > > > > > > > the latest master OpenEmbedded builds associated with the mentioned
> > > > > > > > compatibility issues.
> > > > > > > >
> > > > > > > > LZ4     arch/arm/boot/compressed/piggy_data
> > > > > > > > /bin/sh: 1: lz4c: not found
> > > > > > > > ...
> > > > > > > > ...
> > > > > > > > ERROR: oe_runmake failed
> > > > > > > >
> > > > > > > > Cc: stable@vger.kernel.org
> > > > > > >
> > > > > > > What bug does this resolve that it needs to be backported to stable
> > > > > > > kernels?
> > > > > >
> > > > > > This is not solving any existing actual bug, and therefore there is no
> > > > > > fixes tag.
> > > > > >
> > > > > > The issue here is that the kernel build system is using lz4c, that is
> > > > > > deprecated since 2018, and now distributions are actively moving away from it.
> > > > > >
> > > > > > openSUSE Tumbleweed and OE already removed it, so you would not be able
> > > > > > to compile a stable kernel on such distribution when using lz4 unless we
> > > > > > backport such a patch.
> > > > > >
> > > > > > Everything should be properly documented in the commit message already.
> > > > > >
> > > > > > My understanding is that something like that would be a reason for
> > > > > > backporting to stable, if my understanding is not correct we'll remove
> > > > > > the cc:stable and send a v3.
> > > > >
> > > > > Please read:
> > > > >     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > > > > for what meets stable kernel requirements.  I don't think that this
> > > > > patch is that.
> > > >
> > > > Greg, ack.
> > > >
> > > > Masahiro, can you please let me know if we should send a v3 with the stable
> > > > tag removed or you can remove it yourself when applying?
> > > >
> > >
> > > I applied this with the stable tag removed.
> > > Thanks.
> > >
> > > (I guess someone may want to backport this eventually,
> > > as such distros cannot build stable kernels with ld4 compression.)
> >
> > Yes please :)
> 
> Agree.
> This should be back-ported.

Ok, now queued up, thanks.

greg k-h

