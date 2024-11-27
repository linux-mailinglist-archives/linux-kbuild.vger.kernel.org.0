Return-Path: <linux-kbuild+bounces-4901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3929DAFB6
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Nov 2024 00:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF234280EF1
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 23:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0B6203707;
	Wed, 27 Nov 2024 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhvYs/kp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547BB202F71;
	Wed, 27 Nov 2024 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732748757; cv=none; b=scLcOVsWEyfrZ2V5Tp6gXMFFSqA+s6lXllSd/vgahM+dwWKnToAZWnBhUpeMasNN0k5z5X1W0PE90CZcqkdqY5hl7vNZ5ZdhY+25GQ4qAj9NddeaZjPiJVoSsC/BuKymRvr+lcMGVFaLxTq137nwO9WMQ9S9Knp98Us3U9FPRsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732748757; c=relaxed/simple;
	bh=IBnHTnLx6R19BBp5cLxEEfXX31iIfTAv66qH7GUA7RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBFWD6VGv6zcwmeU/xsze/I5vFW9TxspfgQsK5x99S+b62fbkAzVlop6JSf5enz23uNMf6jc3J4coALqbRexhIRFVRkPsZJcbJJPwJ//RIqehism3LZ//CX34os43fM5arzzXIHjh1FjNvnWAz7SEM3j0B6Bm326Ea56zvxGlGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhvYs/kp; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4af58808485so20908137.3;
        Wed, 27 Nov 2024 15:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732748754; x=1733353554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LD0NsE8cueBmHLv9nYIGrdVGIuuAR+96OlYlJUtBTGw=;
        b=PhvYs/kpnIzxr1GWXJPZiegqcCrhlT47yRbEnh5PAYoS9L3VUgvx5CbF7XoVY33hU1
         rNO+Q5N2NaYmiIQh2o9iR+Sia4HVOBiJgffAqIlFvWIhg2scMn5E9+3z5Uh2VRQ/YUL2
         6ASV55rf7eD8QICFBS9jS3xRuOBFiFRU2b+q+KcLrz3+kPUx+05sWypUIODW6T3gNgwU
         ueWRZ/V1FCmvkMjH9ejpFC1Oa+zBK4OYLS6gp7IjlILMhhqTokJlXnrQQRNhJcR4uluG
         qhHRCvqCxvxiSHmalTDw3grNVCbpVtlswAHs7WFKTzJnU5I67YJ17Qk6ybdo//KEI9Q3
         hXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732748754; x=1733353554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LD0NsE8cueBmHLv9nYIGrdVGIuuAR+96OlYlJUtBTGw=;
        b=FNHU58QxkPdaIUQGr/zxPPHAFHgzkjYCofEmtN72w7soFVLfM4mMLVVHacJzbftbnN
         XjrNJj+BVH7W0muH/6DzYcmEUErD9q47L9objr9fz+Ro/mATWv0TeRQu0k+ZxQVvyLwE
         De1tdHlV/s+0tkS71SYq07DbaOQAJylVduVcCJHNhbcWLrFXgztn8XU19uSNzmS2eeel
         z6sui5VXHWFY0+DIv6isaDsnQDPqP/mTxyfWffq9IKNJHWk+3Osu9uoGz1zAjPvTTaf7
         ZnEMs/Sbr7OpW+LCTalDpDWg7iogr9N2b7Y0fa/4fwMbtk/eSLuavRy7wWL1pHNVvIjX
         GkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1+ErF3yavfAoIRt72CygzMyg0TLnyQ/EzghVsnkXnbX2Y4Gq0gVL8a5fiWwNVCXd29mo5UE2bmvuJ7cY=@vger.kernel.org, AJvYcCVTQpB7bbQIjRrQuIihNnM1q8Iif5kzoOKLk5OrHFIKEINaimRv12oRHPeKExzfNvYVSNDwKGUAFwU8moWH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ww+w8IPBewsrIp1hBWC05xNqOSt6Z6Xh1if4o9IZ7IWUH+2e
	ri2vjvELGbc+bWQeREa6/jwaH5Sqm8zifMEHhgfMUhFn42X/G34ggqyzWQ==
X-Gm-Gg: ASbGncsAE82QrU02RaoQ8KbFxvPgOuj7efqlSAInWZYI0nctbIlhM+U72b+Bt1LUu0U
	F+OZLxNA94/clmMO1h7WmY2w99KoWcCri1qDsF+2UtLy9BwUlIp1EWw1Kr9jWzJZKuqNYBq1AYk
	L8Fpmnsd5kgcslQ3l2z7YDimD9QIKzlXgkDBH5YhbllumWOVCgvpp6n2MBZaFay+FJsYF3o83xz
	Z1U5ZuUeVinLzq7Ec8x1DrZOagjBBKEQ0hFY/1y8z60vLAzI/CDfIMv9HTC/8DGfkzqTTFn6sJH
	80TMFvX4d5voCGs5Bcv000vJPtio6uQ=
