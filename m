Return-Path: <linux-kbuild+bounces-1866-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70F8C70B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 05:35:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF3221F232CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 03:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979514411;
	Thu, 16 May 2024 03:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX7VhaVr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85994436;
	Thu, 16 May 2024 03:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715830512; cv=none; b=I4P60XQCsqiz4hbDswnh4/OtF2esT1uPMexN3maIIqJNX6WJHXWPMgIxvTVeHYdoo3JEY8BDvI4NfpYN7pcWiuEOlD3Daw/TZ3yxOkTexkFIPYdtqxJ2v5r4pAgDiv9Eqha3ted99RXJKX/9yx5LrGQWumjAcBjfcej2D5LlCq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715830512; c=relaxed/simple;
	bh=2+EBAwZSXv7snld41RZlX3M09+s/iFM2dzlAQGBv3fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqYmDw3ARG+7syhwoqdETi0Pw+u2MIg2xr7Sxwn8EAZYDTHBaA58aUsxwZzFoQz1zMdyof02zTqw6peQLUTV03LTdoqxY03m+k1o5PIZQvgApUZJyA3zuy+8HF+/DdF5/O8bo3DhJQWAdJYiCp0/gBHpSlKDv6ETtMRrNXVtp4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX7VhaVr; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-792b8bca915so731518585a.2;
        Wed, 15 May 2024 20:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715830510; x=1716435310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hX5liz/Fe6YKpIijJgT2jfuKiPvSGL9g2t06s49+ebI=;
        b=UX7VhaVrQS6t5YNIaRQEFCko2m6rCgU8T/q5lHn+kqTRPum+USiGOVi1867uVk3Vwo
         qBhqCqVPrgIBKf8gMFlH3Gm4fLT+B8V/ksmaTKxB7+12AGpKlLJkKqNChAC7drONM1dU
         Ek82PlXv2Zk/SEA1gRRM+lU6PakAmN2uSO7TuuU8JLVCeG4tSQQC/hNaiEgAdP8GkK/+
         +4xvVPefOb3tZBXe161M0wT8rJyppi94G8qLNxnzpG0sf2gI4eHvYKcEe2eyfxEBYKFX
         YU5C//ET4/g78hYwlmbua+JcUNbSsFDleyQpih/yLKCNIV20W1A/QeBTO7LWzJDcY23s
         kvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715830510; x=1716435310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hX5liz/Fe6YKpIijJgT2jfuKiPvSGL9g2t06s49+ebI=;
        b=JlwpQoNjG5EdAPogd9X2+ReiBbBoNokoKM7S+3kiwRyposHMi4/iAXvol+8GVibMdn
         F1xxujaEpAsqowTm6HRD1qWkfAGEEzKiTp8Kvvq3bGBjX+fDEUtSnriYKHWl4kiAQM7w
         W5ZymdX/8/w/DMGtJxLPe2MGg88B38Y8yeLNRUw1HzIp3QAPcdGDTjRqd+81MOkJ32zD
         imxIVOA/BPSkyP9Hy8R7D2Acr+8HkaEJBzxUeYkmoLxljDZwqXrCk9y/KMqaBAHx1Uja
         58zVTUi42G0+T/NI0RPU0es2cA+Qtycm16si6SKEUqeCkfI0fwMUvRextAYoIGOJto9h
         dgwA==
X-Forwarded-Encrypted: i=1; AJvYcCV0rj6IxemffImoifyVYG5if34QJxOsGVJFQGSCBY5clMPihPU+1gqTIfaviH/MJpowBGzTeeEYwfNQ4m9pA1gue3I3yjdYO6WsIxBcQp54Pi9dn7MyxIVxr720C9o6F3jFTVgIybOfXkpM
X-Gm-Message-State: AOJu0Yy+Shh/G7qaWG/xEekpihv6I9QdLfFQtkh00rxxr4wagc540C3n
	VaiFymHb2Tur2Usi0a/7/nN/fQWrdPBCzU8i8IONqpQIKLrGTugz
