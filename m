Return-Path: <linux-kbuild+bounces-632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D3861839236
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 16:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63D6F1F225C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jan 2024 15:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFD85F858;
	Tue, 23 Jan 2024 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="tUWJUe48"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD225FBB2
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2024 15:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706022670; cv=none; b=Gd/8FKgLzcnWTt9nh3RR59yYg4oKSqSz4cJi/CywSZ64LesYfFrDqjn71Gh3bdM8d3NVKu7BDUr8sFQzlUPMXBME7XjmdeZ5hAXIdb0dBsw4bnw6TRd7aEa1bVhOY6DmV168rGMXAGOujdqaqPEfNKfk5h0jDxYGRVwrJF4y5e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706022670; c=relaxed/simple;
	bh=zfo4K02LIHKNeJfY1nYMveQnev4v7V0gPyH1RcMLZT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AV8bAiV80m2ULt3VkpX1e9JEl6dSeakhvfaGriezbS3cNcGWNDCj7zTI5K3VPwHr5ZBblrrB5rNyH+SNZTwuJ1Jha29LRIfRF92lh6NMcEIqS504CZekWaZ7eD6M+wd0ZcCfZwUeXM9ptgDGLaVq18z6/Sl3iD0byzcHXkJ5E10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=tUWJUe48; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3392b12dd21so2584065f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jan 2024 07:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706022666; x=1706627466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zsl/7GB8mLkTbghZ8k3RJP7xDY8xQ2VmTN1DxHEnNkg=;
        b=tUWJUe48XHunZ9Rfw3W40bEG8eqcybv5AC5t3wODvEyKDheYefsWbEr4QurHqbQYP7
         JeBeR2inmLEN9aRz5SoQ4zJL5XP+aBbT3B3dBkEfxueNGGkUtS8LUcJgfdvvfycCY7Rp
         4qg9kmveN7vrNCwN0tevgXvL6kV/NUqXqnTKjPq+FJTZv4dCxIeCkJTP41glK2EAWdHK
         N5YyFqcEvmkHLEql+SzSUa7tCcGMl5CxxJ6NOgCotO24Y7B7TZZW0YI+e4VALtLjUOAb
         6XbCGBDIfOOuuiMcysQ8dHBZKMQ5quIs1Tv4tPClSE7r9nZqNDFijmVx1j+5GK+vqc8h
         g2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706022666; x=1706627466;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsl/7GB8mLkTbghZ8k3RJP7xDY8xQ2VmTN1DxHEnNkg=;
        b=imZ7WjVWzvlzzApat/vECSNWxI66VQ6O5H8iMzgWWtqvnN36+Bae5OOhNw3EKUcZPc
         v19Re/DyMTn8w1hHktL0W6T7MOnIiekAkY0u6hBGBrbkyJ15/t/d4MiP0754i05IsYOj
         yyLumLHkocLBNNyo/MZIdQI9RlQoyDOk/Na3N1VKu3FgieFshsz4dXFpQMyFJaIpxgWC
         VM2ZCJO8OKHHlPBFhlSF3kVRdFrlOT3GsEDs5o/u3oNCBzZLQa6bW/A3HPwlJXY4425f
         wgGqoqDBaSKJkua1PsYe8EceznkfKmraPpsooRmjQjN8wXT264YDTu9n85N+iUQEKKpZ
         oEQA==
X-Gm-Message-State: AOJu0Yy+PwwXyy4i06TojQFqDJVxoZZBZbJt3J4qOcPOCa0mptHYqgPQ
	E7UVw3j/gXyoyGshFrwHLvEBWixlebuLPD5mlyQle+JiUN39ADrD6NCsDW3ITdYH3MgTEySRBuR
	6gM4=
X-Google-Smtp-Source: AGHT+IGwFc3cfRZvt0Bggv2cC3e4b5nf882Tcy4F+xnhQwtxfGuC4Wl/QsA7DXC4/1RG6BiJTLDRXA==
X-Received: by 2002:a5d:4d0a:0:b0:336:ee8a:a44e with SMTP id z10-20020a5d4d0a000000b00336ee8aa44emr2558160wrt.94.1706022665555;
        Tue, 23 Jan 2024 07:11:05 -0800 (PST)
