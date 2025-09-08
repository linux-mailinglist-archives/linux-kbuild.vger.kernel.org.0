Return-Path: <linux-kbuild+bounces-8772-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63615B49AF0
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 22:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D491BC607D
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 20:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADF52DC342;
	Mon,  8 Sep 2025 20:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYxnvFh+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD72D9EFA;
	Mon,  8 Sep 2025 20:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757362760; cv=none; b=alkdFYsJi732ZT5e/RIXbdjkcWeapzmqmumX5wnle32ysvqthC69c0AfNBor2HxdleBZS3Zv255f5hP5PrznLKyrtfRzorhrKRB3iBp5C53o2lBVdxo5Gp6PLExMIzpggozwqS2dlDZ/IHDyThrcCOzzVsTH2ag/4GnBi8sRHV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757362760; c=relaxed/simple;
	bh=vT09vTia8SgQBO+FiegSxuy3xNGmzzHUSLwcepL1OEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPZPpr2oaicrmDuZPrVQNaIzp8yptb3EKDvWE/UjmKRcb+btCylDVyEMN+TodC/3xSVO6W50rpUxv3h4whLkdk7gXevsRdELv3cGuV/kVuGW43pX9rC5PZWBdevOspG0erRb6L5ed7L8/qx6QXXz6owgBB4/dSzJzdctFNdHNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYxnvFh+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so3377758f8f.3;
        Mon, 08 Sep 2025 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757362757; x=1757967557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vT09vTia8SgQBO+FiegSxuy3xNGmzzHUSLwcepL1OEI=;
        b=lYxnvFh+lgX6kjFJblJbboRDYB85v+Bbxu0D7wL4zCD2Rxwq5u181sJN/C/qeGWEPZ
         489kqVPhKCbrXQjv17k/K0jPdGvSVRRVKyUlZEIx7f+YHAWpA9N1g36xpRNxUleKYgjv
         98X2SNDXWbJEJEbmjoyDNXFNiqxKrcGuYSVzJ2+eWt1mswEfGE3Y6RYOA+/X0z9Tfl4I
         sB8somHVG5VdhkYJ95THTWNoxq14vP/tIbQHshZDTKP1crzwQEkh7IWi0Jy8iyN/G/0O
         WgnyKngTLaHyCj5sK/fsZ5cuPduvNS1iCnIKWJ1r8toQdxjOi49gLSrA5N3zd/FJIH0d
         72XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757362757; x=1757967557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vT09vTia8SgQBO+FiegSxuy3xNGmzzHUSLwcepL1OEI=;
        b=U6zBUfeRmlyLMCeTGpy6lNYdWw/gtgChR3r2Kd/z3lHDThblr/GQIXo4hpq6XS7rEc
         9S2Z22MMB8DqwqmD1gpqgETllrRlpsYvQsi3cLHos/Jxd8lxosDOtHjPVb7VAAQMjPYV
         zhsQLi4qqYVHAWfpdWd1oxjNhCYp6ExVlntRDZWXtNDK54DzGSY1FI0EY+hPPL2cZ4qK
         gIwVh1aZm120SO8g4s7TzWUloXUaj9/LJEzWWGqwCLvAjZGfgzTlKRuOXqAvXRiBwP/5
         fpAO0NTvYqyx723/IXL/c4h0fyc+/gKNrQI8F6m9Kt+M720h3jG6pgaD/yYETF8YxN/0
         vNRA==
X-Forwarded-Encrypted: i=1; AJvYcCUWKI6yOFCKuZtNZRHV/eNazmja716sVHz/ogB/a0Gc7tbARUG9dRwAQ1jjH7+4UvzSIi2s6JL+oanv/YHN@vger.kernel.org, AJvYcCVDXJc5gzWqkhETKDk8rnpsKNLEC5PwFP1/2ZL6wQo7pxf+OVEGo5YN4/CqJTErZLAac3MYA9bB8b0=@vger.kernel.org, AJvYcCWD3N0tZ57CG1YqOAL8q33mKKRSPDK62SsR7VJxC+gatfc6rS0in1f1VDvc6xLSCDWAsSPPPNzNejG6EJWl@vger.kernel.org
X-Gm-Message-State: AOJu0YylzJr9yd6agm4aa+q0zVt9hMkId++7R4Bjbn9mDhkmXkB7kKHz
	ynfaJlhContWJx2LukLlU2X+/rN0cVKmQv7UEnfLa3gePC8hrkvsbggJMHtpFvZwU5o5EQAUb18
	0lgiki1AiYod/1YudfbBNfcfwa7OL18o=
