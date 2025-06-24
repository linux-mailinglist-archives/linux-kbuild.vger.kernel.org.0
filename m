Return-Path: <linux-kbuild+bounces-7696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F31AE6F55
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 21:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374FA17FCCC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 19:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59C926CE11;
	Tue, 24 Jun 2025 19:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0dpacoD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF3E170826
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792499; cv=none; b=AErVaDJNyGUYyqUt0RTwQzZk1sdIAsCn81uWV0FBD/6yr1HNCQ+w02N6JBOrHN/M5MrDtWYwxthKwUzfVABvYCTNxWKQHDQ+4hBDNLY2GzU4DOKsxAQjSHwoajPK+zowDFgzNbqSjXtVVES5JqFiIoxlwzqzc7bqKNCFMqdNqH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792499; c=relaxed/simple;
	bh=F+ufHKUfSEAi3JOXRzYHAZK4lUckD9bhj1Ag7cvRBmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDNC4waX4Y2q6xbvR2eTAkRuzuvEY6ih5GYCLKXjLMjdPxZQkt1l5g6BbffLfMqaqEiggVOR/eHbkqarVv25ZPfY+Bv5gh4vdiqoBuuD4V3hpByWle7osZuLs8pue244+GSp4HyPBg0uhv/Q0gjK7yd/y782AAMcsvq06nd2XW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0dpacoD; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so1576624a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Jun 2025 12:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750792496; x=1751397296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c7dgBsRhmaQNAp7P7kNjFJVFZs1CDUPcQ7bvbESMeaY=;
        b=l0dpacoDerOuRxHNce3RqreVjCXDBlXIFQviQv/fEmJECIpTpTiyis6NMZdmYohHq9
         7Q5b28RZFNB5YQeUki7/d07iIsuRKc3I00IvYSjJ4Be6lfF/0QY6mn3LgtyEenQyomZq
         VdoC2baSKSaw2vxMsfkjXl3jwff5Y1HI7NTaTYmz79IhwjKROmNGgEZHgGVAXXrZ1Bro
         CfwpD2Y9DjOHXXV+1RDlfqoNJ4zh1QrRSc+UsOT85YEQVXGyQp//mZc5baZ5zYjkNSPb
         bKadJG20q+n6Yk7SEpa+FYwhdIe1E59B1OtOMHkau9W8X5fwSHLz5RA5F35vJMaHAnXm
         y5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792496; x=1751397296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7dgBsRhmaQNAp7P7kNjFJVFZs1CDUPcQ7bvbESMeaY=;
        b=bZSCo3ZwfluV/PyQdG5TcPVMBzDzu+evNv/FV0ezEbZY2AH4VTx9SglNaDYBsF4ogJ
         MPdC8KrLpaU63ETOwM1IkNaRqrzx3gPnKeV7nq4++Pq0usQzcpMkhfI3miJJe8GkjC5Q
         W9dxPdtAwT+DSH22JDCBQBHwos0whxoDdyu4IsQwLG+yTZ4RkglVsWZIb3BCqHggyqtk
         IT4exAehKJLPpv7bg4Uja7suGlaVvnOAywAOxMoQ4tKOtFlmcSf3QXecHxT29ewsFqhs
         YS/Ug7AjIMZC9NrrFv0DoP1tnp2IFs9BOfkctmZsakln/yUk4Nx1hpHnVYM1uIhHXBpT
         TrYw==
X-Gm-Message-State: AOJu0YzQgVtA0ArsOoDf9K37OdK3/Li0D8hOv1yAL/pOz5+TAq+P6eZi
	8ZRF99OW1TzjGIwa8mx5RV3m+K6pp+hNRFIQQvywhThq2i+XsWRknDyz
X-Gm-Gg: ASbGncs1tZZG6D1wi+qVFwx7Hj971ur6bqBubsgsIyKsXT0zHFHC2UZJpoKx02ksL6R
	hZlZNjcFo5fql6Ov/CFFRJ38GlM26plpyVK5mwutlCKuWy3qrnFHNbd53Rl/tZ0YRENAHZxhF33
	ghNxw8XYVZwJ9M83qEeXEm9z28Sywv6E037prLEhCvOQTkHC2pRUTziohMoI4KfEj7C/wabr5iL
	gFNlpjbWIRLfNvbCS6Tz5rJ8NRQdh9l7Qb+nTF9HizIfeao8V1g+bdVCyiMseD5pBXs0CDUGz4H
	+ZoVOfMzW5SNJxmpwMy+Whc0xr+btHFpldSl+v4x/A+Jf627uUMSi+GHUfo2Jweu
X-Google-Smtp-Source: AGHT+IEmQKtXc3SpP964xUsxm9sPNcw2f0yqf5NqmvNAcv7qzpkFCmOwfFHqAncKpZpgxX+e5uZvJg==
X-Received: by 2002:a17:907:aa5:b0:ae0:660f:2b15 with SMTP id a640c23a62f3a-ae0bf226eb7mr23361266b.60.1750792496061;
        Tue, 24 Jun 2025 12:14:56 -0700 (PDT)
