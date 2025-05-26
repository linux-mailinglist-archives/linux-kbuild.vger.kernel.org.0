Return-Path: <linux-kbuild+bounces-7274-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D7FAC43A3
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 20:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C40F3A6BCA
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 18:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387DF156237;
	Mon, 26 May 2025 18:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jj84ZILo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB1A2DCC0C
	for <linux-kbuild@vger.kernel.org>; Mon, 26 May 2025 18:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748283401; cv=none; b=DDqteYYz1HRV3BiVwjq33LQcgc2hWcmL9oL48r4M9OEz03NxXWbeFAd+KYU0Gexf8xq/cl8DhWyfMtrz1q/0TELyK+XeZR9LZALlTOeZGg55sPQ2z+fp7W7CknH11Y5nQ/xEMm+wAavM1aAHsKusb9HTcd9RUF4NtaroThmHysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748283401; c=relaxed/simple;
	bh=Yti0dMuXOfMz+GOUAGdIPgikMBNHti/eNkrv7dgoCjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GnJFKC6QKOFPxzwGFkiwUvqfwM4icjA+omDoCQdgJTs9tgVlOVgtKlh5UFUh2RvBnJIZwW4MHv9NIEZb9VZSGhU7t1Vifn6eiATPu4Wc7VOYkvrOfFC5UcDsA5YfqbOP/NQ1iXS/jXmKk1uPLUQe7q9Tp5CJ0I2Ge8pkx0XSHS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jj84ZILo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad5273c1fd7so483365566b.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 May 2025 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748283397; x=1748888197; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K5uFF/BVTIbwC7dCbZZat5iUD7SfmLBEKXrmOAY5Bp4=;
        b=Jj84ZILotSVE4LxnrdvVE/YgukBv7kQpXMSsG0nHM+Ddw1Th5tiD/0rgk97C3z/IGA
         zyDRyLFLLRciW9yQA0XyaWlMxvzPCK0zCmiUO2YSoGV49zWk1cC9jJNb8j6pBDwxJgcm
         s25fJuHLUNYyvB3FSnWG0+U0jmmBZWNi0SSEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748283397; x=1748888197;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5uFF/BVTIbwC7dCbZZat5iUD7SfmLBEKXrmOAY5Bp4=;
        b=dL7mHkxy20D0/HrZ1JFkXObnovtD16VAtMjrhRuZtu/Rtvq3WKGxV9f+cx8CSZGO1z
         6cBJCIuzNurrqPxi/9F4oJJttw7g6AWr8zjuDH5RdKp7I8txp1HdbQS1Y9p2WqHfitqY
         RBi/oYn6aOIZ6wiHvv5I0xlS9vMQORnQAEkgwBLCQvfsORAKA9Sr9fxILeec3IH9+BZr
         g81TNoxYHQ5oX5Q61ywxN84vGQ/d34LB1mz7udPNxvlSfWYnIulR0ZI+mE1GeWkxjEkq
         aTZIKiFPb/0ZyUq2eJF/thtDuLoN1IqymEqvaUEuHo7XDEqmbUn9qZONvDeodu2Yu5m/
         +vbA==
X-Forwarded-Encrypted: i=1; AJvYcCW9qTV8yc/1rhPsTHoy3JCG1tGJVRxInqlpuCMYHWenrgdYASzZUiJ98jzmb06wzsGTDB+zOZh5ToA/Rq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFFD73Cq3uExg/aMHZ/X4aaA1y5+ggPQSwhUfQPRfgF+AD3zmC
	bfebNnRE5sgI71CfS0Fk1am0sRmerSmQJxySdrZr1TPD6u3jd8b55CyCDc9PbBmvf6xeyhywwCt
	fwweUmLs=
