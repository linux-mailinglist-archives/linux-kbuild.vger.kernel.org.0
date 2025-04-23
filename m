Return-Path: <linux-kbuild+bounces-6727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF40FA9858B
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Apr 2025 11:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 439331B65C30
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Apr 2025 09:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6DAA190472;
	Wed, 23 Apr 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8ygT4bg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A89925C81E;
	Wed, 23 Apr 2025 09:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745400655; cv=none; b=QfGB/2E5wioFFxY7Io5Q/7me6ifSqWoPVVyJw/F91lp2ZRIvbNfFKZILC3UEqD76SLPnHk00dvI8vJRAQB9bHJU70ZQEiNzbKPtD+tepKMZkSQ7Cy7UrBGBCTbjDMtpTXKR3/Nfnfy28PP4XGT1qxYsPZmbg6k/J8kt1QJb3d7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745400655; c=relaxed/simple;
	bh=dETYs6PNtbqc+HtknRC8dknf43oYws7PKuhbwZxPIoo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=gtc0lh1cci+ZRIaHzeDlANvaJvDEe1i5X8foDNu89ksT56jZ8hvr79DUSg06wyrLHTD0mnhQnRY/tPg9yko704lfiPq1XpOZrNk0cFRkpa2VYHc330MbJn6lQl0Ki5Lj607bzBckz3fbqqoifHD7fWV08EiS1e7wgr7sqBQPjmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8ygT4bg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2279915e06eso64075595ad.1;
        Wed, 23 Apr 2025 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745400653; x=1746005453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muxam2SUiy8I7jXTK3ORRV5V0hJy9KAAZUT8IGI2dzg=;
        b=l8ygT4bgyOH/Pbkq7haLSXy/uY31VS2VyQ7yW/zjfDn6fiddXG+gO1w0dUDis599jf
         VZEUyTmCXEmtQU00XmN5OWlGv96dqvlKQbASSoIk0bBeBvw2khDw+pk15UT8VJYqfmID
         /7Zm5QEaVdgrmtSRBEYLtRHkAiZVZaskbxhI0dBS9csCnASWvUozhfhewp+VJTliAxV4
         v7IEVeFri0aDOmpst/UyZuizBUaqoMKys9e+L/OV/bF7xmX4iEq6iiOorrzAOkiT6fl8
         r2aB9DNIhRdB8kNzuKXsyjm5hHcEupkD/esq7sD9AUfHBFG+RCBV3Fg/Fw3BQzv9o3ux
         16lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745400653; x=1746005453;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=muxam2SUiy8I7jXTK3ORRV5V0hJy9KAAZUT8IGI2dzg=;
        b=XvbZqk0+Oj8KJalRZKkwnVPvRnHzw+nX7pj4X47qCwUKhi5LeoS6Fq6Y6oGQencI0Z
         V/L1M5Y0wBVv1sR/npjYi0nddgf9bKDgEE8EbwAOsYIkz7OOTwwp2ZdAkvr9hL0C/l88
         Q5XjdVYjUv31rovg14Nb3q25uLJ4JOxZrDSdlUtTKSuLVo2xjbMmIzH8UcYNBks0A8BA
         5h7FCDigSrzLZJav+vsxbZ7XAEOZRMjVFxqHM6leQ/hhxawy8UliC1cbuyq//jbGcpEY
         UUDY1EakhgRdeHw/IHxVwALhLYbA63hu+VbEEtklUVtgjHU/VR7n0uwuCBuvJQjssuKT
         Lftw==
X-Forwarded-Encrypted: i=1; AJvYcCWQu2BdOdZiozwvRe4AkPYmtPeTEAKHA9Rb0YhkTu0scnwpRPYPzbQ5FClYaIpj7XQdBeSfjoNYERQ=@vger.kernel.org, AJvYcCWT9JxuNLEd1MxCZHtx0w6GYsKOFFuloKsVBqec6E65ACG/h4biMxJ3K0HJt3XvqL0xj1Uj25ccTQg8XPd/@vger.kernel.org, AJvYcCX5bHMFeR/+lH+SGlUzXP/IA/EFBS6aEXxspGbzGvnU0zUIi3HcZ7/B3TtdeX11sC8Y7FIs5Lwa8Y1JX7Z3@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+RvOMgcnofJlqF+Vix84cIVroMYi8MEvLQ38alRmhYc53uyS
	gh3LRCiAvQ/9mr9//4x5OpH+iZreZQToI1WKgJ/BvEMN3AU9dNUw
X-Gm-Gg: ASbGncu6fKngRrWGx6izUqZtMVlck36/8nJ6T2FgNjIyDd05CN6DHCh/tQtLg5WJHLx
	Qqka0EmlWFlsypzkYdnlZ1NTqSg5UA/bij8I8qm0qvfz8pcKgSz8bNSkiclsTFE3/xsyqC0/qxs
	lI6196JOoHB7Mi4Y4nNQokP0Wb5dzmIuCwZZ6nvD5RoHXqhXNk5ZFglQ/3URBh3HMDiNgrC07/b
	XZBDFggFHYlCefl1HdPrKr+ajD6f+GA4COK55/vvvoq28tjaZlPaKVQB/xmYG8emLhR6qdOI8B+
	3zPtzUsATaWAJpcOqz55+4uvz0SmQyPcmkAbcOTEjhIgiOoD0hK94/aqWHQ+JME52LfTeqrwpgX
	uy8oZMeXk9fM=
X-Google-Smtp-Source: AGHT+IG88n4B+Zz7jvsF/amnEc51F/XmSyRSZhLIy5SSMySrK3N+aaQMKVm7LW4VWbvpbZndJX7ocw==
X-Received: by 2002:a17:903:98c:b0:224:1780:c1ec with SMTP id d9443c01a7336-22c5360dc12mr325231335ad.35.1745400653408;
        Wed, 23 Apr 2025 02:30:53 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb64fbsm99667675ad.158.2025.04.23.02.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:30:52 -0700 (PDT)
Message-ID: <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
Date: Wed, 23 Apr 2025 18:30:48 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: andriy.shevchenko@intel.com
Cc: airlied@gmail.com, corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 masahiroy@kernel.org, mchehab+huawei@kernel.org, mripard@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:
> On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:
[...]

>> > Would it be possible to properly support O= and create pyc / pycache
>> > inside the object/output dir?
>> 
>> I have to confess, I've been wondering if we should be treating the .pyc
>> files like we treat .o files or other intermediate products.  Rather
>> than trying to avoid their creation entirely, perhaps we should just be
>> sure they end up in the right place and are properly cleaned up...?
>> 
>> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
>> should do the trick?
> 
> It's not so easy. The Python is written in a way that it thinks it will never
> runs object files separately from the source. Hence that variable sets only
> the folder per script as _home_ for the cache. It's completely unusable. They
> took it wrong. It still can be _painfully_ used, but it will make Makefiles
> uglier.

But, PYTHONPYCACHEPREFIX can be set as an environment variable.

For example, try:

    export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"

Wouldn't it be good enough for you?

Regards,
Akira


