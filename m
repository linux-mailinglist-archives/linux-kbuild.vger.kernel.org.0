Return-Path: <linux-kbuild+bounces-2402-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9E928E62
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 22:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DA13286BB7
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 20:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3320F144D21;
	Fri,  5 Jul 2024 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ker8BJTF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E621208A7;
	Fri,  5 Jul 2024 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720213037; cv=none; b=jX2ofLiPoGdGI5OccvqYJP/gptawzTfLyisW/8o6RnoSg5ocPHTPz48QJXplEa+RETTk5MtIa9xNBMepCkOKkcFeNWdnj+x0td+G1gPmQV0x38nUpcTR6b7qexkse/4OPRX6q8DT+IOYmUTYXqZgnCjd/OT8Uba/QdjjAyj96FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720213037; c=relaxed/simple;
	bh=zfPl4JHpdt2rgtqNdErFVL4BX9c29lDaCnBMeoiVAQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YrIpwlZT8hTf+pgVodvOCFRt+GgBAKwJelll35bLDlNL483CSix46E0Q/niYY9lOZ7TCVbWUeIbRLQCBWBeO5gzAWgC8ZXBgVtcxnCcacAMH7RMeQK1tD8grzDOkbJr72hbkzB63C77WBRRrf254oigdWcj5dhBvimM+NvOI8d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ker8BJTF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-36740e64749so1131775f8f.0;
        Fri, 05 Jul 2024 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720213034; x=1720817834; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NBgL8A01VZphViZ2sBr2uNobrvDjjMctGWN3h70md50=;
        b=ker8BJTF7Q/dsfwKXM5RUPx5bLOFRLRmIVocThLRP/AwGrNuggxigz6HWShSW70eET
         z7eNZ7AHn+aqIiWGrMmW6gEUbrbUxoWDRPjH83I4nKo+oMeZDWazlejt1NAgA1JE1dKF
         nxEtWU1Rp/wRlAEMib9LmXnJM7uuCKSHm2wfjMZd5ZXRdPWXDOG1bpOYypRApwwtjY/V
         OGfDv+4cjDIoMpfEq4W/cva2YKKUH7CiBsCoIgO/xu4sHaaTdla1tqEYsRwZZR8MqTSH
         hbS9mIh5X2rPAGeGp1Oqav9+s8S8tpkjy+GA7NvmyNPxM0fnKacHL1cGJFH/HNXdzX0f
         t8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720213034; x=1720817834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NBgL8A01VZphViZ2sBr2uNobrvDjjMctGWN3h70md50=;
        b=ZNaHocPFprdySZJ1mZWKq0Yi6CS/K5QrMhK1B3oeaPg0jNH4zbcI+BBI5/Ko/g/m7V
         GXxhPmwjsd810/sL6Qu1SVeStzOZOmzJSg55YUyP5ur0y+RjvfoD6Dxhbp3L5bnOkxTW
         6wjqTjLiedfZ+JLwqssmECW20orH0G9Y7tbvZwdFLKZsbN/OV9rNpkBrEu+Xppi9FU3C
         34/UH00jR9Y6Fa+oYMr16c2d4/i6EDvbCQeRynSQ6Ij9pzcA5jceqc29KjuM9QphkPWM
         wv7PV40wnbRpOtKpk9bKAiYn2vXMMaFiKk6jHfeRXURB5S6hKi73Xr8nCiSIFRyzPdJD
         Z2sA==
X-Forwarded-Encrypted: i=1; AJvYcCUyydannyGCfdfp3yWsRn//Id0wu4nCX2M1tFQCKq6c8EQJ0AWBadolQiFNSkqWeyeZJdKUiY7Vj/TEKNPtkGO4wwgCOb4aFcKk576D
X-Gm-Message-State: AOJu0Yw+6RccI0yrJcc0RLyK05b5HSZlPOejwbneTNWDk8Czfd4G7h/f
	xM8ATsvkY9z39tJDEocc3G+FKQ3TYiG5KWalASrV5BMEDkv5Fd4xMiDinQ==
