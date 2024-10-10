Return-Path: <linux-kbuild+bounces-4028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E79C9982A1
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 11:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92A46B28B15
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 09:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD821BF7E5;
	Thu, 10 Oct 2024 09:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SZmBS5TI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D501BE239
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 09:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553120; cv=none; b=tGJIH/eGgsRR1utMPqqt1zilbMx+kVlNXKXfX9AQGwmkBhTYkCacgxCyPmI9U826f+nqO4F4ZURuFA63OoBXYyDSckz4AympurakFmgn5coh+o/TFfGSjy76I0PMIv8PtMh33zAQuB39VEHNatVhSnb1Lbqxmp19gRHFWMahEmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553120; c=relaxed/simple;
	bh=sprZWicbSYX/wuK86XaKNqOKKGSxgjIajbIesmsLRa8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UFKBS+4cwQohXgoc7ZmYoZCFo+riY74lFPBywsr1RXdCajJoo9Oq+UtN0VUlqXfd6Z2vFDiz8Dm8ef5tuoC7XJLuOAU1do7c0zY0QhbCIRoScdPjzFwIPUUbVZ+XK8a6UHwig/UzeJ/qCCtTKVAClI+m1vkdHTZpyUFf0b5z4E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SZmBS5TI; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e28edea9af6so909418276.3
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728553118; x=1729157918; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AhvaeBWw5/RdolKgGnr5greoh9tZKs03Mr9gvw9kc=;
        b=SZmBS5TIdBy8AWRHgacIv2cBU3SdzXYCyCi0rlZuys3W2MoftD+0CgVxUUsR9oQpOC
         SSoZyMKKUmv4GQtD+P939nZ3PZ6IIqbBJPdF4/KaZALr+nCV/yfxZxnLvIXUnQ/0mMDU
         c5H9hnYwSRZ5VupneL2sfMNuSlfA7qgb7XmCZabQ8wZ6uZuGMgSN9pZ8fA0OWk8P/kEz
         JYLeK0N6vzEBsADDTFYGg4kFslMWoJHudHV0nZ7/nHxwyCG6AKxCZBICqbfDULoeG1HT
         SFJPR/1+gU4yDq9FAVVdvj320enq3xMPwYWTxoNwbJnKJVxWsbo8LQ3mY8QLxyn3RxVr
         dBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553118; x=1729157918;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AhvaeBWw5/RdolKgGnr5greoh9tZKs03Mr9gvw9kc=;
        b=dMQcDRZfxfNwOpj4MrqxXFQUEIz/Fqgujq6AiEFHoYJxcS9ymPf4Kq0uEo72KIfQiu
         wLegQt3eB9Ai7tQaQS3JkVIxe2OBXBSa1Bj7g5oEZlT0vWMEV485HjQ+6lSi049JZyyr
         RSsmfEkVBL3mEFJkdtaKgYpTX4wwJvM15q+FMCEWCrO/UYVeR+Dg1Z+mazG/PSwcwSiI
         CIOjrPJYTOsXQB5uujqM7+qHZSFksfwxZmu51iBWFxfBSfGcvvY9yN/5HKmBnTqrWxWU
         QoBh85/zZFjXVgA6ZrrMzTDHiQFkVg4MBJHZvJNHTAZJCeBP/mHGfb9xRrrqsuNFZJjz
         FCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXevsKbKzv4eVzi/rOL1YSusLA6b0k3O2iGM43iwz1n4UtyYM/dm76XLcNz0zEIFBOEL2OfUBGbHplSXfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2NSAgvmk/wuIZ1S1mawaXyfFKacFF+muA3v1tGAPJXFKLU8W
	jvzDHb7sVyrBg2H0P0Q85tMyag9mlj3/0pDz9YgNbN0YkL0xd5Y1aX4d5Cg2dJu8ZPQejj5u5ht
	fXBqKH3E//5UwGw==
X-Google-Smtp-Source: AGHT+IGeUBivrsQSq+PuNVUTTRBZI+h4vM5m+PDMtlURQ9Ehj+kRy0g7Kk3HN2DNX8RKbhDakX9kqmGo1oBnmoc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:d681:0:b0:e0b:a712:2ceb with SMTP id
 3f1490d57ef6-e28fe3665b7mr121379276.5.1728553118005; Thu, 10 Oct 2024
 02:38:38 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:38:26 +0000
