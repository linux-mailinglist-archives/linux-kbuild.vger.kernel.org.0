Return-Path: <linux-kbuild+bounces-9978-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 310EACA2B43
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 08:56:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D356A3034DD2
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 07:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A9330FF26;
	Thu,  4 Dec 2025 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMmZMkhV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624AA30F7E4
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834924; cv=none; b=sCjBD61HcieigQiSn8Z4dd2v1Rt4WKgqFbXGsPHzJzKj685m3ORP3oHt/vlyRzU1rbagA+jnaHWklE3fWzVD4z2MYiRnDEb9XhWNVv9x9do/BBQem4C+yzLXqzffYiyD1vFdVLM2slv+ISa0foPgTpcTrptCZgucZOFBEGFqWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834924; c=relaxed/simple;
	bh=djzz99/Nqr+mam54feyNiv1NIFjqDBU6RJYwqgkk4Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRXe8OnFhf9FJ9ipNCFtM4RxKhqcda/QBdUEu/3trrGcbiRPhGBmKRgJrEPf/2uabVh9iDMQCqmy5HjGEELXe26l6+aokVdPszDERHDRG5hGKpvKbg3EOZaHrzmEs5ZmjI6Zfo9pd6kkW+Rw5YqHn+Sjy6xVFiHSa9SXxbRAKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMmZMkhV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5959187c5a9so451553e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Dec 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834920; x=1765439720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=gMmZMkhV3vs3n0FzsHdafB2Msqyg9ZJ0fYcxNrh6CCd1JJO0wmLYPlkeHxCrOESGxj
         gpYHcTzstePF3OyQBeLzh4J8xUrUtRPRBHtgbH3q+h0joO1xUGRu8lUbJ2M22LmvojSL
         Ma9n2w0UdDeDTbZSbSQkxtsJINRMCa3EVdLaEVLdKQJw0ioTg0iWrTJn/Z7QfTRBqXn0
         8v3aZXApN6JlkNOJ7djlKftiv45U44scS6biKtYhhb6XGb78XeUyiRBvaDPbOEFdx6oh
         RzixmN6xb/NLTtm4EG8XXxjY32pzmbDJixcaHmRQ3Ta6lvJ0vQmmESwlTlIB2hwRGH6f
         Y0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834920; x=1765439720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9GtPr5taZTAzyn89OMPpDe+uAgwZM83gWeHrAtje3E=;
        b=uoWb43o76AZGqZVtoSfQhaALEo9AXO+f9ACPdesXF1Umh+XEFfVgJLRhLgqsW4xx1V
         0B9oOuDKPCRDUoOdOCkB4LtCJEhzTHh8DM27rU2VahuttH25nEnVjLolSF7ogqzgCU/m
         R0z0NFfGGlPrwjgFZh6gmybF9/MNRxJamOWwpEgoTlVpjdaI6llfEx0wFwRODF2Kt9uf
         M5yAPlGzkhTxKNQCWzp6ZhFdyM/jm68XUsI4jDkSjQHeg+MNo2irc9F7ESAUay5wgFOJ
         zA6fNpxc41epFm1Q7v+xhSmrmoyiQczCBE9VKpyQdTmQlR13UaQNG/ixRSSWOtBRZNJb
         5hkg==
X-Gm-Message-State: AOJu0YwCIX8FEssuMniKuYu2/I9Ih9zIzKFbcPkGOqxWr0xooqXO/A28
	UmDPzFej9zu1MGvEFld+dsLM43lgZTePBM7zK8mppPkDDin9fCff6EHv
X-Gm-Gg: ASbGncuZwlkk5kkStqwvmmYVTWL/kJnA+rlpahc1Gn5VAp9fimiRK+qGxVgv3PpEMpE
	ONIpcyncjfCpPSJjuHkhP9uyWL4v66JjjVjdZc2nXpMgv/YWovGQ8LLG+CpGAYQkZ+sknnqiyfu
	4GiLScHStoPLNTZacElyZ7ruoPh6wgyfd/MjjepMielim6eXrLcF+XeRtz2tmxISsSj/d8+90eL
	CF3MQnNPrDVzdfPoNC47mvM6qJQ5DKN8L0MrOw3C2KniN00u6b0zfgcqk+rKRHXR4pcpg7laTNI
	jgtn7p7CA5jkpSimWlbton2EbyPLUW/zTu2aOoI0781tsnwcUvbs/Jxkbik1yaQ9dFYvgF0oysq
	soDmWqmkFn55TYWNq+FelYWXzdQM24zROV7srNoJf6NfryvSUQe+J5qyX1uV+YXyCz+SCUw==
X-Google-Smtp-Source: AGHT+IEldMEBa+Y+2+8e9BBmMa+iraf8wmEl/ZT2sdU4A9p2jyG2tZG76w7egCqyyaaevWjMOuPaow==
X-Received: by 2002:a05:6512:3c9c:b0:595:9d6b:1175 with SMTP id 2adb3069b0e04-597d3f27914mr1982243e87.14.1764834919940;
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:51 +0100
Subject: [PATCH v5 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-1-2d4f20d86c24@gmail.com>
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

A subsequent commit will add a new function `bindgen-option` to
`scripts/Kconfig.include`. The bindgen backend requires the `--target`
option for cross compiling, but variable `BINDGEN_TARGET` in
`rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Therefore, move this variable to a separate new `Makefile.rust` file and
include it from `scripts/Makefile` to make the exported variable
available for use in Kconfig. Place the include in the `need-compiler`
branch to avoid including it in irrelevant make targets.

Since the new file name is `Makefile.rust`, it matches an existing
MAINTAINERS rule `scripts/*rust*`, so no modification to the MAINTAINERS
file is needed.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Makefile              | 3 ++-
 rust/Makefile         | 8 --------
 scripts/Makefile.rust | 9 +++++++++
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index e61f1300fea0..bdbf2025e68c 100644
--- a/Makefile
+++ b/Makefile
@@ -718,9 +718,10 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
 
+ifdef need-compiler
+include $(srctree)/scripts/Makefile.rust
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
-ifdef need-compiler
 include $(srctree)/scripts/Makefile.compiler
 endif
 
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..2603b34f9833 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -385,14 +385,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
-# Derived from `scripts/Makefile.clang`.
-BINDGEN_TARGET_x86	:= x86_64-linux-gnu
-BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
-BINDGEN_TARGET_arm	:= arm-linux-gnueabi
-BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
-BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
-BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
-
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
new file mode 100644
index 000000000000..5c12b4b8c8b6
--- /dev/null
+++ b/scripts/Makefile.rust
@@ -0,0 +1,9 @@
+# Derived from `scripts/Makefile.clang`.
+BINDGEN_TARGET_x86	:= x86_64-linux-gnu
+BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_arm	:= arm-linux-gnueabi
+BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
+BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
+
+export BINDGEN_TARGET

-- 
2.51.1


