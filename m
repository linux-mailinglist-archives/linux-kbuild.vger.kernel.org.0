Return-Path: <linux-kbuild+bounces-9580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAC8C4FB7F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 21:38:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 803463B7C2E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 20:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19E933D6E6;
	Tue, 11 Nov 2025 20:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yci4/T5y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54D33D6C7
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762893485; cv=none; b=PTQvMhYTSZVcbkqWfQOjkUgpP0P8Cv2gLafHoCOvqPIYx04CEiXrcT06fMwMnaGtM1A7TbLosdXUt7j5Kx7AMkx3v7ezr6NVn29jWyeE/fGCO4bnO6fYhU7Wy2KpqxY0RIEq8DHG7SYYbzyj4PXNkDbpU51Z3R2GYIiXhRlgHr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762893485; c=relaxed/simple;
	bh=7GWZxDCCMttOLyhuWX3RwzB7XVbSwN7ki8zrLyUQHdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s0MsgUjd4pNVrB+B57IokBrmYR3MX64mXb5c6JQ7PyaMG432Mm1if8W42cEpKxrhyTH0ykTJJahA+OsRSLd9tStROhxbibzK8/4E2aGZ54vyzlLjE4tqXomCR1BsMbpZnv91rf9sy4YYIkUmw5bQ4ZpsKaKCYjWeZKwNjRBxORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yci4/T5y; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b714b1290aeso29421466b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 12:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762893482; x=1763498282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xqn1zKvw9DCjF/8Ax6kOshUW26Fkeqzkn2Kx2fxNpnc=;
        b=Yci4/T5yZvdBXIQ8lAQykFDsLLRsJOE8KRFWLzlbMInw1n8vCRAA/8YGo9SUMfrp0D
         rCid0Ml6KqISSOg7qQMeKRNxfbBsIieBOmVp+ICxskYRiU5kD7jeLn/HNCXV+eL4iFEx
         foDzuN56ktOQcA/Cf9C4Df7maOLS+5tz5zP/IJrJgm0ldfrnAfrCUuVoPrCJI7RyFXlY
         b2cHIkUBMuMZPUA9HTQaDIjgS0OEK9iyAJ9iNiSxZzlTVMQmblRrxvQpg2cjEej8Y4+4
         xuPUX8RhHeIsnLvW2UsIBnRZ7ZCO9rKPU/wR4nnGkwQA+ex4J1BdCvgDFNqt8APTgDAx
         NxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762893482; x=1763498282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xqn1zKvw9DCjF/8Ax6kOshUW26Fkeqzkn2Kx2fxNpnc=;
        b=q6Mn4v4VzvIARchcEd5vL4uCNm+n5z56ZOSJB0vQYRbcZP4GxG3JGPW8bZDQ8Krl+W
         v4kaknj2oSpjE3RpurAjiIxLhpi0NhTpgZQ8LKxH1fbWt/CoISWifmCn9xyUJP8dYPDh
         hTFFx+F8e4R0a2lwyVxukbt8dWJqHD83kScsLvOHx9z/PgTmeWOxrqK+EBXJMDN3s1cu
         8c7m4MmMpeark+776Baln/sofV1uqZOE/CmAlioNe/2+9OMuXNKOaZaHEmuwaZW6uk57
         gj7Kj/sjps+iNl6Ci4vqMENZ4ZbHVB1qCbKsFOjvEvRI5SV9FuvjMKZdvpypj9m5xdfW
         2Smw==
X-Forwarded-Encrypted: i=1; AJvYcCVwItspNiMR2HHwAx53/qMiDdFpo2qSb9zkgW5KknB9BOJkrfqNy62XpSZxH9dN5RZ9NUeCweA7LetGTuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCjZQpdxOUENx4pS+t84FIzZL9h+2JMJox5i+XGnQ6xHAxLCk
	rkkDNxWchxcqLzJLMR7T9QHX/kIGb/VK8QcsBCpFBugGxrRw1TzsiUXC