X-Google-Smtp-Source: AGHT+IEqX/EpuOEA0EK0wvho0kzeKYUxtBqEvGh7CQJzukXWIdI8Jnm0dD3EsMhDNAkw0QmSAMb3OQ==
X-Received: by 2002:a5d:46c5:0:b0:367:973c:aa75 with SMTP id ffacd0b85a97d-3679dd35019mr3387793f8f.42.1720213033494;
        Fri, 05 Jul 2024 13:57:13 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-52.xnet.hr. [88.207.43.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679efcffe0sm4608829f8f.97.2024.07.05.13.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 13:57:13 -0700 (PDT)
Message-ID: <70b32083-34fb-42a5-b9bd-6f4fd21f70fd@gmail.com>
Date: Fri, 5 Jul 2024 22:57:11 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM linux-next] Segfault while building headers with
 dpkg-deb
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <2c8833e1-1995-4f49-804a-705ab9e702a5@gmail.com>
 <CAK7LNASH6mS3X_YhkVV9z5ZVXdew_nGpJxaakaE1moZckETM7A@mail.gmail.com>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <CAK7LNASH6mS3X_YhkVV9z5ZVXdew_nGpJxaakaE1moZckETM7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/2/24 10:18, Masahiro Yamada wrote:
> On Sat, Jun 29, 2024 at 3:59 AM Mirsad Todorovac <mtodorovac69@gmail.com> wrote:
>>
>> Hi all,
>>
>> On the vanilla linux-next tree, branch next-20240627, there happens to be a bug while building
>> with the randconfig seed KCONFIG_SEED=0x90E8E591:
>>
>>   .
>>   .
>>   .
>>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6.10.0-rc5-next-20240627-dirty/kernel/samples/trace_events/trace-events-sample.ko.xz
>>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6.10.0-rc5-next-20240627-dirty/kernel/samples/trace_events/trace_custom_sched.ko.xz
>>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6.10.0-rc5-next-20240627-dirty/kernel/samples/ftrace/sample-trace-array.ko.xz
>>   XZ      debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6.10.0-rc5-next-20240627-dirty/kernel/samples/fprobe/fprobe_example.ko.xz
>> dpkg-deb: building package 'linux-libc-dev' in '../linux-libc-dev_6.10.0-rc5-45_i386.deb'.
>>   DEPMOD  debian/linux-image-6.10.0-rc5-next-20240627-dirty/lib/modules/6.10.0-rc5-next-20240627-dirty
>> dpkg-deb: building package 'linux-headers-6.10.0-rc5-next-20240627-dirty' in '../linux-headers-6.10.0-rc5-next-20240627-dirty_6.10.0-rc5-45_i386.deb'.
>> Segmentation fault (core dumped)
>> make[6]: *** [scripts/Makefile.modinst:128: depmod] Error 139
>> make[5]: *** [Makefile:1842: modules_install] Error 2
>> make[4]: *** [Makefile:2058: run-command] Error 2
>> make[3]: *** [debian/rules:61: binary-image] Error 2
>> make[3]: *** Waiting for unfinished jobs....
>> dpkg-deb: building package 'linux-image-6.10.0-rc5-next-20240627-dirty-dbg' in '../linux-image-6.10.0-rc5-next-20240627-dirty-dbg_6.10.0-rc5-45_i386.deb'.
>> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
>> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
>> make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:1555: bindeb-pkg] Error 2
>> make: *** [Makefile:240: __sub-make] Error 2
>>
>> Build log and .config are attached at your convenience.
> 
> 
> 
> 
> 
> If you used an old kmod version, this is a known issue.
> 
> https://lore.kernel.org/linux-kbuild/E1rNVlL-000qDm-Pg@rmk-PC.armlinux.org.uk/
> 
> A quick solution is to upgrade your kmod version.

I see. Sorry then for the noise and duplicated work.

It might be inevitable that I will do something dumb more often than not when testing
randconfig errors from such a vast number of lines of code ... :-/

My kmod is as follows:

ii  kmod           29-1ubuntu1  amd64        tools for managing Linux kernel modules

I thought of upgrading to 24.04 LTS, but when upgrading kmod I've lost the capacity to boot
the older kernels in bisect process?

Probably, it would be for the best if I had several versions of Ubuntu in multiple boot
options? However, I have not yet done that ...

Best regards,
Mirsad Todorovac

> --
> Best Regards
> Masahiro Yamada

