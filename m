Return-Path: <linux-kbuild+bounces-10537-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ABAD1631C
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 02:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D46103019B47
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 01:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654FA274B40;
	Tue, 13 Jan 2026 01:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1+tv2it"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BC23D7DE
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Jan 2026 01:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268690; cv=none; b=iBSbldPt+hkDVdhBgXyESnTWMI0t/cYSj9Ta2BLmlAZ/TaCrz3LSDZsMrGoy0EaBj8W8g0iGftPqJLKNnLJBKSXPNCMYEPN+qrs9pYBV2JrbuD03sf0BuOD+IovuWemlzzOGPKcB00RJEJU8K/7UT5LJ7AeyAikKDpgX17tRXH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268690; c=relaxed/simple;
	bh=rzrjC221+4p2F3nUmD1KU5yTvAmfj72IKccTj/qfT6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKrm0ToF8Js5GyQaN3qwIwcwraQj+sOdDrSm4OEURIBPsZ9phtFWUgxei8vLBq/9aYzfbOmIccTsyjvn9lnJK1sx4amuEkkDnuVJYlhydy+NWrYvjdKJtfxDjQ1+3bQlFSwGTANsfnsPLbaKpUm7K+uzSSyqEwSIXVddrWPnRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1+tv2it; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-432d256c2a9so3473623f8f.3
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jan 2026 17:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768268687; x=1768873487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QXuf4cwRpBOzqTZvP4qMKCqVPPc0MElEg+LdlADa3c=;
        b=i1+tv2itsqegd2gAv1GRfllqhV5epd/v+tPtGbTy164dPvtJcyb9YmKWI2fCHWkDZH
         Fq8fiJB2gBQ9wme1EiBfx38SVhk2drWlObHxNmoFJ4NGZ21qSOfYkr/ULpLBp70l6deN
         NLStcmUsXPf8Xhtd3dAazJZZOBycM8CxCjoBhp5ssBgWhEmWG9QBOsVOmvg7HZmIVsIT
         QFliazRL17gSnnscSGdaLuJUTmtyE+QCh4X/uxJ/XwJM1eXFBxGHzHhid9GaFSGwrNxX
         eu1ceX2twHbU77nYYowZVoijyvmzbgVW2gCu9k6fo07LclE479RrFoLoiY6r0NkRJo4D
         luvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268687; x=1768873487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8QXuf4cwRpBOzqTZvP4qMKCqVPPc0MElEg+LdlADa3c=;
        b=RFBx38B4QDPDTslKJ0xiLKmJ6j6G7kXMVye2p8KMK1JWRauNDOukp9yfWDjVlFu3XD
         Wsp7AlKBBEBr071TWiaLDGyrIbR58QYEaAPrZ862zUXSqMziFF9Ud+wOJZf3eb6MJMcb
         0V2Rxa+AymWpr1q6R7lO76uYLeKf84N/hEkxKxtHQXKjAsBhZJSS3fNhuJmuVHWRwknO
         WlgVuwAkDmn4pQFYOB0/DpA4XLV/+L/ATg9UsPf+497zsKBCNvVFO8mYW8ykHij6njQ3
         FwZDr6Qp6/RfYlrN1gKgGRLNK+wQLrb3AA205YfH0YibabTw1f2/sgif+YwEI1T4yXqz
         cHPw==
X-Forwarded-Encrypted: i=1; AJvYcCVsH2L2FZOE5RX6Vm7qeJiMTvwahnenZb7Bu9tsGmCi4nkn2Hi3lAd/Rrew/ev2NJQ2qL9DaQMCDgxXUpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgr6gH5tNJtZEW0QrapU0tu7ctPA6BgVBc/Kn9UOq3CxY7inj4
	FTCZyWff/IwrohxmRQnXVUgS8aoDLuOKysHkcwbzB4mKtLvqNXa+eOyO6FEpeR7++Eq1aHayGhl
	IrDrhpxpdaL9x6AfGiL0upcANlPmwsHU=
X-Gm-Gg: AY/fxX7WEa2tjT/xC2s04+AFTQsz3LyWMPcwPot+K3kSwxtcV64Q+jTX1P7UKyj9nRv
	yA3fY9PYwmAkgDvsqu4uDIMzX5wv0oTJDMjrrdV0DL1u6K9v8h45EhlE/nVROrApwSIuFcoZidV
	q+37k2UQOZpKavtkAGPrcQWZkkoN0SHr3aDAYPaxnKKgYl5yaqkRfudJuCF9kLVfF73llu+ntSA
	FNhXxbyIu8mSEV1NLmOGKSHc1FUDPkKKwUZ1Hpc5n7Ok17LtENwFQfg8Lz5YR5cy7rpeSTV0VJf
	2JHq6Z3aAsBj16bTOVKfa+s88lCNQw==