X-Google-Smtp-Source: AGHT+IGGjDiO5lDKoiSYpB604VPOCM6B6Oc2HWQxKNmMjcmHcNaLhjvy2qiSAvsvTPI8Q4r09+WpLw==
X-Received: by 2002:a05:620a:4610:b0:792:c7dd:c057 with SMTP id af79cd13be357-792c7ddc885mr2292841285a.72.1715830509604;
        Wed, 15 May 2024 20:35:09 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf340b32sm757383985a.126.2024.05.15.20.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 20:35:08 -0700 (PDT)
Message-ID: <8a699761-de25-409d-9d8a-aa0c1ac4c605@gmail.com>
Date: Wed, 15 May 2024 20:35:06 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/net/dsa/dsa_loop_bdinfo.c build problems
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Stephen Langstaff <stephenlangstaff1@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-kernel@vger.kernel.org, OlteanV@gmail.com
References: <212a9464-d52b-4730-95b9-5a0aebd38c91@gmail.com>
 <CAHx5RXCWW5M-eW5v65bAkQWZemsU2NTvDv3jA9_XKz=+YP56Qg@mail.gmail.com>
 <688e54ec-3b29-4e3b-a2c3-f2c83b9c97b7@lunn.ch>
 <CAHx5RXBFdzsgKXR94gdZd2b=uz8PJDg4OjLPJxKtsdhcjJq3Qw@mail.gmail.com>
 <e307a237-68e3-40c9-be31-4fe3d560ada2@lunn.ch>
 <CAHx5RXCF0=Soz_k88RGvJFGrajaxn=mVnqpb99GAQ=b7XOcWiw@mail.gmail.com>
 <732d8bb2-1d4f-4958-b130-0bd15a407271@gmail.com>
 <CAHx5RXDaweFTF_Qt0GdBH4nBeMqwL4VVto7xzHBvFgFL5n=Ebg@mail.gmail.com>
 <c8c01e53-0a45-4319-88ff-bfb0caba150c@lunn.ch>
 <CAHx5RXDzN93WaYFe2bk6m2TmMC+A9vsmhodRFmZi17cFY5CrWQ@mail.gmail.com>
 <949fcbea-23dc-44c1-9146-c358b15b9253@lunn.ch>
 <b7d6fdcb-4b01-4bc1-8e4b-3cf4ccb951e3@gmail.com>
 <19db38dd-b265-45d3-af1c-85d4cb8d075a@gmail.com>
 <CAK7LNAS9dpp9aW-ESpJq8qaAffrQgUSnAFVVupPcnD3SP8eWZA@mail.gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <CAK7LNAS9dpp9aW-ESpJq8qaAffrQgUSnAFVVupPcnD3SP8eWZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/15/2024 7:17 PM, Masahiro Yamada wrote:
