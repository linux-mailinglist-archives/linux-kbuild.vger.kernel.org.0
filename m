Return-Path: <linux-kbuild+bounces-6462-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F56A7CF02
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 18:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BEEF167C39
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 16:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0F8C16E863;
	Sun,  6 Apr 2025 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IHUpfyPU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D41531F0
	for <linux-kbuild@vger.kernel.org>; Sun,  6 Apr 2025 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743958227; cv=none; b=LZ/akO8Y7+NyFvdVwAxCaQ2P/c4qsnOHVRw/J2NMH47SW6OyBjfQzIJHL9ZZ5I5Dm9lwMBFyXIng0h7oW/DvQ55jzZZVb3nsuVL5aGX/Jyw/7cSc98zbo3AyhTZsi48gr55zgtUYCkeoIE2iN+WRJtd7zrbXaGzXjsjmSDQxHWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743958227; c=relaxed/simple;
	bh=O/ObsG6NTir58TKc4fMJ3s6XxYR9YL+LTg1B159OMR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZM4uLBJKHxeewurPlyKl/IT14uiADATxLH+eyHLakWjGL28afYUS0SHS30QMVRElMo4s5iFa+Ahh/R+JZTwwH5NOIDVdzvD0zRW4oV7XRwImmeO/pBHD4qBi7GrpxxOGZtV/km1B0rppKzv69eqlT7cNyYxJqHMKmXgEvS3I7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IHUpfyPU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso684199066b.0
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Apr 2025 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743958224; x=1744563024; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ofvTYq6OVdukl6A+l5RpRSvyxUTCeuH/7ysugrt6vyk=;
        b=IHUpfyPUdLctFgtkfUqGsqN+rIkDTLb4nf37KU1TmDGQru7A19YUZRQructrY4P+zS
         HoxSP6goUCRJ+zEMnWJJAR157qr7W+AtcKivXxc3/rE5HY6yk1wyNmmYGXNZ1O34HBVh
         KLE2TC2SBy/sSyDLtprQuIOc3VlMKdn68sl0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743958224; x=1744563024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofvTYq6OVdukl6A+l5RpRSvyxUTCeuH/7ysugrt6vyk=;
        b=F13LG4rtS8GEM2+C4oGjvLRTGV7qoBIBdnVvLUUXGmoqcRJTR/iLGbYNt0BlXBr0bb
         P2IU8buVSttq8ghvhOKRA85P0z139e9KR1VYUmrSPfmEvWdTb7/1Uc0DQW4gH0b85Ymh
         qZMe2UFIqHIwV3dh+GRkp9MfUsdTbOkvDifc2wKiZ1h+WE4O1iqf1/48sIifGq6nS4jj
         RNQuCCeIWfmyl+zXODolmCFbvk2dsdoYluyTn5vIF30hZ8c2ITbF15gUV7i7SqABxmRz
         +z+xJTbVrVcGQiC/R61dJiDpIvYIU64WF7T8q1hXuSL5zfKqVDY9rzExYsfOydi9oGrZ
         3PHQ==
X-Gm-Message-State: AOJu0Yyvk35Qq9CKo8odC78kKIyFoN7MsdA2qRXXh+i2AxZol8rJfb12
	nR3eJcVBeqOrp5c1lWhBaA0+y7wqoZ9+srz73RrZoocVAoO2Bvb2lBnVHDfKLjADK6cs+ZiFcGw
	Yus8=
X-Gm-Gg: ASbGncsorB2Ijdma0D7Tf10/dSK5lf+eSlPtjgDhnKSWnmolKvgv5x+jEDOJ8y3w6lt
	/sFJ+kO3falSM1Y3qiFmcF5P3BAwl7LhLxtHSS3QjIMvoVR03bJNQEmoH8k2uosPK50n8Z34/YE
	xr9gF4qE10aOWYaCZy7fZQm9a3j0Fr/zBDxfD2i0vIPMZewsGOr3qjufww9bp+vQ0x/ZPeqGCwA
	8/fxKy4NmDF1NAnPgO+GWcQWX6dmpQLbFb6q8HZSTqsxtgI2kzlsdemL8KbFYwS69WOObtRZAaj
	+jwQ2F2EYFjEI54tiWGriWis4qNMfGzJ5mutJCx2E5QMRzL+dh7xcnuFYAbYO+JiTPhS67NjbIb
	FdlQKYIVjMAQdP/3Zykk=
