Return-Path: <linux-kbuild+bounces-10451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A0D0A920
	for <lists+linux-kbuild@lfdr.de>; Fri, 09 Jan 2026 15:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A301F301AFC5
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jan 2026 14:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96AD35E523;
	Fri,  9 Jan 2026 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b="cdSFwx1K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ofcsgdbm.dwd.de (ofcsgdbm.dwd.de [141.38.3.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD8D54763
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Jan 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.38.3.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968057; cv=none; b=Rl7C4GXPGDfeqNRyqVvwEBhrOuEUzPFlKaFUkSh2OZQ+BurCCnjPWU3PPr+2X/WfqV37c3MLIfH634TE5068W166yeK87WVqP1y7+fC3eVl+laZGjGStK4kA1KOXTMYnXq4TRev3cLTMu3ruzFXi77sZZQCsY7mMZZ+9oCUDUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968057; c=relaxed/simple;
	bh=3MOFehWZ9m5+WiMtSF8r9O2f2bs1OUZJqo/UhG5ujSo=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=bZRdOgeRXTYicdq7+h2NrUYPEZ879wMHwf5ARPHYjFhiaDFcx8Sd1A3pKtuSIZ8wr4fUJdXG1DVJ5B0/um4lIWQYkwW+NaPmJ4miblP4JH4xddQ64OcNvqNv7OHU231GnXdfaaTZzh6OHzuZtu0+eeNO8j6w4VaBolatK6Oxcb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de; spf=pass smtp.mailfrom=dwd.de; dkim=pass (2048-bit key) header.d=dwd.de header.i=@dwd.de header.b=cdSFwx1K; arc=none smtp.client-ip=141.38.3.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dwd.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dwd.de
Received: from localhost (localhost [127.0.0.1])
	by ofcsg2dn4.dwd.de (Postfix) with ESMTP id 4dnk6V3LH0z2wMY
	for <linux-kbuild@vger.kernel.org>; Fri,  9 Jan 2026 14:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dwd.de; h=
	content-type:content-type:mime-version:message-id:subject
	:subject:from:from:date:date:received:received:received:received
	:received:received:received:received; s=dwd-csg20210107; t=
	1767967474; x=1769177075; bh=3MOFehWZ9m5+WiMtSF8r9O2f2bs1OUZJqo/
	UhG5ujSo=; b=cdSFwx1KlfRRGQ/vIHdPqP8m9vKpsRrIgk34VeyMhI0X2bzg9vn
	loGLhHYJ4gstm36qeIxiecdSlD4/1o1xaWnjHRfuR2xKF1R0S/UQftRFNU71zIKu
	gzRSXu6oHLiNH+wuajAL9lvKeco/gD8YrzwBqw/gUwwrwRjWZr8GTSfKqxJ2J43D
	M7xFrKTJ5cPuUMhpyWzhEMnFXYJELPDsdG1J0CvKROq3A3M1oBPA8PqJ7s8tiIY/
	1gTHfEBxGXWNSctRoQ3cft+cAdVqHvuH5lePWQuEl8tPseDgUPqyTC+/mdIPstxg
	wYPduFYgGp4ik/Ppkd6juQtrrL4s9C9S03g==
X-Virus-Scanned: by amavisd-new at csg.dwd.de
Received: from ofcsg2cteh1.dwd.de ([172.30.232.65])
 by localhost (ofcsg2dn4.dwd.de [172.30.232.27]) (amavis, port 10024)
 with ESMTP id VzkCt50SRk8K for <linux-kbuild@vger.kernel.org>;
 Fri,  9 Jan 2026 14:04:34 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id 2A6CAC902D73
	for <root@ofcsg2dn4.dwd.de>; Fri,  9 Jan 2026 14:04:34 +0000 (UTC)
Received: from ofcsg2cteh1.dwd.de (unknown [127.0.0.1])
	by DDEI (Postfix) with ESMTP id 1E8E9C90291A
	for <root@ofcsg2dn4.dwd.de>; Fri,  9 Jan 2026 14:04:34 +0000 (UTC)
X-DDEI-TLS-USAGE: Unused
Received: from ofcsgdbm.dwd.de (unknown [172.30.232.27])
	by ofcsg2cteh1.dwd.de (Postfix) with ESMTP
	for <root@ofcsg2dn4.dwd.de>; Fri,  9 Jan 2026 14:04:34 +0000 (UTC)
Received: from ofcsgdbm.dwd.de by localhost (Postfix XFORWARD proxy);
 Fri, 09 Jan 2026 14:04:34 -0000
Received: from ofcsg2dvf1.dwd.de (unknown [172.30.232.10])
	by ofcsg2dn4.dwd.de (Postfix) with ESMTPS id 4dnk6V0T30z2wMG;
	Fri,  9 Jan 2026 14:04:34 +0000 (UTC)
