Return-Path: <linux-kbuild+bounces-8141-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D32B114B1
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B645C1CE3C37
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0449624500A;
	Thu, 24 Jul 2025 23:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="tP36yNMh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850B242D95
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400232; cv=none; b=cma/Uld+6+uJonb8LsDTnkTmDSBo8mOxcg1v1HWAo1/k496gWGuNp3cucIBBXqLlUYO6ZggySNnWdZFlSsOuJ60D3LQWLSj15T8GBxK9ajszpObAuhD+QyC/pSYCwaEeV6UVvL9A0dab+iS9/UMoXRJNLEoM+4pIGn7co0NBDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400232; c=relaxed/simple;
	bh=h7Os8p1r034RH4lkAG8aM6UqzQvcIU6v8/5QpRCRTlU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bE6OLhOMnxLkv/7dVGJHwcwQHqfUZOyZiHOou0NMtCpk/8eS3H3MDPxb0443rk9U/euDJd0E+4DqM52WPB4ezjORbC3No1mZk5LvBmuG49LsRzWVMcQ/bF+k8avFF4kB+sJnJNuuISDC+5EvmlEwgDASugkr/f5js2U/6n76Uck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=tP36yNMh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23636167b30so14481475ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400230; x=1754005030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CG5iG7HEmzaJkQJOJy5GwPyyfPnsO8eGyVBmIiBheIs=;
        b=tP36yNMhuKZ9NHW/7VHU6Fr9um42pka75oOtwsXVAH3IJFdbQg+ajG3vp5Br2iBABO
         ckAeG6TIA3A4iCOZdg2LH9wYxm3clrelhvpUyHFV3By7FF9nJxCyVOQouOKsJsvLYWVf
         Pkl18jg4qiog2x0af1crMtJdVFpSHaI7SetxRNfLunRmcFX2mU4wxmY8R92IT3oLTWSv
         hrevLBQ+dhxvDEOaqDBYRPhMsTD896NBbxfqsjXQ62/XS+Cyg7HG9xu/rkj/vkHR5wly
         5v5C3B0Ekf5WjsiFrhcDg9DelsE+40jr9yhei+oGUDCUns6XS1E/8IeeZRGtUNrRd29B
         j5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400230; x=1754005030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG5iG7HEmzaJkQJOJy5GwPyyfPnsO8eGyVBmIiBheIs=;
        b=ocFBWgtwnFfJZWVrVEvw+/0KfZM5dH2gVo9asni2VuSe9OaNwk2zZX6xiduqg5PBhY
         zHlQ2ZbIN+pwu58W58uBZ0UPa+A8KGcADbqcJIIDMg0I+jTRBKZwz1dJDMX1SwoA5krO
         x5HZMZtQy/esIjOUtPgC0ZTkdQ5Ef9ta1T0zOHs4va6l1HyB/ZFPc4AQCB3vT+jFAICB
         kb4U/V+CbnTMBwta6BNrhZJEL7L/pvehPgU0aBmLGfwDY2uGvY4iPqNmMQrF9sTO5Xl4
         +4e5+tDhkOB8T77nNQAaPCAgbvnR7yiZ9U+7Ct7zhv41kUlPSVuimZET6Zz1GDlBsWXU
         Exvg==
X-Forwarded-Encrypted: i=1; AJvYcCXoU7XT6y/YDtYsLhS/KRULW7hDbhi4q0OGIhFHSom9LqhVhAQCbCAXDlUgI6aJIq78QA8GcEtUqQCHoiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF+ctwDGLHeSsZ9NILUUYmyq1PaURoiWaw3FiyTFxyYy2itujo
	1VGWCAxQfR8v1zIZqncPUVtHscLV4enYeRNC3k/RMAXIfjmmtqZ2P3V689qFnaig7qg=
X-Gm-Gg: ASbGncszR6rBzAohXlcOxcHWWkyMorzfD4UPGPxysxqyvV6JzBPLF0C5MW4rscrookT
	5c6m2M/IDUU4ehrW74FjbEgFAL2Kx1HMDg8nE4gewwOW15PcwNjMtnaqC2zwfdsPHM0LWGmv1OQ
	GpEz4G2flPW0y9lCH7waId6Wc6NG6DGNAwltBJCWRZOtrb9WPLlOlgbCdUl0L7IBGAxtqPGamVU
	3YhcATb3DQphzPGnjR5M98WmA0dvQVhhSXJIpHpvFJAh10MvFhzFHUyCfmNjz+Q8zxfcDmi979O
	8tzR4ty8oVOE6JzS8SBTx4zcTznCuKzczJMOJ1Lb6v3Q2VLm5NQRxwgqPXXbgmCEfxHB2bA0npa
	E2xZ5UfHTwww6jbtcP8dHOdlWTrp5uXPD
X-Google-Smtp-Source: AGHT+IFimijtxboQ83ruW5Lf/Edn+u8E7CK8azktAcnwGUUTAe1++zEjf4xwnHFBVkfDbfBbAK27Uw==
X-Received: by 2002:a17:903:2a84:b0:238:2990:6382 with SMTP id d9443c01a7336-23f980de085mr106900615ad.0.1753400229626;
        Thu, 24 Jul 2025 16:37:09 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:09 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:55 -0700
Subject: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Call sites written in asm performing indirect call, they need to setup
label register (t2/x7) with correct label.

Currently first kernel was compiled with `-save-temps` option and
normalized function signature string is captured and then placed at the
asm callsite.

TODO: to write a macro wrapper with toolchain support.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 2660faf52232..598e17e800ae 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	load_per_cpu t0, irq_stack_ptr, t1
 	li	t1, IRQ_STACK_SIZE
 	add	sp, t0, t1
+	lui t2, %lpad_hash("FvP7pt_regsE")
 	jalr	a1
 
 	/* Switch back to the thread shadow call stack */

-- 
2.43.0


