Return-Path: <linux-kbuild+bounces-894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D649A851D85
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Feb 2024 20:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0722A1C20B6B
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Feb 2024 19:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B588F4596E;
	Mon, 12 Feb 2024 19:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="H6xDxukL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222141206
	for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2024 19:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764488; cv=none; b=mzpmIIgzi/26ArAZX0woLzHslr2RUC8sqT/GrEctIpmDohc+Ve3K7spcCjIfokVIsNJLax8KNzk8ZA1k+u+bJvdF+thjarwNCXmA9hdHcg0zZFRMOXhXudtACNTN1cPNmZzJbk/pNoQ3nHICKYGNIgtrHfGKIWq+EMg4GtiL9+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764488; c=relaxed/simple;
	bh=fcnOy+w9ogefgfFNDH/dzHcMlY+8Q6Sf6kVS+I216TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsGh2IHWxJ6CW1V1uoMjEUMbJQEAVoY619NY1qdnsabHP90UVTwogXcL1C+SVxKANAYAHSrPNAY+SFtukrce+/jdHs3Kpm8RAO65ZkyqSTgybMhdZEFuAXslOhxx5KJtVXFjmar+nrO7YiP5tR+VmyiTL63wtoycLuIpRwTrOSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=H6xDxukL; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-410ed9f8621so7358385e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Feb 2024 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707764483; x=1708369283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nTN7g1IyMMydmi8H/FiAGDnVrKDKkYuRfKBBFCRX2Pg=;
        b=H6xDxukLzAIwPOlTOcIkiYzo5iYY7WfNnHrmR/yr3AKr+u4l5WuhacWJ52ubl5pyfk
         CkBluJIoZw2FMsBkevs8UEAVGOwv3zdbj80tDQYfMWPLRgBjxXteVjcIVplUaIWNeiad
         WDwV6pKRqWl9rrreZokhc1YlsrQ7cSBPbO82KJE+TBNLFZNnaJAHUGPOWva3veccHz9L
         IL3NHANGQEQoEz6sNlJ7dKThkYIA6rZyZ1OlT7rE3nW6ewD0V2147mw5WE2iFS4sLzoi
         497xqTNAz6gnLNMzmbZWRX06/HwShkQ7RHYzDb6Y1iuIVa95kbnWT7cWSN5i29AVZKH3
         KtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764483; x=1708369283;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTN7g1IyMMydmi8H/FiAGDnVrKDKkYuRfKBBFCRX2Pg=;
        b=OZFX62QibQH5/ZNXSSC+fHy2wTJg/EMO9bey1jn6UYuebsg6sv0oDgmKfxbpVkDjAo
         Mm8kzPPZd3TaiaLE/Y1th8srOVFS8Aq+5XWUs15DNCHm42hzGPNKzVa89tziw2qOGY9p
         3PJfPVtjpclKvK1J2HhO446pPuJ2uZrRZ8zO5xcXCJbTN1wCXBeWH7r66gXfUl9zC5Av
         +5815iIyZ+FcFTOwus2cDNkbE9dwLA0obIe6gQWklHGzznyjFQ+MkyKItR2+wEe8vPAb
         QokKFEGmrXJSsqrvZ5inTDFoYTHdIsDlnjQcmzQKSm6LqDTOTDVBBe58aaQOsHEnF1yo
         2riw==
X-Gm-Message-State: AOJu0YysAMkTIvhr1IdKsyuwdNL0h7edFGF0MAnQV7WsOET2GDg9iXmf
	zNPxs71ZPwVNUp/5JUTTgv9P09BjKzpM7oYN1XyRUrzq0CrfNyUJvpzYxjt88TM=
X-Google-Smtp-Source: AGHT+IEjW5b4V0QP1rJZrnHcGh5KlnNPXzKQZcBMXJM/Gvqhhq/fYiwEaumg25sMF7DF6tkCGbyLaw==
X-Received: by 2002:a5d:6150:0:b0:33b:8678:aac with SMTP id y16-20020a5d6150000000b0033b86780aacmr1654581wrt.0.1707764482762;
        Mon, 12 Feb 2024 11:01:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeZ+7BVRcbP5p2DXANZc825w5QGn23J2RI8Q1sBzceuN+l+JOIjgxysBA+O7jE0tdlt3wG/+YfIXGPFKIvpGyL/LQMbzo8GG5VfFwJpuJiTd8zpyF4jlVbw++Kt1wupyUmD8vqQLdz/j4V+IuRnYFevrTzJIRxrMChSvRTzYrLTZKag8Qq2Da1C5CCdCEuUXOsRcJNf4ND1gzeB2wBTbRtUk+vbTjf7+PWQTj0diX11BPqwxx7xFSfMSPkUqEDikDTVlVuaopYsRxm2HB0yiBU6tTEd/FLw6zkiijzbcvo/yr15IP4AOoKLe/3Nk4wY41jhI1QDohtNL8dlnsdpe/pRkVvkuuwRhfZCQ7cLMs8MAlb1YxioofSDosmrNJqnSz27Q1djUqCO1EHPAAXG7xnMcs8apTMHM3PCvi7UcCQHPK8V46iePw1tCqtZ6Z7vzNM0oZ9f6NuQ+ATlXLDWpNrRagh77RlS9ioJ5+rzR7XLpAwnNqgReoMeWpxBZDyDCE+I2mZ6VLz66+X4lrEqj4PlOCt26MVB3FYze49wxP/iLNPh+QFMSZCxaspQtHs4tzmLxjziw6b1nouQGIQNNhhl+lq+cKo74+IwRL/x30i5ENfy6qg2JGAk1jZLXQ/Koel1bT3WhD2r1ooqS3i4rZ9he7ADvfCucJeMLcc8LqsdXKMmSYnt6usE5cbDsWxRO6BXa2tctlS+Y91eKMsMxk+baJ5ennsIRVMIA9IFwX1gJiwt3EzVHWNmCCqzAkp3JOo/UTBoeyFzr3d2J6CVe65c4T7vEOEF9k3ow==
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ay20-20020a5d6f14000000b0033b495b1d10sm7719037wrb.8.2024.02.12.11.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 11:01:22 -0800 (PST)
Message-ID: <d845be0d-d0e4-4494-9572-753102f3fa24@smile.fr>
Date: Mon, 12 Feb 2024 20:01:21 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] printk: Fix LOG_CPU_MAX_BUF_SHIFT when BASE_SMALL
 is enabled
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, x86@kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Borislav Petkov <bp@alien8.de>, Darren Hart <dvhart@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H . Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jiri Slaby <jirislaby@kernel.org>, John Ogness <john.ogness@linutronix.de>,
 Josh Triplett <josh@joshtriplett.org>, Matthew Wilcox <willy@infradead.org>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Vegard Nossum <vegard.nossum@oracle.com>