X-Gm-Gg: ASbGncswuXUj3Vnv3qBGmhAvDtzczE+7fNjFGzGspw8cfbJJFlL4TOCR97L0QYiNOjW
	Ah5YlWAPp+3kSZaqsJOfkAcXWmfiLiSi0UEfB5XOMtvY1rPpMKNM/ACWD4afWBZ5KaLFB5VtSTJ
	BPGXYY1f+gM5urs8XINwNuFgjx36nnqrcDNj40XzHGtFUtaemNDNV9ivx/fumZQtjFUBd1yfznl
	RS5rWkcyr1eetQAgvmsjyY083ZXVRsEFVdbvJDKs8o71APk+CWywGkRaZ4I2oM5bMOSyYuUJxUr
	t/DVG2TnYOn2MOuI2k6BNSH1MGqTh3/ce4Xcmo1lShJR8RGMqpDCM6hAsmjXP3b5zCzAbzsYhYE
	mrQuHlpTT5mlihf1BXpiz7WnK3w==
X-Google-Smtp-Source: AGHT+IEOLFloC/3SYIc1XZ57P0iS+AkB5j3nJu4fOXkRH9uJf3HodzBSERDjbPEPJuc/n99jvbIOZw==
X-Received: by 2002:a17:906:f590:b0:ad4:c55e:ef8b with SMTP id a640c23a62f3a-ad85b20ad2cmr936089066b.48.1748283396864;
        Mon, 26 May 2025 11:16:36 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm1715747466b.82.2025.05.26.11.16.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 11:16:36 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad5574b59c0so476436666b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 26 May 2025 11:16:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUz61NZKJnBKPcoFB/3J1c2Pr1MVreX907iknsNuTN/CD8FqN89uVE50Y4WJ0PQmh5+8x0BVY3w3Iu4i9s=@vger.kernel.org
X-Received: by 2002:a17:906:7088:b0:ad8:726c:218e with SMTP id
 a640c23a62f3a-ad8726c238cmr338824466b.61.1748283395799; Mon, 26 May 2025
 11:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
In-Reply-To: <CAK7LNAQezLBpYLqJ+=ONqoYKwdaw0_eywN9O26LTnifGq_g+tg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 May 2025 11:16:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com>
X-Gm-Features: AX0GCFuUFCqeQI3Ua9ZEp7_M0Q2Mk-B9yPPbicMi8VVDJWEZ-6ivICVdlD-5joU
Message-ID: <CAHk-=wg2YAc1TrqWB9HhKDWHGzrqeP9=uiW9hzU5p1oApcdAKA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild fixes for v6.15-rc7
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Masahiro,

On Wed, 14 May 2025 at 22:15, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Please pull some Kbuild fixes.

So this isn't actually about your latest kbuild fixes, but more a
generic kbuild thing now that the merge window has opened..

My build times have gone up by a *lot* lately (and by "lately" I don't
mean very recently, but in the last month or so), to the point that
I'm now finding it to be a real annoyance due to it slowing down the
merge window for me.

I did a profile on the load just to check, and it's all just gcc
(well, cc1 mainly), so it's not that something else like ccache got
enabled.

(Things like ccache can speed up builds in other scenarios, but I've
also seen it slow things down a lot for the worst-case sitation when
header files change, so I wanted to verify that it's not just that)

So it's just that we're spending a lot more time in the compiler.

I haven't tried to bisect it, and now I'm too busy to, but the two
main suspects are either that KASAN is now enabled and that just makes
the builds a lot slower (if so, it's my own fault - introduced by me
in commit 6f110a5e4f99 "Disable SLUB_TINY for build testing").

Or it's just that I upgraded to F42 and gcc-15 itself is perhaps just
that much slower.

Anyway, I'm emailing you exactly because I'm busy with the merge
window and this is causing issues for me but I don't have time to
figure it out - and so I'm going "maybe Masahiro is aware of this
already"

I also did notice while timing things that the final module link time
seems to have limited threading

For the rest of the build, I have load averages in the 100+ range
(because I build with "-j128"), but then the last few minutes it
starts dropping a lot when it's in the

  CC [M] ...

stage, and when it hits that Makefile.modfinal stage and we get

  LD [M] ...

stage it seems to have serialized completely and just spends 100% of
time in one single 'make' instance.

But that may be an effect of the link being so fast that 'ps' and
'top' just don't tend to pick them out at all, of course. But I do
note that the LD [M] phase seems to be entirely serialized with the
'CC [M]' phase. Does it really have to be?

               Linus

