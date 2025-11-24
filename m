Return-Path: <linux-kbuild+bounces-9788-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49EC7EAAE
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B9AF6344FDF
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 00:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6439786337;
	Mon, 24 Nov 2025 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmOATdSM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310AD35979
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943809; cv=none; b=GaW+wKgQvApE+Z7fDYvFHk/0msV/6Q3AaRvQUnRD8alB1EI7uoyRY0ss2Sirj6V0EWrzMWiKI2dTshpjJCsM96b7OdCM1ZG7fwXN9qL850Hfx27+jJnDgZDi5jb1u4KLJhvpbJ9G6XE21T8bDuXxgIqJKe4ytwZ4ciCOdyKGB5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943809; c=relaxed/simple;
	bh=UBNCi+JwEpdLbNq63Kw6zv29wcmJRW5azpG7favyCqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m+5AgMXNr/k4o4pTguhkMGk63J4u6UPEvkcnuJ3h8lG/cqvzxVWE1cloNVVKoMrliM+Egg0h0WfQw2lbKk9+7jUAWjxcDH0kcG/2C5vpiuk8CNK7/GH4Ck4mJDt/Y93Q5n9AVNASJXWGkBq7rcCiJjLPGt5zIcMeVXaJSPEPpkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmOATdSM; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5943d20f352so3772846e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 16:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943805; x=1764548605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmO7WeRHELfWemd3T0oTKOnUWLtTpQSTMpH/BoQx1+w=;
        b=JmOATdSMd3cUQbpCBWUvrGF/jQVdat7ESe9LZJJEnoNMfUagl9BljHbkuVZ1DpnD0B
         tNwk23b6nQfrEiwQ9teeS/OV+NOrFrdYiWiqyUNPZV3osvUDJcBWhTw1qWqslWFcaZEK
         P0uJ7UEpKT/OO6XDK8rbYLthyZ2FxAl/RZGoS7KUnhAzchJePg/bIy0sfuqiXLwAfSRS
         gWNlAi34tisJGVv3fjLWppPgPCryROKB7C4VhOq1nRWtDSODW7RSwiuiwIWhWzFe7XG3
         ZsVcIYQWeeQde2qnZct7TFdazG8o9EEIhbw3YQR3SQoThlgFh5O2M2NG9DdJGBIIBH2J
         hfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943805; x=1764548605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VmO7WeRHELfWemd3T0oTKOnUWLtTpQSTMpH/BoQx1+w=;
        b=kMEujMr7YsTNziTzIo0IFYs4a097FqSLdKE5EqFw24UpSjs9C0nMjddXs6rqvm4sHj
         Io8tkZQK4v13oBdYEecu2XoQhjrLTdY/5UeMvizQ68XbNalpuwgh/Hn+SM/w76+ezhO7
         m3w/giVNtJbXLfQ/j2y+v2gA3FlO2eIl3u52mp1bfFZIP5XzkRPnqB+RiD7K/C2nc3OI
         VHYZKklTuu+Y7X99zjjYLvKAgUEIJ5dvcSTeytw4JxBykIIvhQtG98dywMNszp3I7teQ
         Me/Tpz0OUTeOWgumWrZK45iWy0ZkqB4QIKUQj2SJtX/b+Kn9e9X/TRrUTdHLGs8GxnCX
         jpyA==
X-Gm-Message-State: AOJu0YzEkjzJjj360AnjKRkky454Mn68FO2Hfe6sxmcWVnTmSvG5DeYJ
	2MwUlbzIW1lBi/ug7zP5TYU/6VJUvPTZnbPpN8ralqjpH3ShRCFon77KP6Nq5o2GTkU=
X-Gm-Gg: ASbGncspaBtKVdFtu8EXE0U/PxVaXqfb/P/UrtNYy9weKyPjJxEYcs433bSR5sGZOpq
	VNfqup0smGPMmWunOLdPAQxwEJ2ltkZiwloQhvVLSvO276PHUlbByXU5xo6E+n2uWtM+Eqc2fMu
	kt10ozOblA2Pl4VHxuo76URHjLP8MST6dZvGtXhosCrAHCJlxigRt7WfYBnHbTJ0wiSGmvlXJL4
	6dF+OZODVCRNN+G456akTrTDc0rvk4oPKhWwlq5m63fAbX66ZIHMVboVn62PODtNyefQ2Fqpmiv
	11xc8/gUYLdYqpbuyXz8Cq2BnLxXyf9dfsdPv4bKhDMNRO9F+LzdfaLKWswIuBG62IseeKt16h7
	C5fty+5VxD09h4EZKw2a5ZEZ3ctSlXjFb9Tg8nsG9zIxAskCQR+9OPdJ/WdpFWDd/TcFfiA==
X-Google-Smtp-Source: AGHT+IF4aoVvhwlxQOs8/bE5W87pZdLvSLg96T0R9i+b0fAYQSrBsEEdwuQJf/Z42sWlhlDPankRDg==
X-Received: by 2002:a05:6512:3b29:b0:571:8fad:ecee with SMTP id 2adb3069b0e04-596a3eb3235mr3529623e87.21.1763943804905;
        Sun, 23 Nov 2025 16:23:24 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:24 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:21 +0100
Subject: [PATCH v4 1/4] rust: export BINDGEN_TARGET from a separate
 Makefile
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

A subsequent commit will add a new function `rust-bindgen-option` to
`scripts/Kconfig.include`. The bindgen backend requires the `--target`
option for cross compiling, but variable `BINDGEN_TARGET` in
`rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Makefile              | 2 ++
 rust/Makefile         | 8 --------
 scripts/Makefile.rust | 9 +++++++++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index fb4389aa5d5f..e4fcae38cc13 100644
--- a/Makefile
+++ b/Makefile
@@ -718,6 +718,8 @@ ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 include $(srctree)/scripts/Makefile.clang
 endif
 
+include $(srctree)/scripts/Makefile.rust
+
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
 ifdef need-compiler
diff --git a/rust/Makefile b/rust/Makefile
index 7842ad0a4ea7..ae7cbbd89da3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -300,14 +300,6 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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