X-Gm-Gg: ASbGncsgpOsMammc4LG1P+6Tvm4w7k9SmcYSNk+uljpuENxhIKsIJtHZcdM9Qdrdzo5
	+gX27bKypY5ayouJtrqBTr60oG8uDCi2ekhxUsgItX53SxITvXpWWEsLLfk6OH5HRVlc6BODXtq
	yTTeTJxPbO0l2ajcLwhvebGYeOJ4TOb1HAJ9li+vfEmmPS8zfnpz2p2ZMjO4Bxz+DhX3Jwk3yt6
	IouM2ge
X-Google-Smtp-Source: AGHT+IGh6YqUFpx+JIdu/8YkqL5G1rRgnTznoIse4KvphEDHD6OBcCQt7Euav83er+DtfxdiEo+7p+GtKQrhaaETdWA=
X-Received: by 2002:a05:6000:2f86:b0:3d2:6129:5505 with SMTP id
 ffacd0b85a97d-3e64bde66c0mr9404161f8f.36.1757362756927; Mon, 08 Sep 2025
 13:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <36c0e5e9d875addc42a73168b8090144c327ec9f.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcMV0BOJyvx2nciCK2jvht-Hx0HnFtRzcc=zu+pQSOdVw@mail.gmail.com>
 <couuy2aawztipvnlmaloadkbceewcekur5qbtzktr7ovneduvf@l47rxycy65aa>
 <hw7xa2ooqeyjo5ypc5jluuyjlgyzimxtylj5sh6igyffsxtyaf@qajqp37h6v2n> <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
In-Reply-To: <epbqhjyfdt3daudp2wx54jsw6d7jf6ifbr3yknlfuqptz7b4uq@73n5k6b2jrrl>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 8 Sep 2025 22:19:05 +0200
X-Gm-Features: AS18NWBlgrNec5HQDqXuFdTg0l1auT_Opy5K148gspXva4oeYyeCVxabENuTdwg
Message-ID: <CA+fCnZdJckDC4AKYxLS1MLBXir4wWqNddrD0o+mY4MXt0CYhcQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/19] kasan: x86: Handle int3 for inline KASAN reports
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

On Mon, Sep 8, 2025 at 3:09=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >>I recall there were some corner cases where this code path got called i=
n outline
> >>mode, didn't have a mismatch but still died due to the die() below. But=
 I'll
> >>recheck and either apply what you wrote above or get add a better expla=
nation
> >>to the patch message.
> >
> >Okay, so the int3_selftest_ip() is causing a problem in outline mode.
> >
> >I tried disabling kasan with kasan_disable_current() but thinking of it =
now it
> >won't work because int3 handler will still be called and die() will happ=
en.
>
> Sorry, I meant to write that kasan_disable_current() works together with
> if(!kasan_report()). Because without checking kasan_report()' return
> value, if kasan is disabled through kasan_disable_current() it will have =
no
> effect in both inline mode, and if int3 is called in outline mode - the
> kasan_inline_handler will lead to die().

So do I understand correctly, that we have no way to distinguish
whether the int3 was inserted by the KASAN instrumentation or natively
called (like in int3_selftest_ip())?

If so, I think that we need to fix/change the compiler first so that
we can distinguish these cases. And only then introduce
kasan_inline_handler(). (Without kasan_inline_handler(), the outline
instrumentation would then just work, right?)

If we can distinguish them, then we should only call
kasan_inline_handler() for the KASAN-inserted int3's. This is what we
do on arm64 (via brk and KASAN_BRK_IMM). And then int3_selftest_ip()
should not be affected.

> >
> >What did you mean by "return the same value regardless of kasan_report()=
"? Then
> >it will never reach the kasan_inline_recover() which I assume is needed =
for
> >inline mode (once recover will work).

I meant that with the recovery always enabled, it should not matter
whether the report is suppressed (kasan_report() returns false) or
printed (returns true). We should always skip over the int3
instruction and continue the execution.

