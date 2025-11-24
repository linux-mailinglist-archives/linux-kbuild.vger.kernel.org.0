Return-Path: <linux-kbuild+bounces-9790-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447DC7EACA
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 899D43A5AE4
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 00:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F88E19CCF5;
	Mon, 24 Nov 2025 00:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXhrMV1n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C674472618
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943812; cv=none; b=B65Mfq/UnlWMOQ1oXc6/0r+Zq8YGGDX4cRlt+s/hibNLWBHAuZkOlIAmTA3hltGF123rPM92OirwBCbuQzQGBO+3lN6I2JvlCBa9NXqoH2Qd6Anr5fQY/uzDsHAErujJ8KKeWC7flvj6SrBpk73SGsjXe0sVo0bl5WIdMff36Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943812; c=relaxed/simple;
	bh=WbemIgKuUD0wTji/U5cdEGBHeKZfnMP3MRB40CeW1Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9Q1AHKnXNR+LZU3j7h/Bz/YbW8jpxt4WhKoFpTO4fQ87OdJY2xStfr7Eqm8WcU/HeEs80YlgUM3/4qRcvJjIDJ/FdsjO19WTeGbS5/0VOYNcXbUfVjo0BFi2gAMvjXOjqA334M3w38F39sIoYa1o1QAyvYB5F7QPFs2BIKtXTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXhrMV1n; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59584301f0cso3989888e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 16:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943807; x=1764548607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbGYlCQvEAxl7Ii7cRcs+Js6nTClE2kmQahDh35IFoE=;
        b=WXhrMV1nwjasSDnXIDViZKvJytOYRSKrlDBKdbBhCafU9zKoE1wWo6Wt06bYTQeZkH
         wzTwyIrcD3Zt+hm/+YXg9LgRLLFSXi7C7AdyR4MP+qtyD9nRDND+BVlP3+mY47E/9r5E
         a7Rh1Ar0zWOBs7khs7sVKUH3JZpJ8b6OEZ52UpNABjqyRTYLPR7PPNLxmY3SqPuRj9bD
         CMMBzwCtj9JbAdkQmKidK/tgB0i8xPxztTfHhL2dVrM1QhbsUJHE3RZR+ModdVEtxb1M
         2zEvvrkA2iR8+MKVS/WwLPj7QyFz8aH0tQlvyf3hKd32SAP5446RwLWsZrrjDUKFJIth
         fqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943807; x=1764548607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qbGYlCQvEAxl7Ii7cRcs+Js6nTClE2kmQahDh35IFoE=;
        b=WUgj/+HGm5vhe+zkMeoMU+49zSu6ezBT1ng7Wk3ZrgybBdtElgbGfmLRRd9ip4qAnj
         aO9AMNgT28VhJqGKkuUeNxHw5VZSK/tHxqAHX1JVFn5uXNVyAdYf/6HuXM6Pxa84OExH
         0snEG6VB936HP915qDLLGZCS/KyBnlsoNIpH3xUtbM0e5iIq5wb3HaIEcqPe/z8WWHci
         A5A4XQ+Dc/kCAdcu/eoI1QZsXBEpE+Dw3vLUUs2SvKHGtmVXpwd9s0rrsC8hk4KOM51N
         kz0F2Xbc/WmoRNNxTPvQ0xpZ0C5vAFEuJjR1RijRvTnPSGwR7yr1P8s0LcMnolnPXIV7
         6Lbw==
X-Gm-Message-State: AOJu0YyQGm4PUtCFTphV1ShlDB62pR7xD2uueg0KtrbWHwCdCKZXV4pv
	MgnMskzGhcqP9Q3OA4my7jUGzJY4BTyUs+Cy1kZqmbYAZF3CBJMi0fKS
X-Gm-Gg: ASbGncv3imuG2z3HNKGx8pi8QBNDbcWxrYfWNy+eKnW4GiRe617wEwTfgKv+hA+5l69
	pmqInyahZ5d8vJZlPj+A7CajQi2eo58T41lReI73lCG+r/fQGu7tP+y6pT5QuM0VE3zFbpoIpLM
	I8UbXWD6Qj96ufJA63KacpV4Ac6sjEc6hrh14SVza2iy1Zf86/CAlQrkBtiE7DEZ59dTY1AqeXG
	yjC5WfT7WA/QgDOXpEEVB3inr+Mlfa3tiQSSnKqPx0rNg8KaFbAmDenrlsgmQeYyGd0rjd+4C9e
	zj6PnmKJm9kn8t9nYcwiG4nC9nNjbmyri878ZEP2CWrSr/pMrrZVOqHaJMTFRANZ1K5vZmSkul6
	Gzd/CgrD3KLaNspBitamT8WriCdp7V3RyuUqV6tGez+ZZDsXuV0cVHbyQ9FRcELkUL7kClg==
X-Google-Smtp-Source: AGHT+IEwZK8e0HsCARZb6AL+s2DVpYUXEissqZGhv69G7j9nHjSuwrkdy5uD1EZ2r86MmPczP46Jzw==
X-Received: by 2002:a05:6512:b19:b0:595:7fa2:acd with SMTP id 2adb3069b0e04-596a3eb2edcmr3569705e87.21.1763943806325;
        Sun, 23 Nov 2025 16:23:26 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:26 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:23 +0100
Subject: [PATCH v4 3/4] rust: add a Kconfig function to test for support of
 bindgen options
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
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

Use the `BINDGEN_EXTRA_CLANG_ARGS` environment variable to pass the
`--target` option for cross compiling, so that the function can be used
to test both bindgen options and bindgen backend options.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e803..a8cfe9f408a5 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -75,3 +75,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(rust-bindgen-option,<flag>)
+# Return y if the Rust bindgen supports <flag>, n otherwise
+# To test options for the bindgen backend, add -- at the beginning, for example: $(rust-bindgen-option,-- <backend-flag>)
+rust-bindgen-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; BINDGEN_EXTRA_CLANG_ARGS+=" --target=$(BINDGEN_TARGET)" $(BINDGEN) .tmp_$$.h $(1))

-- 
2.51.1


