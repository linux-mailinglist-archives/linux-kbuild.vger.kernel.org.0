Return-Path: <linux-kbuild+bounces-204-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B677FE057
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 20:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B39A2823AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 19:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC065DF18;
	Wed, 29 Nov 2023 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0BAE1A8
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2023 11:34:05 -0800 (PST)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1r8QJj-0006Uf-P7; Wed, 29 Nov 2023 20:33:51 +0100
Message-ID: <06281f7c-e0f2-405c-95a9-0f7e9e84a7f6@pengutronix.de>
Date: Wed, 29 Nov 2023 20:33:48 +0100
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
 <875f0dbc-1d78-4901-91b2-6ad152bcea5a@pengutronix.de>
 <CAPnjgZ0UCkm5QCx+JXe1ggSshozPnOLB6cN=UoJyMn6S4wfFkg@mail.gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAPnjgZ0UCkm5QCx+JXe1ggSshozPnOLB6cN=UoJyMn6S4wfFkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kbuild@vger.kernel.org

On 29.11.23 20:27, Simon Glass wrote:
> On Wed, 29 Nov 2023 at 12:15, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> On 29.11.23 20:02, Simon Glass wrote:
>>> On Wed, 29 Nov 2023 at 11:59, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>> The specification says that this is the root U-Boot compatible,
>>>> which I presume to mean the top-level compatible, which makes sense to me.
>>>>
>>>> The code here though adds all compatible strings from the device tree though,
>>>> is this intended?
>>>
>>> Yes, since it saves needing to read in each DT just to get the
>>> compatible stringlist.
>>
>> The spec reads as if only one string (root) is supposed to be in the list.
>> The script adds all compatibles though. This is not really useful as a bootloader
>> that's compatible with e.g. fsl,imx8mm would just take the first device tree
>> with that SoC, which is most likely to be wrong. It would be better to just
>> specify the top-level compatible, so the bootloader fails instead of taking
>> the first DT it finds.
> 
> We do need to have a list, since we have to support different board revs, etc.

Can you give me an example? The way I see it, a bootloader with
compatible "vendor,board" and a FIT with configuration with compatibles:

  "vendor,board-rev-a", "vendor,board"
  "vendor,board-rev-b", "vendor,board"

would just result in the bootloader booting the first configuration, even if
the device is actually rev-b.


>>>>> +        fsw.property_string('description', model)
>>>>> +        fsw.property_string('type', 'flat_dt')
>>>>> +        fsw.property_string('arch', arch)
>>>>> +        fsw.property_string('compression', compress)
>>>>> +        fsw.property('compatible', bytes(compat))
>>>>
>>>> I think I've never seen a compatible for a fdt node before.
>>>> What use does this serve?
>>>
>>> It indicates the machine that the DT is for.
>>
>> Who makes use of this information?
> 
> U-Boot uses it, I believe. There is an optimisation to use this
> instead of reading the DT itself.

The configuration already has a compatible entry. What extra use is the compatible
entry in the FDT node?

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


