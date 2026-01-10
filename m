Return-Path: <linux-kbuild+bounces-10476-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2ED0D560
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 12:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 830393016714
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jan 2026 11:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0447933D6C4;
	Sat, 10 Jan 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b="OGrXM3ej"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ofcsgdbm.dwd.de (ofcsgdbm.dwd.de [141.38.3.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2A533D4E2
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Jan 2026 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.38.3.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768045432; cv=none; b=IbZOAbN0svLymbaUkXJTK4MCVnWEzQalxKC7gBmi9Eh8a/WKIqry0To9HhUE+9uKOC6wrCxOfSH7SHZol3Ube9I8j2yu00na3qNkO+KeddUOj1m2hFt+lZJIP6UUcHuvtyng8nnasnPSp0AAmDai71ac9oNZbOZ2FpA4/3uSt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768045432; c=relaxed/simple;
	bh=zGpme1KSdVB2Sne3eW8Zm9YCCvYp85iD1I4gzT+xGOY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OQjqC5Qm4H8QEmIw/uBoMLzdzMMD7CNbT7Pd5dilZQ2+ICsRAbnie7KyxZjSnSxKGq0j72lBINihnR7T8NZR+G/NC2cONFlEPGHUSy7da87KgHS2rZflyP4Id+7XXi4/j+Hll2K9LWMNRIQi4mZ51cYVSjDugbWYe6DCBB1VbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de; spf=pass smtp.mailfrom=dwd.de; dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b=OGrXM3ej; arc=none smtp.client-ip=141.38.3.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dwd.de
Received: from localhost (localhost [127.0.0.1])
	by ofcsg2dn3.dwd.de (Postfix) with ESMTP id 4dpGxc2Vflz4tyH
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Jan 2026 11:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dwd.de; h=
	content-type:content-type:mime-version:references:message-id
	:in-reply-to:subject:subject:from:from:date:date:received
	:received:received:received:received:received:received:received;
	 s=dwd-csg20210107; t=1768045428; x=1769255029; bh=zGpme1KSdVB2S
	ne3eW8Zm9YCCvYp85iD1I4gzT+xGOY=; b=OGrXM3ejvSr/MDAn/u+CXpZWQnXAH
	7rEWpwjuLWUuKgckfuM1XjDd9HSDDkkgSWfziUgOe1D6kP5U8ia9Tz8lw8zUJvNZ
	xTTC37yaQJk80CW3POfp+SazUwh9riNWO9g+NQCDlfS6qQT3N3t3Yz2AlPC01wQp
	aw6f44881/xd8Jj3WcMg/Y8Y73hNiTcYt6CpEk3WLz60DWhg92ZtjxMyUU01fBl5
	0xU6G4SZZJGr3kbmqPUwMqQY1seVhG05iv39uxm4QS8ouqTecfJExwSniqS4HCG7
	Js6QjDlJeEJ+OKqjTsc6n4KaCi+Vcti5tuE6t+8JYao96VDPFfFObteYg==
X-Virus-Scanned: by amavisd-new at csg.dwd.de
Received: from ofcsg2cteh1.dwd.de ([172.30.232.65])
 by localhost (ofcsg2dn3.dwd.de [172.30.232.26]) (amavis, port 10024)
 with ESMTP id xvME7Z7ZTsMp for <linux-kbuild@vger.kernel.org>;
 Sat, 10 Jan 2026 11:43:48 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with SMTP id 20CBEC902AF4
	for <root@ofcsg2dn3.dwd.de>; Sat, 10 Jan 2026 11:43:48 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id 09BC8C902E75
	for <root@ofcsg2dn3.dwd.de>; Sat, 10 Jan 2026 11:43:27 +0000 (UTC)
X-DDEI-TLS-USAGE: Unused
Received: from ofcsgdbm.dwd.de (unknown [172.30.232.26])
	by ofcsg2cteh1.dwd.de (Postfix) with ESMTP
	for <root@ofcsg2dn3.dwd.de>; Sat, 10 Jan 2026 11:43:26 +0000 (UTC)
Received: from ofcsgdbm.dwd.de by localhost (Postfix XFORWARD proxy);
 Sat, 10 Jan 2026 11:43:27 -0000
Received: from ofcsg2dvf2.dwd.de (unknown [172.30.232.11])
	by ofcsg2dn3.dwd.de (Postfix) with ESMTPS id 4dpGxB70SRz4tvy;
	Sat, 10 Jan 2026 11:43:26 +0000 (UTC)
Received: from ofmailhub.dwd.de (ofldap.dwd.de [141.38.39.208])
	by ofcsg2dvf2.dwd.de  with ESMTP id 60ABhQ4w016337-60ABhQ4x016337;
	Sat, 10 Jan 2026 11:43:26 GMT
Received: from praktifix.dwd.de (praktifix.dwd.de [141.38.44.46])
	by ofmailhub.dwd.de (Postfix) with ESMTP id BD771452FC;
	Sat, 10 Jan 2026 11:43:26 +0000 (UTC)
Date: Sat, 10 Jan 2026 12:43:26 +0100 (CET)
From: Holger Kiehl <Holger.Kiehl@dwd.de>
To: Nicolas Schier <nsc@kernel.org>
cc: linux-kernel <linux-kernel@vger.kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
    Uday Shankar <ushankar@purestorage.com>
Subject: Re: Since 6.18.x make binrpm-pkg does not sign modules
In-Reply-To: <aWFt34dkIvlu1EYI@derry.ads.avm.de>
Message-ID: <71bc53a4-9b54-c15a-96e-23fb338ac71@praktifix.dwd.de>
References: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de> <aWFt34dkIvlu1EYI@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-FEAS-Client-IP: 141.38.39.208
X-FE-Last-Public-Client-IP: 141.38.39.208
X-FE-Policy-ID: 2:2:1:SYSTEM
X-TMASE-Version: DDEI-5.1-9.1.1004-29688.007
X-TMASE-Result: 10--21.626700-10.000000
X-TMASE-MatchedRID: xcONGPdDH5oMek0ClnpVp/HkpkyUphL9fjJOgArMOCb+Aw16GgqpO4UO
	mGTb5yG/x3iFO+XIjdtSOBg59F2OIYqcpPaWAlpJ8MPuu+RzTf5MkOX0UoduuV/8lGqVstJXDEN
	M/mw+DTL+ZF6Oacqo27NXhgNwZpXj7c9QLp+KWZcSEYfcJF0pRYGzTdEevOMzhg/Tt7otYdg1Md
	dcSZZtR9c82afsPzKXHBunSHImBEKLgXghGVLQksYv//yaWh0Dlom2OdVbFGmwxkbalTMB89iiD
	kGpj+2G8YMGIR6ZqjXgEe/gTiF1iTM8HubNfKJD194/5X9VfCxkcZ9Vcvq375mxQvqCDBwfULfC
	3mZUjoQa6MeoDNjEW0a/sUqtu9vNA6bGiJ6csn3CeTJ8O/OHmF1kFRebn5yayPRAwD/3abYbyCX
	f6orxg3wseitYmET9dAmmyaq2DZxDq2SVEk72KFZ0V5tYhzdWxEHRux+uk8jpP8tMOyYmaA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-DDEI-PROCESSED-RESULT: Safe

On Fri, 9 Jan 2026, Nicolas Schier wrote:

> On Fri, Jan 09, 2026 at 03:04:33PM +0100, Holger Kiehl wrote:
> > Hello,
> > 
> > when building kernel with 'make binrpm-pkg' the modules in the
> > /lib/modules directory of the rpm package are no longer signed
> > although one sees the following during the build process:
> > 
> >    .
> >    .
> >    INSTALL /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
> >    .
> >    .
> >    SIGN    /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
> 
> thanks for your report; well, that's interesting.  The modules signed
> during the package build preparations ("SIGN    .../rpmbuild/BUILD/...")
> is significantly larger than the one in the build tree (as expected, as
> the latter is unsigned); but the one that lands in the rpm package is
> _smaller_ than the module in the build tree.
> 
Reading the comment in scripts/package/kernel.spec

   # later, we make all modules executable so that find-debuginfo.sh strips
   # them up. but they don't actually need to be executable, so remove the
   # executable bit, taking care to do it _after_ find-debuginfo.sh has run

I would think that find-debuginfo.sh also strips the signature of the
modules. As a quick test I replaced scripts/package/kernel.spec and
scripts/package/mkspec in the 6.18.4 tree with those from 6.12.64 and
then did a 'make binrpm-pkg'. Then the signature of the modules in
the rpm package are not removed.

Looking back, it looks like this change was introduced with 6.15-rc1:

https://github.com/torvalds/linux/commit/a7c699d090a1f3795c3271c2b399230e182db06e
   or
https://lkml.org/lkml/2025/3/31/1313

The module signatures are needed if you run the kernel in lockdown mode.
The kernel refuses to load unsigned modules.

Regards,
Holger

> My experience with rpmbuild is limited, I need more time for
> investigation.
> 
> Nathan, do you have more insights on the rpm build process?
> 
> Kind regards,
> Nicolas
> 
> 
> 
> >    .
> >    .
> > 
> > But when installing this RPM and check this it says:
> > 
> >    # modinfo /lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
> >    filename:       /lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
> >    alias:          net-pf-42
> >    license:        GPL v2
> >    description:    Qualcomm IPC-router driver
> >    license:        Dual BSD/GPL
> >    description:    Qualcomm IPC Router Nameservice
> >    author:         Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >    srcversion:     473C5AB47E04ECEA0106681
> >    depends:        
> >    intree:         Y
> >    name:           qrtr
> >    retpoline:      Y
> >    vermagic:       6.18.4 SMP preempt mod_unload modversions
> > 
> > This happens (no signature) with all modules, qrtr.ko was just taken
> > as an example.
> > 
> > Building the kernel via 'make && make modules_install && make install'
> > the modules then do have a signature. Also with kernel 6.12.x the
> > modules are signed when building with 'make binrpm-pkg'.
> > 
> > Config looks as follows:
> > 
> >    # grep CONFIG_MODULE_ .config
> >    CONFIG_MODULE_SIG_FORMAT=y
> >    CONFIG_MODULE_DEBUGFS=y
> >    # CONFIG_MODULE_DEBUG is not set
> >    # CONFIG_MODULE_FORCE_LOAD is not set
> >    CONFIG_MODULE_UNLOAD=y
> >    # CONFIG_MODULE_FORCE_UNLOAD is not set
> >    CONFIG_MODULE_UNLOAD_TAINT_TRACKING=y
> >    CONFIG_MODULE_SRCVERSION_ALL=y
> >    CONFIG_MODULE_SIG=y
> >    # CONFIG_MODULE_SIG_FORCE is not set
> >    CONFIG_MODULE_SIG_ALL=y
> >    # CONFIG_MODULE_SIG_SHA1 is not set
> >    # CONFIG_MODULE_SIG_SHA256 is not set
> >    # CONFIG_MODULE_SIG_SHA384 is not set
> >    CONFIG_MODULE_SIG_SHA512=y
> >    # CONFIG_MODULE_SIG_SHA3_256 is not set
> >    # CONFIG_MODULE_SIG_SHA3_384 is not set
> >    # CONFIG_MODULE_SIG_SHA3_512 is not set
> >    CONFIG_MODULE_SIG_HASH="sha512"
> >    # CONFIG_MODULE_COMPRESS is not set
> >    # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> >    CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
> >    CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
> >    # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> > 
> > What am I missing?
> > 
> > Regards,
> > Holger
> 
> -- 
> Nicolas
> 

