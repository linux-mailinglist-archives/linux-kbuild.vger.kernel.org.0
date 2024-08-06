Return-Path: <linux-kbuild+bounces-2836-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C280948C83
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 12:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7731B2596E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 10:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8241616D4F1;
	Tue,  6 Aug 2024 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vZ31lXX6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDAAA35
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722938538; cv=none; b=riWtIhj/jXsRCK7w5FqUWalShSPLWjG2IMaVe2q8k0yryTB3SMBgs180TuI8PBfMshCY2liSjf2SfxWtR8F+Dj31owxrWIU5oW1JF7dI3cx5ZxdIQdjI/ATN/Bupz9SSUu0KqLA+qe1fx4pQw99Qhx+Mly196h83Wq0rl3QDlzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722938538; c=relaxed/simple;
	bh=jGrDZg6W7b6yIioFv6kLQqST3aNp9FvB3x/QErRlweA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LihpP/CBehtd82sw4ftPlGVpqY2o//VV1RTH+aBmpTa9I2bOT1SV1uFeYYTiQimMGl6vGXzVU4r0u2r4TPnL1wLkENamjMvylbWwMFXE1KAsI+9eSPy7w5+Nm/guU5A160ADNHCOJm0WwwNRdHw5b2Rd0H8ySMB32UcIyryW/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vZ31lXX6; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-36841edbc32so184320f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722938535; x=1723543335; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uyC/KKWrUO6ijg03JYKkhJ/eLBPSnDJxF9JMPfbqZBo=;
        b=vZ31lXX6APWVn8SPj5ylvAHxrh+OwCCa9/xlgY1oUk6D9IZ8kqknilIWsh7ZtGTOUj
         xbtwW1eWWEO7cy6HlHbbEUPgR6PSHOC7beA8uJwqYPl+VL1xkrKTFgQl6Ys5mGiMVn7d
         w5dzehD1Y6MakoR/YB4FW1BD8WBYtdLiT0iLrF1W8zEpvo7DFsZBTnAmyM8gJRbnKgvg
         4JYNEt4wXA9/pmU9IYFucznF/R8r4sbTS2kAPsZgQ4wAo5YrhJv5pSxA+s8zFxdHfxTk
         xzuukTZZzy6KNcGbygS/hLy+2zItEIgShfeRTNRuSjLXqhwkc2+t4Jg8EsSdq8zazEj+
         S66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722938535; x=1723543335;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyC/KKWrUO6ijg03JYKkhJ/eLBPSnDJxF9JMPfbqZBo=;
        b=I+p4DR98U8tYgnNVPJrBx9UBneE/G61mvYO2xXy7OuZOKttZAiG22jdOHZVOhLzQUN
         HZha6/r71WdgNj7QPzZkNnMZ2ZY2tF2zHZ9vW7NpMYrTeBiwgYF4T16HNjlZIHbjo7RO
         vsqUPQ6OX6k5Ox9A0eGSWlv2cZbYB4P9UtQ5JPW51MVoaf1d19fbImuHou6nmjGN2Kam
         nezUBg+3bKgp7p01AVZpSZoRODchzkT5jgLhzg0lHKVFB0I5ALyfWbjW8mtUEM3gRVTO
         ikrQtlfEenvBbMyySqChX009BlUFs2lVxWugRXciDRfOzMAPaWiPaRvjD3cbv+mb/Gcm
         60hg==
X-Forwarded-Encrypted: i=1; AJvYcCVsB8UxDq3F2n/agRGlq4S4vUWmeY+qMWriMtSpiE3SfiE88vJj8RN105XD/F+GNG/IhXRVRZsk60EvdhP0G7Hj2mwz++VGeRuFwve/
X-Gm-Message-State: AOJu0Yyg8SSERM6GvJlKYqxJspfxtnEUFCh0U6FUo7HGbMjrEEONKi1Y
	F/17UZKuNbmiDyK+bzORbzWkQ8Tmd+QfdbbehHHM3HnRs59iTv0vFvT3jLMQR0asiaLiop9b/HD
	zUCITJkLy6DXixQ==
