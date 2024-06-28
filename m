Return-Path: <linux-kbuild+bounces-2282-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DD491C287
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 17:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F30B61F21F2C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2024 15:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35441BE847;
	Fri, 28 Jun 2024 15:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mapxl0Rq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BD0B645;
	Fri, 28 Jun 2024 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719588202; cv=none; b=pDA7V7zhFXK5YB2G+WECkjP09tHHqSRLPtbE3n+JeVZp0HFyFOdFEhst6+LCWe8LVT6ucTQD2sgFVTSrHGqQ9SCyZmBSKW65JmXMubZA4JDhEp+pOj8EwYkKMVLL9SicykKdkZLLLIlhpxfYjEuKkt/+K8wo//5hLnDnmWHMv00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719588202; c=relaxed/simple;
	bh=BR2tHTmy+fHEV9yIh4M/cf4SZ2OcHQDH7CpErqksoLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gESsWUGJpjQLi4BAJrj0HeFNJ0hqDlbEzz6TjyQTLThqIdGKN33I65CLM5BTVTXxNavgErFhI3vNaeaMMZm739lo4Kn/GkD+xysi93Q9RPKmFjB/1fpE5GfYePqVxxiq6W8RzROBCKaGyVtqU58+K27AHaaBovT9En/2oNtDM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mapxl0Rq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ce9ba0cedso1292758e87.2;
        Fri, 28 Jun 2024 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719588199; x=1720192999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jL/M2DhfYKttVaFn04K/Ozv5calB4SUJe5t8RdpTJN8=;
        b=Mapxl0Rq4bfoTU4Pr2hWWAGtrf7fvf088X33TA3OZKvpBwV+WL3RnIqmtFF94DO3AB
         EYIoGPNGiStDKH8NjpfHi1yo7g1QrwM5rEtVl53NJiI8SrIYG1qWG/dKhwq8hMz7xgfb
         oXLRu5Twt8yppnOmMKr407CwtORjh/ShbPmJlvm30TYRbA+a+tJOobMlWtpwlFecwYLU
         +Tcs8XF50VJmYZX9CSpcZcFlULXhv2GYpN3TZ3lvJWtG8B8akEZTW6UWOSEJSUW0ktHp
         0030hpVPujVUSc3xijG7g2racrNRs1rdlvvwIqLp33PNzH5XB5qEKdUutokDyHUM54qN
         ZRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719588199; x=1720192999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jL/M2DhfYKttVaFn04K/Ozv5calB4SUJe5t8RdpTJN8=;
        b=O0a0fx3r4G3yu0D6VQ+atEi5KWs9BIyJaY/mYWngZ3jGuH9Lf2YPID+5GsbUCjrx+F
         dpvLIIS8WnUvFCGijufoVJ7RltCpj2queTQoehCBW4jtA5+DY1Nof/mjCb5EfG1Zn+WP
         bLK1xtGSVF6AToV9vg26oOc2KdLXuNYLN/uncfES+qN2HXwNZQpKJZoQ+GRq7i5wULR5
         o4K1R8ccRkeukLfV725G8nTRezJUfeu+fzWGd1AQI5s9/gPouT75Ir9vwRv1Q9ehxMLy
         6TQR94BJ7V7XQ6hQ0VANvgGUc8jURZ8CtI6znt3XASr/Y4AyJHQYJx4BFkBUrd4npeNF
         3XVw==
X-Forwarded-Encrypted: i=1; AJvYcCWFNAxzBcZmUjNl1elqsqugwipjJIbFXENoqSsf5xEKzN1CvPDespD5dhN3S1LE1T6O3TJ9uAa8v4dvkbIZCF8CX2FZmGML5k/NhgT07Lgpm/I1D1+5ckb45UVigdnrov9ir/IfTEOFa/uj808HVRnpL7sjA4aVXVLx+NAeJF7dVqkdb++E
X-Gm-Message-State: AOJu0YxRDdjTp474C5laeDKm4tT2u5PLcxP5qiFvdqLl33I5jaNpH2II
	KdmubJUhyinc1NDS2LTAvUmMqIVsWGpkw67KQZM+iJTBeqeP0nnt
X-Google-Smtp-Source: AGHT+IGg5kcqMly3Comvqhc88Qjsv4Vew155hATIGzgcomShCMIVMWAiMMp6EA68DvlRzN+VxwZ1BQ==
X-Received: by 2002:a05:6512:78e:b0:52c:a20e:4da4 with SMTP id 2adb3069b0e04-52ce185ca1amr12557484e87.57.1719588198875;
        Fri, 28 Jun 2024 08:23:18 -0700 (PDT)
Received: from [192.168.178.20] (dh207-41-166.xnet.hr. [88.207.41.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf633bdsm87877066b.74.2024.06.28.08.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 08:23:18 -0700 (PDT)
Message-ID: <8cb43e8d-cb88-47c4-9fed-9de3b1be1e9e@gmail.com>
Date: Fri, 28 Jun 2024 17:23:16 +0200
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
 <d3f8254f-0f53-47ee-a363-b14e9991a6e9@gmail.com> <Zn3PNGFkg6jqU9wc@calendula>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <Zn3PNGFkg6jqU9wc@calendula>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/27/24 22:44, Pablo Neira Ayuso wrote:
> On Thu, Jun 27, 2024 at 10:30:24PM +0200, Mirsad Todorovac wrote:
>> On 6/26/24 20:34, Mirsad Todorovac wrote:
>>>
>>>
>>> On 6/26/24 18:04, Pablo Neira Ayuso wrote:
>>>> On Sun, Jun 23, 2024 at 12:51:49AM +0200, Mirsad Todorovac wrote:
>>>>> On 6/23/24 00:48, Mirsad Todorovac wrote:
>>>>>> On 6/22/24 22:49, Pablo Neira Ayuso wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> There is a fix on the table address this, I will submit is in the next
>>>>>>> pull request.
>>>>>>
>>>>>> Thank you very much.
>>>>>>
>>>>>> Please consider adding Reported-by: Mirsad Todorovac <mtodorovac69@gmail.com>
>>>>>>  
>>>>>>> Thanks for reporting
>>>>>>
>>>>>> No big deal. Anytime :-)
>>>>>
>>>>> P.S.
>>>>>
>>>>> Please notify when I could test the same .config with your fix.
>>>>
>>>> Patch is here:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/commit/?id=aef5daa2c49d510436b733827d4f0bab79fcc4a0
>>>
>>> Build error has gone, tested in the same environment. Please find the build output attached.
>>>
>>> Tested-by: Mirsad Todorovac <mtodorov@69@gmail.com>
>>
>> Apology, please, the right email is this:
>>
>> Tested-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> 
> Thanks a lot for testing.

Not at all - I think that testing whether the patch fixed the problem in the
initial environment adds to QA.

> Patch is already flying upstream, I missed adding this tag. But I
> could include your Reported-by: tag.

In the Internet space-time contiuum, you actually did not miss a thing,
because my testing is a logical consequence of your patch, and could not have
preceded it, so that the Tested-by would be in the original patch ;-)

As Lord Merovingi said, "cause and effect" ;-)

Best regards,
Mirsad Todorovac

