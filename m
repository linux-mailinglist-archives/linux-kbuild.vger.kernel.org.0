Return-Path: <linux-kbuild+bounces-6813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA73AA51AA
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 18:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85A2150016D
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 16:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F3B266B52;
	Wed, 30 Apr 2025 16:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y3nBgKPJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013726563F
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030456; cv=none; b=AWMzO0ABbRBzfAdkQRt4INdGjEfHvSZXB+1NjUFUBeEBNx5scGuFwTwlmudcdww9SCArHvuGNxUPPLvAOZsM5mWADIb2y4u62MJCuAR9POuyyofD0sXlRdPHg7XohKGZFAE284zlr7AKHeP06Jy1wt/Nwhke41af66IohE4u8qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030456; c=relaxed/simple;
	bh=64gtqcGZ8wcy6/ozndo3lRwaVc9zcMKebNzxQK1wlWk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dB1pA1YzIw3mOEMNrT511Pj7W9u5fdR1J/uQaDOSGTi6o80OB6BuRrwWzP6gd9dGB0QgrgQ2KpEHmWAVeCHsPoSo2TwhmnDnU0zVlNt7TfSoX6/H7+4luPkslgVn3sfyKptpRFKvtdYMHmk9YZ0AOBlMHlaaCBkZonrevRhP/OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y3nBgKPJ; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39123912ff0so1977837f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030452; x=1746635252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqTf0w984hWi5llfvtlyawmZ56xQei2ohDzGa9Ujg2A=;
        b=y3nBgKPJhRIKLEh3t0hfUcliA8mfBdv9LEUtXQIWRhRfnBY5EHHNmTYXkYWSFjtxoU
         QQS4PYNUlVOQShV9s74e26kg01m0b7hUqKYJzySyL7+oce23Rpzg/ObOuIJzHAO5zUwP
         TnD3GuyDLwSSTUq5zeldd/Kgp2yRFCLxPC59XAg5cTxjdjxQdS07NhJAdJVisZyg9rol
         NYSGBqfomHCb8DiGQ5BqIrrMYYQ5UY78izesZlMFLr4NTuTcXU38jQ33V9XcvJuLZiG3
         XzDA1M3UN5G0CV3j7cg11K+LhUT5CtsvhrDeYrD5y0hHEibI1DY93cKzL6mVk+MiNMjl
         ufYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030452; x=1746635252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqTf0w984hWi5llfvtlyawmZ56xQei2ohDzGa9Ujg2A=;
        b=k9tG/JsSQHjWGOpLwpHDcIxqL0MuMm7Qwa1MeB1TfkpzctOEoNlDVYj5lVWCXX9rwf
         ItsfAfliuHqzTxalWDFEYm8REdsrb9hWc+nN9ialD/Ka2vjT/xTMq1WEReiNTfQcafH0
         QXXGSdt/vgwdbPqSlD4KWM5EC7IqyhhQY46+FVbGVT+c8GCmF59OjEiYoN78YHqyCJJA
         kT3wadFfEi4X50qYg/VXvK9kQoBlTAiN7l5Dkjw3VNbR5Zr/4QBoMb0YWMybsyGlRf2m
         ae6r3zCnWwmucQWywH9XIAvke3qWgcTmDFclEIRovWUN5ejaR3rhH0koViN3cxF21QDP
         S8OA==
X-Forwarded-Encrypted: i=1; AJvYcCV3vackyWLt3j+DXILbB8ZF5NK1lAo7S0J/ZbBaA0CuQ0cwyi4yOLH61rfIBYJKoxiiQXritzAZZjlcel0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/d7a3dhw7i2lSQESp6NImQibTDdvs2CjDqHuEeYkOvEVEEd8c
	VG3B0ns3+RKu9WSE0n4XkOsUGvUObmxIlfRS63usvfT17IGSlSaFUj4TNtF4r0m4hpFgIHeKj/b
	+WILaPG6u+Q==
X-Google-Smtp-Source: AGHT+IElx2K4Ydzexiq6oj60bHV5vV1dfYGpgIOCHldmU1tuiZbYiGFH3YyV8uq6opoqtz/pcuka5AJ5zvQ7LQ==
X-Received: from wrp29.prod.google.com ([2002:a05:6000:41fd:b0:399:71d8:5e84])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f4e:0:b0:3a0:8712:5983 with SMTP id ffacd0b85a97d-3a08f7d1a1bmr3354676f8f.51.1746030452526;
 Wed, 30 Apr 2025 09:27:32 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:11 +0000
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430162713.1997569-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-5-smostafa@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Handle UBSAN faults
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

As now UBSAN can be enabled, handle brk64 exits from UBSAN.
Re-use the decoding code from the kernel, and panic with
UBSAN message.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/handle_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index b73dc26bc44b..5c49540883e3 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -10,6 +10,7 @@
 
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/ubsan.h>
 
 #include <asm/esr.h>
 #include <asm/exception.h>
@@ -474,6 +475,11 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 			print_nvhe_hyp_panic("BUG", panic_addr);
 	} else if (IS_ENABLED(CONFIG_CFI_CLANG) && esr_is_cfi_brk(esr)) {
 		kvm_nvhe_report_cfi_failure(panic_addr);
+	} else if (IS_ENABLED(CONFIG_UBSAN_KVM_EL2) &&
+		   ESR_ELx_EC(esr) == ESR_ELx_EC_BRK64 &&
+		   esr_is_ubsan_brk(esr)) {
+		print_nvhe_hyp_panic(report_ubsan_failure(esr & UBSAN_BRK_MASK),
+				     panic_addr);
 	} else {
 		print_nvhe_hyp_panic("panic", panic_addr);
 	}
-- 
2.49.0.967.g6a0df3ecc3-goog


