Return-Path: <linux-kbuild+bounces-9530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D50C486C6
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 18:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B4A3B77D0
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EAE2E54BB;
	Mon, 10 Nov 2025 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nRaz1H4j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB5E2E5427
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796956; cv=none; b=l4TzZKlfvuz1eVMvIsdCNAUosnmj/dPpU9YzZIdeO4PY/dyt9TP70XLZLYJYuPsIsrWIVfY3hBJx72J3g7ahbM5UIRJ2W/qBi7VJKvnqM6Xs9sh+6c9fHyHWNCPKdURRnIe2zCNUfcJIeMmiUpaiHzkPU/PxYBzuqEEhOfHX3Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796956; c=relaxed/simple;
	bh=O98arH5WjcI5ZayKxsmOANfoxY47t5wDmB6i5QtbFzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dB1Pi3aKcoH+oS3COPSjlr4e6DjxCgPHaPS0Gsd21A00fHDK5igbheFmNPZ/rZdsfhTpUrYA1fglhiObOWMfNzGgzdzNXI1NhnRgEWfTCAkE8kvuDEe1mLWDPqJEKeWUhqWhoQs4nRqgm8BgbTiyi6BMuP2PglTxt0v3e8SxhNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nRaz1H4j; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88058103dcfso23992136d6.3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762796954; x=1763401754; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPbi2NPPrBKl69IkN7kcBKOxfNw5kLfKkjmbVe2fGbs=;
        b=nRaz1H4jWcNq5aIIMP1HzMyzpXUE547dlrLoh9EEQXJSuCzeEmLTrNGOqgOIyzgxxi
         +4IxsSc9/xH0X92oJKKEHX5/Eva4+4NjRJcuZLk/Ah1PozRGH/9qgW1d58nsKqXSiEUZ
         R94HC13GQTfmF+o3k64nrAJFhgB7tRETmKjcJaeIgJwdwLCdOwiuGl9fXTGmiDOlm8xq
         W7zInIYwwqKhB2X/8sdIHYY4y4yVdtATJe3k3vIoBMisK84GJP9ei+GoZ/LqOWlyahr5
         O/RHBC0rxI/wRA/C+Dzi/MLypGcHkUzdhmyHtv3V74PEYHPmHuQDIbmIjtwftXvbdENa
         648Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796954; x=1763401754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPbi2NPPrBKl69IkN7kcBKOxfNw5kLfKkjmbVe2fGbs=;
        b=YSNq/maPhJuhPtDeCe7GsMfh5NHdDCF0xVqHJHVp9+5GCV4BuVRYTqTVBDahPULOyO
         bG0WdBxxY8sOtcYdpsI1JJ3poBIv5MZY5A1CFiQ/aBotFMFBqsizB1aFl6fG2T9Rlq/W
         6Gl33x7DBQ4OSPFSfFzH2fybQZ71zz8qtD7kM4kGu+rQSpOKD5E7maYrqsypTuks3GZ5
         D6wVtbAT8G9eddm6pXx0MjF8hkdGOvmVOscBTmH4FjeM9TiyAcTh1tvMFHILgdNeYTSd
         2TxwmIp7+RexHbvXJ/szpVdiuW9T6Gzg178e+VrAPLcjFVzS6KU1YQIbpR/+bDUyumR0
         f/Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWvLeVdM4Gl764jJreKZtl0UGe3j2CB3kI3cRS7WJ//9sqbyf3PFS5WGqWrMYKr9PGLKA85B5Oao1/noK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy74suv4WdrpX31d4ECHPIU2n5n9qIksoc3TrpjR50L6AJskUzs
	Pfjcnh8I+5v5JAoBA4H0NgwhRzfgbbW0BwvkVgkNPYd61Pdlxai0u0PEcJVFZsWZecvExZo8zpv
	HxEPCLO3ZCe0e+css5+wfOZZNetfmRw6rQzgabFri
X-Gm-Gg: ASbGncsTvLBzENuqGjuq9lQiJWH2QKktG5UG6ar9S3QDWyTwtop3xTge+FNxbxkBcTM
	7+RLlCh5TQfvkgCXTz44o1qumPL4wKyDw01+ym2aJbwqkE/YADrRY/l8dekyw4XPIgFVImwNE/B
	aTxSmJEPw1pEEdLURIhzAVgZO+Ob3GmcMJDIK7ZVHxi+4izzHwfUTBz7sGR45u9kWlEFXx//jV2
	qMtofIQXyV1B8+K+v3YB3SW/ucy0KUDFoYpxwUGpsJK9Q8avoPGfx4Py/synrDL7MHIk40ogcFt
	Et27suERYcPK7/VO1PTmjHmSyA==
X-Google-Smtp-Source: AGHT+IHaNRtCNWgUYc5RPhLYoD+nULNJ4nH9LNtSZkCbb+Nk0d7DtvBVzdaKV0/uL+kFEgmffI/ryLd+1MDzyV+BJT4=
X-Received: by 2002:a05:6214:1cc2:b0:880:4bde:e0cb with SMTP id
 6a1803df08f44-882385de9demr131074376d6.29.1762796952867; Mon, 10 Nov 2025
 09:49:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <0ca5d46e292e5074c119c7c58e6ec9901fb0ed73.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <0ca5d46e292e5074c119c7c58e6ec9901fb0ed73.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 18:48:35 +0100
X-Gm-Features: AWmQ_bkJUSMUoO8onDW_Kv00mrjnva_voIrMRMQdowErjlplIdY_Q4t-6BqV8ig
Message-ID: <CAG_fn=W033hGM7_jnj0irwW0gc6McLw2nbhfZROWfieqKTxVdQ@mail.gmail.com>
Subject: Re: [PATCH v6 14/18] x86: Minimal SLAB alignment
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

> diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
> index 69404eae9983..3232583b5487 100644
> --- a/arch/x86/include/asm/cache.h
> +++ b/arch/x86/include/asm/cache.h
> @@ -21,4 +21,8 @@
>  #endif
>  #endif
>
> +#ifdef CONFIG_KASAN_SW_TAGS
> +#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)

I don't think linux/linkage.h (the only header included here) defines
KASAN_SHADOW_SCALE_SHIFT, does it?

