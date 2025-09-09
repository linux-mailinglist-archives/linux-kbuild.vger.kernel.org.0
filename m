Return-Path: <linux-kbuild+bounces-8786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B5BB4FFE2
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 16:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 450FA16087A
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 14:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0E921323C;
	Tue,  9 Sep 2025 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqsuQ0O4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7811D1DF97D;
	Tue,  9 Sep 2025 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429185; cv=none; b=b2TXhE5h5hYP1mZFFDf0jMXce2ctVFO5jYf7CiK37FZaNP7jthu37ayzfMRqI3xCJN6u9woP8k26v8VesHVRvxYyOvcRaNi07UZVqLLsPgJA9yAXpsRTloEz10AJ4oNH/o8tCbitfkBdTIzfur+skvTQLITOA4KMyxtSLOgWXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429185; c=relaxed/simple;
	bh=8Dkc/G5/ZxR10KU8r6Kq+n//YpEPGdweuWGyN3lNIao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/kYV94d2xPCGfqEkrXCn+2Tq2cipl+tmiLOLsbx5edSnstQ9DuVXr/jzYfoAe2zTjgTApA05KN5zuXy28CIswkp8XuwsMb9I85KcN5v4rvLeFl62m/lI56a3+xphvThsIUPCIt7SAvITWppdEdC+RPPZ09RnAXjWECjaqWs8QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqsuQ0O4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3db9641b725so5748228f8f.2;
        Tue, 09 Sep 2025 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429181; x=1758033981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ6pjHDMM+suXT8naiE9csEpW818jUZBYVFNTfCYGno=;
        b=WqsuQ0O4E2gtT67gCPO1zC7VdlntxRnXzYAsLuQFdplM/V0ChPPbmeEnZ8B6thuY5y
         dCfHofn/aw3vwekH8FWS4AhbWZWY8w8HHEtaIHo337dbpwPj9SJv9eYrFhyceypo+hQK
         mfLhuToj59mNMhVZnR4LmuSERAYdPxBdJXDA1DI4uqna2zCcZuHG1ymN5odMvRGxlwkx
         RL9hhOoi5QYQBEIZ8BwMK8iHRPBma/Xr9NHJEoPKo1eZFH6xXW8s4bRVubt7td+yTsX6
         /k5Rte+0lE1GSTAnhnHolIGApot7gsj9eZqfUTM3mUR2AgpOYb1jhTYHUJ5uXAO+b0wK
         Wpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429181; x=1758033981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ6pjHDMM+suXT8naiE9csEpW818jUZBYVFNTfCYGno=;
        b=druP7lTWEpYa4oirEsEaWTiOujgv7Nm24h515ba09aDPVrOTF4DfQ0oqa6alqvHWQA
         HybkL/8nN+7/df+lvY5kjgY5jvOFqogaR7gCBMKXC3N0nYEIROGS9b5KZy150X1oUxjO
         9HYTrxa3iNBeBKCXGvdOGekp41jgpW50c6ZNM08glT28r+V/4R3QQ1BA4wYRgzBCAaGw
         h4BFLJVFdXUPEPicZafXZ08nfU/k1ifKaslEw4V8g0OUzS8YYSbr1Ola5iUYLAGVqo9d
         b4BTgHQoQPzhMShdNvutG9JWeTbJFCNFUjy5kOEfrEXu5FNjk4UhigZWqcJZbb6/7Tm0
         5QmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWeOwDIsL3RbDCRhLL3FKqxiPyyrkhPKxKxM6m9B+KNAyFe6mWsERez4nR0l5IH9zy/XDzib3E9cjvQMc0@vger.kernel.org, AJvYcCWBBYHx+61haWYo3t7SlwEXJFahJb0KHZRvjAHEgH5Woln7KU3McuTdph9kIkgrWmNlygfb1wPhHh71qwFZ@vger.kernel.org, AJvYcCXHO5iQayBj64ff6z9fwuiQ4AwOWr6T9v7Nue7JpeH6akWz/kHpJOaC0v7GQU72LtQ/kGV80gZbOCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhM4NfUzvQjMIhtQy9am2ymIFKK1/gt7ax/HmGjGS6dpj73+EM
	BtvNGJZP7WwuPPY70U6mOy2ko3k+fOat8qHVITcHlU9vkZeK1nSo8pxslWBKYw6ZTNKtKxg8lAQ
	IeO3fEOpg/aTNsUlNReag5bQsicZP2Qc=