X-Google-Smtp-Source: AGHT+IEOGwItxYqwNTKyyZ7JO68T+RTjq6yZ8QSOTDnV81eOMgDGLHTtQ7g07lRtF21LhUyqWehTGw==
X-Received: by 2002:a17:907:a05:b0:ac7:322d:779c with SMTP id a640c23a62f3a-ac7d6ec2f2cmr749987966b.50.1743958223755;
        Sun, 06 Apr 2025 09:50:23 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c1db6ea1sm606968766b.143.2025.04.06.09.50.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 09:50:22 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso628696166b.1
        for <linux-kbuild@vger.kernel.org>; Sun, 06 Apr 2025 09:50:22 -0700 (PDT)
X-Received: by 2002:a17:907:7ea1:b0:ac7:b363:862c with SMTP id
 a640c23a62f3a-ac7d6d7f0a5mr843077966b.34.1743958222006; Sun, 06 Apr 2025
 09:50:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
 <01070196099fd059-e8463438-7b1b-4ec8-816d-173874be9966-000000@eu-central-1.amazonses.com>
In-Reply-To: <01070196099fd059-e8463438-7b1b-4ec8-816d-173874be9966-000000@eu-central-1.amazonses.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Apr 2025 09:50:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
X-Gm-Features: ATxdqUGbf7IOrFQnAOhosXAPF4OA1DEnI6vLKh28dp-C3AEUyfL3-SlU4pa-MHg
Message-ID: <CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.15-rc1
To: Damian Tometzki <damian@riscv-rocks.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Apr 2025 at 22:43, Damian Tometzki <damian@riscv-rocks.de> wrote:
>
> i got the following error after this pull request.
>
>  MODPOST Module.symvers
> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
> make[3]: *** [/home/damian/kernel/linux/scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[2]: *** [/home/damian/kernel/linux/Makefile:1956: modpost] Error 2
> make[1]: *** [/home/damian/kernel/linux/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/damian/kernel/build'
> make: *** [Makefile:248: __sub-make] Error 2

Bah. And the reason it doesn't show up in my normal build tests is
that my 'allmodconfig' tests end up picking up SLUB_TINY - which
disables a lot of slub cases, including this test.

And my normal non-allmodconfig tests don't enable SLUB_KUNIT_TEST.

That said, I'm not sure if making it a hard error was a good idea in
the first place. It *used* to be just a warning, and it used to be
enabled only with 'extra_warn'.

So switching it on to always warn was probably a good idea, but then
also making it a hard error may have been a bit excessive.

In related news - I also wonder whether SLUB_TINY should just be
turned off for COMPILE_TEST. It's not a very interesting config option
to test for, and it disables much more code than it enables [*].

Testing this without SLUB_TINY, I see that it *also* triggers this one:

    ERROR: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o

so the claim in commit 6c6c1fc09de3 ("modpost: require a
MODULE_DESCRIPTION()") that "all known instances of this issue have
been fixed" is clearly wrong.

For all we know, there are lots of other cases like this that just
never got tested with W=1 at all.

I think I'll downgrade the error() to a warn() again, and make
SLUB_TINY depend on !COMPILE_TEST.

And I'm not even convinced we should require module descriptions for
silly test modules, but whatever.

We'll see if something else pops up, but making the lack of a module
description a fatal error was clearly not right as-is.

              Linus

[*] In fact, I'm not convinced SLUB_TINYT ever makes sense at all, but
that may be too unrelated to this to worry about.

