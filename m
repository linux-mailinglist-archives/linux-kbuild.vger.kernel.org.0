Return-Path: <linux-kbuild+bounces-4786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E989D54E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 22:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92E16280C70
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348A01DA2F6;
	Thu, 21 Nov 2024 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="Q6dIUuxR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F731B86CF;
	Thu, 21 Nov 2024 21:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732225418; cv=none; b=hz7bA5n1L4pB/LwQ9WwITixo/f6s4pCID5FgZY/B2+12tSHtdnIu0zgpViSO7LtTDoxhHBfR3N/WIbOcAdTa+d8PNxwF6WQ15i4f4lAOSH/OTNjcpQVcivfpiMNLa++ZgkArE6mWSzi22GB3pOyu0bEoryYmAiOG/tEQEJwyijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732225418; c=relaxed/simple;
	bh=6T+dZanRGAdb9LvwIN1qB/R8hVhDMuJAuu09F5PqTK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Heov86KTm8W9gnG3KGHd4sIpyt5DdqP/gkD7nviT0JJVqUWIBn0AMAlnGIGNuACSi8hii81S80LHAK/L1swOcEBP1s4etAzFZsEfmEtjxOc4QUI8pO0bc0l6mW4EB+MagHe2LdFcgnxLivlzKRoGuVkxovkRda55hNoXfZkf5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=Q6dIUuxR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1732225410; bh=6T+dZanRGAdb9LvwIN1qB/R8hVhDMuJAuu09F5PqTK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q6dIUuxRW0VmYwL0qm2t+xkKfZuEI85M3fZVXd9ROjj4PEo9Mo9YEUdRrJ4Y40JET
	 pf8NA3dr4fndQLe2MqYWERGpGW+i0yCtJPXBXPuNsvNoeUPpmx5UC9WtjM8DS6QXx/
	 b4dAInEdo8UOWRS1BqMDFN8pFslUB02ClFTz9Bgs=
Date: Thu, 21 Nov 2024 22:43:29 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PROBLEM] make bindeb-pkg: When just one source line in a single
 driver is changed, all driver are rebuilt?
Message-ID: <9748bda4-0db8-4c70-a321-c7189d575cbc@t-8ch.de>
References: <f96d57c9-efda-4781-a395-a7c5fec7f2ad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f96d57c9-efda-4781-a395-a7c5fec7f2ad@gmail.com>

Hi Mirsad,

On 2024-11-21 22:18:58+0100, Mirsad Todorovac wrote:
> I am perplexed now at 6.12 stable vanilla tree, and I've noticed that after changing just one
> line in ./drivers/gpu/drm/xe/tests/xe_migrate.c:226:5-11, all unrelated drivers are being BTF'd, SIGNED,
> and INSTALL-ed:
> 
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aht10.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/adt7475.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/as370-hwmon.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/aquacomputer_d5next.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/applesmc.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asus_rog_ryujin.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/asc7621.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/atxp1.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/axi-fan-control.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-psu.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9055-hwmon.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/chipcap2.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/cros_ec_hwmon.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/da9052-hwmon.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/coretemp.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/corsair-cpro.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/hwmon/dell-smm-hwmon.ko

This happens when the vermagic is changed. The vermagic is linked into
each module. And after relinking all the other steps also need to be
done.
Building the Debian package increases the build number which ends up in
the vermagic and therefore all modules.
Also there is CONFIG_LOCALVERSION_AUTO which may be involved.

> Is there an option to rebuild just the necessary driver that was modified?

With the whole Debian packaging: No idea.
With plain kbuild: make $MAKEFLAGS $PATH_TO_MODULE.ko

> 2.
> 
> >From the list of files that were compiled, it seems that drivers/gpu/drm/xe/tests/xe_migrate.c was
> not rebult:
> 
> $ grep CC ../err-6.12.0-tiny-pt-02b.log
>   CC      init/version.o
>   CC      init/version-timestamp.o
>   CC      arch/x86/boot/version.o
>   CC      arch/x86/boot/compressed/kaslr.o
>   CC      arch/x86/boot/compressed/misc.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/kallsyms
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/sorttable
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/asn1_compiler
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/genksyms.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/selinux/genheaders/genheaders
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/selinux/mdp/mdp
>   YACC    debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/parse.tab.[ch]
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/sign-file
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/insert-sys-cert
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/parse.tab.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/genksyms/lex.lex.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/modpost.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/file2alias.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/sumversion.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/mod/symsearch.o
>   HOSTCC  debian/linux-headers-6.12.0-dirty/usr/src/linux-headers-6.12.0-dirty/scripts/basic/fixdep
> 
> But they were only BTF + INSTALL + STRIP + SIGN'ed:
> 
> $ grep drivers/gpu/drm/xe/ ../err-6.12.0-tiny-pt-02b.log
>   BTF [M] drivers/gpu/drm/xe/xe.ko
>   INSTALL debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
>   STRIP   debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
>   SIGN    debian/linux-image-6.12.0-dirty/lib/modules/6.12.0-dirty/kernel/drivers/gpu/drm/xe/xe.ko
> 
> Nothing suggests that "drivers/gpu/drm/xe/tests/xe_migrate.c" is being recompiled, though it was modified,
> or at least "touch"-ed.

Do you have CONFIG_DRM_XE_KUNIT_TEST enabled?
It probably does not make sense to use Debian packaging for a kunit
test. Just use kunit.py directly.

> Is this the expected behaviour?
> 
> (I have deliberately skipped "make clean", to see if I can save some building time and grid power.)


Thomas