X-Google-Smtp-Source: AGHT+IEyDe1j18RYk8AjnoaPlYKH8v7/F76VPXiJnEvmSKM59tpFx5Id5pL26BGUmaQSWPpm5D+wABpCqbhRCao=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6000:12c8:b0:366:eb4a:7d5e with SMTP
 id ffacd0b85a97d-36bbc172845mr22591f8f.11.1722938534825; Tue, 06 Aug 2024
 03:02:14 -0700 (PDT)
Date: Tue, 06 Aug 2024 10:01:44 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIj0sWYC/33OS67CMAxA0a2gjDHKx00pI/aBGLiJ20YUghpUQ
 Kh7JzCBJ6o3vJZ87IdIPAROYrN4iIHHkEI85SiWC+E6OrUMwecWWmqURiKkjny8gqO+h3Qhd4D
 KqaokNFb5SuS988BNuL3N3T53F9IlDvf3iVG9pv9powIFjSwKpgYlabdtY2x7Xrl4FC9u1N9EM
 UfoTLiyRjINeqvsD2E+RDn/hQEJXilXkuWajfwh8IvQ1RyBmdBkLdZyrZnwDzFN0xP1lGzpfAE AAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5321; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=jGrDZg6W7b6yIioFv6kLQqST3aNp9FvB3x/QErRlweA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmsfSUVCgPg4u7OxEmK1GfnfKPbsTLND5twh1vD
 kUlgy5Aqi+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrH0lAAKCRAEWL7uWMY5
 RimsD/0foVs/+PzuwCqLiYc3wMylEMPGIh+zc+TfUTRc14S8Ip8g3nchnDZ8RCbP1waPO48/Gzb
 eAcd4YXskpXfZkpuEqdGBNny83M/esTBWKsYS16a9wzP/rmpAei+ok5p5DsddFus/mbwPZy80aQ
 EdzEu553Y/w5zMCbkizLoSWr0Jb/x0MFImZ9c0P3mkny10L0MomkN6oHKWeKfT3MVhZ9GfvV9wX
 JNmdMcUCTXqbQ/hd4mV+5sUHgQZ4pJDnVTiaVXIEepVepAkQrDRwBZqgJwlxfaAPyTC2suIdv2b
 IqQHvSgxD0ihEV/yzeySs+x92/2ySunvkxmK0kVbhfwrytlmASbnP4Omew8O9ZcGGkwU1iX47S6
 zSxjydp8dDbY2hWzTkXtgtKtDx/Sa8THlspolndKuwFCmKPxxQxMNRRoVOyVECQCjyXJltrgNQp
 jkzqDYRXD42i1Fxk/lv4xV8AQj380ZsBPUlIGpAOTclpSWXpViZZNlmz6ArJ7OmL6LJhNBvCgBD
 JRYJVPm/Df6w+bwVr0jJg/2hvZI/Ti1qKBkdxAnYHJrlhpx3cI/xfc8Y6aI9notWyUr6Imvmbvd
 z7tbH454AzdR08Q9bJjCJ2AT4AgEfTdmcwgFMWysaJHR020TOhveXZfdIuhCoG4H76/Rl41S+D3 Rmpt/bahwCdhE6g==
X-Mailer: b4 0.13.0
Message-ID: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
Subject: [PATCH v5] rust: support for shadow call stack sanitizer
From: Alice Ryhl <aliceryhl@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds all of the flags that are needed to support the shadow
call stack (SCS) sanitizer with Rust, and updates Kconfig to allow
configurations that work.

The -Zfixed-x18 flag is required to use SCS on arm64, and requires rustc
version 1.80.0 or greater. This restriction is reflected in Kconfig.

