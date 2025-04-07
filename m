Return-Path: <linux-kbuild+bounces-6497-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFF3A7F0B0
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 01:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E90E3AA4BE
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 23:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6A7227EAB;
	Mon,  7 Apr 2025 23:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wRLP/oOg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AF721421A
	for <linux-kbuild@vger.kernel.org>; Mon,  7 Apr 2025 23:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067333; cv=none; b=mkZrD+pdfRz40B5j5VqH4/EUpyu0AKS0Yfemj77WIWYt+24+tE9HbjMjLibhQScTpJ/BG4NgDanZotGuYykTBT3Rq0utw/dJ37naw/f69hUaaEyYXNm0MPSuJbRYq8zfoeynkO/vR/vg7CLd+390odFGdlZpw1EdRcqKcoXh2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067333; c=relaxed/simple;
	bh=XMGA1c1pFh3lZFyhGlH2mKmzvBPoGQZqtVsn2MD7PhE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OCbwhmz9mR+Qac9Jwu27LlIeRDMHco0gaP/J7m9vRhJwgaalfpS51jdkUYrTQzzYEMDkD/HRtAceUUUccRflDlr9mpfzbHradfJPcEDUHCoElaDGCW/iRWHD/QS97f6deNkiydTtzBEi5UnzF9ZfQeF3oQSBL/azOQS5lHn2xxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wRLP/oOg; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c0306242so6636413b3a.1
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Apr 2025 16:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744067327; x=1744672127; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aaM7XhOiO56IA4YPL35GKWLbBEG8M8dX5KAjEjvLLp4=;
        b=wRLP/oOgCcDpVg9ltwVM+2+E6nrNVo4lkw1dXZRagD0LlknYbQYsSwzgxYGo+SWPRE
         veX98p2DFpZLivcg1DF39tT9Z4iGrSP6EQkM4vZr99g6SYa+odDt1/VdHNYKXltnDfv+
         siyT/IO/fKTk1cKmKna5NQPfmj6GfNvvo0k9ldYE9FZioiM7dG6S4wQ+au3nc4Uab3l3
         Jc64WPi7a9JHkRtMfctZ9MbGOkiT3o1igQpyA0u3gzLdx6yiRjyedviA9/6Eu9csXzNe
         V7iCWBG1SSJ29zZ5vuwpRKMr0lErCZuJhG8eWKNenwsFjca3ODRyVF24wSmKjgeM2bwB
         OOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744067327; x=1744672127;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aaM7XhOiO56IA4YPL35GKWLbBEG8M8dX5KAjEjvLLp4=;
        b=J1JoX1hAdZW7bYe5CGpEpX9oMvjNZlt0ZNCPE1LCdk/GDaw9JPki4Z6xckbf85/o8c
         H4ooA/mgrwND3xBPb1z7tSrlDSPOhH4uNmlBfOEuqhE2zJqzkzapcGXhPiK/tuDk1mxM
         KdHiWpixKJAEwVGuN/vsbhBMk7TcScr1wBPjrDMM/ivF4cU1XWOH4uUm2/TAW85g2LCr
         3ZNxdfrgnd3dXi2BDY9VKbC82Dppl/KtENkQL/suGGMRspNFEE/Q/ARTa/3vhohMQsHZ
         9UerXjNIzWiM91UrchABB23rD0Cjc2oRiGWJNBonGRustb+NWpnxZxYJFGRzY5a0mKKh
         +BTg==
X-Forwarded-Encrypted: i=1; AJvYcCW8vINNMg9AjvQpu9tpnhS/34i2JaYmgP92B9QwaF0pt+Bp/trdd1iDed4OCGUg9+MDHqg//DTMK5572EE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6oK1dlhaJs3Tm1WjeEyB2h0MM4ihFRqMVyolxh7rXOxlwgj9
	V/WW1Umk3wgCdWKetFKyqfB3un4Pts84z3a7pZy9hNTUejwLvwcSRYISl/eAnskQUw0pku3dHVn
	UfYXABD6lP9Ffsbxi5HnRHnAvrw==
X-Google-Smtp-Source: AGHT+IHGD1fnOZirnSWffQqJsQ+XNtsjfNV17kYKBnJj9gDOj9DYeZFe74FqcBdJnepH63c1aEHwz8JPrJi1wwvP5rE=
X-Received: from pfbfd35.prod.google.com ([2002:a05:6a00:2ea3:b0:736:a70b:53c7])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:888e:0:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-739e4b58df9mr18283273b3a.14.1744067327333;
 Mon, 07 Apr 2025 16:08:47 -0700 (PDT)
Date: Mon,  7 Apr 2025 23:08:44 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=samitolvanen@google.com;
 h=from:subject; bh=XMGA1c1pFh3lZFyhGlH2mKmzvBPoGQZqtVsn2MD7PhE=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlfov50FW6dlNm5uiqnZt4B/flph1tzDrAFHrnDbXOGL
 Wz7IcZPHaUsDGIcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAiAd6MDJMOmvwpkeRI6TX4
 2aSwSUtl9qtWzd7PHls3z9ryRS08fxbD/6B9Bx/GBDvoP5yWbcCSm6n5Q0BrZ+4z/na+vpdvbph qcgIA
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407230843.1952850-2-samitolvanen@google.com>
Subject: [PATCH v2] kbuild: Require pahole <v1.28 or >v1.29 with GENDWARFKSYMS
 on X86
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Paolo Pisati <paolo.pisati@canonical.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_GENDWARFKSYMS, __gendwarfksyms_ptr variables are
added to the kernel in EXPORT_SYMBOL() to ensure DWARF type
information is available for exported symbols in the TUs where
they're actually exported. These symbols are dropped when linking
vmlinux, but dangling references to them remain in DWARF.

With CONFIG_DEBUG_INFO_BTF enabled on X86, pahole versions after
commit 47dcb534e253 ("btf_encoder: Stop indexing symbols for
VARs") and before commit 9810758003ce ("btf_encoder: Verify 0
address DWARF variables are in ELF section") place these symbols
in the .data..percpu section, which results in an "Invalid
offset" error in btf_datasec_check_meta() during boot, as all
the variables are at zero offset and have non-zero size. If
CONFIG_DEBUG_INFO_BTF_MODULES is enabled, this also results in a
failure to load modules with:

  failed to validate module [$module] BTF: -22

As the issue occurs in pahole v1.28 and the fix was merged
after v1.29 was released, require pahole <v1.28 or >v1.29 when
GENDWARFKSYMS is enabled with DEBUG_INFO_BTF on X86.

Reported-by: Paolo Pisati <paolo.pisati@canonical.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---

Changes in v2:
- Also allow pahole <v1.28.
- Update comment to include the affected commit range.

---
 kernel/module/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index d7762ef5949a..39278737bb68 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -192,6 +192,11 @@ config GENDWARFKSYMS
 	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
 	# Requires ELF object files.
 	depends on !LTO
+	# To avoid conflicts with the discarded __gendwarfksyms_ptr symbols on
+	# X86, requires pahole before commit 47dcb534e253 ("btf_encoder: Stop
+	# indexing symbols for VARs") or after commit 9810758003ce ("btf_encoder:
+	# Verify 0 address DWARF variables are in ELF section").
+	depends on !X86 || !DEBUG_INFO_BTF || PAHOLE_VERSION < 128 || PAHOLE_VERSION > 129
 	help
 	  Calculate symbol versions from DWARF debugging information using
 	  gendwarfksyms. Requires DEBUG_INFO to be enabled.

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
-- 
2.49.0.504.g3bcea36a83-goog