Received: from [192.168.0.3] ([91.80.31.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbe72sm909251066b.43.2025.06.24.12.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 12:14:55 -0700 (PDT)
Message-ID: <51e72181-6293-4db6-8e57-cbbf6e9133f3@gmail.com>
Date: Tue, 24 Jun 2025 21:14:54 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Franco Martelli <martellif67@gmail.com>
References: <20250604183539.425053-1-martellif67@gmail.com>
 <CAK7LNAROMO2686KPbt+ZquymcZC-RLr0aX5x477uF1DaesUkCQ@mail.gmail.com>
 <9aaea19f-cd15-44fe-8d61-984f7ff316b7@gmail.com>
 <64d93af1-b602-4dba-ad4b-a2b9a493c800@gmail.com>
 <CAK7LNAQTuk9S5+oUARefryz3cz2HF3q6_bvW8PmJi1dhWa26DA@mail.gmail.com>
Content-Language: en-US
From: Franco Martelli <martellif67@gmail.com>
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAl8MfXoCGwMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklBgAwEAhdX5TbxGOmMhlJUi9AkDACN2ZemI8Tz2jSZPDlOQoE0A/3Tq
 SPaEkb6kvK4xw626+AUDrfIzwzBscgpkDo4zCW0DzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAl8MfXoCGwwFCQlmAYAACgkQXEn0O0LcklCMtgEAuCcSolf8LBIB4WTI
 4YGKiN7qBXfW0QTbPO+bPXQLxfEBAJuoVm3BlyMHoNG6UEZ2TcqfV8k6oRqwr/c0IXwJqEkK
In-Reply-To: <CAK7LNAQTuk9S5+oUARefryz3cz2HF3q6_bvW8PmJi1dhWa26DA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/06/25 at 12:33, Masahiro Yamada wrote:
> On Thu, Jun 19, 2025 at 3:55 AM Franco Martelli <martellif67@gmail.com> wrote:
>>
>> On 16/06/25 at 15:44, Franco Martelli wrote:
>>> On 16/06/25 at 15:04, Masahiro Yamada wrote:
>>>> On Thu, Jun 5, 2025 at 3:36 AM Franco Martelli <martellif67@gmail.com>
>>>> wrote:
>>>>>
>>>>> Signed-off-by: Franco Martelli <martellif67@gmail.com>
>>>>> ---
>>>>>
>>>>> Dear Linux hacker,
>>>>>
>>>>> I've written a patch that allows to compare the tristate value of two
>>>>> .config files inline, symbol by symbol, in mconf (make menuconfig) only.
>>>>
>>>>
>>>> I do not understand why this needs to be implemented in
>>>> menuconfig.
>>>> scripts/diffconfig is already available.
>>
>>> When a new stable release of a distribution is available, in the Linux
>>> kernel many things has changed, this patch comes in help in this
>>> situations, it allows to easily compare the customized .config file
>>> built for the previous version of the distribution, with the one
>>> provided by the new software distribution, used as reference.
>>> Generally it can be helpful when the differences between .config files
>>> are huge, because you can navigate across them in the menu window.
>>
>>>>
>>>> I think the comparison mode is rather distracting.
>>>>
>>
>> A solution to improve readability of the comparison mode could
>> be to skip symbols without differences, so leaving those menu
>> entries untouched. This will shrink the amounts of characters
>> displayed significantly.
>>
>> I can send a version 3 of the patch changed accordingly, if
>> you don't reply to this email I will assume yes, but if you
>> are definitely against to this patch, please let me to know.
> 
> I do not think menuconfig (or nconfig) is the right place,
> the user appearance does not assume an extra column.
> 
> If you really want to implement this, xconfig or gconfig
> is better, as they have a 'value' column. It is easier to
> add another column.

I know nothing about QT or GTK, and I don't like to interact
with the mouse when I customize the .config file.

There is no need to reserve a column for the compared value
IMHO. With the third version of the patch when toggling a
tristate value the menu item is restored and no difference
are no longer reported, giving a cool experience for kernel
newbies or end users.

Please try the third version of the patch, load an old file
.config file to compare and tries to toggle the tristate
value of a menu item, it's amazing!

> But, have you used scripts/diffconfig?
> Didn't it suffice your needs?

Sadly diffconfig is not a viable solution for me because of
this:

$ ./scripts/diffconfig config-6.12.32-amd64 config-6.1.137 | wc -l
7373

config-6.12.32-amd64 is the new kernel LTS .config file
provided by the software distribution, that I have to use
as reference for the new customization, config-6.1.137 is
my old kernel LTS .config file with the old customization.
Too many symbol changes reported by diffconfig.

Kind regards,
-- 
Franco Martelli

