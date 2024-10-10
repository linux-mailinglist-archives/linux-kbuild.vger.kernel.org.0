Return-Path: <linux-kbuild+bounces-4046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C7741999307
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 21:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C9C81F29C65
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 19:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0BA1DF971;
	Thu, 10 Oct 2024 19:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQfsImR2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E66D1D0F52;
	Thu, 10 Oct 2024 19:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728589571; cv=none; b=bOhThPzLDvqkhJpi7EWE0nGUmNf4jNYobAhu7mA1rncbqsxfjIynHfEOzgZQY5aTdusFcghMLJJf6k4bevAaPO72RVFc7FgFkS/Chy4NMJl+LzZwfRf5EpIvKn9N4Dl9DBGUz+CQI297uBZg/0PhUXW1twVw/urXc49u3qmuqTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728589571; c=relaxed/simple;
	bh=cx1f9NXqVUl9a4H+a3hZwWW33V++ZZRJYZrepU+A8sI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UVmkMLLUGcsb2BVbpskwiQ2OmBdNG5D5plsuTeqdaZR9BZYFmolIwW8E+NdCE+IkJ+XNTkVCiZuIInMvD65kRAgiL1w/CxGJk/vrx7CvJ7fgB9cdRuMspHNEBL2g+ljF3IWvOwkBvMdeNKTcmRY1rrQQhSgyD/wB+7bGmK7YvrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQfsImR2; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso1057444276.0;
        Thu, 10 Oct 2024 12:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728589569; x=1729194369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8ceetd9EHB2ozXPX4nSAT2IgLXTt5wasr5869UPauE=;
        b=eQfsImR2QlZpNWGdB3AgoaUwU/ZfBaZvFscJcMNc0lVrNi3IQ69zBtQVY0iN5VkToS
         vAkayMvY31M5Ep33GIu1BKDyjpmooAdn8CjjMy5ZoFQcbaf/b1mBwQ/PHOXrpLoBYHz5
         Lgkk1SMfdqwpY7sLGFtM6viLPJGMRZGjJPnA3Ab/H4rjTmsT6n/7b6enuqntbBp+3oJF
         m4Qzxj20phmQED357IyNr9QDcw/EnE3ye/CWktKSUhg18SDhq1my7ljONyjVAve65WyC
         6T6iNTP7hCUf8Z7EIVnG8Q3DY8E1VZRYk8XdCD3C1WO/3qWcP5X/D/r78ngDseIVnChe
         DdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589569; x=1729194369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8ceetd9EHB2ozXPX4nSAT2IgLXTt5wasr5869UPauE=;
        b=tPE5CuQA3UuiTDS6iW418/uzOlVbFW6+RDwA8W+yIZwZ8Tp9/8J012sFx8PmjY82oH
         UF82wh1cMTKHiMb+I3UxNH7vWv+lGHnQoIN+Psk1zBUIAt688shv1jV+sXA3bsh/6SPE
         1pJUdmQ/Dag+Vvd9Fo+r7vBQFI/F8jfPInhY2nNuPiAluaugpBfvR9qkrB4y51SgkBvE
         Me2aDofDd8EdKsHS2DTPmfVosVvhnAo21ARxvtfxUky8fq13oS40QZQf3EsYPQQBIRY6
         0o3VjM0MeR89xpLyMI2EvkBNYTAtRCGKDhZd9SdDTXNl9/b/rIfsFveOGkPmzZ6F5Cwb
         esaA==
X-Forwarded-Encrypted: i=1; AJvYcCVBmm7efi7pTIUqNzh3POJAVTlJCq6Z/VLxfWg2vCmE6JQp7B9QGXyz/ZcVCTWxp+J/YZFaeouoYW5M6kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHhulMuZLpuQs45zANoTWSHUpDCHv1CUh8TP4M9Fopwbz6wuF
	FxKg/ASOI6lEFccR/NDz2vAZ+bvV15wEMJY7xHYjLiBAPH0JEs46
X-Google-Smtp-Source: AGHT+IGYWaIP/yEuiZZIEKVmI//Ve7Q1BZFf5S/eJRmjNH8tbH0V/MHZQAdPvOrRhV3y0mU2olu5gw==
X-Received: by 2002:a05:6902:248c:b0:e28:e9bf:797c with SMTP id 3f1490d57ef6-e2919d5e33dmr101274276.3.1728589569155;
        Thu, 10 Oct 2024 12:46:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:6165:1c10:b99e:4710:9fa7:9721? ([2600:1700:6165:1c10:b99e:4710:9fa7:9721])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef19cacsm433006276.38.2024.10.10.12.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 12:46:08 -0700 (PDT)
Message-ID: <709f5217-b04a-45de-b9a1-373196e5a47d@gmail.com>
Date: Thu, 10 Oct 2024 15:46:05 -0400
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] linux-kbuild: fix: config option can be bool
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 shuah@kernel.org, javier.carrasco.cruz@gmail.com
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
 <20240913171205.22126-2-david.hunter.linux@gmail.com>
 <CAK7LNATkjh8LR58+SZPw44ezbRj6-aisQ9nsUoTY_6yVf+t3Mg@mail.gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <CAK7LNATkjh8LR58+SZPw44ezbRj6-aisQ9nsUoTY_6yVf+t3Mg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/23/24 22:55, Masahiro Yamada wrote:
> 
> I do not see an immediate benefit from this patch.
> 
> 
> 
> Boolean CONFIG options are skipped due to the following code:
> 
> if (defined($orig_configs{$config}) && $orig_configs{$config} ne "m") {
>      next forloop;
> }
> 
> 
> So, I do not understand why this patch is necessary
> until I see 7/7.
> 

Thank you for the feedback. I have been working on the second version 
for all of the patches, and I will resend the series patch soon. In the 
meantime, I have a few things I need cleared up, so I will reply to each 
email where appropriate.

For this email, I was a bit unsure of what my takeaway should be from 
this message. Are you saying one of the following:

1) The patch should be resent, but resent after the patch that is 
currently 7/7
2) The patch should be combined with the patch that is currently 7/7
3) The patch message should be improved so that people can see the need 
for the patch

As of now, my version 2 will be made with option 1, the patch will be 
after the current 7/7. If you had something different in mind, let me 
know. I would be happy to change it as needed.

Thanks,
David Hunter

