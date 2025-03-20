Return-Path: <linux-kbuild+bounces-6253-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D972A69E0B
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 03:08:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15F8F7A3386
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 02:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C491CDFC1;
	Thu, 20 Mar 2025 02:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="UFjO01R8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2370807
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Mar 2025 02:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742436484; cv=none; b=go36aJdU5PxzSqotovhPu9Qh08xeOBZ5rzn6RvzGJXpqjOIZWXOJ9FT1kisg1F+ukITP4KBHDWEWIRleStdkxADNudsQ4ysm+dIebfZ0+TUxm8Dj+wJgTPaGQxea1HCLDWxkOuhh0N3hGx/uiur0P/dIm+OOcmPqyJ6/55tWREQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742436484; c=relaxed/simple;
	bh=m42DtURYMZCXyWHkUzDgb3x5mmA/f+mhAyyGrxqczQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEa+jigDIMMTO8Q3uH5iIa7seaQs0d/TjcH+Q9w57HqxuVTJb9nW+GHZSSF0Y9V5yasbR5pa6yHM3kuujFuhIqixPK71pDvSiq/2gZNFSgUFbe0fRBm0uQJoeYGYZ/2yriwZSwVtTMyXgZ2WRGmK4Jww7Za42xA/jx2gI0pRk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=UFjO01R8; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6ff27ad48beso2618547b3.0
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Mar 2025 19:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742436481; x=1743041281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYfvvRu1GHzIQ/b+4BIBn6FA6Z0KJrVipVcw92I95Mo=;
        b=UFjO01R82Phi/zsptuvfQSn/vE7R8p+3ZHT+VM7PZml6YajaixBZq6427VCHKWAEr8
         Hwl3FyfNnZ0MqYP55JVL/ZlP1tEcHr7nRI1M/1RuJo0UhgtJRQkWVQSGhHYGZeTxCL9b
         /uhSvSzb2XwEzu44MgzIxVRVyzDlxi0rrtSJXtJYY9cqx5LXnwC7F2KRZyHuCMjzebPg
         /X/+cK13kTiL5Jbu303EXMpJaGhR77Yri1hKjCZJOJF0c4z3Omk+PhJBmaZhfLwwg6J6
         f8KcR5rEtkT3oTY8PWkVGb2dXKvkFAPflJT+nZt8KmNGVZKQuWSluSd8J5vBnGLNvmEf
         KCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742436481; x=1743041281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYfvvRu1GHzIQ/b+4BIBn6FA6Z0KJrVipVcw92I95Mo=;
        b=D+uP1riWuFAp1QlpyLomfCQv/tBGlm1MpnBcMs+BFwDgCpjWqx4CvPMz/Eyuyr1Sh+
         jiKqCnIylLNTSJycN0eP/TpNJ7Mu0BDMcd45Ulo2+CM3Whhm99VQgk4YzGs00c0lEFfg
         VESmPaXJ+EL1MCSKssAbOotoLedigt6eDkpxb7mSt/TgpuwdgRChFBlT81N3mL45lZRs
         h0wX0GlJ3qXxvbUZAglFhmBzYwC3zziFYKHAhVNsy3stfX/xxcl3ntrKhNWex0gp76KO
         E9LJnpRRGliyh/SsLnGbIpLCS9xDVH47uRcLLLAJDVzoDDpU1PR+N/xRha+VuhRnXt90
         xATQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlvCc1dagsZoIqmXO1plNRfFii2E5iC7pGi7Dn4SA00nXLiLjI8ARqgrGheDeDm5th2wdh3nUI1psDVn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrGUkKe9/uh8umEmy2QEjlKaIbSW+BjacjIRmZMVPHM45+2OoR
	x+tjiWi4sERAg1IxUf27eo9bT1y1kLhklW/QxJDrl+K+XSDc6XEoRcGs/j3HsCI=
X-Gm-Gg: ASbGnctMP4CbQGuRNYosbtMK7s9k7XV1Zu9S5ktonc0z2qQflTUSqjpMvJi8QU2dKJ7
	c9xRxgt5bG5tnilMEkQbW0dmLYhQKk7M5Hr+6ZGdv70vtFLxdMvV6rmZGvU0dNCOquLajsAtqdF
	qqGpGW/YOhzwyJrv8wjFWeNhiu5Ye2hbhhrpCoZ8VAZ/d97avbfLg0arj8DUiJOyV+E1XlHnaol
	P3ozTc2wVB5Jge+lQGMXRndrJjBKH6pFl/Yaw6VfjiiNuqdwmHMdVoiW12+8jDIY/VFZHOqCaag
	mavxgT6x6F7pRLYYCXVkOz4TuRcKg13mMXlwIXV1J1gi763TjHDqDu63lEU4YxkFsOmTF95ni6p
	i2YuV3TD1Db1ZWdHpQQgJWTxeTQI79A==
X-Google-Smtp-Source: AGHT+IFDVdDbb9X/ieVCAhVOJq33/2ZkRWOn2SMlUCHTT1LWFdTkxTojsuUWjAEuoUU3PICEQ5tJdw==
X-Received: by 2002:a05:690c:2093:b0:700:a63c:641a with SMTP id 00721157ae682-700a63c6433mr37471867b3.0.1742436481396;
        Wed, 19 Mar 2025 19:08:01 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ff32cb598asm32826357b3.111.2025.03.19.19.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:08:01 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
Date: Wed, 19 Mar 2025 22:07:20 -0400
Message-ID: <20250320020740.1631171-2-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Rust 1.82.0 the `raw_ref_op` feature is stable.

By enabling this feature we can use `&raw const place` and
`&raw mut place` instead of using `addr_of!(place)` and
`addr_of_mut!(place)` macros.

Allowing us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are
similar to `&`, `&mut` making it fit more naturally with other
existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/lib.rs     | 2 ++
 scripts/Makefile.build | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 398242f92a96..1d078f69bb19 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -19,6 +19,8 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
 #![feature(inline_const)]
 #![feature(lint_reasons)]
+// Stable in Rust 1.82
+#![feature(raw_ref_op)]
 // Stable in Rust 1.83
 #![feature(const_maybe_uninit_as_mut_ptr)]
 #![feature(const_mut_refs)]
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 993708d11874..a73aaa028e34 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 	$(call if_changed_dep,cc_lst_c)
 
 # Compile Rust sources (.rs)
-# ---------------------------------------------------------------------------
+# --------------------------------------------------------------------------------------
 
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree

