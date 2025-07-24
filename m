Return-Path: <linux-kbuild+bounces-8143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41554B114B5
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 01:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5216B1CE3EC7
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 23:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDE724676A;
	Thu, 24 Jul 2025 23:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lgsFnP7Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1902451F0
	for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 23:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753400236; cv=none; b=SBAwxBXhkahDnlM4hInsWrSF6O8elpCTJyHegR06wl0GaMRGu99P572+6rj68w3wTqHVOnG2zLuHWPYp0ybVzZMFyYgPwf5yLmcW6jRoLuO1wi78PDIGWEzbkE8DrraHTlLfO/Sw1j0XSENMxebssfQJl1jJngPjR2Skno179Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753400236; c=relaxed/simple;
	bh=Znz4HWUKeUDrvSYkQdDugVKK7rHsODYScSSfQiOAlsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpXlaKWwEXl5nFrKiY7A1C5mg6ZRbXa7C8wep1qXbduii43mOL/L0vK5QN/2u3ShKPL/nvFo947AMJ8N6MpYShC9x9ZB8K7aF8IYC1upFr9acL3imB+riSI/mLjgGWd/K4V8meUnraRmii2rdkEG827feRAsvdmQhSMmpnk9bG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lgsFnP7Z; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23649faf69fso12757865ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Jul 2025 16:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400234; x=1754005034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAeHR6jMoeNreT1rLi4tkifNH7GwHO7F0FWeni164mI=;
        b=lgsFnP7ZIEeysxH1adfOmwPF9uqTzuw/RibcbSZs27i/5zDzhcuHX5w0/alwXJt1Zi
         oQN0HjQqg4XHIQF+3nQ1j1JVCtEL27hgI+7BmOdAiHfkCWqsldvWA3/48jQE/2xT9GJk
         4VW1iYPUaXF41lZMR2ayCWK1qPE70PBWEKN4GmZwBSBjnazn65XLD0pBMyQfCelbn8OG
         uB+UJN/E9i4sgcuGXiKWtsQHkc0VgEDTIIWskYsNpV+BJDGVBq0lfX4c82g94F+oZjka
         ulN7RVLZPVxHi7blBgT/DLWSgMSobXWBfZ9HrZIjl4QDEPdeQ9zRD6JOYx4r5KxMfah9
         ptLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400234; x=1754005034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAeHR6jMoeNreT1rLi4tkifNH7GwHO7F0FWeni164mI=;
        b=OhBBOT3xkRytfQPCmmW/olo6GiVwuw7dSgwEj+9Z425XnPjlKs05yHgV4+XGKv1aLC
         TeVRHxNZp2+enccuI0SvWPcZmP08LN7MK4+XMlKa8qmi9srBi2ngQzp3gcLlzYFqSIk3
         7bAERlrAgwHxVqbudFVpy4fDjfObnCcz/XtG86ruz6MontkVKBs/OZQNSEk7suthA/u4
         YnmLMYUlt7CJ5/qigMbqZbcs5gQtmMn1c0kmbRVDQUEcrzs5U5ooh3yDlZONlBQ7hpzF
         Mni+w8+CawEeMcuycpyP3YO0PMRqxR6lQFi2HNgqwVGHvoVBDsaCxv++wtDyrttRIVUZ
         561g==
X-Forwarded-Encrypted: i=1; AJvYcCW+9xj/Vsy5S5RyLWPa+XK9+KppM8QZytIuCbyZ2Sc3kukiKZnR9V0hPxAOjpKogpA7bviHitxDCh3xO1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDS3BjUUcfGoOhO+39i1DFvjgsMtP2609JnxllH289sIG95Wq
	His77I2MavjNV3XIe9Cx3CsL8ywcEjwzpOz/rOsfIFg57KCORLyA2FFVKg78Thf9zAY=
X-Gm-Gg: ASbGncvYhYgqeTZJ7zMZW8w1U+786DYMyUI6K5MrWWPW9HAOprMATQGHXhR8ugbfYsQ
	kdfKEMoDeRFAb+vsZNIvjoE992wzBkND4fq7gwOHG74LMnY5N6YZVh5v1LFG/V7Dpi2LmgU0prl
	4odeGes0X811nY79n+eA4UtcxUmDUT+TE8R/duoInecZnqhX+6787T3DHFlVqlqr1ycWCOuLvVb
	oeeLYVZyQNCzr3yv3j+GoTXswjyCLHI0CVYboW6m1S+EqPQ0wDpkZsp67mTeSdoWk9C5fXZTphG
	y9evlZrf/QbYohLhIB56orXAwyLZdqaAx2rj1PVkvs3mdWPl5i9NoX5eCKt6EHXQ2wZgKUf1Biw
	jcfxjLblnO3jcIUOZ7h0Tso29CdvVzo/82lGucAaX5cs=
X-Google-Smtp-Source: AGHT+IEC6umj6Lj/bljHcGk8ktP/FZKxktXm+XIJAAVaqHXn4oZH20sfm15h9uxx49Sr7WC6JzXzDg==
X-Received: by 2002:a17:903:3c2b:b0:234:adce:3ece with SMTP id d9443c01a7336-23f9813ab07mr115991405ad.11.1753400234285;
        Thu, 24 Jul 2025 16:37:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:36:57 -0700
Subject: [PATCH 04/11] riscv: exception handlers can be software guarded
 transfers
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-riscv_kcfi-v1-4-04b8fa44c98c@rivosinc.com>
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

Exception handlers are static and loaded from readonly memory. Control
transfers can be software guarded and not requiring lpad on target.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 598e17e800ae..3f0890b9c0b9 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -224,12 +224,12 @@ SYM_CODE_START(handle_exception)
 	add t0, t1, t0
 	/* Check if exception code lies within bounds */
 	bgeu t0, t2, 3f
-	REG_L t1, 0(t0)
-2:	jalr t1
+	REG_L t2, 0(t0)
+2:	jalr t2
 	j ret_from_exception
 3:
 
-	la t1, do_trap_unknown
+	la t2, do_trap_unknown
 	j 2b
 SYM_CODE_END(handle_exception)
 ASM_NOKPROBE(handle_exception)

-- 
2.43.0