X-Google-Smtp-Source: AGHT+IGrD4YCLnVT88uZaUoynT2sbqidMdrLivph9MkTZpL1bBRvFiL0NmeH+Xqp7pUW0CAJ+O2H2A==
X-Received: by 2002:a05:6102:32ce:b0:4af:3fa2:2d0f with SMTP id ada2fe7eead31-4af44ae4d60mr7496262137.26.1732748754107;
        Wed, 27 Nov 2024 15:05:54 -0800 (PST)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4af590ac4b0sm11652137.3.2024.11.27.15.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 15:05:53 -0800 (PST)
From: David Hunter <david.hunter.linux@gmail.com>
To: rostedt@goodmis.org
Cc: david.hunter.linux@gmail.com,
	javier.carrasco.cruz@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	shuah@kernel.org,
	David.hunter.linux@gmail.com
Subject: Re: [PATCH v3 0/7] streamline_config.pl: fix: process configs set to "y"
Date: Wed, 27 Nov 2024 18:05:47 -0500
Message-ID: <20241127230547.2047716-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018103032.09ff7dcf@gandalf.local.home>
References: <20241018103032.09ff7dcf@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David.hunter.linux@gmail.com

I think that there are 2 distinct reasons that a module should not be turned off when using the 'localmodconfig' command. 

1) the module is used directly
2) the module is needed for another module that has been included in the kernel with a "y". 

I think we both agree on the first reason, but we may be having a disagreement/miscommunication for reason 2. 

> For example:
>
>  BCACHEFS_FS n -> m
>
> Why is that needed?

With regards to your question, I see that 'CLOSURES' is set to 'y' in your original .config file. 'BCACHEFS_FS' selects 'CLOSURES'. I suspect that if 'BCACHEFS_FS' is set to 'n', then your config would have no way of keeping 'CLOSURES' as 'y'.

I understand that the following patch is not suitable for upstream; however, the following patch might help you to understand a little bit more about each config options like 'BCACHEFS_FS'. 

https://lore.kernel.org/all/20241014141345.5680-5-david.hunter.linux@gmail.com/

If you put in

dprintvar("BCACHEFS_FS);

you would be able to see what selects 'BCACHEFS_FS' and what is selected by 'BCACHEFS_FS'. I suspect that if you were to use it for each of the config options that you have questions about, you would likely see that each config option set to "m" has a "y" option that it selects. The question then would be is the "y" option actually required for your particular machine.   

This brings us to the root cause of the issue that we are having: there is no way to know if a config option set to 'y' is actually required. If there was a way to tell if 'CLOSURES' is needed, we can easily determine whether BCACHEFS_FS is actually necessary. 

Without knowing whether the 'y' options are needed, we then have to make a determination whether it is better to have the (potentially necessary) 'y' options with the extra (not directly used) 'm' options or to drop those 'y' options along with those 'm' options. 

My argument is that the 'y' options are important, even if we cannot determine whether they are used or not. The problem I had that made me aware of the issues with localmodconfig was that my new computer would consistently do an emergency shutdown whenever I would try to compile the kernel. I eventually realized that the fan was not being recognized, so my workaround was to put the BIOS in control of the fan (instead of the kernel). 

It was not until I realized that I had a few hardware devices that were not being recognized that I was able to pinpoint the root cause of the problem. For clarity, some of my hardware devices that were nonfunctional were USBs, the microphone, Bluetooth (and as mentioned earlier, the fan). 

I am curious to know if there are any hardware devices that are not recognized on your computer after you use localmodconfig. One way to check is to use use 'ls' on the psuedofilesystem or to use any of the commands (like lspci) that recognize hardware.

I do not know whether any of your hardware requires the 'CLOSURES' config, but because someone's hardware MAY need it, my reasoning is that streamline_config.pl should include 'BCACHEFS_FS' if it is the only thing that selects another config opiton set to 'y'. 

On my computer, when all of these configs set to 'm' are added (because of reason 2), all of my hardware works (including the Bluetooth, microphone, and USBs. 

If, on the other hand, you still feel like it would be better to not include these particular config options, I would ask that you allow a command line option like '-s' or '--safe' that users could use to make the config file with the added modules. 

