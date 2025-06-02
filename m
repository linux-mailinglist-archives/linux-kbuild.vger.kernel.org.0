Return-Path: <linux-kbuild+bounces-7342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A276ACAF1E
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 15:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D96D3A3B7E
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 13:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E108D21CC6D;
	Mon,  2 Jun 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5HwKRrJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF99235968
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Jun 2025 13:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871360; cv=none; b=h6wn7PBlO8BgR2l+oJsMXUeVt4ZnJp7SEW6uGkejAcUXk3DD0VlDViPK9JD/UFB/sWcUspJAgNaTCuU/oqExaJU2F/B8LG1ps1fCnzYQWiA4tJ4n+HX7nbC0DOq0fwzIHN0XomGi4Txr/oDguvZy0BVVMVSqOZ1gkLsfoVK28A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871360; c=relaxed/simple;
	bh=Nn5z+AbHk1Kte3e9BmAJdn/ULsQWuT8fUp0uplhHkg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HssbV2xt9/ZcI9rRoeC0R5sbICitkl/ebPduUGqqZEd5bBNyqFyuSfAbWNyX43a19OzuGyegh4Sf/0jTIMBd+RKxkdkNk/0nzZ2c8uvC2eDJugnuqRT9ZuBDhjWqxHPs/dyzZmMThwxSBvnkV7wLInNQL479KIRie60809cAUgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5HwKRrJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad51ba0af48so961317066b.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Jun 2025 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748871357; x=1749476157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=khEphp06kyPLJyg1wW6iV3Rq0f6Q/QQdtvwCK89s32c=;
        b=W5HwKRrJO8b3Tlhzec+pxaSuDh2+jMq9uZN6zflslOwvNap+UvcSAekD7DVnecnDB7
         bQPrF5LlO6HeKUC9yjdL7AfgbIvfhXiu2uNO9veGjW6jAWCu0qyvWp1ZiPqFUZR/GUne
         7Wwv4zDdGdl8mkL8ldJjDobucV9IfTAGEW1UgHi0RX/YTeYhWdPR+LOqxokM3MR6wTlr
         Vz1QcRUMMIGaUDyNm2Zv/0cuNUmdM/6xXGs+6vEWQtekIP4acGcjtKyD29T3DKJyKc0J
         8e0LejFiOXhzXQ3miVVBpqjLaYXto7H704wQshWCaecmHfKBRHHg/x+hCXl4BSY+oLHb
         Vp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871357; x=1749476157;
        h=content-transfer-encoding:in-reply-to:content-language:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khEphp06kyPLJyg1wW6iV3Rq0f6Q/QQdtvwCK89s32c=;
        b=pH3qyWTpp/VPZmApf0CWVodan+xTzdsY2C9FfaWFpmm0UsJjIVaKXHIpHuoQddfN/U
         Gt4krZkR5Rneb8mSmHdQWYA3ovRLnBzG3VXGOOSL0xxfSQQ5a/0dFK/1Vl4FkN0ouMKW
         4Mv4ohdbS+qZyfx5qJDDx4WZN7uMx9W5ivzFtx3SnjS3VDFmrDrr+WNj4XBlIhZsSokz
         NBTU5FehF7aIguavQF1+uzVBrKZ6eeXGDJafvzdnjuRpN7ljfI8W6bw3ImecGeI80Xx8
         +YZn08LHYi5a1S2Tzd0kB12IoZheu1lowX3v8gqXiho4OBClKxSZnlzzhbHiG/Cfd3lB
         srXw==
X-Gm-Message-State: AOJu0Yz6gRvK+IvostfiB/CTpsvPhGEsneF2U/UAb6G0t/AP7eG/iOgp
	9B2XxgTyq/m4g5zSE0pkLzbsFJ9d/st23/UNEklfoQcPEdl7njx2V3kv
