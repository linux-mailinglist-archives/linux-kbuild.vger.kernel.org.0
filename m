Return-Path: <linux-kbuild+bounces-8293-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4812AB1B37B
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 14:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E69F7AE16C
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Aug 2025 12:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4802737EF;
	Tue,  5 Aug 2025 12:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WM+hcqWx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AF0270551
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Aug 2025 12:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397078; cv=none; b=bopxPSJukgRRZwESgRv4BQrMcshx7H2RvVgJn9i1+5VZQXenBZXPx7FbSytstWMpcUeUP4sYEMvcTUUzQx4BSO0epiPo8H3Mo9Fx/wEVmM5npbZU3RVqIq+WBZ9Ti6jlKHTv0eU5nL6dMhxF0XXJWBkotMZ3irUrvi8IGLOePmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397078; c=relaxed/simple;
	bh=SplbwX8kGCEpxQqWeH1rJZnxgDVwZxhX8JHkip170Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPRriPuDYHX2t8tFKHys97CCr+pJwk6OpGltDBYDYJyO+gIXd6pk4us7b0+lZKERRpOp7xDwsBaEaRBFO6P4hOou8cMtIiiW599xdlTwtHKEP4OzEiU9ARE+sUxBdWYBt4A/4MxP6gRJ0eKzC6Gcj0f0iOIO4NNaxICvPHeJWSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WM+hcqWx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-24014cd385bso51789155ad.0
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Aug 2025 05:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754397074; x=1755001874; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yc4gvWW52t1NDKhzxwrmBqGipvg9SoHEPfFiqWrZ+tE=;
        b=WM+hcqWxDhpSvQynQvKl4mbBDlMjFXl2ohOeBLh+H1TPOiFWU51hgdU6jVU387r+iU
         58FEeUUoF8DCrZRQji6b95HnFdgK9knvHbki5iXZ3vjR2b0gY0gSIxz+jmbiRw6KuYvB
         7pgMWyLR6dyHMv3q12KDrRlbgx/fXeaqU6EDiX/CQrOZHl3q/dpllri0olnReEj82/22
         UemfTXJCv7Mbgq9BZFZ2tP6NIIA7u1XxbmsWFXjs7fBqqorrhHsLk1qo7oHlMMWYqU4x
         fbikSJQ+x7Q4kSWn8ApT3149jq2X0Ubz2IR20uXqCnRnEyg0QD1xDK1P2bJ+JLroE8+h
         W3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754397074; x=1755001874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yc4gvWW52t1NDKhzxwrmBqGipvg9SoHEPfFiqWrZ+tE=;
        b=ez5BeX080FBI1RoRLC+rVKBjn8gwaSCy2ms04y56d7suov0FyCBd1nZi0tb/lk55Zu
         xj2Ef+O5B21psiXZo6cmjZnD0t41IzB786EewAEVhSLQ9iA0u13vq1WGVzVAsS+T1oFo
         xqqt1N6R3jqmvXyi+Z92YZdU74A5mLRdn8w+/YgggyPdSsDEnhiO3MXltonDfD2QLwsc
         Q5kE/7eQ/9TAJ3UhCY/Qs8E4PN+RqM5Wtx0prHQjAx85Dx8xtMnWS10AQDdzW6OP0kPQ
         GgCPwVXXEW1f1F0K4LHWWj5xbGMCk4nqKKM5LCXRpbtvMlPmWny5RinwHkp8yv1uGW9E
         Iwcw==
X-Forwarded-Encrypted: i=1; AJvYcCX60OuQvw3YGB1UNaSuJpuicJ8OrFAzp0ELTivcj3Z4l0it6FdQI/mYV9Jmj3AgHvWq4t2QwNxo+NfSqm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGz5FLupl9iPcuRS1EwOePzzkDE9U2DgCpcBMMFVTiCBH9bXcJ
	fxH0JvjvhSO8BjxhCxP9FuGBVn3Y01zFlYhkZLkDRXLwUsmFYSR7gbUUtV3MY9mwLVIh+ry1o1h
	dzwjm62YPdW6PyKwEoRRLL01yndNMtSW5AoCZ90ZU
