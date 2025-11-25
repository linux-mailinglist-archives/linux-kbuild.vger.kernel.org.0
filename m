Return-Path: <linux-kbuild+bounces-9830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFEC84EB6
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 13:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 953273B0B12
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 12:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D95F31B13D;
	Tue, 25 Nov 2025 12:07:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF7A31AF39
	for <linux-kbuild@vger.kernel.org>; Tue, 25 Nov 2025 12:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072454; cv=none; b=FJEc5M674nRx7jPNnXGbi67X2SgAG3EBaZ14rwmiix4VHlYatkx0f5cmCUTqHeMFnxLOVF1QO1AeMf+sltxrA+VZiXEYJ9rvPLip2KVVcZ4Pev803SLDTVlub2ggSoAfgwFe3TDAoXhMQ43VtddfC/0EsMyG1hBkcHtaA1IuEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072454; c=relaxed/simple;
	bh=rbdRwxMDqY64/hyq6k/yxOjQEJJNqBhJ2GJXnyXm57I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6yoxtKjPfKY5xVsNUEmZWCmiBHREe8bKMxSFSIhqsj7tEXahU37XyJ/Wz6NL72VYC76jYWbCwqG+M1lT5BWEcOneJEcssU7NI/r3JK4cM+BF6pknsB3fygeESTViEhlDzG+x5aQyP81/yZep4PQbl1/PIkDApT5fR6yrrx85ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNrpJ-000407-Bi; Tue, 25 Nov 2025 13:07:21 +0100
Message-ID: <e358027d-a996-404f-b043-62b9c1b4d06c@pengutronix.de>
Date: Tue, 25 Nov 2025 13:07:20 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: add target to build a cpio containing modules
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Simon Glass <sjg@chromium.org>,
 kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
References: <20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de>
 <20251120080325-536d8deb-fdfe-4dc0-9687-d5d73006376c@linutronix.de>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20251120080325-536d8deb-fdfe-4dc0-9687-d5d73006376c@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Hello Thomas,

On 11/20/25 8:32 AM, Thomas Weißschuh wrote:
>> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
>> index 74bcb9e7f7a4516473481468a0fcf700c3bead33..20eec9e2dec4dda3fa0ef64a15b80dccdcb55f90 100644
>> --- a/scripts/Makefile.package
>> +++ b/scripts/Makefile.package
>> @@ -189,6 +189,22 @@ tar-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar
>>  tar%-pkg: linux-$(KERNELRELEASE)-$(ARCH).tar.% FORCE
>>  	@:
> 
> The other package targets have a separator and documentation comment.

Ack.

>> +modules-install: FORCE
>> +	$(Q)$(MAKE) -f $(srctree)/Makefile
>> +	$(Q)rm -rf $@
> 
> We have the filename prefix ".tmp_" for temporary files and directories.
> These will be automatically ignored by git and cleaned up by "make clean".

The commit originally followed what the tar target did, but it seems
doing it like perf is the better template. Will adapt.

>> +quiet_cmd_cpio = CPIO    $@
>> +      cmd_cpio = $(srctree)/usr/gen_initramfs.sh $< > $@
> 
> Use $(CONFIG_SHELL).

Can do. Is this to allow users to override CONFIG_SHELL from outside?
If so, why not go one step further and remove shebangs from scripts
altogether to enforce that they are called with a $(VARIABLE) that can
be overridden?

> Using '-o' instead of redirecting stdout to the output file should enable the
> usage of the recent copy_file_range() optimizations in gen_init_cpio.

Will give it a try, thanks.

>> +modules-$(KERNELRELEASE)-$(ARCH).cpio: modules-install
>> +	$(Q)$(MAKE) -f $(srctree)/Makefile $(build)=usr cpio-data= usr/gen_init_cpio
> 
> Drop the explicit '-f'; $(build) overwrites it.

Indeed, will drop.

> Is the cpio-data= intended to make sure the line 'hostprogs := gen_init_cpio'
> is executed? I don't think this works as usr/Makefile will overwrite 'cpio-data'
> in any case. But it should be fine to make hostprogs definition unconditional.

Will add a commit making hostprogs := gen_init_cpio unconditional.
The current approach worked though, because specifying the variable on
the command line overrides cpio-data := assignments even if there are
multiple.

Thanks,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


