Return-Path: <linux-kbuild+bounces-8485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 039C7B282AA
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 17:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82040AE66F2
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Aug 2025 15:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D16A25D527;
	Fri, 15 Aug 2025 15:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="V1V8vZLL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E77222560
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Aug 2025 15:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270456; cv=none; b=tGW/FBhiH3xOu/rZV7E0ZXW9QFexU2wEusoPnltaQputfDNMTMPA21Qf/xPqbrmn/njgfLSpy2WZMefTt8PN6V+4PJYPtX15wdv9mGIojwoCKyL0qCIOkbYLJdV7HwEkZQ+l/f5vKPT7kmAm8op1N9gpqY5WWZCnyYThcwkSwPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270456; c=relaxed/simple;
	bh=k91CyiH72FbwUJJuYjdfRL6Li8iR2YI2J5hUcfGbFcw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=dt5ifcwAVk+ndol7dem/Nq0DCt2ygE62ipxhAz3W+n0A1Xa5MBP/0hVP2UJWsd3cIR8loQTIEzz9q+zkd/Ly6yiPxViz4slEKFjqSRTnXXxEbGWMwusLALwcYFoL4ohtYtVuVI+cNnNq9ZSwHyK4zGEoBBqxyw8QIUSXdeAsSBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=V1V8vZLL; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2e614b84so2125198b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 15 Aug 2025 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270454; x=1755875254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=V1V8vZLLC3XqTr5BY3aRTEy/7FEkb4phsfSv2eD/3zEGMqChM2sM7tvO/hNvReJWav
         J25J7BRcBMcU9omfdYApgtZxoVi+oPHI7vD7eHOmwQfBl3+cnheLfl8QeBN9odBm0gqW
         sOjtA+pqXn3sgT8EjL5rCARFhCb5jnRNt9MLf80mP4luYaAGPLBMGUAcWzYrIOq/Ht3+
         v/o/W2zseX6QrVKidYWLJjMHZvfqo2Zb6kBqiZzDsX4W6fWwHzTrK9iWknEzPqsw/x7J
         7EXxmC6H68/kce/RywkOZYliG3qecHFSg0ly51rydhuOi4rIBIuER5UrDqihzZozUJS0
         761w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270454; x=1755875254;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSuqWusYtC3hY8ploe0KH7jPL7SusiQWfMM3CIlvAWY=;
        b=PponG9hcggXvh4U8eWvgs2NmmkRx5UYRhi9TDlAwV4r4njy16Q2/BbzghuEzPgXyT5
         naS/EV9rUzIEZDxknjAvKDIJZPrIuf21bbvQdh8HCYncQDdAyrhu2zgH2ZqKaRnhHops
         tIq5WFPcZ9sHXfmFo0dmJByYU11E8aW39WF3Pa0zqAx9muSAznEBvCRxCJyfKUE3DEo0
         15YXxOd20weqN8cOdk+wBiKh7tXwP/VMHe/nDnN3KzWGODj0puOC6a55i8ttywEe4Ojn
         WcmXa2X2/F1QaVpSHuJVlaxHJFxYuCCuTpsC0O6kVbJG4SzZJmoVLXuYe/03xs+eEDMQ
         uozw==
X-Forwarded-Encrypted: i=1; AJvYcCWrkGWJpPwHOS8OwYyk8i5KyJfCZCB9Jjb5IJCKO3DbwjhPSiM3BV4+KMo6mIfFJ2VbtutKLH+bi/Q1T3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFYqisf9qeQRD2ZvEamBE0ZbubKY/000/suchjJAtsfd+zaENn
	wJO3fD566jfk1QMhbSks30XZ5bM1Iv7Ilx9X28PLCh4VTWhxt4E87u5OlEyiUnvxSKc=
X-Gm-Gg: ASbGncteY1BweZ1u0oTYyW1UEqKqGm29i+NxnIaEM8GV7TFc0YngqQR1EalZ2/0eYVB
	k4XqoNynyOrYInYHhr9eMNAmNVT4brs5QJ4Ucu7nvHeRFh7Y2iLujeHYmF3/OQLnWj2V/KBa9pN
	kVD9yon3BA1rB6xvtR9oVHut+FbIj1YaUCW/3Os7wfK9pyPRunuy4KYx8YFsD2YsEI+k+4ZKAZb
	NY6xN2TJsLvpuxYBsny3BBEFr+CCsUgpVjDhp3DNN4FROBL99dpRv0LKIjalYo2VT/pOQfR5REh
	lW3ODb4730MWyZ0fDqZ64ps+No5InZAlfQNhOhZxhxSzmQ/lxdOCTozLrzB/pExnU1HKo1PllVi
	ZG01rdcS2jTxf9laUeWazyXd7JABMwDvo55A=
X-Google-Smtp-Source: AGHT+IGQbGMaqUCBVjgHpE03NJ6lUtJGuN0cfMPLFV18k27l43zYHixLrnt22lRnZXhrjts5z9io5w==
X-Received: by 2002:a05:6a20:1611:b0:23f:f5bf:35d7 with SMTP id adf61e73a8af0-240d3039205mr3462386637.45.1755270453673;
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b472d5e58d0sm1499710a12.23.2025.08.15.08.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:07:33 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:07:29 PDT (-0700)
Subject:     Re: [PATCH v4 18/24] riscv: vdso: Disable LTO for the vDSO
In-Reply-To: <20250812-vdso-absolute-reloc-v4-18-61a8b615e5ec@linutronix.de>
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
Message-ID: <mhng-146EE95D-951E-41BB-898C-033437B27EA3@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:31 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> All the other architectures supporting LTO (x86, arm64, loongarch) do not
> use it for the vDSO.
>
> Its is problematic for some upcoming compile-time validation of the
> generated object code.
> The LTO object files do not contain the necessary relocation information
> and -flto-fat-objects is not compatible with clang < 16.
>
> For consistency and to enable the mentioned compile-time checks,
> disable LTO for the vDSO.
> The vDSO heavily uses __always_inline anyways.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Jan Stancek <jstancek@redhat.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd3022e9e1a185128b73 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
>  endif
>
>  # Disable -pg to prevent insert call site
> -CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
> +CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
>  CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Also assuming this goes with the others.  Thanks!

