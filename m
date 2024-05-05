Return-Path: <linux-kbuild+bounces-1772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E39F58BBF45
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 07:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF3D281EF2
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 05:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D9217FF;
	Sun,  5 May 2024 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhMr6pTm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6899A35;
	Sun,  5 May 2024 05:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714885268; cv=none; b=SxMbLc5tF0oigPQzOpNS3IKnLH+TsXpGv3YhatuWZumTzMuXlpURLb6DRDGbA2Zt6gYvl0GTdWSSJ6HQQrhwUI+IbXCP4fti8QVIJGSJJU+kNZuosCkCXi1Bwck5TgpApK6zqakMgGjTI+1WgPe91NXVXrwwrAgh12sFsd7tup0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714885268; c=relaxed/simple;
	bh=iCv8VKH7FCqMmNScop6T5aCa+t9fP0ZnGfE3+nGdSzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiRtIEKf6Fnjg6zbnDtlYhMKGRauWsnRfyqBzMXwtNaLalOEfcuWAB0YEfkGJsoP/9uQkc3rQI86QWwuOg3Fa7vEkj6RIXJ5vYJP/1QnEFxbIZh9bY2js9ETew3XsSeWvCg896SFNbcj3+O89LMP+EEzusKzAV4rVYQPeNJ2z/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhMr6pTm; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59a17fcc6bso182528866b.1;
        Sat, 04 May 2024 22:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714885265; x=1715490065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BGj2iZw0M3WP22RDQd4lrzhL8TXQXwvu+PNvjBKii0=;
        b=IhMr6pTm9UC+Sf7JxCcNn9GYEmlcEtvL8/XFwRH/E88Yjzvb/RUV6YoDE73opsPsOZ
         lB12HFiYMtM9Hj+iiHYnNaXpSvExSK9lywiURnqe5y3fC5WtkMBcSAkQHPD1Iu/1vmYV
         ocbl7rPeZb/71rlNt24LgnXqSsLgcb0bRduHsXBqUFaJWpqN5wRuWFDlax7Hj4RKz4L8
         ZbCOa+Vy/vMsocRL2EURwIi+V1L2HfZPVbOWifHY949NmQPLxkZIO0N+zx1De9E+2oG5
         2bskW3H0yhliQ2QYmSboAkp92BAVsHYtebIyfK766eIf2Cukm4CjuBKQZwJdqdST4zMX
         /XdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714885265; x=1715490065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BGj2iZw0M3WP22RDQd4lrzhL8TXQXwvu+PNvjBKii0=;
        b=BITTYyw6wgdr0TKATXVUnrTIDCiSoTE6zoxjdo93vKDvHKfBjNuUzWYht1No6QrV8c
         pyu6uhtjBTYBcRm/NbKWtq1SUf9Z+xylg45/I3jxFTrbN4TbZSah/9PQcWTZkq9BLKcw
         oKeTU2dAmD5+PrK2Xt/OlGd5IcARMgRZNU8XrEydwT/6OIVyAEIKxbiDYS1rmMFXBrAQ
         6hJVIKNUa1/9tIwEpu9F+p+c/xHHoLqb+iBI/VJ5zrcuyjNmn7WUKstdP3B9Iul7fEog
         zpVESo6fIsy3fE90vTP/OmvQKf4Fq95+HMU3nA2w5bRHliZJcFcU8AQDFAz/jhVuBXt/
         v5YA==
X-Forwarded-Encrypted: i=1; AJvYcCXvajsEPcmNxC7h6BnQzNk6YjPa7rBinvHLqtzRhkGdZ2hLCYvxnQNqOlmbBamxfJxhzC1WcCb04FbyzeP8fcIGqcJaPru9K2PSo7Kyao7wEYmXRQFt7e40S6Zn2nnT0R6dqpaUbyuLZcYV
X-Gm-Message-State: AOJu0YyP/c8o8dlTodbbgobqHv0AtTWOkjbWXMEHzQkbffQ2ClrySea8
	3+6R3GNL2Cmg+gqp9ruQHNmm/tnt9TqUm1g15uv0c2C4lsbMAws5
X-Google-Smtp-Source: AGHT+IGHeyGso2i/asF/MEqy/032+R0eOOXgXpAYUc6lEQQIGhl6k9eItFlyqQAng1bgpzGs+BRRhQ==
X-Received: by 2002:a17:907:e86:b0:a59:c889:ed29 with SMTP id ho6-20020a1709070e8600b00a59c889ed29mr154167ejc.38.1714885264652;
        Sat, 04 May 2024 22:01:04 -0700 (PDT)
Received: from gmail.com (1F2EF54C.unconfigured.pool.telekom.hu. [31.46.245.76])
        by smtp.gmail.com with ESMTPSA id lk11-20020a170906cb0b00b00a59a0174c01sm1915440ejb.180.2024.05.04.22.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 22:01:04 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sun, 5 May 2024 07:01:02 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [GIT PULL] Kbuild updates for v6.9-rc1
Message-ID: <ZjcSjk0mXYopAvVS@gmail.com>
References: <CAK7LNARXef6Myb_Gd4jyGfwujoBAjmjzLZBzgkm4T1KmfHP0MQ@mail.gmail.com>
 <ZjcRPelwZP34N42s@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjcRPelwZP34N42s@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> Notes:
> 
> - Yes, those weird 'file' and ': No such file or directory' strings are 
>   pasted as-is. No idea what it's about, and the build log doesn't say.

Forgot to mention that I also did a KBUILD_VERBOSE=2 build - which isn't 
more verbose for this particular failure:


   BTF [M] net/qrtr/qrtr.ko - due to: vmlinux
   BTF [M] net/qrtr/qrtr-smd.ko - due to: vmlinux
   BTF [M] net/qrtr/qrtr-tun.ko - due to: vmlinux
   BTF [M] net/qrtr/qrtr-mhi.ko - due to: vmlinux
 file
 : No such file or directory
 make[3]: *** [debian/rules:61: binary-image] Error 255
 dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
 make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
 make[1]: *** [/home/mingo/tip.localinstall/Makefile:1541: bindeb-pkg] Error 2
 make: *** [Makefile:240: __sub-make] Error 2
 kepler:~/tip.localinstall> 

Thanks,

	Ingo

