Return-Path: <linux-kbuild+bounces-2403-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFD928FD0
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 02:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2B42284807
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 00:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BBB3D68;
	Sat,  6 Jul 2024 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQheob28"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AACE79F3;
	Sat,  6 Jul 2024 00:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720227095; cv=none; b=JFJJzMnE0qwmZKlG/LdsQjs5WsA4MeHkf45x2ZHGfuF4COo0Cq9/5aN9YG0y5zFs/OmoXJryCscOkR802WlyhtIJVw6Cf+7jqT9Gkx7Bp1b3crwgqQylIDlc0XiGqPMr8EE5AvlEmqRThSiOIefsPmALFipUUrJsc+tf73n+7mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720227095; c=relaxed/simple;
	bh=hA4M+hIX7Udd46XmKv0jy7vYTI0wDzFUgfQIm0fu0ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEZspxRGqmf3wvc8RNEh+zywjHiFKOXmzEtOlfQ4cVYAFYy7gcPSmu8WX3XKGrcJqbrGi0m0bIei7CRRHnyBT8LKAZ8Spr6PAi4HHqqWNmLMcJR5uFfx/Jj6Kvqb2btvhNZk8mAfZo33sKzhgjXSgOIynMszbS0HANloDeVgo+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQheob28; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e98087e32so2411038e87.2;
        Fri, 05 Jul 2024 17:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720227092; x=1720831892; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7KFeV49gmhlyGls5y/8NCSbJCJFVQwXPZ0jtKuYPY8=;
        b=kQheob28w2XdTnRUXLlyAuMkXW2KaJfLDOQjtrH/BwqTj08xH2mFwZU7Tnc3Axnwya
         1yJ4KJW0snLpU9eyAe5eCuA6qqj2f8NeTPBwxU5wpMcxIlI2H1vtcofZJ/b4D+tnqcO0
         g0BPSyZPWGcniab8jTCshiYAp7xsYdmf+8OkH2rNeIIYZoA6GjiHnX6XlQ8tasMP6xCr
         34/wVr67DPTrdWHnB5Dqnp+JyyFyzWgAMAN3GJhfe/Vi8Dp+338mHaVk7ISurqyEIz67
         I7OPt+u/yeonA+61TW6LGmrRz+abaAR0EMsFjQRFT9dJJtv2vIUc3cRDZWrCniHj9CWV
         bgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720227092; x=1720831892;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7KFeV49gmhlyGls5y/8NCSbJCJFVQwXPZ0jtKuYPY8=;
        b=cPTnCkQPL5QEGwKgDfpMOrSRtAvTJN1U8Tk1/KA7geO3O7W46obr8UKLQSa5BWyL9F
         D+vNljWr+kL7tp6ykzhp0zf/75mDt5QkCnosuPN7zu4bMGRXtTrTtmqVAS3oEVqqyj++
         uXOiGxwktJMNUxwqoqzQ4KbIRGU2p/mtagMWr1t1e7YGIJbMmojPAbS6SN0uVmhCx/fY
         S2hjxXRxF9woq2WLiBy4hp36nvVm0t2jTXQHkAJ/7PA1MdVvx2iCE4yteQ1+ULLDRb0W
         dRm1GiG+42ZeElu8Uy+RGZ9eZQ9VcaMeufrOp0FoAzHpsbX+C34vA1smjVu9hRuimu0T
         ahsA==
X-Forwarded-Encrypted: i=1; AJvYcCUZgo1bHTSGH5vnPHcDk3t9zcjQncrHNXO1GdMtRzbTDApFxJRGnP5hJZtZ0MP2yLc29j/UETOtDMu+w0uKRYUHnTg7mdnVoq7XBk7c1O9/2Jx5VoBnbP0jOkgkmId9LnC4+NkS3XUJ6IZb
X-Gm-Message-State: AOJu0YxiILJqVrDgGGUa2E2VcW1vv7TWJtsOvJhTTMaZ9DN6D1ZjQfRO
	Ws3P3JNzxd7fKP0uGV01For/FAEAy55qREqFUuAs12ZK2WW1oAFp
X-Google-Smtp-Source: AGHT+IFRGqvMJ701guC7GxeWtW133Kfp9+soZJ2E5pFnQJRh8x6ffl0U4YWIQ7uCNGz8QcE+i4Af3w==
X-Received: by 2002:ac2:5eda:0:b0:52c:9e51:c3f with SMTP id 2adb3069b0e04-52ea06b85a9mr3857483e87.42.1720227091959;
        Fri, 05 Jul 2024 17:51:31 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77df94db65sm33206366b.140.2024.07.05.17.51.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jul 2024 17:51:31 -0700 (PDT)
Date: Sat, 6 Jul 2024 00:51:30 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 1/3] mm: use zonelist_zone() to get zone
Message-ID: <20240706005130.fvxwrv7joshnkhej@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20240702234008.19101-1-richard.weiyang@gmail.com>
 <30bc19a0-4cd3-420e-92a9-7b3c97d6ad2c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30bc19a0-4cd3-420e-92a9-7b3c97d6ad2c@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Fri, Jul 05, 2024 at 11:03:03AM +0200, David Hildenbrand wrote:
>On 03.07.24 01:40, Wei Yang wrote:
>> Instead of accessing zoneref->zone directly, use zonelist_zone() like
>> other places for consistency.
>> 
>> No functional change.
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> CC: Mike Rapoport (IBM) <rppt@kernel.org>
>> ---
>>   include/linux/mmzone.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
>> index cb7f265c2b96..a34a74f5b113 100644
>> --- a/include/linux/mmzone.h
>> +++ b/include/linux/mmzone.h
>> @@ -1690,7 +1690,7 @@ static inline struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
>>   			zone = zonelist_zone(z))
>>   #define for_next_zone_zonelist_nodemask(zone, z, highidx, nodemask) \
>> -	for (zone = z->zone;	\
>> +	for (zone = zonelist_zone(z);	\
>>   		zone;							\
>>   		z = next_zones_zonelist(++z, highidx, nodemask),	\
>>   			zone = zonelist_zone(z))
>
>Should we do the same in movable_only_nodes as well to be consistent in that
>file?
>

Agree, thanks

>-- 
>Cheers,
>
>David / dhildenb

-- 
Wei Yang
Help you, Help me

