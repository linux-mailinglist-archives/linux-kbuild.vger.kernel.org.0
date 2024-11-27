Return-Path: <linux-kbuild+bounces-4894-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC609DA859
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 14:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9451623E9
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 13:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B119B1FCD1A;
	Wed, 27 Nov 2024 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZSFlWUI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32D1FC119;
	Wed, 27 Nov 2024 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732713492; cv=none; b=RIeqXfEzKw5oV6GMbTft7fW4+aoxilFmobQYGzEZULjhheYjLc1Odr6zAPyVuswwLWcE/gtdCm+LBrV2QhA7vISiW2YC/0nST1ZMgz8QmosZSa4y0bU9RRCghCjq0Vb7HOtUSVsrpILBiqDpaXtyIt+CaiULuE3bx79sMsfoGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732713492; c=relaxed/simple;
	bh=i0TQGAHi6uYX4HxoRa3zUstErM9WDdUW2RSIM/o3Xs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSBcQRGUHred/osS78Eax+zx/NJpFK3Y5Czd8NegfDqY0jkaDKtrW+yj0uEmueHwZy38gtgf3405VAHdUB98UOtnIl/EqSi8pniI5KrhrgmHXDS/Tn/ouEVPIznT6LAoSazYu2955A6MuN4dMMrtQuAXb4v+fRWk+skC0TFxfdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZSFlWUI; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5154fab9889so413450e0c.0;
        Wed, 27 Nov 2024 05:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732713490; x=1733318290; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3EMmZPv4ipiCAMOYRilXOFtwDUZhRsTLrhd6cKnwqMA=;
        b=MZSFlWUIDWw2n1LbmCO9R0+SGcrp7YlAo/0Zpitm2fZG9OnphY/NdUyCBm7U0Rd+0d
         6MfK0LJwanF2yCdsaRl1emOPe3yqD3P1b1uF8VHjssdako4XqdoskotscGnmNLxsnZ28
         b1P5pgNVojv+bw9qFJUEqa8ENYT5Ze3dl7okoa4o/vyd//Hrw9vwz+YiMP0NKlJdtwwM
         FrGa6EAkqa6u9c9X9+0ik0sgT1qEQq1rRRAMS2lLApcaODPrDicwcXBJU66rAqB6WZxZ
         WgK16m43U1RVIWzkhLhkHgEBU+D5Vdun4WN+CijMxVv3xkkY5Vl/VkK7eiEAocd/iw02
         RsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732713490; x=1733318290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3EMmZPv4ipiCAMOYRilXOFtwDUZhRsTLrhd6cKnwqMA=;
        b=VubvfXQSGmcEz8/sVjUuachZ1yjcgssH7D+sK0ZySXt/Xel/itdRC6p25Vyzc6czui
         /fZQkA8Fy2wYBr2JV11qgpqtjqhb4a1kSMcKo5eirfX+EyFp4jYq7om/4cJFk0Ers9DD
         gox+NI0J8xTfJn03UEOVVwN5QiZQOBF0hJlgoBGIYHRe0OgJxY3awyMIzeYjTfuMroVy
         C70//06LUju1DM/R5vEPbkDesaQIKBHCod1PQ0jXgD/prQUnR36NdRDmgPVZpATMyL/u
         QRQ0g9bGqbx2OvldKqS/7Ol/tQzoflMFYVctOECxpDo408sQlzdEE8xz+B+SMTf/+okJ
         AJxA==
X-Forwarded-Encrypted: i=1; AJvYcCWV034JsS7UvvZRQJLAsE88muLJSqf8C/uPIzUtHpctTHGLNCcLwMW4tp5yculM42u66J6ze9MB400opY0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzugf88PkYNpCwQoAecmNG9+O/haCmHMrHG4OBqqDUPmLqVoRv
	DO4Xbvq2eIzDbCcHmoCqrnWTsSD5putWjRw2bVD8D0vhcAuzGTuL
X-Gm-Gg: ASbGncs5uScUXk+vhQmCAGTHJpfqfUjLQClGnIs5U5WBD189u3Rs9B2D0mQPEn2ghzR
	N7ocLD13/8PG1IIOlPLFkEbLpXDD2dOJORPA7VMNizYPUzqaesxI8CoxeO8jxkxg54IXC3WdSu4
	nzBYzkJUA2u04kUvAm3Xoro+3Ka6qA7lSBFR1mq9lC4dJlPRcPC486uliy5FLc4ba+MuyPv+f9M
	3mJHD83IqMy2TzRF0q19ImDGcqXc8TgNrKP43un0GavhJqYsL8pWpLxVlyYRD4TUQLBgDM2N3gT
	ZmP+Utyxst8AQ0L/ng5s9RyVzCbT0zIxBA72bP8=
X-Google-Smtp-Source: AGHT+IFcuvzq8pRpuA23JDCL1/XjslFt5AKvwpMZNpXtw4Cpy024+w/ZM79+cagxl2QLc7Bt8qe9sg==
X-Received: by 2002:a05:6122:1d12:b0:50d:3ec1:1537 with SMTP id 71dfb90a1353d-515568dd0b5mr3415597e0c.1.1732713489949;
        Wed, 27 Nov 2024 05:18:09 -0800 (PST)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51544450691sm425503e0c.5.2024.11.27.05.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 05:18:08 -0800 (PST)
Message-ID: <fe9de0fe-b069-49b8-b7a3-cfb81c82199a@gmail.com>
Date: Wed, 27 Nov 2024 08:18:05 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] streamline_config.pl: fix: implement choice for
 kconfigs
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com,
 Steven Rostedt <rostedt@goodmis.org>
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
 <20241014141345.5680-6-david.hunter.linux@gmail.com>
 <CAK7LNAQmV=CGzEyJtBRSfz+YW6yTfWza7mf1dPXEiaJDT7z5xQ@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNAQmV=CGzEyJtBRSfz+YW6yTfWza7mf1dPXEiaJDT7z5xQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/24 18:33, Masahiro Yamada wrote:
> I previously suggested checking how the 'if' statement is handled.
> https://lore.kernel.org/lkml/CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vCZZN=g@mail.gmail.com/
> 
I think I understand now what you were saying. I misunderstood what you 
were saying because I thought that you were saying that the "if" blocks 
were not implemented.

To paraphrase, I believe that you are saying that the "choice" blocks 
should have a similar style to the "if" blocks.

I will take a look at the patch that you sent and figure out how it 
would work. I would like some clarification on the information in the 
choice blocks that are not "depends." Should those also have the same 
style as the "if" block?

I am not sure if you saw this email:
https://lore.kernel.org/all/994efba2-2829-4874-b5fa-9f5317f6ea6b@gmail.com/

There are lots of information, specifically "prompts" and "defaults" 
that are distributed to each of the config options in the "choice" blocks.

> 
> BTW, 'menu' also can have 'depends on'.
> 
> 
> menu "menu"
>           depends on FOO
> config A
>             bool "A"
> config B
>             bool "B"
> endmenu
> 
> 
> This is not implemented, either.
> 
> I am not sure how much effort should be invested in this script, though.
> 
> 
I will look into distributing the "menu" information.

