Return-Path: <linux-kbuild+bounces-3860-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A5898BF8F
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 16:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26319B21D91
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 14:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C7F1CBEA5;
	Tue,  1 Oct 2024 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K7L6oZi8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AEE1CBE93
	for <linux-kbuild@vger.kernel.org>; Tue,  1 Oct 2024 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792030; cv=none; b=aVhwRd7wmYLX6G7sWYuEGRCqAtKxeUYi7XcqLMuxhPV9FIvdxzHEKm6fkk0EQIHFzc7ax7KuumCoy1iwRrn54hHySobVkEuqd9DrQDlH23LxjCWqvlXsTQ9qBkbKYaAkURCiOHKrubwY1Pk6r201BgzF1k8jxopAnirLnRoUk2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792030; c=relaxed/simple;
	bh=XY8ZzKIJln9Dg1OjlPScukFH2zoKtdG7bx31O314oeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s30mnGYR8qG5lX95f7obzh2pmtUeS+ajd09yjgTRTSY8LGhnAvIYTIT1bHNSy/+pBTxYUacdbcew3q423cr/w4Osw/4VpX87xTGqi7+7jk48X3nJmk5wJS23CFiPOKGs2UfkY5i/hbMOFiHWlTTL/cC2Pl6/4N1TB+GTXs9xR9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K7L6oZi8; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a90349aa7e5so823176366b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Oct 2024 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727792027; x=1728396827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+AC5fWKlNBJp4jGjiPsZYEshdzlIiLPjFPjK9CcGHI=;
        b=K7L6oZi8YcQaPPad6xbRrBDnQMa/yKSNzLRIcvvbA6oihyQUml/SZtnb/JYcVn42ci
         eTKcWXPIXY1lh1OAGEIz0ufJRyXjNMIBrJERtcVEgjvZk5RxJf7OEnnrSxbf0UeySJtW
         8sdk/Rtrayr8C4I/NGu/houIg5F+GFQBvTF4xFgVqEY96y3iWyP9bklrYRflo4ER1mDx
         xDQN12nbWlyLK/yVklRb9XliU8UERQ/cNstNz7jaidGEVYBPw1cHP6bZ2onYWTC2lowB
         WzVPtkNWwUQX+ZF1rLy6K2d8S/opJea0U/jcRF11mQmsNzkYSCAQ0gQ48sGqtgnN2NRx
         MW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792027; x=1728396827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+AC5fWKlNBJp4jGjiPsZYEshdzlIiLPjFPjK9CcGHI=;
        b=xO59DxtcJNagoTOW/RjT+Uprco2dKXDqskYkz8K6nDJtxBR72ykr8rkbE3QnfdZ3x3
         uQdrtdPL99sP6cXrQQGsvtAWn7NZpMfuZiqNEQnPi/cn/1QmvTomT+6eu8IzVk6e+sqj
         EzBiFBlTJtoQ7Zn3wJlvbcQfWbLVsjInmW/aq+wGUVlIUCR0aGCQCZoMKQGOvrAbrB7z
         UvczWpYWwm0X/orzYd8NSMAByQrt288Z+K54pKBE3PmYyqSfH0peVJmmaMr9c0gK90RR
         iDZpqqypP0olYZ+vlKvQgdZjlwfeZ3toySCRDfmpCAnUd7kptk101oiynv89xxYh6V65
         QHlA==
X-Forwarded-Encrypted: i=1; AJvYcCVmdVI4QaCM0CpE88XVBLvUbpCORIcDesBhf9g+9anGwgELAfUxsp85n5LBp8EteokfDQqdUM6FO3KOLgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnNm+CWIAYBA7I+oxX3UIWxaXOLffhfuu4pDj6KJbQ0lHiM3Uo
	DrK6Q6J6ouWwGyYftDCmFyxgFEA/h3HNNSwE7XZ3lYkCXtk2EdzUwhRxjNoSvag=
X-Google-Smtp-Source: AGHT+IEMZmc8txKJvmq0HUIkU/EyEg0oAsdYMXagzUOgzgVDeHf+VoEn9MCuGw/Fb5bAjra+vroY0Q==
X-Received: by 2002:a17:907:6e92:b0:a93:c2b0:f965 with SMTP id a640c23a62f3a-a93c4ab2afamr1666487066b.41.1727792026569;
        Tue, 01 Oct 2024 07:13:46 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm721237366b.8.2024.10.01.07.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:13:46 -0700 (PDT)
Message-ID: <e39f5979-50a4-4897-8199-1672ae7b8c06@suse.com>
Date: Tue, 1 Oct 2024 16:13:45 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] gendwarfksyms: Expand array_type
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-31-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-31-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Add support for expanding DW_TAG_array_type, and the subrange type
> indicating array size.
> 
> Example source code:
> 
>   const char *s[34];
> 
> Output with --dump-dies:
> 
>   variable array_type[34] {
>     pointer_type {
>       const_type {
>         base_type char byte_size(1) encoding(6)
>       }
>     } byte_size(8)
>   }
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr

