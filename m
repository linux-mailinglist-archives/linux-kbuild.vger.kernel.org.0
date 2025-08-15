Return-Path: <linux-kbuild+bounces-8483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C1EB28296
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 17:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 755605E7026
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 15:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3B020297B;
	Fri, 15 Aug 2025 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="mZKauASq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88C204095
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Aug 2025 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270352; cv=none; b=abUqzd4c2JxWdsW/IisjVutSn3ui28jnEDFNOYvzKrDsJbhWEW9TuKSq0sCc/yfJ3Png5zN6WfPMZvoucTji9euSCCldQl7dCNwOkJbbiRf3GpXP+wzPtHWAVEzos7GnCEtf3JKlUPtDJkSjCRe2hdeNgDbhWawsG2cZ6n8PVNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270352; c=relaxed/simple;
	bh=wNfhEAk3rnqID1OBHwaELciuLi86NZwkA7swq1t5JdI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LkKMj6VKpd95BrWgDo5petM+P+xaW8E+Dz0aErbUGyYzTkT/ZJuMIdLDxuwIInkjFIRDeq4thrd4IKDqgzZFLhfjVcSlTm1gtTsZD6Plzue/LzVlHHHW5qwNBEbpk+04a6AX1EPaqs3Vs3kmM5kMaB2hD5lBOMQ2hxIT+7MRAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=mZKauASq; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4716f92a0aso1401999a12.0
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Aug 2025 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270350; x=1755875150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=mZKauASq6wZkezrwzg5EsqpZPzKSyUiLiawcT9BlsvW3YiILWWbdCLQfpTP13qY6fB
         oZwx20nglnVNrDmmPfk4aePlJDu2TAg1mBu6EglTB/5H97T2cGuSu4PxV7HImr8TrepE
         68t/id3y3tOVHNYVxVkwTaIc14VHd7H1o9mUsS4bzQlMJR/z7XxZmVnGsRHSebQYgnEV
         rSZiKzLN5z5qnW2SjxlNV1Brx5GmqFnBIIZxMHmU2kyWh2/WybeT81JLEcA4kHv1QC8W
         CS8Wu00IF1ktWN/Ff/zHUzMA0yvpQqSCuCbC8nUpYkKRabnJW3fuJQ0QupC66XAb6JiG
         WqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270350; x=1755875150;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=A2Um4jLwVbIFbUB+TGC8C/WmOwVi6FIUZO2hOMR9jG5lA0maSQ1hRSx7BVuOowssV1
         3Dt35FLdImYku5UTvVT+iKkxvrKqs9x49GJO2ElK09oYVRLfdA1RazA9qvR7C/8y38VD
         /Jm+EOTfG8d/TD+RTxLY24a1fEslxUb1p0L6V0jO02P/U15KlmQiWLNB5yWqgZcrrwj9
         ORq8wOCOX6RrSFyC88mZJpVJcfIeprOaEhCq0h8Iwo30e0j8tCyJRHxJouX/M6TK1miP
         V1YHakWAqbe9lPSWLGZeQ9hLtOY4+9q22JaeFqtCx34u7kA6qM/U8sRO0FWRjfpp624Q
         dxFg==
X-Forwarded-Encrypted: i=1; AJvYcCU7y96XcyeOQ+vJBp4gdQ+CVXxANOYr109hdiMRFno545W3g1znSPpYrdajQGcrO0Amz7Ti3QLtZ2Cx4ts=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu5c8Zuw5mAnonIww/QmRbkQCGWBT8qMougm/u428mbaT+uvMv
	r/A8jfNwR9XYceYmQCJeBnSBxU1joRoEHP6cDK815YYKy6qNXhiIhIde2MYpB1JAHJM=
X-Gm-Gg: ASbGnctLtETj2MMjeG2h+vYc4ln4+7weN1QYiMXscBw2FNotvUtHM9vio7tOdlykCW+
	2K4cuamDFrSF2eM3OwjZyZc2UbBVhzR6ApmKjlnF20Rnk8PyoOiXddXjFM7evHZP2MTlPdS96xt
	eAmQgJBsqZVaQDvk2q6KEZY2pE4p5BNo8hGW1EHlOY951y6ZKQDGqrsMud5V8ONQBqnHukjrnPr
	9qc1dS9ufMJoDZUPpSDC3/z5nKYBvRkF8Xwmbzo4QPOCDLFdKBxiiF4Xu7W2m8PQakp4ag/WIDN
	DfoLt+wjQmzELhZ5viXw0e1uevbJbTavDwXMPR6RALi9KkP3vTuNBgXpph7HRKS/qP041qn2GRP
	+7rkFI6adED3o5czmYS8PnScWtmtd1o1zAKg=
X-Google-Smtp-Source: AGHT+IG3gBMogdOr+spUGY65daTLUVfmz5lhgO/opdXo6UimhkccgL0C2Gx+F8DUbrOBq4AI/2z6Vg==
X-Received: by 2002:a17:903:198c:b0:240:a222:230c with SMTP id d9443c01a7336-2446d5af743mr41307075ad.12.1755270349908;
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446cadf96fsm16286885ad.41.2025.08.15.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:05:47 PDT (-0700)
Subject:     Re: [PATCH v4 06/24] riscv: elf: Move relocation constants to UAPI
In-Reply-To: <20250812-vdso-absolute-reloc-v4-6-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-5B6E084E-60EE-440E-BFF9-5E81AAC9A473@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:19 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> These constants are useful for cross-platform userspace, for example to
> process ELF files during kernel cross-compilation.
>
> Move them from the kernel-private architecture-specific header to the UAPI.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/include/uapi/asm/elf.h | 66 ---------------------------------------
>  include/uapi/linux/elf-r.h        | 66 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 66 deletions(-)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

I'm going to assume you want to take these all together though some 
other tree, thanks!

