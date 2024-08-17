Return-Path: <linux-kbuild+bounces-3056-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DBD955410
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 02:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D3041C21AFD
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 00:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E2D39B;
	Sat, 17 Aug 2024 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAPWM2DT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E533E1;
	Sat, 17 Aug 2024 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723853632; cv=none; b=pohqqsriWuONWfbKq2I9SH84Ye7wJsOt51dCjZZAd775oSWhstvkgkzbdwWzXem64N+cFiL62ZZVkNWC+IQWot1TP594IkP8raGkJWQMQ955w+TomMvdoXLP+pFJuJ6+mVIYCcjW5Pq/nstItOzxaMG3sVBDngmqkojtElnGRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723853632; c=relaxed/simple;
	bh=3HVlOoSaHjxcJtIpzVhJ2EEpWDtgKqdfoAvIwk0krVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1cXZrI1v4+uz+dFCf5neOLEiKl9yGAlNXhOQtUwbaohAF6HgODr+/BY4pmld39bBAwW4ke542Su5D2d8IC6p+7grnLBGy8eHMyll+zT/bStNNx9tKAXHh/CnHzhY2sppMta+/5MaD81miBZSOOOz2fJTPpCITH08VzjypEJhUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAPWM2DT; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7b594936e9bso1757023a12.1;
        Fri, 16 Aug 2024 17:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723853630; x=1724458430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=orKEJYAdBIcqnwofGrE2LY4UvzofdPCTuKCAHjekjZw=;
        b=YAPWM2DTmVQrQrgX9YvKoEYl59pgwLI77mzFhCWYFrOVx1XOzM9ZeBEoCg2d9CFIhD
         4f4Ah+5CnfUm5Ca19Qa/NZmOVaY6kEv3AEEjvkAwnXMoQ35+fkn4adTuwpSISIMcidIi
         RqvUJMvKhBK+d8W9w9E32sLPAjGFH3sjoAiQ6afknNzrL5wm94fw0fa8n0Bb4CDmyMph
         akXWAXKGwjSA2/jJ4Qz0kbGLJ5K5TEkT1Dag+jWt1PMtTXHEPvjtkXa6uvktm6VTHep5
         Esxe6/UE2eatSIle8/8s9vWxgF+gdgwve2bwxHLf5iqYV7PwpNZLvt88S6y4GL7ea0A8
         rNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723853630; x=1724458430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=orKEJYAdBIcqnwofGrE2LY4UvzofdPCTuKCAHjekjZw=;
        b=hmMdhAzfZwSM5H4hm4hs9mdSa8HhPNxII3h0OWs8BBpbjCSds2293FjCG61wpfdnJb
         19K9VmFenjZLUqOcERM1iMLFJ6Wk2VpkbojVs5MHVPRRa9t8ecHMx9jSfsyCd3Dy0icF
         hpwEjIj+w+MI6VRb+2O2VKt/jF0o1aQnc99vvwVArd9TAE9101mshieLLS4Nfwd4uRnb
         ip3N3ccLgxidZ/XFL69d0ujckrzo8CL9epZcVfvrYu/hNd9VOxYCTknDjPH6pdzOL7aq
         dWl71MLvFFnTsf2Sb201T7cbmUfofzoSVybEAU2Lkury0A4gDjKq1ct0XWkkRb5m1eaZ
         H1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSvNlRGHUH4PTPGzfKJeFwx9T1MFpxY2td5cQpkiDnxF+QncaPqQOUWuWhw8YkS8VCsnjdpyFacYdz9vuImCQmR3bNvyGPDYsKVhzvUiBisTynL33xCAkg+Lf6z//WibsoRi+o+Y/Ku5Hxkq5ngsytfy05OeM5Pf+fUUqQjqcCwR4B4kefmG5klAw=
X-Gm-Message-State: AOJu0Yz2lzKBslOiZJW83fgib+dRDpIb+f/N7NMLgGJAnBwGDdBmauDZ
	Vm/CQqm93+pUqCeabAcUsPpPGit3b+vn+QAWM2KON//khUvYq0gO
