Return-Path: <linux-kbuild+bounces-6463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33670A7CF13
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 19:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD04418860FA
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 17:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AE2158D80;
	Sun,  6 Apr 2025 17:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYIuLNwM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E265158545;
	Sun,  6 Apr 2025 17:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743959186; cv=none; b=NK/JBla96II2jyc5GOCng2KKNzs6TdUMFRwpl4Pr7th2w6aeGSH+dCs44kFcKYvhS/xouOOWonCXVVjlB3PUcxOtl7oG3tOcqIBbKdIqaeEZN1Qj3XXUQ6b9xarKGvfP5qs9PRsszaH0Bj/auqnzk5NJf8jUOQwd9GnUHXArdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743959186; c=relaxed/simple;
	bh=fsE6vESQ0VkpE5MBrSgfSQH9ILTaKXJ+GEhR/B3O3t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3VCXClZrg6wStBiTUoAc5o5sNaa0GMfdZVAV7ScJL/R4xy5L4VuRk9cMwt6HiXzOq/qSTI2b3x+I/8OqmCEBm86qg3z8fuDdp6VO2OBCP2oB5JlVM9rkB3Mi3yxUGz+Wt5snOppBB5hIn0AV7lJh5ct4b5qe150GGgMbSP6dP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYIuLNwM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223fb0f619dso33541865ad.1;
        Sun, 06 Apr 2025 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743959183; x=1744563983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=esldIXPYVvKtwb4cv+gKF4UfTvm83mmZ3qA48t8doxk=;
        b=PYIuLNwMfrN48kQYPpK+c/jMp35mhkO//u35uH/InIim0COUD2pyuHezP4BGF5uOVm
         6IW08Y5BPTuV1iq2CDX59NRDQ4l/Kok1EPL45FSmeHsmyZfd3fAI14gRvX7iHz+NXAFk
         XV7DTxfb4Yov2g7Cymf1qnkkvQ8CDaYdYL+wqwXHt49gkLApoVw0GBUe7y3wDO8howSW
         AZA098WrC3upeyqzSQKBNzlSX/NE9C6Y20MVk8t5F8gbZUY6vZsHiS4H6ZY11Xjm7/f7
         2hm5lmenmifc3vikTbgLAkp9qV09xbmGyPCkosDe7YKDys0DCdIzrV5zc/usqLpvXruP
         Aguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743959183; x=1744563983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esldIXPYVvKtwb4cv+gKF4UfTvm83mmZ3qA48t8doxk=;
        b=BYaVRqkcygR+j76hi8p9k1USsDftam9yUw410W2OWjujTnlYpU7WGGxzjsFkmWcwlv
         dYTeHcOFKQQfvjwRnqudvak9AlfRCsI1Dc7tEJW0CGpHcnXkG+ZlcsQ1bYEbgzbTFu6M
         lQQBCwoQy5lpKlhPst62b5qNqoDVrhxw5xOyBCtxiWeBYr0vNa7TUnMr7AL+A0efrzTg
         DpM/YLijdqklxSrn7Zfy0eADly+vp2NRXlkLKadat77szBXpq08dpDPOVOBgnMjPUd6f
         Om/gegLqvW+6mSCWllkSjhW1gTZehFBZf+hH24Ke7NIdBMszg4gmBd0oyswjBTYL4RSp
         NVbw==
X-Forwarded-Encrypted: i=1; AJvYcCWlt23BPeqhWyeUYP/c9SVsEukp7NoqS6kz+m9CAbPAnzWiUjjM+Nn1LvF/ZaqNtptgGNIzBYK25hurdJc=@vger.kernel.org, AJvYcCXBa/59p1nj5ZzLRUIVTphBCpe1chMHC/iRHC4zkcc6b6iFr+l2ugREmbNozWZ4t4+3UC9D7xSrer5xfJjd@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsx3C6jG+/RO9nl1c0BGwm1R38mnAAjhMYtSVHUPc9CcUQSURy
	BKlRue10hTXJBpcm4TJTnzAC3XeD5unrxe8NtOBGb+T54/u2Vxk1YX20pg==
