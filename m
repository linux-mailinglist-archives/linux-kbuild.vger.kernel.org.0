Return-Path: <linux-kbuild+bounces-2739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58613940DF9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 11:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89C351C246CA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 09:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2178F194C8C;
	Tue, 30 Jul 2024 09:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y4d+S3x7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1E194C83
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722332446; cv=none; b=PZKCnPezTSkDljb7nCqbzDHTmzLz7pNek0UabnCLAT4ZnVA9/BJtzH/LiOpmz6sIgzFu+nvbYL+y3GvbZnSqgpTvYrK92TvEJV4Q3KtUfh00b2VyNVf4i3RYc+xTxiBWLJR9AZD+F6eHc9fhTodcSkKgyaEN0fqLq/ty6Xv2p0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722332446; c=relaxed/simple;
	bh=z6AMQsvLXODLg+pFFWql7FTeV2LVKue/By3e3mHikHE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SopxgD/0GfbUorM5BmggXnaeUC7pCw9aji1hC0jceu77LU79Fq06JU4eTMAymDDzh0aCRyU6lU0lGPMzUZtfKmkv8kTb4Ndv9UEgqNUUVYoigGUhe/OXfXleVnxiUmYMD7DFlO2J7YXTqpTZP5LboFlqSRj/GyGw55vtG79SsF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y4d+S3x7; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e03a694ba5aso5982562276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2024 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722332443; x=1722937243; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gS5NAG/xp+5gIQFFz9RUi98/oCWDc4GVmPVVB519uaQ=;
        b=Y4d+S3x7MrIhnRi7AlLb5cFkDkqNAHjmp6nb+ZMTnLvJyoLHvZlyk9UV83iDSNUbcs
         KJoIYSmvfU+EVM//jv/1lvueSmz7DJTvgRiIPXy14JQpKxDTtRJ3XEDcAaS1p2dycX19
         Lp6NzLU+yQOMPsfFJIJT7OVIjMomJuo3h2D8yydBQuhpwHyIOoSYGMvXLKXeWLqkF1Rg
         sSqc+xp/3TcU2m2UfCqxnTW7YLKfh8So/bSlQxLt5iZKJCkhKDHAktHyJWlvp2q3x0Vp
         xQkxM/LrUiaLFXjP2yItOZWFTXtaw47TxXDygQChZzCznn5yO98Tk+PVfrIXlmyQcZwK
         78PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722332443; x=1722937243;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gS5NAG/xp+5gIQFFz9RUi98/oCWDc4GVmPVVB519uaQ=;
        b=m9RM4ANHUm2DgGtg7J/Kh0gwl7pEk5CrYbssu7G7yVXx9CbNUDyuN67D2BUK+75kW+
         WZPCE1M61A4aCmk5NzTUNY+xbu30ABeIYbdBX0DkpTBsclhZ/BW7S9eBvKapVywPgx7w
         dzh92JZgebOUW0JGT8yUpDdHMfm4UQ/kxLKiuYKesFWz5NSTOhXN8WGs/xDRQzrrQxK6
         KXLJaOXsj4nkkku6BCf1zJlvKaL9njcxKg+KklGinI53C/mpdGbsG2Z6e7ra+Ig7Wsgf
         SOVT2JInF7//SHR5LhjT0ZcgSc3VdCVOyUEGPJM+MdorW+eBoS4VjxFwiJ9ZwaMhU7tZ
         V2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWUkYmdRS3yLM33FmzYu6J4GenC9ITiiB4HoWvLo8W1Elmo+/PN2d3vno1+D+4XTwkQ36vwTNYigyWaUY163rEFCGoPqXXLM2vLk7rJ
X-Gm-Message-State: AOJu0YxvX1Mf8CVp8wK/GHNzQTtCjGlvrxJxXw3zKuwyO8uV3DgrG+tO
	CUrjP+7mfBW/Oali+tscGPlOrPQDRrmKibI+QY/TjKmqI7X9bruU95AbJa55I6lHnmcCBDDzEoS
	BCvZ/dlQfFvzk0w==
