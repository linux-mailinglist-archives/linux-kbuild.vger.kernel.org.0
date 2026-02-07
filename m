Return-Path: <linux-kbuild+bounces-11071-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPJ5GL9Ph2k7WQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11071-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 15:44:15 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B836D1063F9
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Feb 2026 15:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D338301778D
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Feb 2026 14:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8522E34F495;
	Sat,  7 Feb 2026 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srNNUUnT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC3C285CB6;
	Sat,  7 Feb 2026 14:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770475452; cv=none; b=OfQlhug6OkJ1vJkutKT6Ut1Wgh1ElPvbaZzvPeOFWfFM8kOvaM4+QVjOW8xUGZ+plUdvKA8qK0y+RAn/YuF+jarR3fEnnK5uQiUiJZ6AwMLJgOaZl7quKMtmTWZBwJpUOhvjV8PlIGg78wQ0h2u+RJd7c3y6A0W8WKwUADzjAEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770475452; c=relaxed/simple;
	bh=GRB53qmLbtIgjt4JBhRaCv1A2w2EobofQS0l4E+aASI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJyqzsxYnzbLrNlkeezLpku0tsl+Doa4LJh/fjkefAJYJNuiTw7Eo8VbbJDrGCupG+bpR15/tbV6TuDwsLKqW9oIxU8hJa1teKdcsy6cRh3UTpmdgT41hdR38Wbeoc/HQFtx2D6w0v9wfW93L32l45tP6ztAYT2IX2Juy7FU5nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srNNUUnT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DB5C116D0;
	Sat,  7 Feb 2026 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770475451;
	bh=GRB53qmLbtIgjt4JBhRaCv1A2w2EobofQS0l4E+aASI=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=srNNUUnT5xDRBR3rHAnL6nMS2A5O77eUlyg/Uyavg4saTKYCELlV+EZChf6Jju/Vy
	 IdZEQ3OUdfU2oYZVaTjv0KGOezGT1xj9FLV36Tk7v5ZD2YCGE1T8dnRZzFo7E7Zcwn
	 hTBN+LeU8GZv16RZ6HxID01aVb2q41qfcUoijMZssgEJoKXq6qIHY9IwsXoCON/Oxu
	 OGCZxaLOUULwW0xLeGDlYpdLpi/uAvpkl4RGzQw80T+YlYdgrj3vjtGUkni6OGbqyY
	 uWi7gUHDy1JAzArBY+mPDbsjf5tzCfxltraAInQwsFV3Esf0oFXE4id2+uQGOVii7N
	 FnRCEVQJLG7tQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Janne Grunau <j@jannau.net>,
	Asahi Lina <lina+kernel@asahilina.net>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] rust: build: remap path to avoid absolute path
Date: Sat,  7 Feb 2026 14:43:55 +0000
Message-ID: <20260207144356.3063613-1-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-11071-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[gary@garyguo.net];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jannau.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B836D1063F9
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

When building with a out directory (O=), absolute paths can end up in the
file name in `#[track_caller]` or the panic message. This is not desirable
as this leaks the exact path being used to build the kernel into the binary
which is not very helpful to achieve reproducibility. It also means that
the same location can appear in two forms (relative or absolute).

This is reported by Asahi [1] and is being workaround in [2] previously to
force everything to be absolute path. Using absolute path for everything
sovles the inconsistency, however it does not address the reproducibility
issue. So, fix this by remap all absolute paths to srctree to relative path
instead.

This change can be validated by building a kernel with O=, strip debug info
on vmlinux, and then check if the absolute path exists in `strings vmlinux`,
e.g. `strings vmlinux |grep \/home`.

Reported-by: Janne Grunau <j@jannau.net>
Reported-by: Asahi Lina <lina+kernel@asahilina.net>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Per-call-site.20data.20and.20lock.20class.20keys/near/572466559 [1]
Link: https://github.com/AsahiLinux/linux/commit/54ab88878869036c9d6620101bfe17a81e88c2f9 [2]
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/Makefile          | 1 +
 scripts/Makefile.build | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 629b3bdd2b20..598d2efede32 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -582,6 +582,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 		--sysroot=/dev/null \
+		--remap-path-prefix=$(abspath $(srctree))= \
 		-Zunstable-options \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
 	$(cmd_objtool)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 204e58dd1bb0..03dde30e953c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -333,6 +333,7 @@ rust_common_cmd = \
 	--crate-type rlib -L $(objtree)/rust/ \
 	--crate-name $(basename $(notdir $@)) \
 	--sysroot=/dev/null \
+	--remap-path-prefix=$(abspath $(srctree))= \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
 # `--emit=obj`, `--emit=asm` and `--emit=llvm-ir` imply a single codegen unit

base-commit: 36896083ef4dbc302e406f01975a227784160cf8
-- 
2.51.2