When CONFIG_DYNAMIC_SCS is enabled, the build will be configured to
include unwind tables in the build artifacts. Dynamic SCS uses the
unwind tables at boot to find all places that need to be patched. The
-Cforce-unwind-tables=y flag ensures that unwind tables are available
for Rust code.

In non-dynamic mode, the -Zsanitizer=shadow-call-stack flag is what
enables the SCS sanitizer.

At the time of writing, all released rustc versions up to and including
1.81 incorrectly think that the Rust targets aarch64-unknown-none and
riscv64-unknown-none-elf don't support -Zsanitizer=shadow-call-stack, so
the build will fail if you enable shadow call stack in non-dynamic mode.
See [1] for the relevant feature request. To avoid this compilation
failure, Kconfig is set up to reject such configurations.

Note that because these configurations are rejected, this patch only
allows SCS to be used with arm64 and not on riscv. However, once [1] is
implemented, I will submit a follow-up patch that allows configurations
without UNWIND_PATCH_PAC_INTO_SCS on sufficiently new compilers. That
patch will implicitly allow SCS to be enabled on riscv, but this is okay
because unlike arm64, riscv does not need any flags for rustc beyond
-Zsanitizer=shadow-call-stack.

It is possible to avoid the requirement of rustc 1.80.0 by using
-Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However, this flag
emits a warning during the build, so this patch does not add support for
using it and instead requires 1.80.0 or greater.

The `depends on` clause is placed on `config RUST` to avoid a situation
where enabling Rust silently turns off the sanitizer. Instead, turning
on the sanitizer results in Rust being disabled. We generally do not
want changes to CONFIG_RUST to result in any mitigations being changed
or turned off.

Link: https://github.com/rust-lang/rust/issues/121972 [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch depends on the next version of [1], which Miguel will send
soon.

Link: https://lore.kernel.org/rust-for-linux/20240709160615.998336-12-ojeda@kernel.org/ [1]
---
Changes in v5:
- Rebase series on v6.11-rc2.
- The first patch is no longer included as it was merged in v6.11-rc2.
- The commit message is rewritten from scratch.
- Link to v4: https://lore.kernel.org/r/20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com

Changes in v4:
- Move `depends on` to CONFIG_RUST.
- Rewrite commit messages to include more context.
- Link to v3: https://lore.kernel.org/r/20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com

Changes in v3:
- Use -Zfixed-x18.
- Add logic to reject unsupported rustc versions.
- Also include a fix to be backported.
- Link to v2: https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com/

Changes in v2:
- Add -Cforce-unwind-tables flag.
- Link to v1: https://lore.kernel.org/rust-for-linux/20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com/
---
 Makefile            | 1 +
 arch/arm64/Makefile | 3 +++
 init/Kconfig        | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 44c02a6f60a1..eb01a26d8354 100644
--- a/Makefile
+++ b/Makefile
@@ -927,6 +927,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
 ifndef CONFIG_DYNAMIC_SCS
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
+KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
 endif
 export CC_FLAGS_SCS
 endif
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index f6bc3da1ef11..b058c4803efb 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -57,9 +57,11 @@ KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 ifneq ($(CONFIG_UNWIND_TABLES),y)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
 KBUILD_AFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=n
 else
 KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_AFLAGS	+= -fasynchronous-unwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y -Zuse-sync-unwind=n
 endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
@@ -114,6 +116,7 @@ endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
 KBUILD_CFLAGS	+= -ffixed-x18
+KBUILD_RUSTFLAGS += -Zfixed-x18
 endif
 
 ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
diff --git a/init/Kconfig b/init/Kconfig
index fe76c5d0a72e..d857f6f90885 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1909,7 +1909,7 @@ config RUST
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
-	depends on !SHADOW_CALL_STACK
+	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
 	help
 	  Enables Rust support in the kernel.

---
base-commit: 5953fd808fca8116a91678ee5fac00fc198ad93d
change-id: 20240304-shadow-call-stack-9c197a4361d9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


