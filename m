Return-Path: <linux-kbuild+bounces-10368-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A767DCEA399
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 17:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E81D303ADF6
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 16:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F603242BD;
	Tue, 30 Dec 2025 16:49:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8255275114;
	Tue, 30 Dec 2025 16:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113344; cv=none; b=Iaw+2bxxueG2mgi8R16z5BoLXEvpCpCraKavisFHdIUorQW8H1MrmXZX8JlrDHp8777KKWOiC6+Gt6n5maJVsYWChCC2Sx/nNRDL2ZE5uxfsbiJ/+ZE3HtiCBi7/l34xYgLJuUieUxlW0tBb2fZR7NoEtToVjLGEzGqqtbH41sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113344; c=relaxed/simple;
	bh=UeO4LvqKTW403HiuQ2KqCmv1QbNBxmU7+kNddLbqkDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VP7pbb6XGqcdmxbLunybVbgiQ798i9hKutuqFWs/KGjLnqzXR4AwVRDyMEj2jtj+raCaavCcKbn7h+Cr++CyBTlKwhAGtxy2caDHfAmA56VrQrGIRWIWGdJzOiEG2vWABVTgnm0Z0lZ3FjN6q5PK7/HVJ+0mM47jFMGKjbQSeo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from minun.felixc.at (unknown [65.108.105.71])
	by APP-05 (Coremail) with SMTP id zQCowAA3yQw8AlRpUjKQAg--.63740S4;
	Wed, 31 Dec 2025 00:48:30 +0800 (CST)
From: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
Date: Tue, 30 Dec 2025 17:47:55 +0100
Subject: [PATCH v6 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-gcc-rust-v5-v6-2-2ac86ba728c8@isrc.iscas.ac.cn>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
In-Reply-To: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
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
X-CM-TRANSID:zQCowAA3yQw8AlRpUjKQAg--.63740S4
X-Coremail-Antispam: 1UD129KBjvJXoW7WF13KF4xur18Gry7Ww4UArb_yoW8ur18pa
	1kKw1ktr4DtrWxKr1kZr4rXay5Krn5J3yUAFWkJ347KF45KryxKr4ftF9xWanruan8u3yY
	qr129as3ArWqkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQEb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVCI4VWUMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jzuWJUUUUU=
X-CM-SenderInfo: x0lq233loux21fy6x21ufox2xfdvhtffof0/

Generate a friendly fatal error if the target triplet is undefined for
bindgen, rather than having the compiler generate obscure error messages
during the build stage.

`BINDGEN_TARGET` is actually defined in `scripts/Makefile.rust`, but the
file is included regardless of whether Rust is enabled, so perform this
check in `rust/Makefile` to avoid breaking targets that do not yet
support Rust builds.

This piece of code is copied from `scripts/Makefile.clang`.

Before this commit, error messages might look like:

error: unknown argument: '-mno-riscv-attribute'
error: unsupported argument 'medany' to option '-mcmodel=' for target
'unknown'
error: unsupported option '-march=' for target ''
error: unsupported option '-mno-save-restore' for target ''
error: unknown target triple 'unknown'
panicked at bindgen/ir/context.rs:562:15:
libclang error; possible causes include:
- Invalid flag syntax
- Unrecognized flags
- Invalid flag arguments
- File I/O errors
- Host vs. target architecture mismatch

Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>
---
 rust/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 2603b34f9833..37b4205afb70 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -385,6 +385,12 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
 
+# Because scripts/Makefile.rust is included regardless of whether Rust is enabled,
+# we perform this check here to avoid breaking targets that do not yet support Rust builds.
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to scripts/Makefile.rust)
+endif
+
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.

-- 
2.51.1