References: <20240207171020.41036-1-yoann.congal@smile.fr>
 <20240207171020.41036-2-yoann.congal@smile.fr>
 <CAK7LNAQb=n1dWdEAJy_aJWnkW2M3bR768WKpxnUv=CtBEi28Xw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAK7LNAQb=n1dWdEAJy_aJWnkW2M3bR768WKpxnUv=CtBEi28Xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Le 11/02/2024 à 00:41, Masahiro Yamada a écrit :
> On Thu, Feb 8, 2024 at 2:10 AM Yoann Congal <yoann.congal@smile.fr> wrote:
>>
>> LOG_CPU_MAX_BUF_SHIFT default value depends on BASE_SMALL:
>>   config LOG_CPU_MAX_BUF_SHIFT
>>         default 12 if !BASE_SMALL
>>         default 0 if BASE_SMALL
>> But, BASE_SMALL is a config of type int and "!BASE_SMALL" is always
>> evaluated to true whatever is the value of BASE_SMALL.
>>
>> This patch fixes this by using the correct conditional operator for int
>> type : BASE_SMALL != 0.
>>
>> Note: This changes CONFIG_LOG_CPU_MAX_BUF_SHIFT=12 to
>> CONFIG_LOG_CPU_MAX_BUF_SHIFT=0 for BASE_SMALL defconfigs, but that will
>> not be a big impact due to this code in kernel/printk/printk.c:
>>   /* by default this will only continue through for large > 64 CPUs */
>>   if (cpu_extra <= __LOG_BUF_LEN / 2)
>>           return;
>> Systems using CONFIG_BASE_SMALL and having 64+ CPUs should be quite
>> rare.
>>
>> John Ogness <john.ogness@linutronix.de> (printk reviewer) wrote:
>>> For printk this will mean that BASE_SMALL systems were probably
>>> previously allocating/using the dynamic ringbuffer and now they will
>>> just continue to use the static ringbuffer. Which is fine and saves
>>> memory (as it should).
>>
>> Petr Mladek <pmladek@suse.com> (printk maintainer) wrote:
>>> More precisely, it allocated the buffer dynamically when the sum
>>> of per-CPU-extra space exceeded half of the default static ring
>>> buffer. This happened for systems with more than 64 CPUs with
>>> the default config values.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Closes: https://lore.kernel.org/all/CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com/
>> Reported-by: Vegard Nossum <vegard.nossum@oracle.com>
>> Closes: https://lore.kernel.org/all/f6856be8-54b7-0fa0-1d17-39632bf29ada@oracle.com/
>> Fixes: 4e244c10eab3 ("kconfig: remove unneeded symbol_empty variable")
>>
> 
> 
> 
> All the Reviewed-by tags are dropped every time, annoyingly.

Hi!

Was I supposed to gather these tags from patch version N to patch version N+1?
In that case, I'm sorry, I did not know that :-/
Patch 1/3 is exactly the same but patch 2/3 is equivalent but different. Is there a rule written somewhere about when carrying the tags across revision and when not? (I could not find it)


> This is equivalent to v4, which had these tags:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot!






> 
>> ---
>> v3->v4:
>> * Fix BASE_SMALL usage instead of switching to BASE_FULL because
>>   BASE_FULL will be removed in the next patches of this series.
>> ---
>>  init/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/init/Kconfig b/init/Kconfig
>> index deda3d14135bb..d50ebd2a2ce42 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -734,8 +734,8 @@ config LOG_CPU_MAX_BUF_SHIFT
>>         int "CPU kernel log buffer size contribution (13 => 8 KB, 17 => 128KB)"
>>         depends on SMP
>>         range 0 21
>> -       default 12 if !BASE_SMALL
>> -       default 0 if BASE_SMALL
>> +       default 0 if BASE_SMALL != 0
>> +       default 12
>>         depends on PRINTK
>>         help
>>           This option allows to increase the default ring buffer size
>> --
>> 2.39.2
>>
>>
> 
> 
> --
> Best Regards
> Masahiro Yamada

-- 
Yoann Congal
Smile ECS - Tech Expert

