Return-Path: <linux-kbuild+bounces-1006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E985BFD7
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 16:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E11CC282743
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Feb 2024 15:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3437602C;
	Tue, 20 Feb 2024 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RnagBOFq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A35F74E0A
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2024 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708442908; cv=none; b=hfg4wGqtUgkcGyQ8HvXUl9GVgcZFKop1WHt3+2c4vPNtWvYOl99mIRKo9sfCprQdSDqk/p2hbbLfkp6X+AFwTvO93seI0ARoivEiVTQ4IWKa4gRWzFRuthv6Uu+xyn4zwjiTVLpJSyP/R67Q6Z57bhSEeykdv4nOD52siwT7iOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708442908; c=relaxed/simple;
	bh=UVLriIpfrdpJPFajm71aoVJ8QkLWvRefgJDCt8opwww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bv/U1AcNwhrHmcwenHxhNMYyG3/7b2q+OYIydD6zr9VgnzEqpUUQf4+Giw6RzZL4eiFOW9Y4BuRMydDkqJGVm+GAyfla7Jo4LAvOD94dQvZ8FtfDlixqxcR/LPh/+cN4zzRsYQgWxTPvlPI2equOe2vw5l+YQYLjni0ciOxdu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RnagBOFq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so299325866b.3
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Feb 2024 07:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708442904; x=1709047704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XcksBfOCrTeFsWG5z2uYrSU/RcRjea2qnZfecVJx4nk=;
        b=RnagBOFqkyJbs08aZtEcKjHCk4hLC8aIfc+iM718gYJnENB8CKEF7hY7piGKHOg1Dg
         uGWnpjK2RlqKeWYFr8Ezd2+2dVpfCjTnJDiap2hgL6momYBU2MwzSnKMuNSIdyLDczuh
         XUXBr/ycbvo60Zr+Vfm0tZbGtqoVKlt49HzifPTgaGutY8LqygOVkZTJyNvzZrVq1MZP
         0Pm4GDrJjpe0F1mZQVTuYBoh6+2WyONw5LiFQqa9dmMEVGtaBL1IHmid+lvvTAdqX4aR
         TJhxTGvQriO13dooYozrrXRCBIa68HoGVx3FEAP+usPt0Jb9DDMZhGyYrl7Xpz/F99kh
         xydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442904; x=1709047704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XcksBfOCrTeFsWG5z2uYrSU/RcRjea2qnZfecVJx4nk=;
        b=Wz5V09ovWhYzujxJadW8vYZwFLWb+9MlEGF1xsY+u7PheAYHC/kW29frZVYcEjhH32
         Lmlc5w4B/adopzK4xZGts3OuF4lOZr2OFre2zCYTfLc/Jhzu2rr+7gQx7YnUV0G72Rvz
         X1rS90zPnc6ZlxvW5quI1rWN0AnjTm1EeOZiQRbw9GLTc7yumiO8uc5XH7ynLzGiyDYe
         h7C9zCjLFSwpSRt/c8+QAORGhrbxf/361SkJp1uCmykknjrJM2pGGd3NkuVhsId6m5H2
         pWV7YSHgX1lDyClE4KGYY13SH/tKwVuC4Up9Cyzr86Me82zjZvw5IOeEWVd3FGbmtPbB
         Y1hw==
X-Forwarded-Encrypted: i=1; AJvYcCURIxdxS5SWr/Xc8S+qSbCOoGsGIPbxEnOqpr6XBB6kwGfxBaqQAiVM/w0dlEAMRvyJx4JR4N3+2ThEE7A+q/TMEs2/hL2p8uEWQcVk
X-Gm-Message-State: AOJu0YzRUKYzyKbGRjNTi6m07XL6QoQPDLb+ADW2AoLIy8jXlpzB6I9e
	1tL8Csghp36oXbr+D8czf6kQHmW0Enai3Ckf7UtbaTlXyUF8di0j0tk69z5LzwY=
X-Google-Smtp-Source: AGHT+IGhdJLTwm3ykzZLu9BaukJMGGo/4XttbvnV7nwt//z0Rmmt73MQF1z4dOhk61XgIiIrH0LNIQ==
X-Received: by 2002:a17:906:60f:b0:a3e:b8ac:288f with SMTP id s15-20020a170906060f00b00a3eb8ac288fmr3168446ejb.4.1708442904601;
        Tue, 20 Feb 2024 07:28:24 -0800 (PST)
Received: from [10.100.51.161] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id s13-20020a170906bc4d00b00a3e8b5df769sm2322738ejv.35.2024.02.20.07.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 07:28:24 -0800 (PST)
Message-ID: <1c6bb7d4-59bf-4887-8a0a-03373d3d9c11@suse.com>
Date: Tue, 20 Feb 2024 16:28:23 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kbuild: Use -fmin-function-alignment when available
Content-Language: en-US
To: Mark Rutland <mark.rutland@arm.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240215151642.8970-1-petr.pavlu@suse.com>
 <ZdON5rbsYFsoulxm@FVFF77S0Q05N>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <ZdON5rbsYFsoulxm@FVFF77S0Q05N>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/24 18:20, Mark Rutland wrote:
> On Thu, Feb 15, 2024 at 04:16:42PM +0100, Petr Pavlu wrote:
>> GCC recently added option -fmin-function-alignment, which should appear
>> in GCC 14. Unlike -falign-functions, this option causes all functions to
>> be aligned at the specified value, including the cold ones.
>>
>> Detect availability of -fmin-function-alignment and use it instead of
>> -falign-functions when present. Introduce CC_HAS_SANE_FUNCTION_ALIGNMENT
>> and make the workarounds for the broken function alignment conditional
>> on this setting.
>>
>> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
> 
> I don't have a GCC 14 build to play with, but this looks sound to me.
> 
> Petr, are you able to test an arm64 kernel with this and DYNAMIC_FTRACE
> enabled? i.e. build that, and check that function symbols are all aligned to 8
> bytes using objdump or similar? That way we could be pretty sure there's no
> other latent issue in this area.

I tested an arm64 kernel with DYNAMIC_FTRACE, in particular with
DYNAMIC_FTRACE_WITH_CALL_OPS=y. That is actually the primary motivation
for this patch. We ran in our environment into some incorrectly aligned
functions with this option despite the kernel workarounds. They were
reported as "Misaligned patch-site" warnings from ftrace_call_adjust().
I don't observe them anymore with -fmin-function-alignment in my tests.
Sorry, I should have mentioned this motivation in the commit message.

-- 
Thanks,
Petr


