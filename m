Return-Path: <linux-kbuild+bounces-7033-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBAFAAF4C9
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 09:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 828F87B5294
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 07:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76339220F41;
	Thu,  8 May 2025 07:38:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D0E220686;
	Thu,  8 May 2025 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689924; cv=none; b=HlnVmQKqvfPN8LavayrEWjThF982OHWT2/IspLGvpqLv1tR//BUzJB925Vqc+uVq6iG1DeQ2cckUCVP8LXeRVxKf9AhbgxdnCEfnhg/mrL050bk0hZ+aluoEL0Bm3lX/8AW3+HAkAd9n9k9HAj5hIwrb5v0z8Syr6voNctOagUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689924; c=relaxed/simple;
	bh=00t+73t/o1ImybTkegnyFnImjLxdJcovYH6HVmTUJwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THtN2GGWFa8WhOb7Cb6/omQzWI6DdhAPyW7va93LoRhIF3ufPSZhQ31pGrr6RYzwpWPKwOQwITmiRVoJ2xy2YmNwLHhUFWjG4MBnr7GFrZqWx6f2AeJnYvlO9W0lKEobT8X81QwB/FZjv5QL1sjcojhyfP1Bl053OmdDxsGpp14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-879467794efso380411241.3;
        Thu, 08 May 2025 00:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746689920; x=1747294720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TdWX9BvnLKIzglHQcO1riqJBcVy449ZX9JhxrNyGJc=;
        b=D1FI50+9blvocnAK2fXKTfdRuhR470mWgSnxJnb2D53398BH3nGSR5WBWE7QTY5jOd
         LIeTtns52+TgLALTqIYHllQuakmTr80Rr6B+FTejrlchipa+sropDsMHOuZrYQghilRk
         je4ugAZj0Pux46uv5RzzBMYzVf4+WQbUtrbxLrrvzLb1HodBycxVgex8FqOCfoEYsHLD
         ic6owFsuPZBiZsWqXs+4lc0jJ2LeN24YUe+kqzxuEGnmRopHhzVbNobAh4kkA/lCD7uG
         tKCIWVeNWmnyN0dz7as+zgvK8urskIcLqNsCxh9Q15Jqtju2bligOPZHEPfbcwuQcx1A
         +7Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUDAEjDJjb6k4zvN6QOubo8mbeBkzoSHD/STeOyPoBXhBKOjl1j3q4zSiaSM2C72ma7N/KhGq8PfuFEVz8=@vger.kernel.org, AJvYcCWacI4B6pOcJTsHTsLjd4pidEubUREe16O/mLq6tGHOEiP8ozWhYqHpYiBrb0oLAyxsEmjSdvCi1VpeBcEE@vger.kernel.org
X-Gm-Message-State: AOJu0YwtoXUsdr4TTR3DVomBppoXvT9QFiXXa2ciq5JkJmXmHdNgsa+V
	u+L1GpB/zi1lNYdVk32hxdM0SOYQSNfkAGXyXYsY05jdVnJ+JAcNolosxaDD
X-Gm-Gg: ASbGncvo0MKtf9ihvUCtCuDE9XlSORGssoL8hp1kIW/rKIfuaZJS0Qk7VCcxshZx0Co
	+GkjWa1oQ9yGxFdgdGdnS06JJYKmcvk6vOCsgKAPOHxLHZ+W+WX91jgKimY+WYVb7sxjg4yxOJP
	a0nMlaXWgXMJQDYPeZQZZ17VIPiaIcPGTVPpSEpDCFPw3AIaedu1qG/EOqGAyictZ6dWj3SkbxJ
	Vl0AH+L1f9olXT/VGvBGtKgDSdaruzSy/CSEojezbMgIAIx9pOzqJ2a+3gR2wlV3YrP0zD2KmFC
	Hjo0evB2UNY0DaPVfUOylUA/Kf/22+xrScvFcsPdvfHSlOlVD561hRi9cxJoxTI9OVGYlc343Ll
	BgWj96JNdQDhbsQ==