X-Google-Smtp-Source: AGHT+IEH9B3oI0gJFVzifTXR7FCn1fNnmN8LJvHyGdRm3dKrf2Frh6i1NVY3qyfddffDfh4yDkMN4g==
X-Received: by 2002:a05:6a20:b71c:b0:1c4:a55b:8146 with SMTP id adf61e73a8af0-1caa3635fddmr1311059637.26.1723853629683;
        Fri, 16 Aug 2024 17:13:49 -0700 (PDT)
Received: from Gatlins-MBP.lan ([2001:558:6025:79:9460:fb03:8dbb:8b69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61dc929sm3583010a12.40.2024.08.16.17.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 17:13:48 -0700 (PDT)
Date: Fri, 16 Aug 2024 17:13:47 -0700
From: Gatlin Newhouse <gatlin.newhouse@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Sami Tolvanen <samitolvanen@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Rust KCFI support
Message-ID: <oehf6r5eftrnuvzulg2yhukf7gjh7jltfdqmtffiok3ro63xe7@y3iplw2gpcy2>
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>

On Thu, Aug 01, 2024 at 01:35:16PM UTC, Alice Ryhl wrote:
> The control flow integrity (kCFI) sanitizer is an important sanitizer
> that is often used in production. This patch series makes it possible to
> use kCFI and Rust together.
> 
> The second patch in this series depends on the next version of [1],
> which Miguel will send soon. It also depends on [2].
> 
> Link: https://lore.kernel.org/r/20240709160615.998336-12-ojeda@kernel.org [1]
> Link: https://lore.kernel.org/r/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Fix for FineIBT.
> - Add more info to commit messages and config descrptions.
> - Link to v1: https://lore.kernel.org/r/20240730-kcfi-v1-0-bbb948752a30@google.com
> 
> ---
> Alice Ryhl (1):
>       cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
> 
> Matthew Maurer (1):
>       rust: cfi: add support for CFI_CLANG with Rust
> 
>  Makefile                        | 10 ++++++++++
>  arch/Kconfig                    | 16 ++++++++++++++++
>  arch/x86/Makefile               |  4 ++++
>  init/Kconfig                    |  4 +++-
>  rust/Makefile                   |  2 +-
>  scripts/generate_rust_target.rs |  1 +
>  6 files changed, 35 insertions(+), 2 deletions(-)

To test this patch: I started from v6.11-rc3 tag and applied the new version of
Miguel's RUSTC_VERSION_TEXT patch [1] and the Support Arrays in Target JSON
patch [2], before applying this patch. I am on Rust's beta channel and
Clang/LLVM 19.

I also built a v6.11-rc3 kernel without these patches to establish a baseline
for LKDTM output in dmesg when testing CFI [3]. I built the v6.11-rc3 kernel by
starting with an x86_64_defconfig, then enabling CFI_CLANG, CFI_PERMISSIVE, and
LKDTM.

When applying [1], there was an patch does not apply error. I had to manually
change the init/Kconfig RUSTC_VERSION_TEXT to Miguel's change in [1]. No issues
encountered applying [2] afterwards. Similarly, was able to automerge this
patch without any issues.

Then I built the kernel starting with x86_64_defconfig and enabling: RUST,
CFI_CLANG, CFI_ICALL_NORMALIZE_INTEGERS, CFI_PERMISSIVE and LKDTM. Compiled the
kernel, load into qemu with Busybox rootfs, test CFI within LKDTM per Kees's
blog [3]. I saw the same expected behavior from LKDTM after applying these
patches when compared with the behavior from LKDTM on a v6.11-rc3 build without
these patches.

Link: https://lore.kernel.org/lkml/20240808221138.873750-1-ojeda@kernel.org/ [1]
Link: https://lore.kernel.org/all/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com/ [2]
Link: https://outflux.net/blog/archives/2019/11/20/experimenting-with-clang-cfi-on-upstream-linux/ [3]

Tested-by: Gatlin Newhouse <gatlin.newhouse@gmail.com>

--
Gatlin Newhouse