> On Thu, May 16, 2024 at 4:21 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> Adding Olek and Masahiro,
>>
>> On 5/14/24 21:05, Florian Fainelli wrote:
>>>
>>>
>>> On 5/14/2024 9:17 AM, Andrew Lunn wrote:
>>>> On Tue, May 14, 2024 at 05:08:24PM +0100, Stephen Langstaff wrote:
>>>>> On Tue, May 14, 2024 at 1:32 PM Andrew Lunn <andrew@lunn.ch> wrote:
>>>>>
>>>>>> So try to making FIXED_PHY = m, and load it after dsa_loop_bdinfo.ko.
>>>>>
>>>>> In my configuration FIXED_PHY is selected by several other modules:
>>>>>     │ Selected by [y]:
>>>>>     │   - FSL_DPAA_ETH [=y] && NETDEVICES [=y] && ETHERNET [=y] &&
>>>>> NET_VENDOR_FREESCALE [=y] && FSL_DPAA [=y] && FSL_FMAN [=y]
>>>>>     │   - FWNODE_MDIO [=y] && NETDEVICES [=y] && MDIO_DEVICE [=y] &&
>>>>> (ACPI [=y] || OF [=y] || COMPILE_TEST [=n])
>>>>>     │   - OF_MDIO [=y] && NETDEVICES [=y] && MDIO_DEVICE [=y] && OF [=y]
>>>>> && PHYLIB [=y]
>>>>>
>>>>> ...so it looks pretty tied up with the MDIO support which I guess I
>>>>> will need for the real PHY!
>>>>>
>>>>> If I sorted out building the dsa_loop_bdinfo.c code as a built-in do
>>>>> you think that would solve the ordering issue?
>>>
>>> I have re-created the issue with CONFIG_FIXED_PHY=y and for a reason I
>>> do not yet understand the following rule:
>>>
>>> obj-$(CONFIG_FIXED_PHY)                += dsa_loop_bdinfo.o
>>>
>>> does not result in the kernel image containing the dsa_loop_bdinfo.o
>>> object symbols. I am fairly sure this worked when this was submitted
>>> back then, so give me a day or two to figure out why. AFAICT the make
>>> rule is simply not executed.
>>
>> Bisection landed on 227d72063fccb2d19b30fb4197fba478514f7d83 ("dsa:
>> simplify Kconfig symbols and dependencies") which appeared in v5.13 and
>> specifically this hunk being reverted back to how it was before gets us
>> the build results we want:
>>
>> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
>> index 7ffd2d03efaf..5da6424bc6f8 100644
>> --- a/drivers/net/Makefile
>> +++ b/drivers/net/Makefile
>> @@ -45,7 +45,7 @@ obj-$(CONFIG_ARCNET) += arcnet/
>>    obj-$(CONFIG_DEV_APPLETALK) += appletalk/
>>    obj-$(CONFIG_CAIF) += caif/
>>    obj-$(CONFIG_CAN) += can/
>> -obj-$(CONFIG_NET_DSA) += dsa/
>> +obj-y += dsa/
>>    obj-$(CONFIG_ETHERNET) += ethernet/
>>    obj-$(CONFIG_FDDI) += fddi/
>>    obj-$(CONFIG_HIPPI) += hippi/
>>
>> Masahiro, for context in drivers/net/dsa/Makefile we have this bit:
>>
>> obj-$(CONFIG_NET_DSA_LOOP)      += dsa_loop.o
>> ifdef CONFIG_NET_DSA_LOOP
>> obj-$(CONFIG_FIXED_PHY)         += dsa_loop_bdinfo.o
>> endif
>>
>> whereby we want dsa_loop.o to follow the value of CONFIG_NET_DSA_LOOP,
>> and we want dsa_loop_bdinfo.o to be either built as a module or built
>> into the kernel and we want to follow the value of CONFIG_FIXED_PHY
>> because there is a functional dependency between the two objects.
>>
>> Prior to Olek's change this would work just fine because we would always
>> descend into drivers/net/dsa/ but after his change, and assuming that
>> CONFIG_NET_DSA=m which is the case, then we no longer get
>> dsa_loop_bdinfo.o to be built at all when CONFIG_FIXED_PHY=y.
>> Essentially only obj-m rules are being processed, obj-y rules are not.
>>
>> That does not really seem intuitive to me as to why any suggestions on
>> how to fix that, short of unconditionally descending into the tree like
>> we used to?
> 
> 
> 
> "obj-m += dsa/" means everything under dsa/ must be modular.
> 
> 
> 
> If there is a built-in object under dsa/ with CONFIG_NET_DSA=m,
> you cannot do  "obj-$(CONFIG_NET_DSA) += dsa/".
> 
> 
> You need to change it back to "obj-y += dsa/".

Thanks, posted a patch doing that! Is there anyway that Kbuild could be 
warning about such a situation?
-- 
Florian

