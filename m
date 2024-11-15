Return-Path: <linux-kbuild+bounces-4686-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D109CDAB8
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 09:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65EA5B23EF6
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 08:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F56189919;
	Fri, 15 Nov 2024 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="FpSboBLT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018F62B9B9;
	Fri, 15 Nov 2024 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731659994; cv=none; b=lDI1yymhExXO3I5p791pVwhCkbXPEEp2uQS9lBfYbePfp8xB1eoe7Uarg3Vg45XX1V6ZjOH48EoPmsvCn9PYSB7Iactvu0+uwBYwn5myy+6XRiz2PYSKpmQXY4arkr1QQUaB3kGRTOyvE83nj8+IiPE3Kx0Mt0dtTQec5z4SS38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731659994; c=relaxed/simple;
	bh=szWPyMhF2TaPYgYdAiyareXGxnMhv3fBBNmJWFTgqYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYuUefm+tGKfy6YVfDFJyThosVJUsHnurbiapwrC9HOzmTaXLeCirmAolGne6kvGUHg4/txgtxzUjMaFlSknuyf71F0ivsYOtp6/JRoPl6zlaTMAvYgV92NCRBdYKWZwp5p0/XEgZqH0Geg4Ej1q3Rb8ubz866sjP3YsVR4u/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=FpSboBLT; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 62B611F987;
	Fri, 15 Nov 2024 09:39:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1731659986;
	bh=laxSPqZHzjZ/9jJd5FP23rk7JMnLBz/mjZvgCEDeXZg=; h=From:To:Subject;
	b=FpSboBLTerqpNyZIuUJ+MfwRwzwLMkD7Lbv5J4tJX4Q1h9a+a2XPpVUTOrTPWPIKm
	 8tzV/N/lLfiuJ8idrpKPTFp57O2PGfFre/izM8lmoLFG965wgrpoG1tAiIBiChh4mk
	 g+SJt+2X1AdGlGsOV+NY2GA4YwaBpj8LEN1mf4y8csXNLpQJGL/ORlG3+7WIcb3lrL
	 lHxAzIzEjgJMiqpdiIDscIXuOjQmSfApH5VLVBjNrDlignFhaLZqlzs/k1Yex/BkK7
	 gR5RN50TFbfUHAVXGb3w8KhP+TnMuwYX5/iviJAkrb97ZNN29j0P2baTlD0cNXKGuG
	 CVsb2fRovfGHg==
Date: Fri, 15 Nov 2024 09:39:40 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Parth Pancholi <parth105105@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
Message-ID: <20241115083940.GA3971@francesco-nb>
References: <20241114145645.563356-1-parth105105@gmail.com>
 <2024111442-yeast-flail-fcea@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024111442-yeast-flail-fcea@gregkh>

Hello Greg,

On Thu, Nov 14, 2024 at 05:02:01PM +0100, Greg KH wrote:
> On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> > From: Parth Pancholi <parth.pancholi@toradex.com>
> > 
> > Replace lz4c with lz4 for kernel image compression.
> > Although lz4 and lz4c are functionally similar, lz4c has been deprecated
> > upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25, lz4
> > and lz4c have been packaged together, making it safe to update the
> > requirement from lz4c to lz4.
> > 
> > Consequently, some distributions and build systems, such as OpenEmbedded,
> > have fully transitioned to using lz4. OpenEmbedded core adopted this
> > change in commit fe167e082cbd ("bitbake.conf: require lz4 instead of
> > lz4c"), causing compatibility issues when building the mainline kernel
> > in the latest OpenEmbedded environment, as seen in the errors below.
> > 
> > This change also updates the LZ4 compression commands to make it backward
> > compatible by replacing stdin and stdout with the '-' option, due to some
> > unclear reason, the stdout keyword does not work for lz4 and '-' works for
> > both. In addition, this modifies the legacy '-c1' with '-9' which is also
> > compatible with both. This fixes the mainline kernel build failures with
> > the latest master OpenEmbedded builds associated with the mentioned
> > compatibility issues.
> > 
> > LZ4     arch/arm/boot/compressed/piggy_data
> > /bin/sh: 1: lz4c: not found
> > ...
> > ...
> > ERROR: oe_runmake failed
> > 
> > Cc: stable@vger.kernel.org
> 
> What bug does this resolve that it needs to be backported to stable
> kernels?

This is not solving any existing actual bug, and therefore there is no
fixes tag.

The issue here is that the kernel build system is using lz4c, that is
deprecated since 2018, and now distributions are actively moving away from it. 

openSUSE Tumbleweed and OE already removed it, so you would not be able
to compile a stable kernel on such distribution when using lz4 unless we
backport such a patch.

Everything should be properly documented in the commit message already.

My understanding is that something like that would be a reason for
backporting to stable, if my understanding is not correct we'll remove
the cc:stable and send a v3.

Francesco


