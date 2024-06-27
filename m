Return-Path: <linux-kbuild+bounces-2274-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C791B062
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 22:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C71701C20DA1
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 20:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A25374F6;
	Thu, 27 Jun 2024 20:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q64wE+LT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B658D13C3F6;
	Thu, 27 Jun 2024 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719520230; cv=none; b=l76hlbpFNtxyAAuSvPYHJnI7/SX66J0IHEm/WEKkNE1N7Yl6dvEvQd1dB2nZqHOLYpCJz9DbUqFtL09E21l0qemT4cdnTvuq44zjyuOGn2+xjjli71HSixhjyz5qWSKdclwWLVd2y4/tBnoCFSu3LeMDxjbgRg6eZCll2of9lcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719520230; c=relaxed/simple;
	bh=g3zse+u1WIgDINFtNe0bYsu3qg6O32NLoN6Aqff/TMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WT0Le0QytLp2YRBL486OkVysr3AlOQRD03NduQwVmmsRafLYUmEOWHUvdcRT8d4wAiuGaHijO6T2oF9pTcs1HNMdJujDzlM1p4iCEVL/7nuUNKChul2a7R8G66XwFikXgQJvZAVs0DrNVOewFFru02MpTWQXnpad69dZUaJVjRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q64wE+LT; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d4ee2aaabso2468833a12.2;
        Thu, 27 Jun 2024 13:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719520227; x=1720125027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C4INq2hPfpwDS3r1ZsYysbJ0MSl4awpvMRP7743NdmU=;
        b=Q64wE+LTnY3L9vwnwJYITDAwM4mDWyobHd6sO3U5xd/2cf6Qs0HOwgctRhihJL5SyA
         U9rSUnIFEphe3XbiRjwzzN4YuLrYA7UsYWtCpoVZQojI4+mVXQPsxHpzk8j0LgG6uDNT
         QKZ1mCxGpND5LFj79Qod6OTNrN6G5mam5DbwWuaOb0+V8Uwk4AHKGuyIHjIw+zMJLzws
         LucvjDpKab91W6/YjDmdBWPpLYayBL5dIykEe2vHft9it/49L4L1GN7eJXRMxK9PMrhy
         O9bPZVxEJVOMNXAbrdYTqcRoHHbmFn3CBlMGrz9oF8Ky3v4DGWCCa1JN/ENTHrVeN9Hf
         0gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719520227; x=1720125027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4INq2hPfpwDS3r1ZsYysbJ0MSl4awpvMRP7743NdmU=;
        b=eOinx9ZhIYNgFxANKnCfvgdsfrCqpAI601y1ZyPgf8a9swQ13z/mu4KDpCQSxV2wtD
         u+c+uoY5LPaDyZJcVy3gfnZV8Z7a8See5fCxeRdsXheO1Qwy5ZP44dWiq6knrBZMM4zd
         LBohxWm5waEYI36RXBkGeP4Q3D+qQc9AN1niRROpWh3iw6NlSQ7EwkCXnlKI2TMQWB/c
         plZAk/fhBAM6Xrswd75rWvxrJDrXjNIAwzOEPy7tkaP1ISA3FrHa8YJdXcta1YvYh05i
         ts6fBguSXhTWFSBQ/Ou6TCrhZxBSk8SG+AMDdv1kRll9XrK4VL/WXixMX2w+lKIFWEl2
         csVg==
X-Forwarded-Encrypted: i=1; AJvYcCVWgzFaD9lPZI8pekQGl9YK5IAJQK/ii0Y5CtC2YJ6jA7IXMlVcfGVNmKwKBVPUPzURLDGVrjrAp/0nIgTxdAwNuARoWDI24uFkQnG6ako4RqPEK5d5hLCTNnJ4ZhPIEe1TPtB8jzh9qwzMH1exKkxDl8vg+eITGufu4/GBeZFgHLviK3cE
X-Gm-Message-State: AOJu0YxeLacnUMft2r9VZKVlubeihIvzqm1Zub2Funs2pd0gWBMPTCaq
	kwBmSRv4UWPLCJBnlMgySTHRVc7NL8SbjsOISY7/QB4CSLqupu93
X-Google-Smtp-Source: AGHT+IEIMaJHGWNG+WIa+jl1kTf7Dsctp55viVzQA4nttCLNPUA3KWsB7JC+p4iKuy1vGu+akfSiZg==
X-Received: by 2002:a17:907:c5ce:b0:a72:4c32:7d89 with SMTP id a640c23a62f3a-a724c327e82mr1198204066b.54.1719520225755;
        Thu, 27 Jun 2024 13:30:25 -0700 (PDT)
Received: from [192.168.178.20] (dh207-41-166.xnet.hr. [88.207.41.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab08cb97sm8939166b.143.2024.06.27.13.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 13:30:25 -0700 (PDT)
Message-ID: <d3f8254f-0f53-47ee-a363-b14e9991a6e9@gmail.com>
Date: Thu, 27 Jun 2024 22:30:24 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PROBLEM] make randconfig: net/netfilter/core.c:830: undefined
 reference to `netfilter_lwtunnel_fini'
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org
References: <7a472130-d9c4-4fda-840b-093308f73d3d@gmail.com>
 <Znc4931wlIgvqrfP@calendula> <6cdb1346-75ca-472e-8d96-d58a1eaab172@gmail.com>
 <b50bb0bf-4d35-4334-a721-2a092210aecc@gmail.com> <Znw78PpYwAgFZiaB@calendula>
 <3d7b5916-c462-49cb-af32-e43f6d6ebfec@gmail.com>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <3d7b5916-c462-49cb-af32-e43f6d6ebfec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/24 20:34, Mirsad Todorovac wrote:
> 
> 
> On 6/26/24 18:04, Pablo Neira Ayuso wrote:
>> On Sun, Jun 23, 2024 at 12:51:49AM +0200, Mirsad Todorovac wrote:
>>> On 6/23/24 00:48, Mirsad Todorovac wrote:
>>>> On 6/22/24 22:49, Pablo Neira Ayuso wrote:
>>>>> Hi,
>>>>>
>>>>> There is a fix on the table address this, I will submit is in the next
>>>>> pull request.
>>>>
>>>> Thank you very much.
>>>>
>>>> Please consider adding Reported-by: Mirsad Todorovac <mtodorovac69@gmail.com>
>>>>  
>>>>> Thanks for reporting
>>>>
>>>> No big deal. Anytime :-)
>>>
>>> P.S.
>>>
>>> Please notify when I could test the same .config with your fix.
>>
>> Patch is here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/commit/?id=aef5daa2c49d510436b733827d4f0bab79fcc4a0
> 
> Build error has gone, tested in the same environment. Please find the build output attached.
> 
> Tested-by: Mirsad Todorovac <mtodorov@69@gmail.com>

Apology, please, the right email is this:

Tested-by: Mirsad Todorovac <mtodorovac69@gmail.com>

Best regards,
Mirsad Todorovac

