Return-Path: <linux-kbuild+bounces-10366-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F893CEA381
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 17:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4533A300C2A6
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 16:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20A4831A54C;
	Tue, 30 Dec 2025 16:49:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A523D2A3;
	Tue, 30 Dec 2025 16:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113343; cv=none; b=dELlKj+OeP+vf18xYt9cfwmukrKqBrojuHhKXzRcPS4ubf3fsjd8xveKEGIlEaOxsDqlY+GLjGWaFRQMh3kmffrJPQc12P/m3kfTwRJrd6zwblenkOLaFTauGlmwqMMdTIkbzO2YVt9GY+4f2Vz4L1C70taGcGaJK9ybdieYNKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113343; c=relaxed/simple;
	bh=TUu2Dp2xZxi1yNJqpMQ42nivcbRZIxIELfScEgMADkU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KmasS6xayOtHIJvayimq+FdxkhhV7WstcIu6B7Y31hnefqMad+mgd4gryRz0m8BzmdH4xYyvL91fXZRZLNeYOzdYWYtIoC5IDIGoK1keVwC1aOUFRgBZQBmu0cz758pw8XBxXhRGRH5wIbHrMrGMq9VNJ/M3rWp+p9irXeaHUso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from minun.felixc.at (unknown [65.108.105.71])
	by APP-05 (Coremail) with SMTP id zQCowAA3yQw8AlRpUjKQAg--.63740S2;
	Wed, 31 Dec 2025 00:48:08 +0800 (CST)
From: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Subject: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Date: Tue, 30 Dec 2025 17:47:53 +0100
Message-Id: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADkCVGkC/22MQQrDIBBFrxJmXYuZaChd9R4lC9HRDDSxaCotw
 bvXZl34m/fhvR0yJaYM126HRIUzx7XBeOrAzmYNJNg1BpSoe5RKBGtFeuVNFC2M8ZYcDT2ZAZr
 xTOT5fdTuU+OZ8xbT54gX/Xv/d9qkQKc8SncZLapbWAw/zjYuMNVav7H9R8mmAAAA
X-Change-ID: 20251204-gcc-rust-v5-aafcede31ea3
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
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor@kernel.org>, 
 Mingcong Bai <jeffbai@aosc.io>, Han Gao <rabenda.cn@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Jason Montleon <jmontleo@redhat.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
 Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowAA3yQw8AlRpUjKQAg--.63740S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW8KrWUGF48JF1fuw4UJwb_yoW8Jw4xpa
	95Cr4fKrWDJFWIgr4fAr48WF45GF1rJrWrJF17t34UJ3y7ur18trnIkr4rJa17ZryvvrWj
	vr1F9Fy09ryUCwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBKb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCI4V
	WUMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRAhL0DUUUUU=
	=
X-CM-SenderInfo: x0lq233loux21fy6x21ufox2xfdvhtffof0/

Previous v5 patch:
https://lore.kernel.org/20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com

Changes in v6:
- Simplified `bindgen-backend-option` Kconfig function by using
`/dev/null` with clang option `-x c` instead of `touch`ing a new temp
file.
- Moved the `BINDGEN_TARGET` check to `rust/Makefile` so it only
performs the check when Rust is enabled, avoiding breaking targets that
do not support Rust builds.
- Updated my git email to the institutional email address.

Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
---
Asuna Yang (4):
      rust: export BINDGEN_TARGET from a separate Makefile
      rust: generate a fatal error if BINDGEN_TARGET is undefined
      rust: add a Kconfig function to test for support of bindgen options
      RISC-V: handle extension configs for bindgen, re-enable gcc + rust builds

 Documentation/rust/arch-support.rst |  2 +-
 Makefile                            |  3 ++-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       | 17 ++++++++---------
 scripts/Kconfig.include             |  5 +++++
 scripts/Makefile.rust               | 10 ++++++++++
 6 files changed, 60 insertions(+), 12 deletions(-)
---
base-commit: 8640b74557fc8b4c300030f6ccb8cd078f665ec8
change-id: 20251204-gcc-rust-v5-aafcede31ea3

Best regards,
-- 
Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>