X-Gm-Gg: ASbGncvGQ6JGxcks6EYBF5NWagpbKDKn3uGzWIlqyFsuK5NSWnT+VQr3tkyB+Y+9VEA
	Wzop0vccfW5In+r0FIfJRM0qzK7di6RfyEyilp0gBzm009KaVMfdCaM3060v+H4TxIHMK8Fk9X/
	uRuTQgwuJLH3tD7zogjp6UIK91bWs/C0lhmc2GAzGplTaXZB2M6gMrF4t3BLOVcVm6PV1UOpX84
	AM3T3SEq1oMGiX9ZUc=
X-Google-Smtp-Source: AGHT+IHb1KmB6lnjW41yclSEzy+oVUecoVoO4XyT9rv1AyycY2cmZP7ch9LbWppf7fa3h/2TrIKAOfOqCRnTeUq53aA=
X-Received: by 2002:a05:6000:401f:b0:3e7:4991:87c4 with SMTP id
 ffacd0b85a97d-3e749918b76mr5400755f8f.61.1757429180544; Tue, 09 Sep 2025
 07:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com>
 <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
 <CA+fCnZe52tKCuGUP0LzbAsxqiukOXyLFT4Zc6_c0K1mFCXJ=dQ@mail.gmail.com>
 <m7sliogcv2ggy2m7inkzy5p6fkpinic7hqtjoo22ewycancs64@dnfcl2khgfur> <CA+fCnZc3ZY43KeQcWSw4kgcCqJpAvNj6gKd+x0AkjhuE2R8Hdw@mail.gmail.com>
In-Reply-To: <CA+fCnZc3ZY43KeQcWSw4kgcCqJpAvNj6gKd+x0AkjhuE2R8Hdw@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Sep 2025 16:46:09 +0200
X-Gm-Features: AS18NWDf03t8X97flQzZHTvir2nukoTD6nPxpyweIbo71u3mhN5KV1t_32mprjc
Message-ID: <CA+fCnZd6qJRcSukbCuvH5n0KcGYxmrLi=_9vRA7HvRpSbYJNmA@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] kasan: x86: Apply multishot to the inline report handler
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 4:45=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>
> On Tue, Sep 9, 2025 at 10:42=E2=80=AFAM Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com> wrote:
> >
> > On 2025-09-08 at 22:19:11 +0200, Andrey Konovalov wrote:
> > >On Mon, Sep 8, 2025 at 3:04=E2=80=AFPM Maciej Wieczor-Retman
> > ><maciej.wieczor-retman@intel.com> wrote:
> > >>
> > >> >> +       if (kasan_multi_shot_enabled())
> > >> >> +               return true;
> > >> >
> > >> >It's odd this this is required on x86 but not on arm64, see my comm=
ent
> > >> >on the patch that adds kasan_inline_handler().
> > >> >
> > >>
> > >> I think this is needed if we want to keep the kasan_inline_recover b=
elow.
> > >> Because without this patch, kasan_report() will report a mismatch, a=
n then die()
> > >> will be called. So the multishot gets ignored.
> > >
> > >But die() should be called only when recovery is disabled. And
> > >recovery should always be enabled.
> >
> > Hmm I thought when I was testing inline mode last time, that recovery w=
as always
> > disabled. I'll recheck later.
> >
> > But just looking at llvm code, hwasan-recover has init(false). And the =
kernel
> > doesn't do anything to this value in Makefile.kasan. Perhaps it just ne=
eds to be
> > corrected in the Makefile.kasan?
>
> Recovery should be disabled as the default when

Eh, enabled, not disabled.

> -fsanitize=3Dkernel-hwaddress is used (unless something was
> broken/changed); see this patch:
>
> https://github.com/llvm/llvm-project/commit/1ba9d9c6ca1ffeef7e833261ebca4=
63a92adf82f

