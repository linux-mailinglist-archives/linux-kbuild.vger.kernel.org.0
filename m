Return-Path: <linux-kbuild+bounces-9831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5E0C84F35
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 13:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 88FEC34AF24
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 12:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEE631B126;
	Tue, 25 Nov 2025 12:21:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B811A9B58
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764073302; cv=none; b=g0aIxBJy64sDUiCFR4hi49tksWg2MpG1ZCxf/+a7P8qZrrfTqv9DGnD5qfempcBFkjSQj5cu4kH34dV3DWGCDfN69quNsnZ226HVMpnad/XkRK7+TCign1p8MiR+Th/IgazGxsBA19JxSS7k6+EdP9PIyC6KoFHcrA3n//T1moA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764073302; c=relaxed/simple;
	bh=lRYBE+dbukqC0GncIrkrRBKj4ekSJtzNsllPrrPPcuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h+JOcbdqBX5Xdb11itkyLtBCMzhVZ02ZiDV/GpIzlNW2vSdCtjGTNouz4ntvFOpjONt0n9sthaUfcp7SXAbFYX/7fhJH5ODz+PgfiCjskfrBCZppDRMz4NPOMxjuzu8v144Hb8GLbLksv/4AmHuhDgbS30RMQdo5Vf8Eio+t5Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNs31-0005bx-7W; Tue, 25 Nov 2025 13:21:31 +0100
Message-ID: <7a707cc0-f360-4379-9278-b05e4bed6c5b@pengutronix.de>
Date: Tue, 25 Nov 2025 13:21:30 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: add target to build a cpio containing modules
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Simon Glass
 <sjg@chromium.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>
References: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
 <20251120063936.GA3321365@ax162>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20251120063936.GA3321365@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Hi Nathan,

On 11/20/25 7:39 AM, Nathan Chancellor wrote:
> On Sat, Nov 15, 2025 at 03:21:51PM +0100, Ahmad Fatoum wrote:
>> From: Sascha Hauer <s.hauer@pengutronix.de>
>> +modules-install: FORCE
>> +	$(Q)$(MAKE) -f $(srctree)/Makefile
>> +	$(Q)rm -rf $@
>> +	$(Q)$(MAKE) -f $(srctree)/Makefile INSTALL_MOD_PATH=$@ modules_install
>> +
>> +quiet_cmd_cpio = CPIO    $@
>> +      cmd_cpio = $(srctree)/usr/gen_initramfs.sh $< > $@
>> +
>> +modules-$(KERNELRELEASE)-$(ARCH).cpio: modules-install
>> +	$(Q)$(MAKE) -f $(srctree)/Makefile $(build)=usr cpio-data= usr/gen_init_cpio
> 
> This seems like a bit of a hack to generate gen_init_cpio this way but I
> am not sure it is worth moving usr/gen_init_cpio.c and
> usr/gen_initramfs.sh elsewhere (scripts?) to make it a most accessible
> hostprog right now... Nicolas, do you have any opinions on this?

After incorporating Thomas' feedback, this is simplified to:

  $(Q)$(MAKE) $(build)=usr usr/gen_init_cpio

which looks much better.

>> +	$(call cmd,cpio)
>> +
>> +PHONY += cpio-modules-pkg
>> +cpio-modules-pkg: modules-$(KERNELRELEASE)-$(ARCH).cpio
> 
> I think it would make a little more sense (and match the style of the
> perf package targets as well) to name this target modules-cpio-pkg.

It currently matches the style of the tar packages, which start with
tar-, but I can follow the perf- order. Makes more sense if it's
extended to support compressed cpios in future too.

Cheers,
Ahmad

> 
>> +	@:
>> +
>>  # perf-tar*-src-pkg - generate a source tarball with perf source
>>  # ---------------------------------------------------------------------------
>>  
>> @@ -245,6 +261,7 @@ help:
>>  	@echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
>>  	@echo '  tarxz-pkg           - Build the kernel as a xz compressed tarball'
>>  	@echo '  tarzst-pkg          - Build the kernel as a zstd compressed tarball'
>> +	@echo '  cpio-modules-pkg    - Build the kernel modules as cpio archive'
>>  	@echo '  perf-tar-src-pkg    - Build the perf source tarball with no compression'
>>  	@echo '  perf-targz-src-pkg  - Build the perf source tarball with gzip compression'
>>  	@echo '  perf-tarbz2-src-pkg - Build the perf source tarball with bz2 compression'
>>
>> ---
>> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
>> change-id: 20251115-cpio-modules-pkg-70d85a69892b
>>
>> Best regards,
>> -- 
>> Ahmad Fatoum <a.fatoum@pengutronix.de>
>>
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


