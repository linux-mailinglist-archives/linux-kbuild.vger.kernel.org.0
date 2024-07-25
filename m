Return-Path: <linux-kbuild+bounces-2657-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C025593C293
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 15:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE0071C20E76
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5FD19B3C7;
	Thu, 25 Jul 2024 12:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P5VhkUEl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DCA19B3C5
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 12:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721912375; cv=none; b=LvAFywlCICTYHyVDsfaQv3cJA5alScO+fwmrYTCMLmXXwtqXvB616vOZI2g39m3PkVp2P5Znjncfi1DNiwmc81UBI0ZECyL0xlEOJt1bXYcdvzpBZJiFiFLbNOwWd8Sib8U5LAdTkAZHCwUwYJJhDvPFK8TdcVbzKUWzmji0YLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721912375; c=relaxed/simple;
	bh=C5M5Cp6O26cJNK6tU4XtF1j29Ai+zh3qyJcVP9FvsUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n4tcK7D0DMxZGj23mLv0Tfb/Y5gKHHJY3x8NBR21cWynLITwJrwMHgVvk/qN+Ot6ac2ZnnVwphxx1MmBi/0ri0daFOXyC+AJvFMsrALV8SmfCbpZ2fe5RQ+QUYd3+1MXtgPaDBPZ70mbEAVFPcq5gWKeybxMt8aa55KyY+pmJG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P5VhkUEl; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f008aa351so207960e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721912372; x=1722517172; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zIfbxqUmzo46HSqAfgUq13hsjAeuf22jHoKKPgp0pGo=;
        b=P5VhkUEleZCyNLWchOdPc3xqdnScxsbOG7V707hkBC9gT+mDbg4jWVD4mStMAsn+Tu
         182SOuTVu9iXjawOrhbmot8KtnYkV+PE/ePt+fPLgAeCNMmaCoVlPUSMPe8aTb8AOjsv
         DqEKU+FS/83TBIa70MH7N8xrWq7Yw798mrm0dwl+big1d16XBnZGToA6ZbI77RHQRswb
         VkDrLs9mNX/gBOPrIO5IFPgrAPEP0oWIGod9tbHVWtQLNTZRuEm4v6t3Lq/q/r+LK55l
         yd645b9xR2mhY8L8GhorBJX5PrTraD/VrdrXTIVILJdyy924GX4UhbO037QhLf/BmHBp
         T34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721912372; x=1722517172;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIfbxqUmzo46HSqAfgUq13hsjAeuf22jHoKKPgp0pGo=;
        b=JNKs4Fthy4zMU+NkkTlY91bxutHHUhT3+JrtxIZyzfWd/j8wI+lxjGzkS9HS1zwlI/
         66uI+amf1PmZqqt4TI9oPrveUj5RjyFYbbk0/uBd67NuyBnRsQyqlc/sRr7StrSaKkyK
         hwvENLL1tf2cmNJqE43Fz5QsmACuXGy+68Pa6cRege09JJK703F72CPW8xPdVj+t6wPp
         zMIapXe++Md66X9ZfrR2o7FIgxBUM8A3BT+hIz/bYTFgMy2cjczUPdC1Uz8y5Cq4jrEU
         e9Jd1TqSKGqfsnC+3N1ZSNxq06/EYaY56pSZhfptLYa7l8Bw8rhpjFsdTivhqD5sO9ug
         0Ccw==
X-Forwarded-Encrypted: i=1; AJvYcCWmGCvg2p+jG4CIvv3VD4Vwm3CROQt+67c6fZtzWuNuYSvlhuhd71RMXcpX6ka12rsd8ZkxYMT0mseFXIGrbBHNc0xVgqSnTX+2xYC/
X-Gm-Message-State: AOJu0YzGZG5VhzbkMdnEfP/LQYB0h2SylwMtKOk3vO+7IzODL5nLEmHn
	cU3InIYs+eFg4uJFA20s3tf/PC8c2kheaQyejwkz6kpERtso1/sUctoOkiBMlFhNTU15x1SLgf8
	4
X-Google-Smtp-Source: AGHT+IGycK5yh/wfucGGjHImpM5C1XOB/I60EH6O1olLGqE4w2H/LzB8RkII7zGMsVepz1K6MGim1Q==
X-Received: by 2002:a19:a407:0:b0:52e:9d28:c28a with SMTP id 2adb3069b0e04-52fd6035f28mr1125423e87.26.1721912371865;
        Thu, 25 Jul 2024 05:59:31 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4348bsm70245466b.118.2024.07.25.05.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 05:59:31 -0700 (PDT)
