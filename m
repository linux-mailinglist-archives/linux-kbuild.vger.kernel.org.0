Return-Path: <linux-kbuild+bounces-6908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4626AA8007
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 12:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D5EB3B58A7
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 10:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C97189F57;
	Sat,  3 May 2025 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ohfj/Wpf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344361D515A
	for <linux-kbuild@vger.kernel.org>; Sat,  3 May 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746268009; cv=none; b=dLRBcO1njDOR/p0zuWo/spSM5dV5hTanUojSj5764sqMyUSlrTdM7TsO0TSBPLWknWS1G09DYdB6OFgZzsFr//rxZYG8g7UM/+ZoxzpOW2sif0pW0x3/aEnl1JSI/Fv7o7guw3zvwktS/g8szS15FDsDPKA5OX3XR6WeJpE3r98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746268009; c=relaxed/simple;
	bh=W+xMqx3fuPFovNkVPldJNMyMSK/vtL9pBT70f5EItxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POeZetrCinjSpBdOCwS+DffmcEFrPZsrjvkuRYuY7LAvEQZctykNUznD+Bzn9DdzboYivX7hl9h1yfqeUznLgNtGu+wgnNjs9JJdUu8qqxDZawu8iXmLraQdu3PFKPVxB7za3rFt/A0DdcxBCtJ3GPfEuDSF3G4Nb/20AViL33o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ohfj/Wpf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac339f53df9so593440866b.1
        for <linux-kbuild@vger.kernel.org>; Sat, 03 May 2025 03:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746268005; x=1746872805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=brJWAHxt7c4PhTiLh0rTDLz2d6d0poBPqgDwkWrVqs0=;
        b=Ohfj/WpfRa2YubyqiVrMZLTOqhvIpc+KIIRk2oZTYbI+nuhFfaWEsa+gp9DAiGsOuB
         PNPLmuz9fHX5G4XZu522wxfQGY3oX/+Wy/b8LNnKvaN6TzO0IIedAiNkLqC637fsQPbX
         V7T+7qXtrqviv/A1i2Q685B+CQXSZUFEA5R8nY15Y/Gx07Aic9r0MMXFuRb5l+7JnQd9
         GJxGt3qmlxChxmHdVDKS1La3M7y0Co71FasTXMJWRPd8852fgRVBKjQYtladcRdfzlcB
         gg/fUuaMqaFutVjZd/Fk2j/0IDokO8/p62mAK9ctiOES5DQbhDT/a2MAqsFNm2njSdz4
         6pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746268005; x=1746872805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brJWAHxt7c4PhTiLh0rTDLz2d6d0poBPqgDwkWrVqs0=;
        b=YUq56l8GcjqoTr0TC+SZawYPRYicZ8cKZro/DZA72YRgpA+X956gRS7ymZ/EZH3oyW
         kWj0P4w5398/jxslz0lIKBZoK5jf2I8hxhswg12gJI4j3UYh7jYDcvwr7Q8K+iI96acF
         5xwleSyT+EMJaU1et5fIU7ixUhXJBt2zu1oYZZpOTuGzK7b6q020t/keDHvEPlZBvWh9
         I3EEyHeMzN+sda9zeghDYySnu6gNkgztpR29SFYw3UXoTOrFbKWNvymrW5EKHX1vbC28
         BSSLuoQZJKzicIHzbdhkfukuGvjHI3hbKx0nHfOCm+UjvX1YthB6tdKxp0qLMMn+HXfk
         K09A==
X-Forwarded-Encrypted: i=1; AJvYcCWtHi1HdD3+6e9dn2WdYpioUTpZGYEDb1dk9DeHEHnpSVf4zRR7iUHhRGejLprR4T/1ciHnZEizmuAL9ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXy6Vy3itLc53bdMrRdWfg2g7Y67D5+cspvVWEBk4xFe0wgAmt
	yYzx7DN+9vM7zINxp76jTFOWHcYkwGQUgzT82wKa1Apq8aNSKKEyum6g8b3Y4EY=
