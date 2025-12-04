Return-Path: <linux-kbuild+bounces-9980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DECDCA2B52
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 08:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F861306CF59
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 07:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BF330B528;
	Thu,  4 Dec 2025 07:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVBfDhLn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E698A311964
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764834926; cv=none; b=Ze4L46EIVABaEgxsRQ83cOqIJHa5mUECCQkUeNDsFyj8WrH8ANWpXrMU6wM8tZwMFiKkWFtXAonyV3Y8t5xDD8wil92sxcgszgyJaRY0nlFAiSq1zEf5tw4p4rmrzHmf/GHdtwCiD+aQ/iVBR8mkj5HC1lqxSrG/n5jBfVsC/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764834926; c=relaxed/simple;
	bh=iTlPMjznJPbXtJOmJD38qd13ozQfx2VEj/0hkHnAJ+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q2zYjno80dto1zaUEr1l69pIER5c30zIqFiat1+l0gHvYLJ0AtK1XcPE5EYjbNK/fEfUio2jSEik1Of/lsUlx09bvs3p3J7pPJRbJk/A2r/iYdfhNdGBKbJVUZbdk7Dm15jfIVIi9t50yAFUoQBQHx4qLMUSTkNzhkf7ZnGfHdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVBfDhLn; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59578e38613so600384e87.2
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Dec 2025 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764834921; x=1765439721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=WVBfDhLnXSfCvsS1SAxp6E/otJpTNFOuveXhI8D1iYshreuNdrS800sKYNJDTC30Vq
         gHAZ3pZV73fhL5jPH9kw8tCcTKUBye+e5Qvud5yZg0RmDPogngx5ojRvjKZdGpeApKyw
         L7FQismbl6mDqUvAgJ8cMg4UbxBZkKKzmLZ4jB+wcxR+RrpVfSG8Bebjvt+b1UBzSrHt
         HbYJGJphm/RpRTx5PrPBcw9pRUmHd9AVwQ7FkkkS3dxlT2Yge9cLDyLPCJt8pNraUeh0
         JsqAH21FDLra4YgzdM4mT8RSQKqdjikS2FcYhO+iN605wlJkPNlWoIMYHvTAF0W6YPTW
         xrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764834921; x=1765439721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l5CWhh0bivbAxLbPHjrdPNLbMwbFtGK6KhcOChIXS0I=;
        b=Qg33AJnzJGKRzbSTAAYGFbWjy7l0KmfRAeWTQuN0hoYdK/KFAqEdM/6WAEa/qxKHfJ
         jCSS1bauE3uCr7OKRZEL6nrhM0tH0yWZY5eOMU+zH8PWpJpT9LxRJFbbjGmrqhwTVzV7
         u3tziX8EnGPoSA1V21ySTCiaslBr851MEGCOcislRipKdaI6+OSZkja8ORiOzaNUPP2j
         p5HU+gMUpbSegXsTcfeeTMnN9gva+T8Q6UP4/X0XVmTCXgFR4INSf8XNWMJSFUg+Ogym
         Ib0RRSKjZro9uV8Ub/RHlywF6t8TfbLdPck/kGxETAZFToGLesJJc1KR63C8D4tBtuKF
         kjHQ==
X-Gm-Message-State: AOJu0Yyo6ZftlqADAfzqgk6ttOlOe3xigIQiqcTFolTPKweD5oygsZty
	ZiDDc0Ny8mpOnG8G6do5jPicfxou7cv7JarTO33lKajjN8IWquK5vbgT
X-Gm-Gg: ASbGncuXgUnT9P/oeySmQ231SIblXNnyZDXmUFCR0jW+HepEJmi5Hp1czjHAKfb0hO2
	RGE/LlTTwj8N9k87ta0c8aceYykkHAdYFeHQ9pqm6EdqrtPWxq1IO37nws+ro85yx1scoMPaQZ/
	ZiPk4oQNjNtFVqEF5k1daRPopAOtAiG0tM2M5umyvwVIkKv5MXwQL5o5Yob6eq82r/1Dps682RI
	Le/jhzQWPH6Q2C1q2N9AavRN16B7yDjPhNOjDnPfb+puYELNCa1Lca33tWdM//vYk+peV6Xm2aq
	y5RLvJfwU6NqG4E7o0d9zhpGVfWKSVvO8eOFaF9Wc0PtOq5Qt9EvTIDAtLlCseAbg51eJNRi6du
	djUJ7xxsSQZMEefvxOw6+kCe0nimFK4hOwz9EzsdLfW9dMvpK7DH1Cn3/RJn4qHEDBwGWHQ==
X-Google-Smtp-Source: AGHT+IHtNtKovriM8w2pLkDHwyMQApqeD8GW60UnConeyFy7gFY99L8zBySpoiS8naABTGPgdJC9Sw==
X-Received: by 2002:a05:6512:159b:b0:592:f521:188a with SMTP id 2adb3069b0e04-597d6709d9emr571551e87.49.1764834921103;
        Wed, 03 Dec 2025 23:55:21 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-597d7c28019sm239190e87.69.2025.12.03.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:55:20 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Thu, 04 Dec 2025 08:54:53 +0100
Subject: [PATCH v5 3/4] rust: add a Kconfig function to test for support of
 bindgen options
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-gcc-rust-v5-v5-3-2d4f20d86c24@gmail.com>
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

Add a new `bindgen-backend-option` Kconfig function to test whether the
bindgen backend supports a given flag.

A subsequent commit will use this function to test for RISC-V extension
flags.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 scripts/Kconfig.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index d42042b6c9e2..5d4d29eed0b3 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -78,3 +78,8 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# $(bindgen-backend-option,<flag>)
+# Return y if bindgen backend supports <flag>, n otherwise
+# For now, the backend refers only to libclang, so more specifically, this function tests whether the given flag is recognized by the libclang used by bindgen.
+bindgen-backend-option = $(success,trap "rm -f .tmp_$$.h" EXIT; touch .tmp_$$.h; $(BINDGEN) .tmp_$$.h -- --target=$(BINDGEN_TARGET) $(1))

-- 
2.51.1