X-Google-Smtp-Source: AGHT+IEAYmuT9bt/EZYRX3xPr3Qjq/pFg7Y7gAsPnhq0IbyR7wEkcv0zepyahlrIQJ18LqWdDX2eBw==
X-Received: by 2002:a05:6102:3e87:b0:4da:e6e1:c343 with SMTP id ada2fe7eead31-4dc738d46b9mr5292810137.23.1746689920050;
        Thu, 08 May 2025 00:38:40 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ddba67c5a9sm17124137.30.2025.05.08.00.38.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:38:39 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4c6cf5e4cd5so602007137.2;
        Thu, 08 May 2025 00:38:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEUIlfsFtBbATlaW1ZNegBCzRTYZB6UJpjdTCDH6dLDjISr6jVcZd6iGHAwFmqOEcL3cOIbaWnXrZ70s/p@vger.kernel.org, AJvYcCWwQd5ZK7+edg53Y8Sp6j9befMaBaYGtWLgOlJP10oP1jyEi8AvNH+PxaDPRFAyUc8f1JTU3I/zPx2u99g=@vger.kernel.org
X-Received: by 2002:a05:6102:15a4:b0:4dd:b86a:dac1 with SMTP id
 ada2fe7eead31-4ddb86adb37mr323439137.3.1746689918794; Thu, 08 May 2025
 00:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507074936.486648-1-masahiroy@kernel.org> <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
 <b1e4e83c0965e10f2fe59826d19eaf131ec7aef9.camel@sipsolutions.net>
In-Reply-To: <b1e4e83c0965e10f2fe59826d19eaf131ec7aef9.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 09:38:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUwE7btR+ebG8-gvPb8GPnxUGPWw3yKR4qM4Uc_mYcHhg@mail.gmail.com>
X-Gm-Features: ATxdqUHSUZJrVPRt7puYinzwH0Sbp9Bizhx3T3hxY8yiAcyEWRrVX-9gdHKQkgI
Message-ID: <CAMuHMdUwE7btR+ebG8-gvPb8GPnxUGPWw3yKR4qM4Uc_mYcHhg@mail.gmail.com>
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as well
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard Weinberger <richard@nod.at>, 
	linux-um@lists.infradead.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Johannes,

On Thu, 8 May 2025 at 07:29, Johannes Berg <johannes@sipsolutions.net> wrote:
> On Wed, 2025-05-07 at 15:38 -0600, Shuah Khan wrote:
> > My workflow:
> >
> > - Build kernel on x86_64 with CONFIG_AMD_MEM_ENCRYPT enabled
> >
> > - Check for arch/x86/realmode/rm/pasyms.h
> >    ls arch/x86/realmode/rm/pasyms.h
> >       arch/x86/realmode/rm/pasyms.h
> >
> > - make ARCH=um O=/linux/build
> >
> >    This patch cleans the source tree, but doesn't remove
> >    arch/x86/realmode/rm/pasyms.h
> >
> > - ls arch/x86/realmode/rm/pasyms.h
> >       arch/x86/realmode/rm/pasyms.h
>
> Is that even _expected_ to work? If you have x86 built first, I'd almost
> expect you to have to do "make ARCH=x86 mrproper" before building
> another ARCH. I don't see how ARCH=um would know how to do a full clean
> up of ARCH=x86, unless this is somehow arch-independent?
>
> Or maybe that's not an issue with other architectures because UML is
> special in that it uses parts of x86?

Probably.
I only use my linux-next source tree for fixing reported build issues on
various architectures, and I never use make clean/mrproper.  Works fine.

> Though I guess the patch here should make it do that, more or less, but
> it can't, likely because you're also switching from in-tree build to O=
> build?

Yeah, mixing in-tree and out-of-tree builds causes issues.
Never build in-tree in a source tree you use with O= (except for
e.g. "make tags").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