X-Gm-Gg: ASbGncs+mOKM1QjTQwLJpgDOX/pww9/wfJxkCorwjseOEk/W9DU3xTKV6np6jzT0dPQ
	hFmA5ctnYk6PF+hho+26s/ZO04T2XZmfbaguHXxJQbz+8G8mVcFF2rPO7MP+QQifAnnWIWN9MNK
	URKa6wofLsQUF5+CrwxBawfaOkPW5ca8x+QcuYAtBz/tKIh/Cnn8V/bDOJA+1TdEyVj7Os60UGz
	SD4FnDpmneLJQ1fXqj8guraIXtMszJQnYxzaZnEWEtIZjCsGDjjV576UP0U9D+3m3LUGwj964Wg
	zrgkLv/DPPePd6wyGJdBcLHNA3fAc0ALJ0lcF3VoL0es7kGh6mWVBpSM+ZVsYAtofNs6n4imDYq
	+wUkxR78O6xZ8FaTq3w==
X-Google-Smtp-Source: AGHT+IGm04YRe5ywbkiTxfJQDJ5TJ6rRJSssqf/5YANPih8GF1oY+ItTOoZDfsvCv08APNoFquoEPw==
X-Received: by 2002:a17:902:9896:b0:223:26da:4b8e with SMTP id d9443c01a7336-22a8a04a770mr111258565ad.4.1743959183537;
        Sun, 06 Apr 2025 10:06:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866dccbsm65712875ad.176.2025.04.06.10.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 10:06:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f02ef4bf-c641-4319-b907-52410187b044@roeck-us.net>
Date: Sun, 6 Apr 2025 10:06:21 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] script: modpost: require a MODULE_DESCRIPTION()
To: Arnd Bergmann <arnd@kernel.org>,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311-moddesc-error-v1-1-79adedf48d0e@oss.qualcomm.com>
 <32b8f7fa-3c48-4f5f-b99b-c1a8cd065442@roeck-us.net>
 <a30bd547-d0e8-44d2-ac2c-22396ecb9270@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a30bd547-d0e8-44d2-ac2c-22396ecb9270@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/25 09:06, Arnd Bergmann wrote:
> On Sun, Apr 6, 2025, at 17:59, Guenter Roeck wrote:
>> On Tue, Mar 11, 2025 at 12:49:02PM -0700, Jeff Johnson wrote:
>>> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
>>> description is missing"), a module without a MODULE_DESCRIPTION() has
>>> resulted in a warning with make W=1. Since that time, all known
>>> instances of this issue have been fixed. Therefore, now make it an
>>> error if a MODULE_DESCRIPTION() is not present.
>>>
>>> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
>>> ---
>>> did my treewide cleanup for v6.11, Arnd had a few more stragglers that
>>> he was going to fix. I hope that by posting, some of the 0-day bots
>>> will pick it up and hopefully provide some feedback.
>>>
>>> Note: I'm not really sure if *all* of these have been fixed. After I
>>
>> FWIW, I ran
>>
>> for f in $(find . -name '*.c'); do grep -q MODULE_LICENSE $f && (grep
>> -q MODULE_DESCRIPTION $f || echo $f); done
>>
>> That reports a large number of files (111, to be exact) with MODULE_LICENSE
>> but not MODULE_DESCRIPTION. I cross-checked a few, and found that many can
>> be built as module. The fall-out from this patch might be interesting.
> 
> The ones I sent were only the result of what I found from randconfig
> builds on x86, arm32 and arm64, so I likely missed drivers that are
> specific to other architectures, or that are very unlikely to be
> in loadable modules because of random 'select FOO' Kconfig statements
> leading to them being always built-in in practice.
> 
>          Arnd

ERROR: modpost: missing MODULE_DESCRIPTION() in drivers/block/swim3.o

Guess I'll just keep disabling affected drivers.

Guenter