X-Gm-Gg: ASbGncvfkzuR5TBev0i+qZBtc27KX3Zu0XuodzkGpWmu1EA5EUo1Gw//9Iv3u8om5tb
	snJ+yJaJpnkUn0yFEasEZO2XjiStJ9IKZyI1ErE2Ub73kUP6uai0+tt5RKgq/hhD/Xlj+HAbprj
	hqVgPG45b4LMEIh9giK3orvDy+nx3ub8MCk/xIPJ5LZAgHZPYcnN19gGHXJ4iVmA3O83q/ygBOA
	bD5lWNEuCrZTjgMWOMPfN3rOw322wcwR8Q18mvR5gCU8yNuzUhCtwh5zlCHmf8P2Cx8kQ6djInG
	PJw+RtQFvDrBLdjM16EpKC2wq9seJmH+5KMmMAtShKpAA9KBCuQXG7uXMt3NvCijfcsc/1AbmNA
	hxoHcelCqQr9zCZcB4mdSSNg=
X-Google-Smtp-Source: AGHT+IFI6gzbVJ591O3W/+/ecxOnHEZVTR7U2krF46uDuNK6GaQXqyVuW6lPJRL3/BcyxGk8NLyjGw==
X-Received: by 2002:a17:907:d649:b0:ad8:908d:20f3 with SMTP id a640c23a62f3a-ad8b0e93f91mr1727673566b.28.1748871356921;
        Mon, 02 Jun 2025 06:35:56 -0700 (PDT)
Received: from [192.168.0.3] (mob-5-90-139-122.net.vodafone.it. [5.90.139.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c59f81sm6030046a12.18.2025.06.02.06.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 06:35:56 -0700 (PDT)
Message-ID: <9224246f-d069-4e38-bae0-0a9ae9b0b1c7@gmail.com>
Date: Mon, 2 Jun 2025 15:35:55 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] kconfig: comparison feature between two .config files
 added to mconf
To: Randy Dunlap <rdunlap@infradead.org>, masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org
References: <20250601184049.368419-1-martellif67@gmail.com>
 <a7fb70de-7bf1-4208-a62c-2b8b9d0ec6bf@infradead.org>
 <9ad8db45-0de3-4803-8747-e1259d1f2219@infradead.org>
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
Content-Language: en-US
In-Reply-To: <9ad8db45-0de3-4803-8747-e1259d1f2219@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/25 at 05:37, Randy Dunlap wrote:
> Hi,
> 
> On 6/1/25 6:04 PM, Randy Dunlap wrote:
>> Hi,
>>
>>
>>
>> On 6/1/25 11:40 AM, Franco Martelli wrote:
>>> Dear Linux hacker,
>>>
>>> I've written a patch that allows to compare the tristate value of two
>>> .config files inline, symbol by symbol, in mconf (make menuconfig) only.
>>> It can be useful when customizing the .config file, personally I use it
>>> to compare my .config file with the one provided by the software
>>> distribution.
>>
>> I like this concept. Thanks.
> 
> Of course there is also scripts/diffconfig but it can be a bit noisy.

Yes, on the Internet there are many recipes to obtain differences 
between two files, but I would be liked something more direct.

> 
>>>> A screenshot of the new mconf view is available here:
>>> https://i.is.cc/2cpIXxoP.jpg
>>
>> That virtual terminal is wider than 80 columns.  :)
>>
>> Please make <Compare> fit into an 80-columns terminal (squeeze spaces on that line).
>>
> 
> See patch below.

Thanks for appreciate my patch! :)

> 
>>> The patch was originally written on Linux 6.1 amd64 series tested on
>>> 6.1.137 kernel version.
>>>
>>> The patch has a limitation, it only show the tristate value (Y/N/M) not
>>> differences for symbol with a value (string), but it also marks with a
>>> "#" the symbol missing in the loaded .config, meaning therefore the
>>> symbol as a new feature.
>>>
>>> o I've also added support for the more canonical <F1> key to show inline
>>> help window, in addition to <?> and <h> keys.
>>>
>>> o By pressing the <F2> key you will get a view with all the symbol
>>> differences listed.
>>>
>>> o By pressing the <F4> key you'll save to a file the differences.
>>
>>     I would appreciate at least one alternate to F2 (Compare) and F4 (save
>>     diff to file) since my window manager (xfce4) intercepts Function keys.
>>
> 
> See patch below. You may use it if you care to.
> 

I'll apply surely, thanks again!

