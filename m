Return-Path: <linux-kbuild+bounces-6746-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D13A9D74B
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 04:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 119077B0B3F
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Apr 2025 02:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0BC81FC0F0;
	Sat, 26 Apr 2025 02:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhWUwB1M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1EC1F4720;
	Sat, 26 Apr 2025 02:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745635153; cv=none; b=uf3IqiL4MIuLBClDNehfIKVy0HbCr1ZHBdxD8pUKdwALKFe3nj2wDDFYuiAnbxIDAO4wnWy5hLz6ui59IbzqIXi5w2Lrvl7dQ6xdQJoSTY4F1bY2q3AFd+0mQpFL2eyF9bQCCf5HRmFF2iJ1XtBixJbLyVKwZ9TrgCgzKzXC49o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745635153; c=relaxed/simple;
	bh=1FqjtnhNDJ7FHUEMh+JAetY3FAIKW7glSvclDAKtT9A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=iCSNuFClcDYqWWKpm2rP8g9b7xaiVrJeRlX/u0ZdFLaS9MNoWeKT34IWjIStaQZCnSAOOgzjcm/sCRagTOcVg9Rww31Rp7i7RzUGlZtGo5ch8vt19+m/ODXWFvgspoahTntpYE0tOP+akeGi4yStBvyNoTzOzlKsooIyr8suYzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhWUwB1M; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af579e46b5dso2095637a12.3;
        Fri, 25 Apr 2025 19:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745635151; x=1746239951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JpplSP/dFAaY6jk9LLlgcDCITdJ17ib1uCJw3e53Eew=;
        b=WhWUwB1M2P1wxcgDyPhZUKKxfYvCX4duGXFxDdArkcfWsIEWXsGmqSGOb19Xts9/rF
         muaSCDfk15Dx1nqKNiOQ0rytMW7g816IT8sWak0804Z6qwNZeZb2eFgjfGPb3RUEBkpJ
         q/bb+eMOkjPB0HpPOjI0rBQ+EOfbzKVL1oTz+VG+tEMN7PAc7ba1Nrprk06fkJc8XuBr
         qtpyNVUBmk2+1Pcg9qnyHC/fYUr4wL7r/LGYtfjcaUdFRmYgNAPJy+pEi0uOn2RoKnPf
         5Nkm6X+2KWhsduiflxfq3d1xChPkFWsmuqIVe5YIhui4BxTwTxNPR7UTNHFdgTXF6bpa
         P/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745635151; x=1746239951;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpplSP/dFAaY6jk9LLlgcDCITdJ17ib1uCJw3e53Eew=;
        b=ZuL47D6QVLX5e7DFocS+NJ7K5JjcTLULPhKumd0mez45xxo3xy5vDogGcHPLsWS0EB
         jqDYMw/m1kUDJiU7sSbGBo0tEnCJdAKRMyJFfSfZtUDAhHrmiQZI6aZK2K56aNnpG0wu
         wK4B7v2yNe/tY7GMz+UhT0+hbrlLy6/1wYXDuSEAijXfKJgk0GY7Gyp+M2ds2BviFbVG
         EvkD46V2RVzZusF6LatUEoqMYNTKdtC791j2w0Q8Kj6Vv6QtTi5eQl6lX3wLaGw+ICOI
         t206sLY58Ib/LomKjnhUVwQXd0avKez6PGoSOZKzE/Z7JEIgnoPlS1BM8jF6OF+MbDoK
         BJxw==
X-Forwarded-Encrypted: i=1; AJvYcCWDhvFAnQovlDl+eIXfRolLUVmSTtjmHohsuCYOiMB39M9pW4PD7Lx16335eoBbAmKxk29q5/K+zB6TuMGL@vger.kernel.org, AJvYcCXUsZrPQOGn+FeXQJL2/fxOUc4VxkaEYbx91tr/gXBr/DWGTgXiHb8hbO/VSjdCY+WUMgr9Iw6ADQq8Ybyb@vger.kernel.org, AJvYcCXnmzMGjghU/FiTRxDaFuC4ZrzC8xvz7bQN4LvOuzcVp6IZbR3KEOiw9u6AX9u8qIDfMxtwEtj4gZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9VbtiijcJ/V0wspAKUBbXcHxt2wRc7C55BWxudKX2cqYzN4oj
	HQT0K+3modVVoo6f4AuVo7/5E3CdIjRxMSysZlzfkLC46zJXSpAp
X-Gm-Gg: ASbGnctM85dLopXmzVXCBHQzWlsQLWGbr37QBbTsHYCHVSvoymZ6+JtulJ3fuyXo0jj
	eX5sAeOtscYd1VK7+TljH96bvTwazwZS9Ek5AynbhGAAvqlsmqfdHWmNWqwmC4MjZT+DXGIsEyq
	jsNbZ8dw5PzoM4ohgyvbi93vkCa76250L3FpigoEyDo7unnwuiAT/UdQUSyiMJa5dtLzx9o6RQw
	KWP1UG4JQD+33EOAftGDxPwBrcWTARpGKKTQ5pinuFdHL+pkSxh9CQzCc4KBIPAvZnON/FKyuzw
	+1eXqxRnCYUONtqQRqzMog/ByKPUgBuX98VOuoy45xmC4lyBTbpZCjpyM3rEaVeLn2MJXMwV0CZ
	sIO0InNgI2tg=
