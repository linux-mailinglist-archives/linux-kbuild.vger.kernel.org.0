Return-Path: <linux-kbuild+bounces-201-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508757FE02C
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 20:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03A82282466
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33C35DF14;
	Wed, 29 Nov 2023 19:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7B6D7D
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:15:14 -0800 (PST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1r8Q1V-0003uT-9O; Wed, 29 Nov 2023 20:15:01 +0100
Message-ID: <875f0dbc-1d78-4901-91b2-6ad152bcea5a@pengutronix.de>
Date: Wed, 29 Nov 2023 20:14:58 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] arm64: boot: Support Flat Image Tree
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 lkml <linux-kernel@vger.kernel.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>,
 linux-kbuild@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20231129172200.430674-1-sjg@chromium.org>
 <20231129172200.430674-3-sjg@chromium.org>
 <30f32467-51ea-47de-a272-38e074f4060b@pengutronix.de>
 <CAPnjgZ25xoXsi74XYY0E8ucQiowQqPdZgUHrfVNAYWKZEYODHg@mail.gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAPnjgZ25xoXsi74XYY0E8ucQiowQqPdZgUHrfVNAYWKZEYODHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

Hello Simon,

On 29.11.23 20:02, Simon Glass wrote:
> Hi Ahmad,
> 
> On Wed, 29 Nov 2023 at 11:59, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> Hi,
>>
>> a few more comments after decompiling the FIT image:
>>
>> On 29.11.23 18:21, Simon Glass wrote:
>>> +    with fsw.add_node('kernel'):
>>> +        fsw.property_string('description', args.name)
>>> +        fsw.property_string('type', 'kernel_noload')
>>
>> The specification only says no loading done, but doesn't explain what it
>> means for a bootloader to _not_ load an image. Looking into the U-Boot commit
>> b9b50e89d317 ("image: Implement IH_TYPE_KERNEL_NOLOAD") that introduces this,
>> apparently no loading means ignoring load and entry address?
>>
>> I presume missing load and entry is something older U-Boot versions
>> were unhappy about? Please let me know if the semantics are as I understood,
>> so I can prepare a barebox patch supporting it.
> 
> Oh, see my previous email.

Thanks.

> 
>>
>>> +        fsw.property_string('arch', args.arch)
>>> +        fsw.property_string('os', args.os)
>>> +        fsw.property_string('compression', args.compress)
>>> +        fsw.property('data', data)
>>> +        fsw.property_u32('load', 0)
>>> +        fsw.property_u32('entry', 0)
>>> +
>>> +
>>> +def finish_fit(fsw, entries):
>>> +    """Finish the FIT ready for use
>>> +
>>> +    Writes the /configurations node and subnodes
>>> +
>>> +    Args:
>>> +        fsw (libfdt.FdtSw): Object to use for writing
>>> +        entries (list of tuple): List of configurations:
>>> +            str: Description of model
>>> +            str: Compatible stringlist
>>> +    """
>>> +    fsw.end_node()
>>> +    seq = 0
>>> +    with fsw.add_node('configurations'):
>>> +        for model, compat in entries:
>>> +            seq += 1
>>> +            with fsw.add_node(f'conf-{seq}'):
>>> +                fsw.property('compatible', bytes(compat))
>>
>> The specification says that this is the root U-Boot compatible,
>> which I presume to mean the top-level compatible, which makes sense to me.
>>
>> The code here though adds all compatible strings from the device tree though,
>> is this intended?
> 
> Yes, since it saves needing to read in each DT just to get the
> compatible stringlist.

The spec reads as if only one string (root) is supposed to be in the list.
The script adds all compatibles though. This is not really useful as a bootloader
that's compatible with e.g. fsl,imx8mm would just take the first device tree
with that SoC, which is most likely to be wrong. It would be better to just
specify the top-level compatible, so the bootloader fails instead of taking
the first DT it finds.

>>> +        fsw.property_string('description', model)
>>> +        fsw.property_string('type', 'flat_dt')
>>> +        fsw.property_string('arch', arch)
>>> +        fsw.property_string('compression', compress)
>>> +        fsw.property('compatible', bytes(compat))
>>
>> I think I've never seen a compatible for a fdt node before.
>> What use does this serve?
> 
> It indicates the machine that the DT is for.

Who makes use of this information?

Thanks,
Ahmad

> 
> Regards,
> Simon
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