X-Google-Smtp-Source: AGHT+IG7qRLJEdvzuUk1cU0Hd/aciEvRihM2ezORcoZuOe/k9BC6vaOeX8Kq6q9sv7zNW5IYjU1d4dGctLx6EX0=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:c0e:b0:e05:afa1:9c91 with SMTP
 id 3f1490d57ef6-e0b543c014fmr17243276.2.1722332442725; Tue, 30 Jul 2024
 02:40:42 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:40:10 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPq0qGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcyNT3ezktEzdZFNLIwtLi1SjpLQkJaDSgqLUtMwKsDHRsbW1ABweSid WAAAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=z6AMQsvLXODLg+pFFWql7FTeV2LVKue/By3e3mHikHE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmqLT/DlXPvLrNiN9RW7CHa+JUKbZ8WpU9oawxa
 rBXINc5ExKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqi0/wAKCRAEWL7uWMY5
 RifMD/9S9iChYHZ4DJJm411uHpuWsB1EOpo1ysk8eYxa7ATNAbHYYO43Nq9NSWk4IqmW0N9/LvY
 1FVKvuieTZjiFl1MadCOEjxs5fn0wv7FOv4ONkq3gmu4Io0X02PR2a1R41Eyg+9I6FJj4Tt9rbM
 GfPgmL72NxrK2DwxLdfSt+jiAex3megb/Dn4jM8iMgfFb+nJBQOPN3Nqh0jbNjmTWbU3ARvV1k/
 MLDYCkP56vrb8ihRT0TroqIKD/v19BoJqEgVqMnXX/zIKUdHXRgmtIwheMKkZKJ9sXDvsLY1nj1
 xHpWQt2buoPo4zOedf0ly+gcAFUAFoDOU5r7mOsTnBZM0soDJIOuqO6hq2c2wDq4n5AGpJLPjNG
 iVG5edF+gvTNbo880EUp7PwSSVu0emeVCul6+DJSBEcnGiSkoKY9vYHH+ZqNiGeyDabYxSSE6he
 k5GtNCs6SnRTLsWRohtpEPHPja68cl8tuX6aQZOiz+oYgVVJuSjYsiY60oiLFtGhtM549DUxAV6
 AUpo+2txYCvo2a/79q1YghQCMadxNKikcSsZk+vjrivB+EZmw8IOYkfvdhMJ7RT+5DXvgQgGMGv
 cz54JGXnpLJYc4MUDP32bckFXU5vx7zXhikQoahrSqRXKIN234ZIaCya6b4r8ELXDGEj0QLIK9U vv8RhnWsX+Jx/gA==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240730-kcfi-v1-0-bbb948752a30@google.com>
Subject: [PATCH 0/2] Rust KCFI support
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

The control flow integrity (kCFI) sanitizer is an important sanitizer
that is often used in production. This patch series makes it possible to
use kCFI and Rust together.

The second patch in this series depends on the next version of [1],
which Miguel will send soon. It also depends on [2].

Link: https://lore.kernel.org/r/20240709160615.998336-12-ojeda@kernel.org [1]
Link: https://lore.kernel.org/r/20240730-target-json-arrays-v1-1-2b376fd0ecf4@google.com [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (1):
      cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS

Matthew Maurer (1):
      rust: cfi: add support for CFI_CLANG with Rust

 Makefile                        | 10 ++++++++++
 arch/Kconfig                    | 11 +++++++++++
 init/Kconfig                    |  2 +-
 rust/Makefile                   |  2 +-
 scripts/generate_rust_target.rs |  1 +
 5 files changed, 24 insertions(+), 2 deletions(-)
---
base-commit: 8718bc07faa6ddf4f7335a12e4cdd4ffc796bbd8
change-id: 20240725-kcfi-c592898e2bfb

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


