Return-Path: <linux-kbuild+bounces-2390-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9392849A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 11:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB1128468A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jul 2024 09:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5842C146584;
	Fri,  5 Jul 2024 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BrGVW2CH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B993D1465A9
	for <linux-kbuild@vger.kernel.org>; Fri,  5 Jul 2024 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170190; cv=none; b=bh9wMM/RhBvrGs0FVrhA9MBwcRQrQSvZEnlvvFsrnS5bxJ2xnQXM7oDxwumW8vE2PhpSDwhdBoxrDzpfPW+DEw68DjAhcaCWptngUP8JsH/iV79xPp7PezwjOSO1TLhZV8E7uXKWlVNvqf79zPoR/qeBflwfQeYv9HSEnAtvfkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170190; c=relaxed/simple;
	bh=S+yZBBMaErmw6DxMq6ezVGMcwsBMDJlIzMt8qM3pLmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RchAKi05U6wYk2DNURE2XmqM+O6fw3H4+Vm6xiWetv+ttWFDEIXrPdsik/ueDZeTWgd1k0r28Ga60ZCEYUYELaH1DdavQl8wY/RU3On8p3De79K2Sf+uTJCiKSOhgGjfDdMTonM4UT6EVw7raxWrTM5BoLF4qDjBnHOtoWh1dNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BrGVW2CH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720170187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RdjIc9xIHusxwhl4uGZCL9GY0NsWTTtgrjbZIGPRauM=;
	b=BrGVW2CHl32iP8MgJ25Op6trnxe8xTCtxYYjF/1itjhRNdWDT7X6jyPKhLGDIfIgIB8llK
	WSfSx8Djljwlaqv8CNnKN/FaeZL0KZma1XJQMipzyuT9u7OaSBJBpWl7PkwlJSaIvEqJiJ
	X8YUdAxSdAfEN6H69sdP7B5WQLwPdUo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-v-EbmxmePruqBDVtJuzzJA-1; Fri, 05 Jul 2024 05:03:06 -0400
X-MC-Unique: v-EbmxmePruqBDVtJuzzJA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-424fb2df2bdso14811705e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jul 2024 02:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720170185; x=1720774985;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RdjIc9xIHusxwhl4uGZCL9GY0NsWTTtgrjbZIGPRauM=;
        b=pJEBuGw+wuXsEywIFLmn4cca66rAPuUD2tpKmM6y9IYQvhp+dL4e0ihvh4YSunm7B3
         +dP5055iSLLUSAjTLOk0CkOG5jlGG8CLHVKtJfO+WYmQOJP6GuYbn13MWjSWFuOHYHA9
         KuywyOvkbl2LYq9aE3cqHFIuqBCavc85GN2imdR/ZKbQZwzcC0zdewiYd9aYo5xbEYR4
         2NEj3luDIK2KnqNcqnE3JECu160Y9IZVGQTPaw8X6QetFJD1Ki7hamIsA2zvYqQaHdeN
         A1sUJvoUqUo20TO+2p34I+LmbNhtv9216vOT7NhQ4FwXqATYnYnWMz2m/hZqsVB1eDiT
         b4SA==
X-Forwarded-Encrypted: i=1; AJvYcCXlHacz2X4KM63tFfdfyvU3xOq/yZR9G+p2Ekju8+7zAK+0emiaFVCGEWN4pLRDfyDThkxlaPm63ZX/10mtMemN8VqpXUZHocMVfdp5
X-Gm-Message-State: AOJu0YxGZSdwjB+zTeCqwTlaNkatH9IvxN/fm54LNVYVROPzQiFZkord
	C7xBROceWHBDRk1mrWEd7LwwA5dRpEP37hm9EZBrUe8E2aMdisGTsPkcFvY7+djtMBYy5oGrNkK
	ysEYYVDZWdWn9mFHdfKbwFBeJyN4bqK7Yq5BKo8HlXeiOwM+inYmqaaPV8fzl3dRM0Oah6w==
X-Received: by 2002:a05:600c:358b:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-4264a3d0174mr34741375e9.16.1720170185090;
        Fri, 05 Jul 2024 02:03:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG7HuYDewT5rgVP8ciStxZZRgcN71a98Q3TT9JcRhL70UgC/NwhuRtW3SoEWLIedQiRBVGbA==
X-Received: by 2002:a05:600c:358b:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-4264a3d0174mr34741055e9.16.1720170184615;
        Fri, 05 Jul 2024 02:03:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:b500:3ed7:a1c7:447e:2279? (p200300cbc702b5003ed7a1c7447e2279.dip0.t-ipconnect.de. [2003:cb:c702:b500:3ed7:a1c7:447e:2279])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca6dbsm53895175e9.38.2024.07.05.02.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 02:03:04 -0700 (PDT)
Message-ID: <30bc19a0-4cd3-420e-92a9-7b3c97d6ad2c@redhat.com>
Date: Fri, 5 Jul 2024 11:03:03 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: use zonelist_zone() to get zone
To: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
 masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240702234008.19101-1-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.24 01:40, Wei Yang wrote:
> Instead of accessing zoneref->zone directly, use zonelist_zone() like
> other places for consistency.
> 
> No functional change.
> 
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> CC: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>   include/linux/mmzone.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index cb7f265c2b96..a34a74f5b113 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -1690,7 +1690,7 @@ static inline struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
>   			zone = zonelist_zone(z))
>   
>   #define for_next_zone_zonelist_nodemask(zone, z, highidx, nodemask) \
> -	for (zone = z->zone;	\
> +	for (zone = zonelist_zone(z);	\
>   		zone;							\
>   		z = next_zones_zonelist(++z, highidx, nodemask),	\
>   			zone = zonelist_zone(z))

Should we do the same in movable_only_nodes as well to be consistent in 
that file?

-- 
Cheers,

David / dhildenb


