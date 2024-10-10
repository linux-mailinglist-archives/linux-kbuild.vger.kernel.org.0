Return-Path: <linux-kbuild+bounces-4047-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C471599934E
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 22:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D97A281769
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 20:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28531CDFD1;
	Thu, 10 Oct 2024 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVkI+1A4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325731B6539;
	Thu, 10 Oct 2024 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728590777; cv=none; b=Xk1LRHSgrDUfqmz5xUu1tNyHS/RJ7U2V32uBPoLzqyPWnm2UX2srAb2zE59U9pExmm4Jeup/qN4b46ZE7V2aLRp9afztpNGODUJdMvr5TrYy2e9xRpPOZvm12xUFGP+gq+8zXyOS9mAwljeHBnj/X0FNAd1vNdJ6q8Z7nkxRExw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728590777; c=relaxed/simple;
	bh=NzCpZm8/mEuC6Rq3qXHG9eoMATiEF1drnN/nAnqXnv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZT8xIVDhXdr+ZI+rdRlOOMAutEAB1YpyNzLaz1+Jgq2XV5G6VogBsgnraETD9WCmAJylEtxzlpshgzpjgSLnwngkWo32t2aPf65H1gW4GCKq95nJNkaFQfgxdWBfP9dne7f5ySEHRAYiVTHMqFm1WKVM41jCWuu7TEFv/8iRpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVkI+1A4; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e2e41bd08bso16180907b3.2;
        Thu, 10 Oct 2024 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728590775; x=1729195575; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QCJw2Q36leTBqr9TQNzAFnVCjMfNwHV5BxGjqHBBZ+g=;
        b=CVkI+1A49yC8IyZVo+BOJlvBBxP2Adcfy9qcU2gzPyp2mnkr015cYXorVsEI1Uz0+R
         p7oBKHPJepd9sK3EYu4ueFO1g9Dp7n3iDV+9sloCMMYCrCdOIJ0+eP8Et+AkPuFwJNKO
         I7EOQhDpTFERvnsCoWIop4KmqvOir7dkPuiIjDq3KqpSqZA8D0edc7jVBPFA46AfUZm8
         9XOnqy8awVHi9/Ep78QMWKaO6RGs0cd5txM/izCJaORa34nZ+ALw0SRssA9V9pcRjQrk
         Tozsk2NUhpJRlxbYLapU/ig2fakQJlVt0+ggyg0umhjRSWDWDYXUaZhB8CG1msU1IY7b
         uohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728590775; x=1729195575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCJw2Q36leTBqr9TQNzAFnVCjMfNwHV5BxGjqHBBZ+g=;
        b=N46j4eZ+HuKhiO/aWr7YYfx6K2KGnkEv2yiJXWtnhzFs6ZTLdPNeKKbAZRgLufEVi/
         k//A6HjDx0hpxrPjJRMDz0JPyWjSZ4UxGhfHlplAycQ+KEPFNX7L6Gyw6Wk55ttC+NaI
         xTvtt8U13jnz+2+CwV62Tc/pRPS0VqcbIxq8GptjFym7Z1Nc3gzgaUe3O2XmzhgknGRP
         iDNwIr6jWkYq1a/NtO9wJ5HqorCOeT5dZQnQsnP5OSdGB4bfyvotLLArNs8+/BlMi8MM
         IBm3e8gjC8X9Mf9uNlGlO6HwfOh3H0u5KTX+8pJ+41EVEy86aNF1GMIqDu8Y7LGJS3w0
         zkLw==
X-Forwarded-Encrypted: i=1; AJvYcCWMYHPFF/B5Ijn8FqUEYh8DuiZ5bTxuMsGx77tmCkaAjS09MrQLC28htLIlLl7+/thteCSLC8dZ0Weg5Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywxwhZJFMSheVdjRiJG7xNKOhXcsfhRmyf4T/Dyyn39sflSI98
	QIXhBpm9nKT4zTO8w68zlFPGcnhpKOOc/hO9y1fdIOj0OdeekpPjYnCEUg==
X-Google-Smtp-Source: AGHT+IF0whqmEoxPIlb0uKeib7Itmz63HnvLzOTnokKadAu7f0WJBQ6tWnjmptJ3gvmvS7hZ3UrB+g==
X-Received: by 2002:a05:690c:250e:b0:6e2:12e5:35b4 with SMTP id 00721157ae682-6e3471e8d16mr1444227b3.0.1728590775127;
        Thu, 10 Oct 2024 13:06:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:6165:1c10:b99e:4710:9fa7:9721? ([2600:1700:6165:1c10:b99e:4710:9fa7:9721])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332c27a49sm3310677b3.88.2024.10.10.13.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 13:06:14 -0700 (PDT)
Message-ID: <dd2d6338-b763-48ad-be9c-aed7107b201d@gmail.com>
Date: Thu, 10 Oct 2024 16:06:11 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] linux-kbuild: fix: implement choice for kconfigs
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-6-david.hunter.linux@gmail.com>
 <CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vCZZN=g@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNAQ8D4OVT81iTVs8jjrBXX6Zgwc+VJ_vb7hb4J-vCZZN=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/24 23:46, Masahiro Yamada wrote:
> 
> This is ugly.
> Please do not use the temp file.
> 


Understood. I found a way to do it that is much more in line with the 
style of the script and it avoids using the temp file. Oddly enough it 
involves changing less lines of code as well. I will be submitting the 
changes soon. Right now, I am just finishing up the change logs for all 
the patches.

My question here is "Is there a general rule as to why the first version 
was bad?" For example, is it considered bad practice to make temporary 
files?

Thanks,
David Hunter