X-Google-Smtp-Source: AGHT+IE44KmkhgPN/y1Z+QQtUhDR0Rj3E1Ytzqt5IZB/2pxGjM8oeA/JwKOp+X642fQ81dh589yQ+w==
X-Received: by 2002:a05:6a20:7f90:b0:1f5:7353:c303 with SMTP id adf61e73a8af0-2045b6f5372mr6075481637.11.1745635151397;
        Fri, 25 Apr 2025 19:39:11 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a133sm4016961b3a.90.2025.04.25.19.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 19:39:11 -0700 (PDT)
Message-ID: <22d7bca2-cdfb-4e06-acb2-41363ba13333@gmail.com>
Date: Sat, 26 Apr 2025 11:39:05 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: airlied@gmail.com, corbet@lwn.net, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, masahiroy@kernel.org, mripard@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de,
 mchehab+huawei@kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4 0/4] Don't create Python bytecode when building the
 kernel
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

Responding to Mauro's cover-letter of v4 at:

    https://lore.kernel.org/cover.1745453655.git.mchehab+huawei@kernel.org/

, which did not CC'd to you.

On Thu, 24 Apr 2025 08:16:20 +0800, Mauro Carvalho Chehab wrote:
> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> when W=1. Due to Python's normal behavior, its JIT compiler will create
> a bytecode and store it under scripts/lib/*/__pycache__.  As one may be using
> O= and even having the sources on a read-only mount point, disable its
> creation during build time.
> 
> This is done by adding PYTHONDONTWRITEBYTECODE=1 on every place
> where the script is called within Kbuild and when called via another script.
>  
> This only solves half of the issue though, as one may be manually running
> the script by hand, without asking Python to not store any bytecode.
> This should be OK, but afterwards, git status will list the __pycache__ as
> not committed. To prevent that, add *.pyc to .gitignore.
> 
> This series contain 4 patches:
> 
> - patch 1 adjusts a variable that pass extra data to scripts/kerneldoc.py;
> - patch 2moves scripts/kernel-doc location to the main makefile
>   and exports it, as scripts/Makefile.build will need it;
> - patch 3 disables __pycache__ generation and ensure that the entire Kbuild
>   will use KERNELDOC var for the location of kernel-doc;
> - patch 4 adds *.pyc at the list of object files to be ignored.

I see Jon has merged them all, but responding here anyway.

In https://lore.kernel.org/Z_zYXAJcTD-c3xTe@black.fi.intel.com/, you said:

> This started well, until it becomes a scripts/lib/kdoc.
> So, it makes the `make O=...` builds dirty *). Please make sure this doesn't leave
> "disgusting turd" )as said by Linus) in the clean tree.
>
>*) it creates that __pycache__ disaster. And no, .gitignore IS NOT a solution.w

Andy, I don't agree with your words "__pycache__ disaster" and 
".gitignore IS NOT a solution".

Running "find . -name ".gitignore" -exec grep -nH --null -F -e ".pyc" \{\} +"
under today's Linus master returns this:

-------------------------------------------------------------
./scripts/gdb/linux/.gitignore:2:*.pyc
./drivers/comedi/drivers/ni_routing/tools/.gitignore:3:*.pyc
./tools/perf/.gitignore:32:*.pyc
./tools/testing/selftests/tc-testing/.gitignore:3:*.pyc
./Documentation/.gitignore:3:*.pyc
-------------------------------------------------------------

, and they have been working perfectly.

Having seen your response at https://lore.kernel.org/aAoERIArkvj497ns@smile.fi.intel.com/ :

> I tried before, but I admit, that I have missed something. It was a mess
> in that case. Now I probably can't repeat as I don't remember what was
> the environment and settings I had that time. I'm really glad to see it
> is working this way!

, I'm guessing you had a traumatic experience caused by python's bytecode
caching in the past.  Do you still believe ".gitignore IS NOT a solution"?

From my viewpoint, applying only 4/4 of this series is the right thing to do.

Bothering with might-become-incompatilbe-in-the-future python environment
variables in kernel Makefiles looks over-engineering to me.
Also, as Mauro says in 3/4, it is incomplete in that it does not cover
the cases where those scripts are invoked outside of kernel build.
And it will interfere with existing developers who want the benefit of
bytecode caching.

I'm not precluding the possibility of incoherent bytecode cache; for example
by using a shared kernel source tree among several developers, and only
one of them (owner) has a write permission of it.  In that case, said
owner might update the tree without running relevant python scripts.

I don't know if python can notice outdated cache and disregard it.

In such a situation, setting PYTHONPYCACHEPREFIX as an environment
variable should help, for sure, but only in such special cases.

Andy, what do you say if I ask reverts of 1/4, 2/4/, and 3/4?

Regards,
Akira


