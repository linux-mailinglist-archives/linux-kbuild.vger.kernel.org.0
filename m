Return-Path: <linux-kbuild+bounces-9559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB1BC4CBCE
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCE5A1889B28
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B626D2877CB;
	Tue, 11 Nov 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bDI6rpIX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5A4221FBF
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854220; cv=none; b=Bkw6HyhnzU8sLBc8ufASjLPDMKM83xvXFIV+Guqwkreo3Nj5X8NqjN2ULZJLRVgbDXbv2xpIGZoPqzliEt0+bi0eGHXSRRnXoYXuugCPC2kOAfM9vFoIznkYgHOwDi/cYpwJar+MsTPxOouO18Pm8xYh5SsOH4+STXhj0SzlDuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854220; c=relaxed/simple;
	bh=pIXt5RY2avngREVQV/WVzy+4eYrZh/+QLtTn4Iny2dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdGjeYHWnDYmgOk74p3dqA9Dx9kmdxw7ngKGkC9ZtqmwAsOERTLygKBhpWuUB12byb/Do3HHz6CFw0ALx0boAooCk/tSBUSF7LXXSmQz9HPs0N9+Je9g+Fa/Qy/phJNnCa1qJfils7sHPKLHalGr8nlDk59HQ5cUjmtOSQU3zjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bDI6rpIX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3418ac74bffso2886887a91.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762854218; x=1763459018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIXt5RY2avngREVQV/WVzy+4eYrZh/+QLtTn4Iny2dI=;
        b=bDI6rpIXP+VW2NampGr8t7hh8Ew6NtNigDPB3koLxGn1qiiXqZTHvBzvF4LWvCcpie
         flg5+jhfDcXJcAx627ZwaAODmfN5uIs4uUoGXULR/fI6jc0pZKdchmt023fiRLfuYgYO
         2cFJ+lV7JQSiX9TkpF2iyVq7+1x5WuECi0S2/82aa1KbPNw4IHTLhknhkhlR5pUlVkHp
         SCH8nl6PEXDaLYMh6ugXjkdT6KwkahZRD8WytJMwxt4k8GBOdogALG2kzeQLN4eezV+6
         n701TG65idRjBYGoxWzbIQLodKpsYiK3a/TivfTIAqJvbmjKw9swCowpDTlR8a8vaKfR
         xS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854218; x=1763459018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIXt5RY2avngREVQV/WVzy+4eYrZh/+QLtTn4Iny2dI=;
        b=NiTfbSzHQMYxg8dVnQvvg5/5pZzrBdunflw0PW2Evf/aDGr2fYH+cy3/hP41qMLR/1
         H9mbEpnKgQcv4b6auE+OmzMv/fW+6Lpohlwtknp7F8pjddh1fT1hZcu55mqrXi8fYe0t
         6Wt12CIJtxOPIIeBGfysGL8pJqn33wKowkiepYOtOk7a7iSPVGbOZ1rGtyFtScFCO9VC
         I+jAXux4if0J7vHX01jc0eR7l3F9h9b8woRCBhvrOOVWWB9vlBYHfcyfBZHop1dqKsan
         ZvZpon92NvNYseWiHUwx+I3+ik6AOy58/WUcd+aki/NCPdABX7UwQEUIon8/WjlKhWfI
         bPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQCNUflHVKS8aiDDLYQ2/YsKr7adlLPExPS19rneefn1PBSz12HejTgK51BGuzjfOAJDEHHWjCuODuIwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17YZkYV0ET+XvzUbC9pQIAum+SZH8Wtl6f34kbwk2OZfFQlRk
	B00MMHKCxMMcqzewGAiXs9qkhwBywaWjub76cckZwTXuPc0cKldAdvhKa8NBkL1gVO0tyIiEvWF
	XP/gvVDvagx70Fb58ILryJ7QM2ZvrqYzngdJh30Y1
X-Gm-Gg: ASbGncs6X0KCed5jSq444ctPKCzLPlVX82qXHc/mkLSsEjW7TpZF0dwvZf9MeWYJ1lr
	TQnAIAHPb0By5//pswbAbLqm+QllLs2+Rn8An9gDxjhkrCD261dKgCAQUrtGFFaG7mPaeMrYY6g
	top6FdjE5InNlCA13aJZBY1GMJf9RioaL6eDB0fE5+t7KgNCKJbwq8S49uaNB6qGQVZziJIsw5b
	B2PAPejQYN4xk85EwPoSfykIFaJZ4NofrA6zE2oi45wzCEvhuMcwMli2az3CJcF4sPWfz71rTCr
	WGDmzshX7fieSt/LRnWix8xXk+aImvMyrfRe
X-Google-Smtp-Source: AGHT+IEXo9sAHez4NR7EbhnospiZemL/LvJQCJ/Qa++0OXR1ORpXnOCB1WU1DKZb7CVWmG9+mXoqaQaxouu4ZLKngmU=
X-Received: by 2002:a17:90b:6c3:b0:340:5b6a:5bb0 with SMTP id
 98e67ed59e1d1-3436ccfd8dfmr13988152a91.26.1762854218118; Tue, 11 Nov 2025
 01:43:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d030a07c956c1e7cbf8cd44d6b42120baaa41723.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <d030a07c956c1e7cbf8cd44d6b42120baaa41723.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:42:59 +0100
X-Gm-Features: AWmQ_bkUJ_QlWZiGCG2FxZvthHc4c4y_090hZyMeaaw5jt0Qf6xk9VB1Qerb_Pc
Message-ID: <CAG_fn=VUzLi1C9jss1eHV=pPh4QFmWk-fQUbhNwrGNSUk-yKaw@mail.gmail.com>
Subject: Re: [PATCH v6 08/18] x86/mm: Reset tag for virtual to physical
 address conversions
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:07=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> Any place where pointer arithmetic is used to convert a virtual address
> into a physical one can raise errors if the virtual address is tagged.
>
> Reset the pointer's tag by sign extending the tag bits in macros that do
> pointer arithmetic in address conversions. There will be no change in
> compiled code with KASAN disabled since the compiler will optimize the
> __tag_reset() out.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>