Received: from [192.168.0.20] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id u7-20020a5d6da7000000b00337d735c193sm3583401wrs.49.2024.01.23.07.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 07:11:05 -0800 (PST)
Message-ID: <d21298d9-fed6-4e08-9780-dbcb388b9ccc@smile.fr>
Date: Tue, 23 Jan 2024 16:11:04 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kconfig: remove unneeded symbol_empty variable
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vegard Nossum <vegard.nossum@oracle.com>
References: <20231125163559.824210-1-masahiroy@kernel.org>
 <CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAMuHMdWm6u1wX7efZQf=2XUAHascps76YQac6rdnQGhc8nop_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 23/01/2024 à 13:54, Geert Uytterhoeven a écrit :
> Hi Yamada-san,

Hello,
 
> On Sat, Nov 25, 2023 at 5:36 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> This is used only for initializing other variables.
>>
>> Use the empty string "".
>>
>> Please note newval.tri is unused for S_INT/HEX/STRING.
>>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> Thanks for your patch, which is now commit 4e244c10eab345a7
> ("kconfig: remove unneeded symbol_empty variable") in v6.8-rc1.
> 
> When running "make <foo>_defconfig" with <foo>_defconfig an SMP
> defconfig without explicit configuration of CONFIG_LOG_CPU_MAX_BUF_SHIFT,
> the aforementioned commit causes a change in the generated .config:
> 
> -CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
> +CONFIG_LOG_CPU_MAX_BUF_SHIFT=0
> 
> It looks like CONFIG_BASE_SMALL=0 is treated as a string instead of
> the integer number zero?
> 
> init/Kconfig=config LOG_CPU_MAX_BUF_SHIFT
> init/Kconfig-   int "CPU kernel log buffer size contribution (13 => 8
> KB, 17 => 128KB)"
> init/Kconfig-   depends on SMP
> init/Kconfig-   range 0 21
> init/Kconfig:   default 12 if !BASE_SMALL
> init/Kconfig:   default 0 if BASE_SMALL
> 
> Note that reverting 4e244c10eab345a7 is not sufficient to fix the issue.
> Also reverting commit 6262afa10ef7cc8f ("kconfig: default to zero if
> int/hex symbol lacks default property") does fix it.

(Since I'd really like 6262afa10ef7cc8f ("kconfig: default to zero if int/hex symbol lacks default property") to stay, allow me to try to help)

The problem is quite easy to reproduce:
  $ make x86_64_defconfig
  $ grep 'LOG_CPU_MAX_BUF_SHIFT\|BASE_SMALL\|BASE_FULL' .config
  CONFIG_LOG_CPU_MAX_BUF_SHIFT=0
  CONFIG_BASE_FULL=y
  CONFIG_BASE_SMALL=0
Here, CONFIG_LOG_CPU_MAX_BUF_SHIFT should be 12 not 0.

For what it is worth, CONFIG_BASE_SMALL is defined as an int but is only used as a bool :
   $ git grep BASE_SMALL
  arch/x86/include/asm/mpspec.h:#if CONFIG_BASE_SMALL == 0
  drivers/tty/vt/vc_screen.c:#define CON_BUF_SIZE (CONFIG_BASE_SMALL ? 256 : PAGE_SIZE)
  include/linux/threads.h:#define PID_MAX_DEFAULT (CONFIG_BASE_SMALL ? 0x1000 : 0x8000)
  include/linux/threads.h:#define PID_MAX_LIMIT (CONFIG_BASE_SMALL ? PAGE_SIZE * 8 : \
  include/linux/udp.h:#define UDP_HTABLE_SIZE_MIN         (CONFIG_BASE_SMALL ? 128 : 256)
  include/linux/xarray.h:#define XA_CHUNK_SHIFT           (CONFIG_BASE_SMALL ? 4 : 6)
  init/Kconfig:   default 12 if !BASE_SMALL
  init/Kconfig:   default 0 if BASE_SMALL
  init/Kconfig:config BASE_SMALL
  kernel/futex/core.c:#if CONFIG_BASE_SMALL
  kernel/user.c:#define UIDHASH_BITS      (CONFIG_BASE_SMALL ? 3 : 7)

Maybe we should change CONFIG_BASE_SMALL to the bool type?

I'll poke around to see if I can understand why a int="0" is true for kconfig.

Regards,
-- 
Yoann Congal
Smile ECS - Tech Expert

