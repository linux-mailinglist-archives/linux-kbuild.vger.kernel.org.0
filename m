Return-Path: <linux-kbuild+bounces-9979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38084CA2B49
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 08:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 330C3303A688
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 07:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33744312837;
	Thu,  4 Dec 2025 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjEBQjxO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DB83101A3
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834926; cv=none; b=jSOY4wcdl4Tiscg1K8Xjw2a5U7laYit/fAUWpRX6nCtlydZGMpFK4rMU1uubs2GPCTlTroZBg+nbKHN/B/6jrC04vMItA0m9YsPvbf0OV9tmCQZUxKs8/cheho7SbDKuoarz3yHcrTb89EFf4ahQkCDYNDE0vnas1l1xSUMkWhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834926; c=relaxed/simple;
	bh=gAqTIa/FjG6cAUC+EuJL20860zY+3jWZZY86tAyZUAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/+ojuSwwA+2MjzFnU646ZvueYkj936MB7WPpOpzp0d2GNqErIJR9gExxLWEWCEozoP1I4QH97Amn8m0iOEBvj+RNRmxDsDqjbnVtBQSh3YP1UheNh6eb44V0tNLQPWDDiWjgrvClW/ZpT1wYHMm0cHEYkSCkIcOQlyE8rnHZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjEBQjxO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59581e32163so675127e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=EjEBQjxOlXOY42LENED3rHo6KrTi3dKuZHtKdl7RHAbEBSVNxco28Ye7K22DbNq3Wx
         Z4X73LpdkpC0vZtVHOg94Ya0qGfmy1oJCzrmbmuACyTM15nonk66hL3eax2HW3xjtfQb
         oJDWWuVtVQ0caVp8UPFbe/9RQCwXX0PjXqKtTjQ4QNdJ4OlwSRsQBl2/x/xXEAvYOPkX
         ubQv/p0W0Bl0lcPpe0umiGlSNgaI9oJb2jfTHUYzFeDd4YLv+BLk3u0Q9uODhE2xb+Pd
         Jk4lxm0RJMpD1e62UHniX/4cI7NE6mBaPDo5vlf7vFpVD7LNv/Bu9Z+UhGpBkaqoJTPr
         hUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZiwTIA7+3bk0rVcoIpmE4cdhNIriz9fkqfbHGGu2Q8=;
        b=tA6nA6/lejBle4ArxMgC9dom92s09QGwbQgwWE3iI9Z+Zwd/hRXbh+dwUdTii9ae8Q
         FT3GPW9NRL+P0OZ7rnBZw/J5QvCLI/FKqO6Zstdq3gwPitH1npXfs+rgJsF2n3tWds0v
         I68WnztJ+du0kw/St77XfiCtf6Ur6Nku2Xyc/pyvZmqCOQ39gARI7ZxmqHXJhG3dUXHT
         4ETdUc2hp579zO6/dwuLwZQjhDUAxD8mIpxiXZq9wHfH9GtDHQcMzBgbPuS4CIQIIwpR
         ZAJa9ivykzwTVmSQVfhhIsVnz195p2DDM7ynaeQ0EcXparZkz37YQWRmOJOaNsbRzDHj
         koIA==
X-Gm-Message-State: AOJu0YwQ0NVRlY/+DDoir9ifcyZeC+tFpVz1hsw1gBDk07ciCG9xdiK2
	rPP37zXISLcF41upmrDjmCEtsvH/VcieC3mm8QOfZwOWPBjW080Nv6b3
X-Gm-Gg: ASbGncumlL+mMzkXcBY8QfAsGhWyIZPbx1ry4WEn7JlCqFXq6HNBPtM14IVfb0mFghB
	kIJmWIZHRZ+unYYaBYFiIIbP568zdu7xoy6CjWSZMhAP9/T0467Y6LyL3C2iYfJ+LGm/SSd2G+C
	/fW6oRYvQYYAXwvZRcaaFAyEjAwK17/Xm4BpxgVIXK627yUWvizzINt1IgoY4Qfrm2cEb4ddifI
	GqZCG1W3NsHwT0/5QgCdhTGgokV9JwIed3x722q3AGVUa+Qq43CrI/++gpcIaUSy2K70RtbAwFP
	hGkH9wIHS46axWt+3pLrBT08Xmj1lbRfTWO78TrJkK0AmwoCvyy/WZoRia6pW5FH3xqI4Td+Rye
	P+pr1rPPCU302thyAWECLh7pB0wH3bIEIs5nxY0OU6rjqyW2703Kw2gV8jPox8C2/C9OTXg==
X-Google-Smtp-Source: AGHT+IGspx1iBq0l/KYW0BPXnBTjQSmqu1QYrFO2QolLF61uEAVSaqBKv7zpWcBgOHbRwa9f2MaI2A==
X-Received: by 2002:a05:6512:684:b0:55f:4f1f:93fa with SMTP id 2adb3069b0e04-597d66f8a45mr630014e87.42.1764834920536;
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:52 +0100
Subject: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
In-Reply-To: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>, 
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <SpriteOvO@gmail.com>, Asuna Yang <spriteovo@gmail.com>
X-Mailer: b4 0.14.3

From: Asuna Yang <spriteovo@gmail.com>

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

This piece of code is copied from `scripts/Makefile.clang`.

Before this commit, error messages might look like:

error: unknown argument: '-mno-riscv-attribute'
error: unsupported argument 'medany' to option '-mcmodel=' for target
'unknown'
error: unsupported option '-march=' for target ''
error: unsupported option '-mno-save-restore' for target ''
error: unknown target triple 'unknown'
panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Makefile.rust | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index 5c12b4b8c8b6..b219244cd051 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -6,4 +6,8 @@ BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to scripts/Makefile.rust)
+else
 export BINDGEN_TARGET
+endif

-- 
2.51.1


