Return-Path: <linux-kbuild+bounces-9867-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9EFC89823
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 12:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9FD19342B34
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 11:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22722F5A2E;
	Wed, 26 Nov 2025 11:27:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E9931E10C
	for <linux-kbuild@vger.kernel.org>; Wed, 26 Nov 2025 11:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156436; cv=none; b=lAmCZ4QetL/QAxCdzyX8h21j2P63sLpUdWhhHBGC5B+LShjdgsWlniW2PFyH8E08a1PCpQb6p6yTYa2DiihoftRnXCvmDva6eItWRApF89fqg1KYuGbu2ZSGEmL+5Acbla4G+X0pWSXH2lrkOZM0Lh5ch6+4BWp1GERmxP3lrM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156436; c=relaxed/simple;
	bh=Mmn6tqkJXO3fkvIt+x6eBm/a5UZkaJnvCv7iIk5J3GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ort3N5DwdOiH+YV+Wy5L7R2NiHJ1utnxAo6hjxXreiKSjsY9Z3qCMRvV1d4QSRzLmi/hNWM8AboK/ETQxQeGpkopNu1FZ1iX5aEm99iCiRhuL14jzlMoJWFv4NfinuVti2Pns765yGqwsywByVz0235kLjEjGksdw4M3ParRCKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vODff-0000m0-Cc; Wed, 26 Nov 2025 12:26:51 +0100
Message-ID: <28e18785-1336-4fbc-9f2b-69aa6bb06375@pengutronix.de>
Date: Wed, 26 Nov 2025 12:26:49 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>,
 Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>,
 Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-7-sjg@chromium.org>
 <20251120084201-53a3c98f-6a3c-4116-8635-be67d58fd57b@linutronix.de>
 <CAFLszTjsgkPV_-Si79RY5T_Fxd5+f-b1VbpG11uS3E9Lk4Ofmg@mail.gmail.com>
 <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20251126080620-921e6880-cacf-44c5-bd8b-f380fbb8090a@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Hi,

On 11/26/25 8:16 AM, Thomas Weißschuh wrote:
> On Tue, Nov 25, 2025 at 02:58:12PM -0700, Simon Glass wrote:
>> On Thu, 20 Nov 2025 at 00:49, Thomas Weißschuh
>> <thomas.weissschuh@linutronix.de> wrote:
>>>
>>> On Wed, Nov 19, 2025 at 11:13:27AM -0700, Simon Glass wrote:
> 
> (...)
> 
>>>>  quiet_cmd_fit = FIT     $@
>>>>        cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
>>>> -             --name '$(UIMAGE_NAME)' \
>>>> +             --name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
>>>
>>> Remnant of a previous revision?
>>
>> The flags are there to allow extra options to be passed if needed.
> 
> Are they necessary for the module functionality added here?
> If not I'd put them into a dedicated commit.
> 
>>>
>>>>               $(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
>>>>               $(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
>>>> +             $(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
>>>
>>> I am wondering how module dependencies work without the depmod invocation
>>> and modules.dep file.
>>
>> We have a mechanism to place a pre-build initrd with the filesystem,
>> etc. into the FIT. But for this particular feature (suggested by Ahmad
>> Fatoum) we are just providing the raw modules. Presumably another
>> initrd would be needed to provide the startup files?
> 
> modules.dep is more than optional and generic startup files but an integral
> part of a module tree. Without it, any module depending on another module's
> symbols will fail to load. Also the modules will be unsigned, potentially
> making them unloadable.

I'll use the occasion to elaborate a bit on why I thought adding modules
is a good idea.

- You have a system boot from FIT and maybe even a r/o rootfs
- You want to boot a different kernel without any userspace changes,
e.g. to bisect
- Fortunately, you have a build target that generates you a FIT with
kernel, enabled device trees and all modules (including deps and such)
- In the bootloader[1], you specify that a CPIO with a minimal init[2]
that bindmounts /lib/modules in the initramfs over the rootfs modules
before pivot_root

and that's it, you are running your new kernel with the old rootfs
unchanged. I believe this would be really handy, which is why I
suggested it.

> Ahmad's patch does produce a complete and fully
> functional module tree by means of 'make headers_install'.

I originally thought that we could generate the CPIO normally as part of
the kernel build and then we can readily depend on it in the rule that
invokes make_fit.py.

If this proves to be too cumbersome, I think it's already an improvement
if the user can manually run make modules-cpio-pkg and then make
image.fit with the initrd specified. A single target would be neater of
course, but I didn't intend for this to stall the series.

It can always follow later.

[1]: For my particular usage, I intend to extend the barebox boot
override mechanism. Currently, it's possible to do:
barebox$ boot -o bootm.initrd=/mnt/tftp/my-ramdisk.cpio /mnt/tftp/my-fit
and I want to extend it to allow appending any number of CPIOs:
barebox$ boot -o bootm.initrd=":/mnt/tftp/my-init.cpio" /mnt/tftp/my-fit

[2]: The bind mount logic for the initramfs init will probably go into
https://github.com/pengutronix/rsinit, which I can compile once per
architecture, put into my TFTP srv path and then not have to worry about it.

Cheers,
Ahmad

> 
>>>>               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
>>>>
>>>>  # XZ
>>>> --
>>>> 2.43.0
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


