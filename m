Return-Path: <linux-kbuild+bounces-4895-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBBC9DA875
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 14:27:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9932823CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 13:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9AC1FAC29;
	Wed, 27 Nov 2024 13:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0PsAX0Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62A1FCD18;
	Wed, 27 Nov 2024 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732714021; cv=none; b=eTEOsTVDcT4BaYnESJ5g/mA5U6WP8KGhOZxPcZ4Y5nC+dNf3AToN2TRc0p7jSjNstNEllQGce5Dw8x0zcNjq/HVhN3grbEthgeBRnA2ykQCyLpuhywVpOThqwPC5UG5Si52MWaLZKJKuW+E0a7Z9GPkP3/YUZyBwwzxUuLbGU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732714021; c=relaxed/simple;
	bh=uaCiDCXuWzRxHU/92iiKkygk/Ft9kvQnq4yPLx94xjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BaDxyIJazdy1aoJKgNrX3ITwCkRyC8RHUh4EG320IqEFbFGqlo/kQHx8lfSYjfi2AwsR7lek4h6HH5fjYWqmsN+isCqspuMuO3P9XfXrnDDSzMy7GQ8cs7r7/NQ0cus6n15gSjaeq2iLpPVl9YtgHsL5ffJ2Xa7LIns8rdb9ar0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0PsAX0Z; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4aefdbf8134so1422633137.2;
        Wed, 27 Nov 2024 05:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732714019; x=1733318819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOiOJ6+Vu6oJDu2ObyW5Mt7Xes58O5evw8O4KBY+L+Y=;
        b=M0PsAX0Z8hRmqpup+VoLqzSEEteEimh5wO+A8Drf6scjR2AJmaePCk97/OwAkgZRjs
         v8n4yvn0M2vsbxYs6Hq9DA5qy7i0bWrvkQJKimu5a8bHQonMPGQPpLaD/NVsk300BrYM
         gnfxTCuhf/n05Ni3CvWxRIJalAiu+nK1oprqfElqyCbhQ1Br7HaNU1H2Ta2f92ANMOpW
         pJLOBTl05ssUhqaugJ9ZriLD1sHvN+DV3YTb+etXb6ogbyGqXQFE+SxvKhzHoR76WQPE
         /9G51YdNnQTO5IP23fbeGMfIx7E3dgg/beL9LA4UzR+0uSI7rWFSJ71h/71nsfY3ySsL
         8+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732714019; x=1733318819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOiOJ6+Vu6oJDu2ObyW5Mt7Xes58O5evw8O4KBY+L+Y=;
        b=h4lcM05m3gaqBnVOjgL+d4TwQINOIb8n8fiHfByVnoIlIfHnZ9Lk4WlUSCW0R/67p4
         QEQ/Ps+bdaiS09Lzn8+n/K81LUfWwnwLs3wS9T9UVDzUNbTzWD1SfFJVWHAddSfuuhVb
         HTSSBR3KD8/R5oFmh1+zkWK9H8CvnrHxyIQIp/Ye32oxtBzlVgnZn88VI5GICyCu3NLp
         VfTo8/y1oMcfHITDb8j5OJE++uTZ7lkrT/GJWfYM8oxGNx1jkUbWaOrs+HBhQCFWfcjm
         R1QKDtfArHDCFzzIV+uHJOPrQRTVKHu1G2zErvpzVzBVZRJWm5+5W3F2wE1jhjpE3xX1
         weJg==
X-Forwarded-Encrypted: i=1; AJvYcCWvcn9w1OfWO4QETKNzxAcShMxjc8uxK5T49/PUzGHMi6eX9C5gJT55zgsbqhtoYlQ91AOR37Ov+L2SM1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PfxNlEWAP617WqerUtoqMW59GuTes9sAHv0+JS14LgOyXWJu
	PSRoRuyW7rcVjLT6dgiJ+8fN7ifwQoF+1bdCCMwYiiIH5cJl25Ww
X-Gm-Gg: ASbGncuImSnBSpFQ/DLSvDmUCZFCSOVAQGfzqOmGD80kSTR21VJUaqqhkD9KSR70Gjk
	shmKx5XW+F9fe4w923Yc+2L+8go/bsuPjxMcLx2CoR2unZIVEmPDdqNgErxcjAgKqEM5SD/hW9l
	ZoIqr5FMdPwIXjvAJK3MEeCAm4cw6Vg6dH8aXUYkCBrmoZQjEZwbxhp/HGn6D32Vz2cjay+e2Mp
	8eEqza5NRAP2uqKziofe1DqF7DdE7cnsz1NU0tgU6UFu5m2XbJvGnZfyOm6yNCyAfyjEYivLYzX
	NEG+wai6DzHhkpOATgKQfagH1zu+7L1gBISPkms=
X-Google-Smtp-Source: AGHT+IGSGm6WE0IC/9CAvd5/e4c2BcSs4ujLES12ykfA/Ho+ScWSgImvHrgtxD/oipWTcAMOUv0oFg==
X-Received: by 2002:a05:6102:26d5:b0:4af:4101:fd53 with SMTP id ada2fe7eead31-4af44984beamr3817306137.22.1732714019193;
        Wed, 27 Nov 2024 05:26:59 -0800 (PST)
Received: from [192.168.1.145] (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af35905181sm748652137.31.2024.11.27.05.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 05:26:58 -0800 (PST)
Message-ID: <20725773-8456-448f-a91e-f926d94bcb63@gmail.com>
Date: Wed, 27 Nov 2024 08:26:55 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] streamline_config.pl: check prompt for bool
 options
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com,
 Steven Rostedt <rostedt@goodmis.org>, david.hunter.linux@gmail.com
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
 <20241014141345.5680-8-david.hunter.linux@gmail.com>
 <CAK7LNASqqbNX652UdyO_MeLmcxsno-zHykeO1ff0rES=_PAOqw@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNASqqbNX652UdyO_MeLmcxsno-zHykeO1ff0rES=_PAOqw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> As I reviewed in v1, this patch depends on 6/7.

Hello,

I am a little confused by this part. I originally understood this to say 
that I should put it after the 6/7 patch because it depends on it. 
Should I have combined the two patches into one?

Sorry for not understanding.