Message-ID: <90416ccc-8537-489c-ac15-78aacbcb42b0@suse.com>
Date: Thu, 25 Jul 2024 14:59:30 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] module: Split modules_install compression and
 in-kernel decompression
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722090622.16524-1-petr.pavlu@suse.com>
 <20240722090622.16524-2-petr.pavlu@suse.com>
 <CAK7LNATG-kYuxGgzC7e-BbTPMnSH+MCAEVOXoQkdGYH9xLincA@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CAK7LNATG-kYuxGgzC7e-BbTPMnSH+MCAEVOXoQkdGYH9xLincA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/22/24 12:23, Masahiro Yamada wrote:
> On Mon, Jul 22, 2024 at 6:07 PM Petr Pavlu <petr.pavlu@suse.com> wrote:
>>
>> The kernel configuration allows specifying a module compression mode. If
>> one is selected then each module gets compressed during
>> 'make modules_install' and additionally one can also enable support for
>> a respective direct in-kernel decompression support. This means that the
>> decompression support cannot be enabled without the automatic compression.
>>
>> Some distributions, such as the (open)SUSE family, use a signer service for
>> modules. A build runs on a worker machine but signing is done by a separate
>> locked-down server that is in possession of the signing key. The build
>> invokes 'make modules_install' to create a modules tree, collects
>> information about the modules, asks the signer service for their signature,
>> appends each signature to the respective module and compresses all modules.
>>
>> When using this arrangment, the 'make modules_install' step produces
>> unsigned+uncompressed modules and the distribution's own build recipe takes
>> care of signing and compression later.
>>
>> The signing support can be currently enabled without automatically signing
>> modules during 'make modules_install'. However, the in-kernel decompression
>> support can be selected only after first enabling automatic compression
>> during this step.
>>
>> To allow only enabling the in-kernel decompression support without the
>> automatic compression during 'make modules_install', separate the
>> compression options similarly to the signing options, as follows:
>>
>>> Enable loadable module support
>> [*] Module compression
>>       Module compression type (GZIP)  --->
>> [*]   Automatically compress all modules
>> [ ]   Support in-kernel module decompression
>>
>> * "Module compression" (MODULE_COMPRESS) is a new main switch for the
>>   compression/decompression support. It replaces MODULE_COMPRESS_NONE.
>> * "Module compression type" (MODULE_COMPRESS_<type>) chooses the
>>   compression type, one of GZ, XZ, ZSTD.
>> * "Automatically compress all modules" (MODULE_COMPRESS_ALL) is a new
>>   option to enable module compression during 'make modules_install'. It
>>   defaults to Y.
>> * "Support in-kernel module decompression" (MODULE_DECOMPRESS) enables
>>   in-kernel decompression.
>>
>> Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
>> ---
> 
> 
> 
> My preference is to add
>  CONFIG_MODULE_DECOMPRESS_GZIP
>  CONFIG_MODULE_DECOMPRESS_XZ
>  CONFIG_MODULE_DECOMPRESS_ZSTD
> instead of
>  CONFIG_MODULE_COMPRESS_ALL.
> 
> 
> 
> 
> For example,
> 
> 
> if MODULE_DECOMPRESS
> 
> config MODULE_DECOMPRESS_GZIP
>        bool "Support in-kernel GZIP decompression for module"
>        default MODULE_COMPRESS_GZIP
> 
> config MODULE_DECOMPRESS_XZ
>        bool "Support in-kernel XZ decompression for module"
>        default MODULE_COMPRESS_XZ
> 
> config MODULE_DECOMPRESS_ZSTD
>        bool "Support in-kernel ZSTD decompression for module"
>        default MODULE_COMPRESS_ZSTD
> 
> endif
> 
> 
> 
> 
> 
> OR, maybe
> 
> 
> 
> config MODULE_DECOMPRESS_GZIP
>        bool "Support in-kernel GZIP decompression for module"
>        select MODULE_DECOMPRESS
> 
> config MODULE_DECOMPRESS_XZ
>        bool "Support in-kernel XZ decompression for module"
>        select MODULE_DECOMPRESS
> 
> config MODULE_DECOMPRESS_ZSTD
>        bool "Support in-kernel ZSTD decompression for module"
>        select MODULE_DECOMPRESS
> 
> config MODULE_DECOMPRESS
>        bool
> 
> 
> 
> 
> You can toggle MODULE_COMPRESS_GZIP and
> MODULE_DECOMPRESS_GZIP independently

I can implement this, but what would be a use case to enable multiple module
decompression types in the kernel?

> 
> 
> Of course, the current kernel/module/decompress.c does not
> work when multiple (or zero) CONFIG_MODULE_DECOMPRESS_* is
> enabled. It needs a little modification.

One issue is with the file /sys/module/compression which shows the module
decompression type supported by the kernel. If multiple types are allowed then
I think they should all get listed there. This could however create some
compatibility problems. For instance, kmod reads this file and currently
expects to find exactly one type, so it would need updating as well.

Thanks,
Petr

