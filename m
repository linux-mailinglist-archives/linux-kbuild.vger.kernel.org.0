Return-Path: <linux-kbuild+bounces-9787-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69476C7EAAB
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F15B03A3972
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 00:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257FA7260D;
	Mon, 24 Nov 2025 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HH/bmTBh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806A22339
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943808; cv=none; b=qW3kL2kdbQkP9lGErYrplDKrMTYsfFh4A4pNx2g1jRhrRNIegneiSLy+dovRHYeFHBujC+KTpiVKb/gT30mwwaBh5wCGDRdnzBdJdeTdSY4qDeyflZ78Jye1VrKHJMjxmKxFJz/R7WXFtfx3LA3/6+qxU0iM3H0eHVPNFP+bkq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943808; c=relaxed/simple;
	bh=cEQkVzIQAT5F+YBATsjdDaHzZfOdiRJgRCPobJ8Vjt8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X59S8or2gI7am5mgvgfbv5NbSohdBm4V2nqQBD5a+BffplPKYRrMkt08oLE+0JeZhffRNCOS27Ss69Ibcxf80krzGWMKVjQCQgb99ARwywObOg9ux/SztRmB2G4LPpyZuP75Ma6XriRvtScOfqWh7aWWiq88Bs+4hMIai005DI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HH/bmTBh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5942a631c2dso4867734e87.2
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 16:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943804; x=1764548604; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OW9zraMwsimBhMrQgXdByeYCxYLuz0CHVP+O90zjt8=;
        b=HH/bmTBh7XZkT2SOasCHK4Xjc81qhvGnXQ8yZYlu4wWfdex+M/i2IPvD6pQhJnJAtW
         kGFF1rsaXYcUuI534EZwf5AE0gCqp4obzHTA3aHQp1ix4lX+DWLKhikiez0eQZDiiQn/
         ifIfK4fOdlhro7Jp5U4ZlCQLfiSqSrbDfYeDukf50pvJd+h+ytzGCsvO0XYLFHB+jxRJ
         N5q4CDXoz5CYDzPnAZTMn8p3fBFkoNgnqT8JVvwq+jOFM8O7Q9AuAkFpp5NL+LXJNeY9
         PENgwX+7Ye7A3ehcS8xnW5wDVzrAJAGQT4I+IlVQlVqk/8YVDBDuNaTy4vGWaq4YwOoe
         uYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943804; x=1764548604;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OW9zraMwsimBhMrQgXdByeYCxYLuz0CHVP+O90zjt8=;
        b=KFZoVskblHjzyXoypeHxC7jXBLQHa0S/yoGduZaFHHYRcGL8/BMAlKeT0N3yA7ygK7
         y1rhfh2PVhH6s0d/TZFhO5yuHHcJ8S9j5lgy5DvEjqQ3myN48734Dr+ps57fjbTXNk4y
         QA/CoYKeRvQlFN8vUfoDhhrpTcP4fcsVGkcBMEuAC8hJK0fSLLcN7aR3WtyWR11u6kCh
         QtiR1/y6QatK+MKwP+O9eV1wcDIrgkKbfvL7JQDxDrUUmLEhAsD0Y0lEJMn9lDyIHaD+
         OI1kboxw9DKwnoSA8G/lbexFlulkk61F0FHHZR94gwFsjxix6Pp0GOE/Qml3PTqqW5Ei
         o7Fg==
X-Gm-Message-State: AOJu0YzkHZfsFclj1rxAB3UebWoNPlyP/poZlx1VWSW6jqPak8EGcUi0
	RUqLnKDSiZ82QmjGbE2xaicl/mXBwaP+gfxejaOprVh0CYv7REgPFjP3
X-Gm-Gg: ASbGnctFEFJUTXdIXYa7KtOdVWGKQm+pf3gLaeJXkdIv9vOLTQAcC99jCq36nnrJpcb
	mJ5EnN5ZXtouFHnvXFj/JZbqlArN1Xj9iSilC06t7bABqXd59s81x1Amen+pgdAzt2Qa+2AmvFP
	D0RnJ5Mu44VDpOf+7kgbXOG2PntBvj4keLWmMrBrEm+SwaC4EoghNds9Z8/7vXZAlW8R0HzbmFk
	qSL7YeGBaoz96D1NUWyfuHpZw56/eM3lyxB0e4dJkj4208oODiUePnFTt7asxOAmeM0CGkdEAEu
	fKWsi5Pvva/f2ru78kWvBdj1H0YDeEeWQduGp6IVuUdesLHGc8RfgEu+bru6P6JUa4pHkncZAS3
	etYtTqDQeLIAwmh4swVNRv/oESJGfAJmUHHl4nsJAucDNKrx3QK1mtq6Ro1OSgRuPVTJKrw==
X-Google-Smtp-Source: AGHT+IGp/S6DY+Vg8q5hhu61BVUxjpK+86wXNMq2cNDUYhkNRYb0qdjGVo9KqBjwyHEpqgrXlidJKA==
X-Received: by 2002:a05:6512:3e0a:b0:595:8311:dc80 with SMTP id 2adb3069b0e04-596a3eb3551mr3359466e87.20.1763943803843;
        Sun, 23 Nov 2025 16:23:23 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:23 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH v4 0/4] RISC-V: re-enable gcc + rust builds
Date: Mon, 24 Nov 2025 01:23:20 +0100
Message-Id: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHilI2kC/x3MQQqAIBBA0avIrBtIUYquEi1CR5uNhZYE4t2Tl
 m/xf4VMiSnDIiokKpz5jB16EGCPPQZCdt2gRmWkVBqDtZiefGPRKM2sHdmJjPPQiyuR5/e/rVt
 rH1qMHx1dAAAA
X-Change-ID: 20251124-gcc-rust-v4-1584dec7e5df
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

Previous v3 patch:
https://lore.kernel.org/linux-riscv/20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com/T/#u

v3 checks option availability via libclang's version. According to
Vivian's suggestion, v4 checks option availability by directly running
bindgen.

Compared to v3, commits are split into finer granularity, as suggested
by Miguel and Vivian. Regarding checking for undefined for
`BINDGEN_TARGET`, I've placed it in a separate commit. Since it's really
small, I think it's not really necessary to send it as a new patch
email.

Regarding Vivian's mention of riscv32 support, the documentation does
not declare riscv32 is maintained, and I have limited experience with
riscv32 and no strong motivation to test it. Therefore, this patch
didn't consider riscv32.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: fix gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  2 ++
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 11 ++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 14 ++++++++++++++
 6 files changed, 58 insertions(+), 11 deletions(-)
---
base-commit: f824272b6e3fe24950abc527136e8140f67b0b23
change-id: 20251124-gcc-rust-v4-1584dec7e5df

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>