X-Gm-Gg: ASbGncvkQwDaRz/aCp9X2XEAMa4v/v0tjVD4qkIRtZ2uJV86SDHQq8t+xModmZ3hd89
	0GFZVHI8y8oQXrKKXZnxx2BDOs4vGdQfEG6yUE0+f6JAA9H86vUTX+3D/E8N+dq3GnEl2oYxsve
	TlrgKA12OqKi0PvJo2WdHKaivR7rYoSUzg4CRVMZmPSf7q0D0MqAOC427RkgqvqeY6ByyJDSlGE
	Ee5iMFt6n6Zrf4TZq9ommqkSMwvWy6raQAAS7hwAgl6YCkLjHgVJ0nHWEFpScP2eAD1dv4Bepug
	WnO6vSoTWfTA4gNybalT0SFM5LxOV20ha81Ncm7dh96yaaB5gEU8CM8kCDzzmSD9TyisQ5KrPO/
	WdCev0pFRtem9W9j4xY+9D+aFWKdAf5mlcApUCskIz3sEf7qN+RyalqxjwQUi97j5Lm3OEaDFHD
	/kwBfyem4oFGNRwSp+e/hXNX7ExLvO5qRTrg==
X-Google-Smtp-Source: AGHT+IG5np7B+oYRQPSJ6UlK9IUvVySK4fkR4lCuLAGITvhYKuu+IaCR926UVllS3cE9io14VQFjOQ==
X-Received: by 2002:a17:906:fd86:b0:b70:af93:b32d with SMTP id a640c23a62f3a-b7331ab5d5amr46995466b.53.1762893482105;
        Tue, 11 Nov 2025 12:38:02 -0800 (PST)
