Return-Path: <linux-kbuild+bounces-6271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E421EA6B1A7
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 00:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA1948672A
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 23:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96C822A7FF;
	Thu, 20 Mar 2025 23:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MaSTqBvV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA0622256A
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2025 23:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742513285; cv=none; b=Yyy1hopL3jk3QGJPfnad2+7SFTzEjuldQMzcFrbcoC2OsfbMyMeOrU5gNJdH5Uj/T12cDTUMS5PV5CzTLxbg+7X7PXZ1Wv7jaV711/7kESN94khQ0u6e/Tv9dbxDFFR5SOrmlg5cTrBtybjPZQB+0Q5ogQcMXwl4Y6zYLLKrkdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742513285; c=relaxed/simple;
	bh=sTzT5PtwQSPHGFOm3VurrDvsdk8Mjq6EUX9qB/8ft9M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LalT/UABhacVnGyisGZT16zOVhqkU5hjKhOdyq5OLoYXDz+4esYhHkEtexL0B9d5TMiXMC9wDeevt8pp7ZJ9TMlx7a6jbXK8HBgYbQu+jwmzTcXOF/NR1oUQspk6n4RRkKG5Z4GDklB0UtdKJzD9jOGugzOeRbMYVo5WdGwCuKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MaSTqBvV; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso3632466a91.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2025 16:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742513284; x=1743118084; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kzKhceJYkAUqAvfvyFb46En6N7ik17gmHG0Ft959/Ys=;
        b=MaSTqBvVlvd8QmrxkuM4IcrQwPmDyczMhD4BOENlrUXSO7ORTweuil9G5IkpK8Z4yO
         QX7iP93UA/RXBSgAK0BETlkZuJR6XBjLJxj9N2oq+es+/xgxiSFewfEyKLIVNDVIHOM+
         2v18BjEpsCqjHU2lFMgia5rSn5iqn3haADyl9AENK+GUdXTEz3PYPKOlw0rLAJkhl+w9
         zrpzSbj0rCt0iQJgamPhz5iE4saJqL1L4yI+01FjKA9Un/UMHlf9FYYdHG1uiNXf0oBW
         G/HUERmg5OLRSxTneZElq6VH8UHs+ThHQ3Qgd3lyk9INqBZwjNgfWR6xcKWW5nOwp7s/
         B7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742513284; x=1743118084;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kzKhceJYkAUqAvfvyFb46En6N7ik17gmHG0Ft959/Ys=;
        b=ujnKcn9WxzQjQwdv3b2CyH/N+xeKwXEfGolKbWeTT+YdqFtJxTAF604CQ9zzvKVisX
         HTCiGF8F38lU2yBwn1rNnXUIFd8qz2ve/KYAls4IlkO3gNDESuRa2ja1OmtMJLyvNIX1
         DXsAYzLCOFtUIjPNLFOZjCIof3LYv/QTx8DKX595amgR+c0btxop3b9hrSmhDycVJk/U
         mtGnqeB6Ey+IxzauQW2MHv21WsL6S9RBA7kN7wrXNSTlgDqLeLN2OmQBAz3iHUXOrUfN
         MgH4HJi7u2S8HnphN36GG0ssXBWd6a9XeCJ3T5VMqh/CsCYlDe4OGBqXTfjVOoEh/LrC
         7jng==
X-Forwarded-Encrypted: i=1; AJvYcCXHa5bPqYmHXncl/qi0v8Upx2WW8xBZcbUxm787anqrrpCg6R02NYpU5EP8ghkkLhyj/ROyWl1XeOlBppk=@vger.kernel.org
X-Gm-Message-State: AOJu0YySKyQ5CrFVG+N/pTCdtxpasAXUwMJmBtPR+xovxgvKt7JKk3qE
	PEifaGCkyDRQYk+QcK4DLWZMhPtFWMvTAnp3r2QWz2Nz/lO4jQG1+3SItZou6iRLM+kfVLAYsMq
	b8GhxPYonFQcZKpHV2Pw8bRCmDA==
X-Google-Smtp-Source: AGHT+IHnAupWokYIK22X9v/qMVPuyMFNnXuVjx1FMSGpF61YwN2ljJRb873YXI9hUKxhoK14+Ih+q/r8UQu7GQopifg=
X-Received: from pjbpq9.prod.google.com ([2002:a17:90b:3d89:b0:2fa:a101:755])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2551:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-3030fe595c0mr2031878a91.7.1742513283758;
 Thu, 20 Mar 2025 16:28:03 -0700 (PDT)
Date: Thu, 20 Mar 2025 23:27:58 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=samitolvanen@google.com;
 h=from:subject; bh=sTzT5PtwQSPHGFOm3VurrDvsdk8Mjq6EUX9qB/8ft9M=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOl3ltT2hVutY8g1/PDl6u6AP4GND2d9CpBU873Zs17EK
 yOh9uTmjlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCRskiG/9F5Px3Ot6o136w5
 fDv7eqJv8iR3w0YZT3Nv0Xldn2/su8LIcJpxm8H6V2m6thEKRncv5XZu3y67Qsar1+CK8aGe+Xw beQA=
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320232757.2283956-2-samitolvanen@google.com>
Subject: [PATCH] kbuild: Require pahole >v1.29 with GENDWARFKSYMS and BTF on X86
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Paolo Pisati <paolo.pisati@canonical.com>
Content-Type: text/plain; charset="UTF-8"

With CONFIG_GENDWARFKSYMS, __gendwarfksyms_ptr variables are added
to the kernel in EXPORT_SYMBOL() to ensure DWARF type information
is available for exported symbols in the TUs where they're actually
exported. These symbols are dropped when linking vmlinux, but
dangling references to them remain in DWARF.

With CONFIG_DEBUG_INFO_BTF enabled on X86, pahole versions
before commit 9810758003ce ("btf_encoder: Verify 0 address
DWARF variables are in ELF section") place these symbols in the
.data..percpu section, which results in an "Invalid offset" error in
btf_datasec_check_meta() during boot, as all the variables are at
zero offset and have non-zero size. If CONFIG_DEBUG_INFO_BTF_MODULES
is enabled, this also results in a failure to load modules with:

  failed to validate module [$module] BTF: -22

The pahole commit that adds 0 address DWARF variable verification
was merged after v1.29 was released, so later versions of pahole
shouldn't have this issue. Require pahole >v1.29 when GENDWARFKSYMS
is enabled with DEBUG_INFO_BTF on X86.

Reported-by: Paolo Pisati <paolo.pisati@canonical.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 kernel/module/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index d7762ef5949a..7c75832aa1af 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -192,6 +192,10 @@ config GENDWARFKSYMS
 	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
 	# Requires ELF object files.
 	depends on !LTO
+	# Requires pahole commit 9810758003ce ("btf_encoder: Verify 0 address
+	# DWARF variables are in ELF section") on X86 to avoid conflicts with
+	# __gendwarfksyms_ptr symbols.
+	depends on !X86 || !DEBUG_INFO_BTF || PAHOLE_VERSION > 129
 	help
 	  Calculate symbol versions from DWARF debugging information using
 	  gendwarfksyms. Requires DEBUG_INFO to be enabled.

base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
-- 
2.49.0.395.g12beb8f557-goog