X-Gm-Gg: ASbGncv6/d6lSaeJQLo4y9S9fATOm2SGoRYOtXricc8m6rgRRM6wdXacv2tDY+dzmr6
	GKKSbOxWOSJ7INGxSzY2e0QQudJP2VaisvZcCUlfA4FmiEYMFuSucYkreKfVLpvrxpWu9sr+q7A
	K1MRqjvv4+1vK15+p1fMldXeBd+CVDyz1aAi420ywwotxk6O31pEUkZdvVQY6+mqh358//tILGe
	Vzn2761Z5BiMHKLmpdSIHhOGFYj6IJL9A28KZChqrU6KQftbNKOvfBrKqkTVSg6tAYm+1MtDmVs
	OldVCD9Rh8EUXuzm3J1EMheCuUBpZbofefauvdKCtG8=
X-Google-Smtp-Source: AGHT+IHiNdfTG1Lwe53VSOBsvssZocvCjEijhJyzDWm1Py+VylIB04fuJ+7LtlEQiEGfC9bylP5eug==
X-Received: by 2002:a17:907:948e:b0:acb:4cd7:2963 with SMTP id a640c23a62f3a-ad1a49e34famr53282566b.33.1746268005458;
        Sat, 03 May 2025 03:26:45 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189148a18sm177429666b.27.2025.05.03.03.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 03:26:45 -0700 (PDT)
Message-ID: <efd64a6f-d6e5-4790-96b6-0776cd3a7f5a@suse.com>
Date: Sat, 3 May 2025 12:26:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] modpost: Create modalias for builtin modules
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
 <cf3ff619-6177-42e1-8f64-74cf4cbb8672@suse.com>
 <aBCkNh0Q2hwpMchj@example.org> <aBDK0G6OUUcEmzvZ@example.org>
 <7b13da9f-39f2-4007-931b-519d8e7d1ab6@suse.com>
 <aBDs_Unta7-vOPk4@example.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <aBDs_Unta7-vOPk4@example.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 17:15, Alexey Gladkov wrote:
> On Tue, Apr 29, 2025 at 04:14:13PM +0200, Petr Pavlu wrote:
>> On 4/29/25 14:49, Alexey Gladkov wrote:
>>> On Tue, Apr 29, 2025 at 12:04:44PM +0200, Alexey Gladkov wrote:
>>>>> I'm not sure it's best to overload this data in this way. I think mixing
>>>>> actual files and "logical" modules in the modules list is somewhat
>>>>> confusing.
>>>>>
>>>>> An alternative would be to keep a single module struct for vmlinux and
>>>>> record the discovered aliases under it?
>>>>
>>>> It is possible to extend struct module_alias and add the module name. The
>>>> problem is that alias is added by module_alias_printf() and we will have
>>>> to add the module name to the arguments to each do_entry handler in
>>>> addition to struct module where there is already a name (but in our case
>>>> it is vmlinux).
>>>>
>>>> I can do that if you think it's a better way.
>>>
>>> If I don't add separate entries for each builtin module, the patch will
>>> look like this:
>>> [...]
>>
>> I see, that didn't turn out as well as I envisioned. One more approach
>> would be to track builtin modules separately. A patch is below. I'm not
>> sure if it's better.
> 
> I'm not sure I get it. What do you mean when you say I need to track
> builtin modules separately ?

The patch that I sent in my reply introduces a new list called
builtin_modules. This is what I meant by tracking builtin modules
separately. This implementation has the advantage of not conceptually
mixing the modules and allows the function write_vmlinux_export_c_file()
to directly use the new list.

On the other hand, keeping everything in one list and introducing a flag
for builtin modules (or maybe replacing module.is_vmlinux with some
module.type enum) allows functions that take only a module pointer to
know which module they are dealing with, which I imagine could be
useful.

I don't have a clear preference, as long as we avoid misusing
module.dump_file.

-- 
Thanks,
Petr

