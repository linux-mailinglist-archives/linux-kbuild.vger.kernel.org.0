Return-Path: <linux-kbuild+bounces-907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C151485328F
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 15:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78669286E11
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Feb 2024 14:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A6B5674B;
	Tue, 13 Feb 2024 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VGtvro8G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051BF56469
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707833048; cv=none; b=hqZx7U3X2dzXuwP8wlC+B7/RXCqr5NwdIEbD/lS+jdDYCgjczZKusXRfAbdy2jOlBXCKBsmqAhF4WDVyB9/AT9kuT7BX110+BKpCCD2XQNVkob6njFLFYMaRWMLPOWCuAwQUx2HOcnraYj/hVvKQKSF49BbqpAWbc3f4Zc0TVYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707833048; c=relaxed/simple;
	bh=fHDodVGPfXKeK3nBhaERyTWy/HaZE3D2dDXvGBeZbT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUTGA6blziS1iOpZ0ZNKeznH27ZxDW5N9U9GEpt3BFBLf8rYAxu1bnLMhiYZ/wQOgLiKinzGowYm+qD+SQl8+wLQkLUbyX2ZeaeO9MXTcwMJM2gTWxJq/fjYYQh6lU1lpaqF0oqXibo9rG6mLPOoisvW20SJQtLElDXOyl0fT8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VGtvro8G; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso1399850a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2024 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707833044; x=1708437844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NBSidf4kq5A+Hopib0XOHnFPn3FmlvSKgt3Ygv93O/c=;
        b=VGtvro8GSxVQ8jeUN+FOclhfS4JHzLmyQcwrwfGulUvfLUNSAXbFicbsv5fX40X7l+
         bd9L5yDgxLYbNxRaKzCTvRZXrsE7rr5ID150n3tmb0+qltzFqTuVtIZms8IWgva46ftZ
         /55Vz+SvOG7/Ms4taFix9sSh+pOB1AAIZkeni0yRWuumqHUVBZ2xV8I49sSaUbWwLxqk
         wNv08H+HJTdC2TJEHO2IZpJBDyGUQnIS3iwoLHMnhMX5jrdNWO8kfz4EiNXFnUr9W+Xb
         mGnXzFafc+M6dmX8xmx/iS4OJxMqo7V0BzB9Kc/7reuTFRWl8616ebXpKR7G9+192ZlN
         EQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833044; x=1708437844;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NBSidf4kq5A+Hopib0XOHnFPn3FmlvSKgt3Ygv93O/c=;
        b=XChgGffZeMfhE7dlZgnCTzc9q9PMUm3rrtQKSlogD2VJue21C93vdo2/LiEkuZWDu2
         oRiYIiUMl9hs2sBijJGRtMOWkUgOCVpVBrPMQNo3/fi+mZpTj8l2lWLv1E73nkn6F/vT
         dJQPTE3ESIslH8HJK4kD4/7eGelII8SgKoGhQxMXCtNFPiEepc6gXvUs+gbzfi2Q1YLv
         5quJG5h9N9e7K7uyD6Ru6QK/aAD57RdBXT5PPWdZcFWSil7apn4LZq4feWw2aFSeLcF2
         AkdX3rYFArlnAxE5Uk+ltC0faEZJF5ip51i4pMf74y1lArE/0jp3Tke4gpLtIyNR1We3
         G6gQ==
X-Gm-Message-State: AOJu0YyaEv+C6NkfXqVRD60zPgzq56gQMlcY21Uv+vAAZY3fmT9JIUDK
	IVddhpFosyrP8ZJNkpUshf5UvdAILEWrJqb3K0CatXXIqEPVDysaZ7oEbkzhKlI=