Received: from [192.168.0.3] (mob-5-90-138-22.net.vodafone.it. [5.90.138.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa24d14sm1414930266b.74.2025.11.11.12.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 12:38:01 -0800 (PST)
Message-ID: <f58e7b0d-d885-42e6-91e0-6fcc621964c2@gmail.com>
Date: Tue, 11 Nov 2025 21:37:59 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] Kconfig: Added compare capabilities for mconf
To: Nicolas Schier <nsc@kernel.org>
Cc: nathan@kernel.org, rdunlap@infradead.org, corbet@lwn.net,
 linux-kbuild@vger.kernel.org
References: <20251030141342.159994-1-martellif67@gmail.com>
 <20251030141342.159994-2-martellif67@gmail.com>
 <aRNMww8YU_7dKwK3@derry.ads.avm.de>
Content-Language: en-US
From: Franco Martelli <martellif67@gmail.com>
Autocrypt: addr=martellif67@gmail.com; keydata=
 xjMEXwx9ehYJKwYBBAHaRw8BAQdA8CkGKYFI/MK9U3RPhzE5H/ul7B6bHu/4BIhTf6LLO47N
 J0ZyYW5jbyBNYXJ0ZWxsaSA8bWFydGVsbGlmNjdAZ21haWwuY29tPsKWBBMWCAA+FiEET9sW
 9yyU4uM6QbloXEn0O0LcklAFAmhyroACGwMFCQ0ncuYFCwkIBwIGFQoJCAsCBBYCAwECHgEC
 F4AACgkQXEn0O0LcklAHVwD9H5JZ52g292FD8w0x6meDD8y/6KkNpzuaLHP6/Oo8kAIBAJsh
 aMB9LdCBJTMtnxU8JTHtAoGOZ/59UJWeZIkuWJUNzjgEXwx9ehIKKwYBBAGXVQEFAQEHQNP5
 V2q0H0oiJu89h1SSPgQDtkixXvUvRf1rNLLIcNpPAwEIB8J+BBgWCAAmFiEET9sW9yyU4uM6
 QbloXEn0O0LcklAFAmhyroACGwwFCQ0ncuYACgkQXEn0O0LcklASVwEAoEkHMEU7mHc0zmAu
 D2R1PYsDh9+3wQeied5PrF+HdakBAOeSGsf40GBew5umZuM59I04d1uXYAXGMP+jGN2RUtMA
In-Reply-To: <aRNMww8YU_7dKwK3@derry.ads.avm.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/25 at 15:48, Nicolas Schier wrote:
> Hi Franco,
> 
> thanks for your contribution.  Some notes below:

Hi Nicolas,

thank you very much for your answer.

> 
> On Thu, Oct 30, 2025 at 03:13:42PM +0100, Franco Martelli wrote:
>> This patch allows to compare the tristate value of two .config files
>> inline, symbol by symbol, in mconf (make menuconfig) only. It can be
>> really useful when customizing the .config file.
>>
>> When a new stable release of a distribution is available, in the Linux
>> kernel many things has changed, this patch comes in help in this
>> situations, it allows to easily compare the customized .config file
>> built for the previous version of the distribution, with the one
>> provided by the new software distribution, used as reference.
>> Generally it can be helpful when the differences between .config files
>> are huge, because you can navigate across them in the menu window.
>>
>> The patch has a limitation, it only show the tristate value (Y/N/M) not
>> differences for symbol with a value (string), but it also marks with a
>> "#" the symbol missing in the loaded .config, meaning therefore the
>> symbol as a new feature.
> 
> I must confess, that I am not convinced yet, that this will be helpful
> for general purposes.  Yes, large changes in .config files are not easy
> to parse, but I do not see how your solution is easier to handle than
> the use of scripts/diffconfig, other than not showing removed config
> options.

the strong of my patch is interaction; scripts/diffconfig merely show
you a list of differences that you'll have to handle instead, having
differences reported near every symbol's item in the mconf window let
you to interact with the differences inline, on the fly.

> 
>>
>> o I've also added support for the more canonical <F1> key to show inline
>>    help window, in addition to <?> and <h> keys.
> 
> Please split-off logical these independent changes into separate
> patches (Add support for 'F1' hot-key).

OK, sorry!

> 
> Using simple letters (here 'h') as hot-keys is not a good idea as those
> are already used for jumping through the currently shown menu item
> (cp. highlighted letters in menu config screens).

the 'h' hot-key was already in the source code used to open the 'help'
window, it wasn't a my change.
Using simple letters to call functionality was strongly advised to me by
Randy Dunlap because some desktop environments intercept function keys
by default, using letters provides a workaround for this.

> 
>> o By pressing the <F2> or <D> key you will get a view with all the
>>    symbol differences listed.
>>
>> o By pressing the <F4> or <F> key you'll save to a file the differences.
> 
> While the list might be helpful for comparing two config files, a large
> list within an ncurses window does not look like a good thing to me.

True but the list will (hopefully) shrink during the configuration
process and the list now (version 4) is sorted alphabetically.

> 
> When I save the list to a file (F4), I'd rather choose the output of
> diffconfig for evaluation -- as it is more complete and has a layout
> that looks more straight-forward and clear to me.

OK, it seems easy to implement.

>> o Added help text that it describes the new features.
>>
>> This software is under GPL-2.0 license.
> 
> Please note that the whole Linux kernel source and its build system is
> GPL-2.0 per se, cp. COPYING and the SPDX header line in each file.
> 
>>
>> Changelog:
>> ----------
>>
>> scripts/kconfig/confdata.c:
>> ---------------------------
>>
>> Silenced a warning emitted when parsing the .config file to compare.
> [...]
> 
> Please put any patch changelog below the triple-dash line ('---').

OK sorry, I'm new to the kernel process patching.

> 
> I have not looked at the code, yet, as I have doubts regarding the
> usefulness (see above).
> 
> Iff nobody mentions strong interest in these changes, please re-evaluate
> if it makes sense for you to invest into a v5.

I'll wait a couple of week, if in the meanwhile nobody appreciate my
patch and therefore it will be rejected I'll made it available on my
Github profile for the Linux 6.12.y kernel series.

> Kind regards,
> Nicolas

Thanks again, kind regards.
-- 
Franco Martelli