X-Google-Smtp-Source: AGHT+IEebGw6L+DCEowzC1fWnpJ9/6F/tHC8QlJPrsrlqIYFHxBkcEnJQunhABrVxJS4ojuoSVylquTQBlixDe2/UhU=
X-Received: by 2002:a05:6000:25c6:b0:42b:4267:83e3 with SMTP id
 ffacd0b85a97d-432c374f5femr24312893f8f.5.1768268687045; Mon, 12 Jan 2026
 17:44:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768233085.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1768233085.git.m.wieczorretman@pm.me>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 13 Jan 2026 02:44:35 +0100
X-Gm-Features: AZwV_Qg49kJdgHS5b0feyJ3FQ4qpkZSxgMzwvg9-kXkrvqB0Op5YiaAIZPipNv4
Message-ID: <CA+fCnZf5NMa=_Aic_gVQ05rvAvYx0xUpbZ=hOg2=7A9=ZbPdFw@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: corbet@lwn.net, morbo@google.com, rppt@kernel.org, 
	lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com, 
	vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org, 
	catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org, 
	jackmanb@google.com, samuel.holland@sifive.com, glider@google.com, 
	osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org, 
	akpm@linux-foundation.org, Liam.Howlett@oracle.com, kees@kernel.org, 
	jan.kiszka@siemens.com, thomas.lendacky@amd.com, jeremy.linton@arm.com, 
	dvyukov@google.com, axelrasmussen@google.com, leitao@debian.org, 
	ryabinin.a.a@gmail.com, bigeasy@linutronix.de, peterz@infradead.org, 
	mark.rutland@arm.com, urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, 
	mhocko@suse.com, weixugc@google.com, kbingham@kernel.org, vbabka@suse.cz, 
	nathan@kernel.org, trintaeoitogc@gmail.com, samitolvanen@google.com, 
	tglx@kernel.org, thuth@redhat.com, surenb@google.com, 
	anshuman.khandual@arm.com, smostafa@google.com, yuanchu@google.com, 
	ada.coupriediaz@arm.com, dave.hansen@linux.intel.com, kas@kernel.org, 
	nick.desaulniers+lkml@gmail.com, david@kernel.org, bp@alien8.de, 
	ardb@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 6:26=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> =3D=3D=3D=3D=3D=3D=3D Introduction
> The patchset aims to add a KASAN tag-based mode for the x86 architecture
> with the help of the new CPU feature called Linear Address Masking
> (LAM). Main improvement introduced by the series is 2x lower memory
> usage compared to KASAN's generic mode, the only currently available
> mode on x86. The tag based mode may also find errors that the generic
> mode couldn't because of differences in how these modes operate.
>
> =3D=3D=3D=3D=3D=3D=3D How does KASAN' tag-based mode work?
> When enabled, memory accesses and allocations are augmented by the
> compiler during kernel compilation. Instrumentation functions are added
> to each memory allocation and each pointer dereference.
>
> The allocation related functions generate a random tag and save it in
> two places: in shadow memory that maps to the allocated memory, and in
> the top bits of the pointer that points to the allocated memory. Storing
> the tag in the top of the pointer is possible because of Top-Byte Ignore
> (TBI) on arm64 architecture and LAM on x86.
>
> The access related functions are performing a comparison between the tag
> stored in the pointer and the one stored in shadow memory. If the tags
> don't match an out of bounds error must have occurred and so an error
> report is generated.
>
> The general idea for the tag-based mode is very well explained in the
> series with the original implementation [1].
>
> [1] https://lore.kernel.org/all/cover.1544099024.git.andreyknvl@google.co=
m/
>
> =3D=3D=3D=3D=3D=3D=3D Differences summary compared to the arm64 tag-based=
 mode
> - Tag width:
>         - Tag width influences the chance of a tag mismatch due to two
>           tags from different allocations having the same value. The
>           bigger the possible range of tag values the lower the chance
>           of that happening.
>         - Shortening the tag width from 8 bits to 4, while it can help
>           with memory usage, it also increases the chance of not
>           reporting an error. 4 bit tags have a ~7% chance of a tag
>           mismatch.
>
> - Address masking mechanism
>         - TBI in arm64 allows for storing metadata in the top 8 bits of
>           the virtual address.
>         - LAM in x86 allows storing tags in bits [62:57] of the pointer.
>           To maximize memory savings the tag width is reduced to bits
>           [60:57].
>
> - Inline mode mismatch reporting
>         - Arm64 inserts a BRK instruction to pass metadata about a tag
>           mismatch to the KASAN report.
>         - Right now on x86 the INT3 instruction is used for the same
>           purpose. The attempt to move it over to use UD1 is already
>           implemented and tested but relies on another series that needs
>           merging first. Therefore this patch will be posted separately
>           once the dependency is satisfied by being merged upstream.
>

Please also update the Software Tag-Based KASAN section in
Documentation/dev-tools/kasan.rst accordingly.

