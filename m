Return-Path: <linux-kbuild+bounces-10454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C6481D0C3F6
	for <lists+linux-kbuild@lfdr.de>; Fri, 09 Jan 2026 22:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B40E5301BCF0
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jan 2026 21:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B931C31D399;
	Fri,  9 Jan 2026 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6vKIMX1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F2631D367;
	Fri,  9 Jan 2026 21:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767992814; cv=none; b=mi++JUkM1QL7IFfipqbDnDrtFBNn2as/b4n1l/9m+WX/EpKMI0ncCSj8inb47RMRLm2oY4l89VgXeLTwxZ5fdj1+70VKolnh627zPZAA/DFHPkL+Lx/7uCZTB8VOeJOhINelI3HkwTf43CAWw4k4F2cPUIWfGrodmG8iG4QGw3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767992814; c=relaxed/simple;
	bh=LEW6pf+NoIZrBQDpVuYo+xSoyizKTTAmMr1YcU1TRPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRv3v8xDd8QWzAcQvG++60AwvPsCHN/yeetxUIzz/Ok7t+nMdpt+edHNMUUSBcKSfLqZWHTKspRJsJ36zAexk4F+l+RiyMPoTT5N5pyzFwdSewloxyBUTSjh54MGLVUnGEfnPRdAGBpJCGlENjPWfehBqi84ykiYURETBDjlFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6vKIMX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC50C4CEF1;
	Fri,  9 Jan 2026 21:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767992813;
	bh=LEW6pf+NoIZrBQDpVuYo+xSoyizKTTAmMr1YcU1TRPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6vKIMX1hbCoYcoL4MX8xHMuyAU5phIVUNqbO3z6wMTjUNAO6Ut3/p8paRuZRfW0b
	 bZy1AoSvIZlLbP2cLk4KnX0lrA019wJiYySU9q5yO3XrT+pS77ZQ558d8/bADiZP81
	 nQPj0ArvQmysdNncgGK9SUCWCKhu2v7f9MPiefCigeFkIsBRn9V1FmOqMM50nIaZx6
	 1feJXUyUg4EFh10Yns6AomVsD36MIsgue4RD5vf8URqacOsu4OUS64CXo9nUQ4PNAV
	 4HaEP4u8tNdvlqvbG5+YomiHl4vwQbmbVNB3dkDxJZ5leH2M9gAb9mfxGckjmKaKc7
	 O5vivCARuab+w==
Date: Fri, 9 Jan 2026 22:06:39 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Holger Kiehl <Holger.Kiehl@dwd.de>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: Since 6.18.x make binrpm-pkg does not sign modules
Message-ID: <aWFt34dkIvlu1EYI@derry.ads.avm.de>
Mail-Followup-To: Holger Kiehl <Holger.Kiehl@dwd.de>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
References: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de>

On Fri, Jan 09, 2026 at 03:04:33PM +0100, Holger Kiehl wrote:
> Hello,
> 
> when building kernel with 'make binrpm-pkg' the modules in the
> /lib/modules directory of the rpm package are no longer signed
> although one sees the following during the build process:
> 
>    .
>    .
>    INSTALL /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
>    .
>    .
>    SIGN    /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko

thanks for your report; well, that's interesting.  The modules signed
during the package build preparations ("SIGN    .../rpmbuild/BUILD/...")
is significantly larger than the one in the build tree (as expected, as
the latter is unsigned); but the one that lands in the rpm package is
_smaller_ than the module in the build tree.

My experience with rpmbuild is limited, I need more time for
investigation.

Nathan, do you have more insights on the rpm build process?

Kind regards,
Nicolas



>    .
>    .
> 
> But when installing this RPM and check this it says:
> 
>    # modinfo /lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
>    filename:       /lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
>    alias:          net-pf-42
>    license:        GPL v2
>    description:    Qualcomm IPC-router driver
>    license:        Dual BSD/GPL
>    description:    Qualcomm IPC Router Nameservice
>    author:         Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>    srcversion:     473C5AB47E04ECEA0106681
>    depends:        
>    intree:         Y
>    name:           qrtr
>    retpoline:      Y
>    vermagic:       6.18.4 SMP preempt mod_unload modversions
> 
> This happens (no signature) with all modules, qrtr.ko was just taken
> as an example.
> 
> Building the kernel via 'make && make modules_install && make install'
> the modules then do have a signature. Also with kernel 6.12.x the
> modules are signed when building with 'make binrpm-pkg'.
> 
> Config looks as follows:
> 
>    # grep CONFIG_MODULE_ .config
>    CONFIG_MODULE_SIG_FORMAT=y
>    CONFIG_MODULE_DEBUGFS=y
>    # CONFIG_MODULE_DEBUG is not set
>    # CONFIG_MODULE_FORCE_LOAD is not set
>    CONFIG_MODULE_UNLOAD=y
>    # CONFIG_MODULE_FORCE_UNLOAD is not set
>    CONFIG_MODULE_UNLOAD_TAINT_TRACKING=y
>    CONFIG_MODULE_SRCVERSION_ALL=y
>    CONFIG_MODULE_SIG=y
>    # CONFIG_MODULE_SIG_FORCE is not set
>    CONFIG_MODULE_SIG_ALL=y
>    # CONFIG_MODULE_SIG_SHA1 is not set
>    # CONFIG_MODULE_SIG_SHA256 is not set
>    # CONFIG_MODULE_SIG_SHA384 is not set
>    CONFIG_MODULE_SIG_SHA512=y
>    # CONFIG_MODULE_SIG_SHA3_256 is not set
>    # CONFIG_MODULE_SIG_SHA3_384 is not set
>    # CONFIG_MODULE_SIG_SHA3_512 is not set
>    CONFIG_MODULE_SIG_HASH="sha512"
>    # CONFIG_MODULE_COMPRESS is not set
>    # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
>    CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
>    CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
>    # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> 
> What am I missing?
> 
> Regards,
> Holger

-- 
Nicolas

