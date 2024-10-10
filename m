Return-Path: <linux-kbuild+bounces-4049-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 737399993AC
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 22:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0FD21C22F46
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 20:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB141E1027;
	Thu, 10 Oct 2024 20:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1CjSC7M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D813419CD1D;
	Thu, 10 Oct 2024 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728592202; cv=none; b=tdCzDaLneKE5g5Ua7oOC/38kUC01oemhghi0NxNpwPsDpu1rDjWxxNwxMoQb+/6ho4sfqr2V5x1Q6doI9x2guIdSJWX/CvS2qgCWCkOlE6C7BEeabrtNRH6gaYw1PyVmSGHALx8fOLXWWAIdsLB0S0MueubiGKUBBeWG7vRmg84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728592202; c=relaxed/simple;
	bh=2aFl6PalEYBTRKRln337Jg4gYLlMo78moiZwjzbIvcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6nkl96IdQkObJ+a213JRo++/+8VED62L/LkOy2fJ8YpXfccmAKafo4SBTAK2IdkJTSFUoU4KsFGHUc0VqNaVfJpsJQq99UF7hqr6kMC3Xzaa+SHBnP5BgQNJfHVWB84MxtIhGg8TL6HGFxlnM3BcSB2NAkUZfZ+ti90xFEe+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1CjSC7M; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e28fa2807eeso1408996276.1;
        Thu, 10 Oct 2024 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728592200; x=1729197000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnH5frAV3FKYG7CNJZqqZgrdIikXi7xYzgy+7t1l7jc=;
        b=N1CjSC7MUj6Z15tBxJi0kRFVSz/x8aQeXeinilsbePwy9NS5x3pOBnFVbKKUIFKK4X
         kqa0TATf3STMPi6uY4MYeoW7LmPCOlokN0RVp+RwURWT/20jvumq2H8TauvT533/soSk
         fhV6QnpINZcwGLryUcjmIoyKlwkGoP3cMinkaRIMqZOTmzHXn9QGaHaUFW2VvUtUmm3g
         /cp//lt1f+IZ19+MAvhGHadGAN6TOcl7GlYS4qiSmpEp/EeuMBeWrOhyzyANqBab5Gnm
         jOlgRkItMC92YU0aMWb4ehHTlMxBgAD4dY5p314RupLBaB9r5z5V1jQaG3C66U0AyDDG
         wZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728592200; x=1729197000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnH5frAV3FKYG7CNJZqqZgrdIikXi7xYzgy+7t1l7jc=;
        b=Lmye6k5SMUSb71cYsIle3AvHuL3mchL+pWWRtfwdZU9p/asnxsSnHAs3HQ75nmrFHc
         Lc7WBvuA4A8PtIJ4w4PQfYJx+XgjDpPNIIXoASxwZlIEmih/cDKdXsjKW1du6ldx0dxW
         jVSTZPgApv07u9AAtMzPrdAV4fCWFI2r2ClxCmtGPNXvTuALFp+hMDG/nDAQWUIlJ0Aa
         6m6LaEvM3hjTwm+CzLnE+msepnjy3ppQY/0g1v2FZ0xQtQUwuJ9c3WZ8aaXrOuseO4UK
         74XrTT1aUj8lDdMhe2/399F0CG4yFbGzoC78EQYECtZp4MZk+zIeW8WGF9L7M8vMFvZt
         MxHg==
X-Forwarded-Encrypted: i=1; AJvYcCV8CSV8RQClhdbLUbxBy2cGi9ymToEZQgS7Ld7V9N9Kh1nBab91v3NrTzHpHeuUcNYa81tzOqzUXxqpL9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLN8JhjWa9T0VDLSobwyySAqcDC4Y54oZlb2TnPUCOpDLTuzA9
	NvTnuLF0FBMeHl3fDF+sHvq1nz5nL2X0HaYWOjmnubKrzMRw/m4RC7KSKQ==
X-Google-Smtp-Source: AGHT+IENhI2Z+FU39xY0x0mHnDu1KOS5WsmDfABLMBlia9+dLeTnJ881c6JtjwpFa08d1wHus79iXA==
X-Received: by 2002:a05:690c:3185:b0:6dd:bcce:7cd7 with SMTP id 00721157ae682-6e347c55068mr1135747b3.42.1728592199574;
        Thu, 10 Oct 2024 13:29:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:6165:1c10:b99e:4710:9fa7:9721? ([2600:1700:6165:1c10:b99e:4710:9fa7:9721])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b612a0sm3384067b3.25.2024.10.10.13.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 13:29:59 -0700 (PDT)
Message-ID: <994efba2-2829-4874-b5fa-9f5317f6ea6b@gmail.com>
Date: Thu, 10 Oct 2024 16:29:56 -0400
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

Apologies, I was a little too quick with the send button on my previous 
email. I forgot that I also wanted to respond to this part as well.

On 9/23/24 23:46, Masahiro Yamada wrote:

> I believe the only benefit to parse 'choice' block
> is to propagate its 'depends on' down to member configs.

I am not quite sure this statement is correct. I definitely agree that 
the main reason to parse the "choice" block is to propagate the 
"depends"; however, I believe that there is also information for 
defaults as well as for prompts inside the "choice" blocks.


I made a shell script that reads all of the choice blocks in the various 
Kconfig files. I wanted to know how many of each type of information is 
in there. Here are the results:

  - select: 0
  - prompts: 152
  - defaults: 156
  - depends: 72

Also, I should note that while there are no selects inside of a choice, 
I am unaware if this will always be the case in the future.

Here is a link to the shell script that I made:

https://github.com/dshunter107/linux-tools/blob/main/check_propagation.sh

Thanks,
David Hunter

