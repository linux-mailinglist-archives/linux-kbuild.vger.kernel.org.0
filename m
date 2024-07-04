Return-Path: <linux-kbuild+bounces-2369-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849A927998
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 17:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8ADDB230EF
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A4D1B011C;
	Thu,  4 Jul 2024 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lDkdNpUZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f74.google.com (mail-lf1-f74.google.com [209.85.167.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8389A1AE84E
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jul 2024 15:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105720; cv=none; b=UEoDCoS7j15dU5epPAYKab4dccYYgOAOtx4454aiPCL6tUmJxjJa6mpzwwBvw3Nky5f5bH1Q0nyelgAPC2q8EKg7WoVJ6jW17a1opwubqx2TgpZxNy2LecQplz1cZWFGHsh0LtAFFzlGZGxn0WA4evU0okmTaMeIfmUBChQb23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105720; c=relaxed/simple;
	bh=sMZ9BbO9POf0tBvc7/nZ7J8+lUS3pL+EDqabjAFyEGA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=C/O/+c+k8XgtW/E7FsPv4r16PvW6/Weojdpx2Dv/DKJRIfn1ls974jyW7p+HVFAnETBhtdqoMa5npkorUp6OfM5dwrw3GSH2Rv5TzQriDUv2fFHXuuhdSU6As+wy2q5tWpSgZPi/u4A+k0lb86LS4avAFYB2A+xuipWYdX4hte4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lDkdNpUZ; arc=none smtp.client-ip=209.85.167.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-lf1-f74.google.com with SMTP id 2adb3069b0e04-52ea249d1c9so524926e87.0
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jul 2024 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720105717; x=1720710517; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PzSiEWHDqLOxuRxN/UEdGAy5HCuRwVDWD6Rf7lJYZNs=;
        b=lDkdNpUZl1h9N1KrH/8pwiZa9TYAwq8gQlzxdU9ebzTwa5aTaDlcjVfRL/7eEfQUnY
         4V4Da5WnUlUbnRqX/MnRG/9+gfnrSbUMK9dundHO4zjAb+b9g9UFasSVHyDzyxQ2sEGj
         x1cR3OcB5p5pMX+soVmyOIhV9fh6GIZWms6UGPlCCJteAtWJPrVUAmu+LF0hTEYbr+Ak
         +AefQt6JRtwXr3iinrYw6ounTMU6bj19Lvj/4ujSMOkJZ1e1jObEcF+EaYhB247VZiR2
         q/2xsOHt5s56ZRFcCwLB95dwOjfA0DLq2tU5apXYQipkMT2V5QNsEspupKuCu9UR9/MX
         OEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720105717; x=1720710517;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PzSiEWHDqLOxuRxN/UEdGAy5HCuRwVDWD6Rf7lJYZNs=;
        b=t1GQ/OpfNPIAecf4177GtIaQEZmufk3yHIJQkt0x5JsXuHpe8GBVdeqRxwmS0kSIrP
         NCZQCK4xXYSy+dIPbPSWJlGyRJ6tdXO7XTplSz6aOKTBUa7HtpT4PtR9+5W0Vy1CIpDO
         QXAm1Cl99NO+AJCJuAp79QzQVt+lCjCSUVaUuv8NBxOjTysSUUeUICfrXmd1m9WlVGXZ
         JIb12sBR/aReZbCiYxJN10UFiN1hj5RA0NmDWJD0mTnPs9ROn/PSOUL73AMHhlLKz2Js
         lecqQM9zOnNc1c7tKYXnKRqJi4yoRppcXFwcGnKoT+Ic78o+JfQiTlNDaNSfQxD2zirN
         JBmg==
X-Forwarded-Encrypted: i=1; AJvYcCX9ctdBm5HtbDbfHybSaiTpmor7zHVbmiFI6ZPdcXtG7Px8a10GKHkYvJPtxFfR8NARp0M+K1pM0QibV78Yzy0ZqBaEyO49WX+oeGek
X-Gm-Message-State: AOJu0YxxwKe8pKHAQ+icIzQjnuvE8iWr24vYSS6LQbYLkvI5i5XvTdya
	NkyrpdLPrzS3tBX+IOcGziDLq/mqTOmY7KA6eSTTyo/29RWg0uHmTKziqasw/K8WsP0jTLTWjkR
	u50ITJaMpwzzuJQ==
X-Google-Smtp-Source: AGHT+IGtMjqJqbGdpeG6XkBOWWWAlxExMeckibL1JE2gb3ke1OrLZH6Wihub3zA9InePK7NnkTcNpv4TI7hjN1k=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:ac2:5591:0:b0:52c:98ad:2aa5 with SMTP id
 2adb3069b0e04-52ea064e605mr1667e87.6.1720105716416; Thu, 04 Jul 2024 08:08:36
 -0700 (PDT)
Date: Thu, 04 Jul 2024 15:07:56 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMy6hmYC/33NTQrCMBCG4auUrI3kry115T3ExThJ2mBtJClRK
 bm7aVcK4vL9YJ5ZSDTBmUgO1UKCSS46P5WQu4rgAFNvqNOliWBCMckUjQNo/6AI40jjDHilHfK
 uBSUbrjtS7u7BWPfczNO59ODi7MNre5H4uv7TEqecWlbXBqxiIPDYe9+PZo/+RlYuiU+i/kWIQ mB7USCt0g1vvoic8xuC2nZt9gAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=sMZ9BbO9POf0tBvc7/nZ7J8+lUS3pL+EDqabjAFyEGA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmhrrQpdWqyMX89InGD0RlfLUysaEpa7+2hl//G
 kdBemCumWeJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZoa60AAKCRAEWL7uWMY5
 Rvw9EACPiiNQuSaMz/hjO2blKrzq/IMx9mVL8aL7cKVQhf430WCkmYCgMh3LhQIXho1N0DQwSVS
 sCNasAs46lHK1C8u0DLQ+mt5L5w1qHva84IH6EkoObATW8dsrdsfD2HQFUl7bHT+eiZpG0/kXN7
 c5TMsg28LcPy08LVC/+VL7d9cBYgrIcsPPjAdrSwBM7JbZnNqaA03+DACaLC64i6fV/ha6y5JIH
 RMf4STxvpoPO3+u/RSu6OBlEUqXRSbaP4uHjcX/OJi1pX/Rq9gYgDcSEy5KEvpM/XzsVRphzovq
 dhzUegofv0TeAjPsALcJ18R8FEIVZZodrA8QtYYY2JbdY+7Bay0bwbpraebWgCanapAOjrUnWlo
 vmRNs5CIMhSSVPx2keaXZsB5nHm8YXglsxnkE2kAL1zRNxxrCFvd//g1Gx5jzC53k4NgkRqnfM4
 w/5+ezAAEby55UDdYyHiEZpVB576xTWcAfB9d6s5Jtm+sfc7B/rYw3zZ8wfKyPuyi/zEZv4aCWo
 xFGKWJLskPIDh56G8RJuqrGiJldPT+j61FD2XE3LPoJeEd+eim9e0xMXTE+OdcfO2gvbyAUvNML
 HWTDNsd4FduQ6JJHJqF8MO9vdzNmRxf64+ZWlk86WB3SFQzxazGAF6LP0hBIW+BmD1ohzb3/MNy xQKwHHQ9NwXMucg==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
Subject: [PATCH v3 0/2] Rust and the shadow call stack sanitizer
From: Alice Ryhl <aliceryhl@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This patch series makes it possible to use Rust together with the shadow
call stack sanitizer. The first patch is intended to be backported to
ensure that people don't try to use SCS with Rust on older kernel
versions. The second patch makes it possible to use Rust with the shadow
call stack sanitizer.

The second patch in this series doesn't make sense without [1], though
it doesn't break the build if [1] is missing.

Link: https://lore.kernel.org/rust-for-linux/20240701183625.665574-12-ojeda@kernel.org/ [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v3:
- Use -Zfixed-x18.
- Add logic to reject unsupported rustc versions.
- Also include a fix to be backported.
- Link to v2: https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com/

Changes in v2:
- Add -Cforce-unwind-tables flag.
- Link to v1: https://lore.kernel.org/rust-for-linux/20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com/

---
Alice Ryhl (2):
      rust: SHADOW_CALL_STACK is incompatible with Rust
      rust: add flags for shadow call stack sanitizer

 Makefile            | 1 +
 arch/Kconfig        | 1 +
 arch/arm64/Makefile | 3 +++
 3 files changed, 5 insertions(+)
---
base-commit: 83b1e6e4170cf96b2a7c49070dd43749649f454e
change-id: 20240304-shadow-call-stack-9c197a4361d9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