In-Reply-To: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3960; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ioyjOajrFUcSJsPSpIsZJ5SxB5UOY0I6EBrBjM/1voU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnB6CYAC51tAnp8Qhdz59K5IFjoWW12e6tR9tLn
 kG/RmSvGhaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwegmAAKCRAEWL7uWMY5
 RgmyEACujMB3w0rEef116bx1bRT21n1YSunfGZXdQCCu2RtRyUVgsAEUwAVB5pdwVkC4eO9k2y4
 J/0P5OFmndf5+KsZZT6jdQdRtUkNY8h/5fUPuTNsLQZt4LEgQ4MQyqbC6/hJWb9ZfrXZGokMuYk
 NPi5w6WZScxVBt9QEKvSCQ0AlJ0Q+1WvZbt3JJBKLZOhVJPlQZXik7JbThTpSdZzkVPp+MM/HKc
 zP6pz5u+VmWY7AqGTE/N1n2FgHIe8Ooyl9l5lWwbX0tXfmHPdAfZ6o8A0EQHT4MUHzM5263Qn9R
 /CoMZ61NeRmxv9nAlddUSP9xEokmrVy5CdIHQINBKsvaGjnuXrg0kpaaFWvvrXNO4zxsPaOy19M
 owZX8cAsQQ0wFtN3lrRuy5FkSlhWgnjPYEIbI7YW0uY005s6dhdRFXSJ665W0KcPG6Q9FKJiW7m
 hauSngZ5cbsX55pxwJVDXXZJ0rxbX8ySptvJeCUmoi87os8k0vy8FwUvbpdrAL2dgibjLbgRb+J
 kwDlcUEtlnNnltQST23BIiQm3Erw7fHHdbeC0Igr5CWNKGEIXvk36XAdt2dDb4tU4jOq0t5aCVQ
 mKOsr+/PeiQ9vHdAhu97yN5Jqtp85cbystbJ0XaJNX80jGj5HcMzRwB87Q4nX8NJkU98RoQbEQK HoWTPx+0j4qrp6w==
X-Mailer: b4 0.13.0
Message-ID: <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com>
Subject: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Gary Guo <gary@garyguo.net>

Each version of Rust supports a range of LLVM versions. There are cases where
we want to gate a config on the LLVM version instead of the Rust version.
Normalized cfi integer tags are one example [1].

For consistency with cc-version and ld-version, the new version number is added
to the existing rustc-version script, rather than being added to a new script.

The invocation of rustc-version is being moved from init/Kconfig to
scripts/Kconfig.include to avoid invoking rustc-version.sh twice and for
consistency with cc-version.

Link: https://lore.kernel.org/all/20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com/ [1]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 init/Kconfig             |  6 +++++-
 scripts/Kconfig.include  |  4 ++++
 scripts/rustc-version.sh | 31 +++++++++++++++++++++++++------
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 530a382ee0fe..98cf859d58c2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -62,7 +62,7 @@ config LLD_VERSION
 
 config RUSTC_VERSION
 	int
-	default $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+	default $(rustc-version)
 	help
 	  It does not depend on `RUST` since that one may need to use the version
 	  in a `depends on`.
@@ -78,6 +78,10 @@ config RUST_IS_AVAILABLE
 	  In particular, the Makefile target 'rustavailable' is useful to check
 	  why the Rust toolchain is not being detected.
 
+config RUSTC_LLVM_VERSION
+	int
+	default $(rustc-llvm-version)
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 785a491e5996..788097a55731 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -65,6 +65,10 @@ cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
 
+rustc-info := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
+rustc-version := $(shell,set -- $(rustc-info) && echo $1)
+rustc-llvm-version := $(shell,set -- $(rustc-info) && echo $2)
+
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise
 # Calls to this should be guarded so that they are not evaluated if
diff --git a/scripts/rustc-version.sh b/scripts/rustc-version.sh
index 4e22593e2eab..24e19ed8f234 100755
--- a/scripts/rustc-version.sh
+++ b/scripts/rustc-version.sh
@@ -3,14 +3,23 @@
 #
 # Usage: $ ./rustc-version.sh rustc
 #
-# Print the Rust compiler version in a 6 or 7-digit form.
+# Print the Rust compiler version and the LLVM version it uses in a 6 or
+# 7-digit form.
+
+# Convert the version string x.y.z to a canonical up-to-6-digits form.
+get_llvm_canonical_version()
+{
+	IFS=.
+	set -- $1
+	echo $((10000 * $1 + 100 * $2 + $3))
+}
 
 # Convert the version string x.y.z to a canonical up-to-7-digits form.
 #
-# Note that this function uses one more digit (compared to other
-# instances in other version scripts) to give a bit more space to
+# Note that this function uses one more digit (compared to other instances in
+# other version scripts and the instance above) to give a bit more space to
 # `rustc` since it will reach 1.100.0 in late 2026.
-get_canonical_version()
+get_rustc_canonical_version()
 {
 	IFS=.
 	set -- $1
@@ -19,8 +28,18 @@ get_canonical_version()
 
 if output=$("$@" --version 2>/dev/null); then
 	set -- $output
-	get_canonical_version $2
+	rustc_version=$(get_rustc_canonical_version $2)
 else
-	echo 0
+	echo 0 0
 	exit 1
 fi
+
+if output=$("$@" --version --verbose 2>/dev/null | grep LLVM); then
+	set -- $output
+	rustc_llvm_version=$(get_llvm_canonical_version $3)
+else
+	echo 0 0
+	exit 1
+fi
+
+echo $rustc_version $rustc_llvm_version

-- 
2.47.0.rc0.187.ge670bccf7e-goog