>>> o Added help text that it describes the new features.
>>>
>>> If you like this patch, it would be nice that other kconfig GUI client
>>> such as nconf, gconf and qconf be patched in order to have compare
>>> capability for them too.
>>> This software is under GPL-2.0 license.
>>>
>>> Franco Martelli (1):
>>>    Kconfig: Added compare capabilities for mconf
>>>
>>>   scripts/kconfig/confdata.c         | 165 ++++++++++++++++++++++++-
>>>   scripts/kconfig/expr.h             |   9 ++
>>>   scripts/kconfig/lkc.h              |  11 ++
>>>   scripts/kconfig/lkc_proto.h        |   4 +
>>>   scripts/kconfig/lxdialog/menubox.c |  13 +-
>>>   scripts/kconfig/mconf.c            | 192 ++++++++++++++++++++++++++---
>>>   6 files changed, 376 insertions(+), 18 deletions(-)
> 
> ---
> 
> Adjust the locations of the menuconfig commands so that the new
> "Compare" command fits inside an 80-column-wide terminal.
> 
> Add shortcuts for the new F2 (add 'D') and F4 (add 'F') keys
> in case function keys are intercepted by some other software layer.
> 
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>   scripts/kconfig/lxdialog/menubox.c |   16 ++++++++++------
>   scripts/kconfig/mconf.c            |    4 ++--
>   2 files changed, 12 insertions(+), 8 deletions(-)
> 
> --- linux-next-20250530.orig/scripts/kconfig/lxdialog/menubox.c
> +++ linux-next-20250530/scripts/kconfig/lxdialog/menubox.c
> @@ -133,15 +133,15 @@ static void print_arrows(WINDOW * win, i
>    */
>   static void print_buttons(WINDOW * win, int height, int width, int selected)
>   {
> -	int x = width / 2 - 28;
> +	int x = width / 2 - 30;
>   	int y = height - 2;
>   
>   	print_button(win, "Select", y, x, selected == 0);
> -	print_button(win, " Exit ", y, x + 12, selected == 1);
> -	print_button(win, " Help ", y, x + 24, selected == 2);
> -	print_button(win, " Save ", y, x + 36, selected == 3);
> -	print_button(win, " Load ", y, x + 48, selected == 4);
> -	print_button(win, "Compare", y, x + 60, selected == 5);
> +	print_button(win, " Exit ", y, x + 10, selected == 1);
> +	print_button(win, " Help ", y, x + 20, selected == 2);
> +	print_button(win, " Save ", y, x + 30, selected == 3);
> +	print_button(win, " Load ", y, x + 40, selected == 4);
> +	print_button(win, "Compare", y, x + 50, selected == 5);
>   
>   	wmove(win, y, x + 1 + 12 * selected);
>   	wrefresh(win);
> @@ -366,6 +366,8 @@ do_resize:
>   		case ' ':
>   		case 's':
>   		case 'y':
> +		case 'd':
> +		case 'f':
>   		case 'n':
>   		case 'm':
>   		case '/':
> @@ -398,8 +400,10 @@ do_resize:
>   			case 'z':
>   				return 10;
>   			case KEY_F(2):		/* Differences between .config files view */
> +			case 'd':
>   				return 40;
>   			case KEY_F(4):		/* Save to file differences between .config files */
> +			case 'f':
>   				return 60;
>   			case '\n':
>   				return button == 5 ? 50 : button;	/* Workaround for Compare button */
> --- linux-next-20250530.orig/scripts/kconfig/mconf.c
> +++ linux-next-20250530/scripts/kconfig/mconf.c
> @@ -137,9 +137,9 @@ static const char mconf_readme[] =
>   "built-in, _: for a symbol excluded, M: for a symbol as module and #: for\n"
>   "a symbol absent in the loaded \".config\" file, meaning therefore a new feature.\n"
>   "\n"
> -"Once loaded the .config file to compare, using the <F2> key a view will\n"
> +"Once loaded the .config file to compare, using the <F2> or 'D' key a view will\n"
>   "be displayed listing the differences between the two .config files, using\n"
> -"the <F4> key instead, you can save to a file these differences.\n"
> +"the <F4> or 'F' key instead, you can save to a file these differences.\n"
>   "\n"
>   "Other information\n"
>   "-----------------\n"
> 
> 


-- 
Franco Martelli