X-Gm-Gg: ASbGncsn544EyUC59WYHcWgIDmrV4jh2Ns2wARzmqc33hD7Wk/A7U53yJm0q7HQs3rk
	oN8woFC9WOPYYi04K/f46rWAY5UHQVJRoNfPJpTPg3qLnwu6Ip5VINDoGIrLx0LaIups45nVjy1
	KRFB+jWkLNTlJCCoZU0lL2AhooxkSRD0NJ2Kk8WQg+wYmNFqoME3Vbe+XCaf6J15wYueDK88qZo
	KOUZW7aKwEEiE5QWOH9IrY1stpjxldrJtJTyA==
X-Google-Smtp-Source: AGHT+IGPjiYBPWhiiCGGe0rpFKkbh1Rg3FSdLNOsksOA3V1eWAJUxiBJ13PoRIjsobG4RiQygfgDMFJjCSuuK+shj7s=
X-Received: by 2002:a17:903:245:b0:224:23be:c569 with SMTP id
 d9443c01a7336-24246f6b79bmr191772715ad.22.1754397074101; Tue, 05 Aug 2025
 05:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804-kasan-via-kcsan-v1-0-823a6d5b5f84@google.com> <20250804-kasan-via-kcsan-v1-2-823a6d5b5f84@google.com>
In-Reply-To: <20250804-kasan-via-kcsan-v1-2-823a6d5b5f84@google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 5 Aug 2025 14:30:37 +0200
X-Gm-Features: Ac12FXyvqYle1O7urbvJeMSiw9QK6-PDkDpNKV6wtqm4byhvYfbkU7M963dNpMQ
Message-ID: <CANpmjNOJxJ+kM4J7O5J8meSD_V=4uAa6SwFCiG83Vv_8kn56sw@mail.gmail.com>
Subject: Re: [PATCH early RFC 2/4] kbuild: kasan: refactor open coded cflags
 for kasan test
To: Jann Horn <jannh@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Aug 2025 at 21:18, Jann Horn <jannh@google.com> wrote:
>
> In the Makefile for mm/kasan/, KASAN is broadly disabled to prevent the
> KASAN runtime from recursing into itself; but the KASAN tests must be
> exempt from that.
>
> This is currently implemented by duplicating the same logic that is also
> in scripts/Makefile.lib. In preparation for changing that logic,
> refactor away the duplicate logic - we already have infrastructure for
> opting in specific files inside directories that are opted out.
>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  mm/kasan/Makefile | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
> index dd93ae8a6beb..922b2e6f6d14 100644
> --- a/mm/kasan/Makefile
> +++ b/mm/kasan/Makefile
> @@ -35,18 +35,10 @@ CFLAGS_shadow.o := $(CC_FLAGS_KASAN_RUNTIME)
>  CFLAGS_hw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
>  CFLAGS_sw_tags.o := $(CC_FLAGS_KASAN_RUNTIME)
>
> -CFLAGS_KASAN_TEST := $(CFLAGS_KASAN)
> -ifndef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
> -# If compiler instruments memintrinsics by prefixing them with __asan/__hwasan,
> -# we need to treat them normally (as builtins), otherwise the compiler won't
> -# recognize them as instrumentable. If it doesn't instrument them, we need to
> -# pass -fno-builtin, so the compiler doesn't inline them.
> -CFLAGS_KASAN_TEST += -fno-builtin

Has the -fno-builtin passed to test if
!CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX become redundant?


> -endif
> +KASAN_SANITIZE_kasan_test_c.o := y
> +KASAN_SANITIZE_kasan_test_rust.o := y
>
>  CFLAGS_REMOVE_kasan_test_c.o += $(call cc-option, -Wvla-larger-than=1)
> -CFLAGS_kasan_test_c.o := $(CFLAGS_KASAN_TEST)
> -RUSTFLAGS_kasan_test_rust.o := $(RUSTFLAGS_KASAN)
>
>  obj-y := common.o report.o
>  obj-$(CONFIG_KASAN_GENERIC) += init.o generic.o report_generic.o shadow.o quarantine.o
>
> --
> 2.50.1.565.gc32cd1483b-goog
>

