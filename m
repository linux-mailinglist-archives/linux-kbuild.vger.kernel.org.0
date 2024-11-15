Return-Path: <linux-kbuild+bounces-4687-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF309CDB76
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 10:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61153B2263E
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 09:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F9118CC1C;
	Fri, 15 Nov 2024 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lD63Z5tw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F023118C322;
	Fri, 15 Nov 2024 09:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731662537; cv=none; b=uAKQ/MsFFQTCta6pw6tP5k5w1+LY6lggTjdnu1pYvkHdW/f8SV5KW04KzyX2a+SAT74pL2KGtURyJh9YvRH4p0zRqjS/fQ6QQJPdY6oD8UF45aJxa/dEvW07HSVdxKn/dPShb9PLFODAiwRum2/TnNvBcgtLFZ2CLYnP7Ufv3zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731662537; c=relaxed/simple;
	bh=XAw7hxVKcfQgolreomu8qnqVYITQSexMqnTW646pREI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtX586YJdqIllf2zdoW8VmsuJiOKz9hByIPOshLXWHW18fHfWTyysZxyTBDSvj+Kou4df7Pwpe66jCBQ7VqwHdd+Kv+26nyplihZbdvuxvIFJYZKj/BfuMmMUuaMLIZqNgpA+urC09QE7GpMx8N9XVSMbsC0LTVukfjTX0rtHCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lD63Z5tw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFC8C4CECF;
	Fri, 15 Nov 2024 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1731662536;
	bh=XAw7hxVKcfQgolreomu8qnqVYITQSexMqnTW646pREI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lD63Z5twBZpCEMI6JV5mGGiUWk2w0Gu5EFcHQrw6Il8SmUjG+AWpfNZSA7ByL7s3h
	 JKeCQmvsnHbHf9A11y3C0zjA9AlOOnthq8MSfu4haBM+PCpaVvypfq0ptsBwBmfd5J
	 ksGRcJMyPF2sLaYPCamopmeNrow0deH9aKRfdSv0=
Date: Fri, 15 Nov 2024 10:22:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Parth Pancholi <parth105105@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
Message-ID: <2024111541-antiquity-footpath-e221@gregkh>
References: <20241114145645.563356-1-parth105105@gmail.com>
 <2024111442-yeast-flail-fcea@gregkh>
 <20241115083940.GA3971@francesco-nb>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115083940.GA3971@francesco-nb>

On Fri, Nov 15, 2024 at 09:39:40AM +0100, Francesco Dolcini wrote:
> Hello Greg,
> 
> On Thu, Nov 14, 2024 at 05:02:01PM +0100, Greg KH wrote:
> > On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > 
> > > Replace lz4c with lz4 for kernel image compression.
> > > Although lz4 and lz4c are functionally similar, lz4c has been deprecated
> > > upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25, lz4
> > > and lz4c have been packaged together, making it safe to update the
> > > requirement from lz4c to lz4.
> > > 
> > > Consequently, some distributions and build systems, such as OpenEmbedded,
> > > have fully transitioned to using lz4. OpenEmbedded core adopted this
> > > change in commit fe167e082cbd ("bitbake.conf: require lz4 instead of
> > > lz4c"), causing compatibility issues when building the mainline kernel
> > > in the latest OpenEmbedded environment, as seen in the errors below.
> > > 
> > > This change also updates the LZ4 compression commands to make it backward
> > > compatible by replacing stdin and stdout with the '-' option, due to some
> > > unclear reason, the stdout keyword does not work for lz4 and '-' works for
> > > both. In addition, this modifies the legacy '-c1' with '-9' which is also
> > > compatible with both. This fixes the mainline kernel build failures with
> > > the latest master OpenEmbedded builds associated with the mentioned
> > > compatibility issues.
> > > 
> > > LZ4     arch/arm/boot/compressed/piggy_data
> > > /bin/sh: 1: lz4c: not found
> > > ...
> > > ...
> > > ERROR: oe_runmake failed
> > > 
> > > Cc: stable@vger.kernel.org
> > 
> > What bug does this resolve that it needs to be backported to stable
> > kernels?
> 
> This is not solving any existing actual bug, and therefore there is no
> fixes tag.
> 
> The issue here is that the kernel build system is using lz4c, that is
> deprecated since 2018, and now distributions are actively moving away from it. 
> 
> openSUSE Tumbleweed and OE already removed it, so you would not be able
> to compile a stable kernel on such distribution when using lz4 unless we
> backport such a patch.
> 
> Everything should be properly documented in the commit message already.
> 
> My understanding is that something like that would be a reason for
> backporting to stable, if my understanding is not correct we'll remove
> the cc:stable and send a v3.

Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for what meets stable kernel requirements.  I don't think that this
patch is that.

thanks,

greg k-h