X-Google-Smtp-Source: AGHT+IEhcvnsV2fI+C7lmzhyj6k7OS1JNG3wZTTmz/N2MNxpuUn3fmaSdMAvwlpBHUuRHH6MO/iU9Q==
X-Received: by 2002:a05:6402:69a:b0:562:1059:b27a with SMTP id f26-20020a056402069a00b005621059b27amr347392edy.29.1707833044139;
        Tue, 13 Feb 2024 06:04:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFGg0R9XXbtCrpYCljgYwJRYZRoWb/t/oAWecu45+8xD5IGd63m/3RXDKiaGk4l1+kF/CZedAfW/sPq2Zgcj8DTIKrFIBXOftErEmEZWknL7WmHerd6o5NgEcUR22qa4Ch1zbVQc5jKN5s2p4uDYe8iWRtT1fYJ3D73Vvrqe/Sc/tkjlBjxYzCBbl26LnFI7Zo7/A=
Received: from [10.100.51.161] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402151300b005611fc0cc11sm3770841edw.43.2024.02.13.06.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:04:03 -0800 (PST)
Message-ID: <23fcc355-c649-430a-b613-e62d71f681c3@suse.com>
Date: Tue, 13 Feb 2024 15:04:03 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Use -fmin-function-alignment when available
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: masahiroy@kernel.org, nicolas@fjasle.eu, mark.rutland@arm.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212145355.1050-1-petr.pavlu@suse.com>
 <20240213002746.GB3272429@dev-arch.thelio-3990X>
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240213002746.GB3272429@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/13/24 01:27, Nathan Chancellor wrote:
> Hi Petr,
> 
> On Mon, Feb 12, 2024 at 03:53:55PM +0100, Petr Pavlu wrote:
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
>> ---
>>  Makefile                       |  7 ++++++-
>>  arch/Kconfig                   |  8 ++++++++
>>  include/linux/compiler_types.h | 10 +++++-----
>>  kernel/exit.c                  |  5 ++++-
>>  4 files changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 7e0b2ad98905..9516e43f6e45 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -974,7 +974,12 @@ export CC_FLAGS_CFI
>>  endif
>>  
>>  ifneq ($(CONFIG_FUNCTION_ALIGNMENT),0)
>> -KBUILD_CFLAGS += -falign-functions=$(CONFIG_FUNCTION_ALIGNMENT)
>> +# Set the minimal function alignment. Try to use the newer GCC option
>> +# -fmin-function-alignment, or fall back to -falign-funtions. See also
>> +# CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT.
>> +KBUILD_CFLAGS += $(call cc-option, \
>> +	-fmin-function-alignment=$(CONFIG_FUNCTION_ALIGNMENT), \
>> +	-falign-functions=$(CONFIG_FUNCTION_ALIGNMENT))
>>  endif
>>  
>>  # arch Makefile may override CC so keep this after arch Makefile is included
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index a5af0edd3eb8..e2448f927fae 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -1507,4 +1507,12 @@ config FUNCTION_ALIGNMENT
>>  	default 4 if FUNCTION_ALIGNMENT_4B
>>  	default 0
>>  
>> +config CC_HAS_SANE_FUNCTION_ALIGNMENT
>> +	# Detect availability of the GCC option -fmin-function-alignment which
>> +	# guarantees minimal alignment for all functions. GCC 13 and older have
>> +	# only -falign-functions which the compiler ignores for cold functions
>> +	# and this hence requires extra care in the kernel. Clang provides
>> +	# strict alignment always when using -falign-functions.
>> +	def_bool $(cc-option, -fmin-function-alignment=8) || CC_IS_CLANG
>> +
> 
> I think this configuration should be split into something like
> CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT that has the cc-option check then
> CONFIG_CC_HAS_SANE_FUNCTION_ALIGNMENT can depend on that configuration
> or Clang as you have it here, so that we can drop the cc-option check in
> the main Makefile and have it be:
> 
> ifdef CONFIG_CC_HAS_MIN_FUNCTION_ALIGNMENT
> KBUILD_CFLAGS += -fmin-function-alignment=$(CONFIG_FUNCTION_ALIGNMENT)
> else
> KBUILD_CFLAGS += -falign-functions=$(CONFIG_FUNCTION_ALIGNMENT)
> endif
> 
> It is wasteful to call cc-option twice in my opinion, especially if we
> are checking it in Kconfig.

Makes sense, thanks.

-- Petr