Received: from ofmailhub.dwd.de (ofmailhub.dwd.de [141.38.39.208])
	by ofcsg2dvf1.dwd.de  with ESMTP id 609E4XtC014759-609E4XtD014759;
	Fri, 9 Jan 2026 14:04:33 GMT
Received: from praktifix.dwd.de (praktifix.dwd.de [141.38.44.46])
	by ofmailhub.dwd.de (Postfix) with ESMTP id D6B40453EE;
	Fri,  9 Jan 2026 14:04:33 +0000 (UTC)
Date: Fri, 9 Jan 2026 15:04:33 +0100 (CET)
From: Holger Kiehl <Holger.Kiehl@dwd.de>
To: linux-kernel <linux-kernel@vger.kernel.org>
cc: Nathan Chancellor <nathan@kernel.org>, 
    Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org
Subject: Since 6.18.x make binrpm-pkg does not sign modules
Message-ID: <68c375f6-e07e-fec-434d-6a45a4f1390@praktifix.dwd.de>
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
X-TMASE-Version: DDEI-5.1-9.1.1004-29688.000
X-TMASE-Result: 10--7.515800-10.000000
X-TMASE-MatchedRID: ebEStOsB1eHlWiNI/3lADytPpXoicS5XBGvINcfHqhfCvo6DOxRiGkky
	WkxwbAqd6A359G52VXra79nEzIkbtuuxJ6yExp+Qvybt3bgNxoIZ9kiZvd+oBHEYikaYBI9GTx9
	jhIf/nmx+etgWL9CZfCXsjdlhqK2FuzPW6EqBhGCOjIrMSa2sR52PthYkuzed6ljkEk+hhAdNx9
	SgDrJ3kiXIi1nfrFIZmyiLZetSf8l9j2GwzTE3vSq2rl3dzGQ1pJED3CRyjE8fik2cUsCLrum1C
	81V6y79WllSBewq9pcVBlgIO1cr7el5G/kaPuJqftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-DDEI-PROCESSED-RESULT: Safe

Hello,

when building kernel with 'make binrpm-pkg' the modules in the
/lib/modules directory of the rpm package are no longer signed
although one sees the following during the build process:

   .
   .
   INSTALL /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
   .
   .
   SIGN    /usr/src/kernels/linux-6.18.4/rpmbuild/BUILD/kernel-6.18.4-build/BUILDROOT/lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
   .
   .

But when installing this RPM and check this it says:

   # modinfo /lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
   filename:       /lib/modules/6.18.4/kernel/net/qrtr/qrtr.ko
   alias:          net-pf-42
   license:        GPL v2
   description:    Qualcomm IPC-router driver
   license:        Dual BSD/GPL
   description:    Qualcomm IPC Router Nameservice
   author:         Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
   srcversion:     473C5AB47E04ECEA0106681
   depends:        
   intree:         Y
   name:           qrtr
   retpoline:      Y
   vermagic:       6.18.4 SMP preempt mod_unload modversions

This happens (no signature) with all modules, qrtr.ko was just taken
as an example.

Building the kernel via 'make && make modules_install && make install'
the modules then do have a signature. Also with kernel 6.12.x the
modules are signed when building with 'make binrpm-pkg'.

Config looks as follows:

   # grep CONFIG_MODULE_ .config
   CONFIG_MODULE_SIG_FORMAT=y
   CONFIG_MODULE_DEBUGFS=y
   # CONFIG_MODULE_DEBUG is not set
   # CONFIG_MODULE_FORCE_LOAD is not set
   CONFIG_MODULE_UNLOAD=y
   # CONFIG_MODULE_FORCE_UNLOAD is not set
   CONFIG_MODULE_UNLOAD_TAINT_TRACKING=y
   CONFIG_MODULE_SRCVERSION_ALL=y
   CONFIG_MODULE_SIG=y
   # CONFIG_MODULE_SIG_FORCE is not set
   CONFIG_MODULE_SIG_ALL=y
   # CONFIG_MODULE_SIG_SHA1 is not set
   # CONFIG_MODULE_SIG_SHA256 is not set
   # CONFIG_MODULE_SIG_SHA384 is not set
   CONFIG_MODULE_SIG_SHA512=y
   # CONFIG_MODULE_SIG_SHA3_256 is not set
   # CONFIG_MODULE_SIG_SHA3_384 is not set
   # CONFIG_MODULE_SIG_SHA3_512 is not set
   CONFIG_MODULE_SIG_HASH="sha512"
   # CONFIG_MODULE_COMPRESS is not set
   # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
   CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
   CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
   # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set

What am I missing?

Regards,
Holger

