Return-Path: <linux-kbuild+bounces-12653-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OSxB2D20mmzcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12653-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:55:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C82673A065D
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0196130058C6
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B96A385501;
	Sun,  5 Apr 2026 23:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDWPhZSp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D9264A65;
	Sun,  5 Apr 2026 23:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433287; cv=none; b=LooFuI7d9woSLWyKKNs7ufkz1vBuQSeFsL1wvntMULv2W/T8gpy5fYVoLCcWeRo3/yatxd8zzP3s8chYYsUTR0NpYMhYCx4SxW+Su/yCtCFcEEtnDdbFGAgqVBNkCV67m1UFzg5dd1cM3tEVgYvzm8vMIm7qa6+MU3+T2Lp3k6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433287; c=relaxed/simple;
	bh=kAA62WBPcurVVrTXPGLQy+IyDPvmVjelJYdVSSg7Y/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5tuv+LEtdC1wFdThuz5sWawECs3txehG9EPhumNhF0picrNaizKM17kZ2EYoJLR844vUPNjx2JxCZi4BgOwB/yhnXiesc7/GmpJAPBTgJaM3CswgovuUKpXPmxUDNIGqLdROzt0EHhwYW2WPW93dSC4BOtfH9zxy1HtUOT2H1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDWPhZSp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433ABC2BCB0;
	Sun,  5 Apr 2026 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433286;
	bh=kAA62WBPcurVVrTXPGLQy+IyDPvmVjelJYdVSSg7Y/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CDWPhZSpnW+m2srqW9KnMzV7G9L1iRvIsEo8KP7CScPqG1Ifub79N4yj4T0IKrXc0
	 4XmCbJ8zDasSdrjt7qHAlDp9GjyKU1PVePB9pLKwO1yYKuqMmE+zMzS3f8ObYOQMzG
	 Sz8I1kSAf+/0TbbLJC2pKQ0kqL3IFyIPFzgAagHeEGUpcHcDj1c0A7xusZQz9bbfR1
	 FSgviWf3M31Ti8M4qq5aJadgtYloCGN8lrF7uyJTBqns8a/qMIIobVXaSkE/6gLioK
	 tJwkSLx6bxzgYU0l/ny8XpR3fIxVt28+VUtoLh3KPsIh2WOCgv/Dnw0iO3ictk7CMV
	 QrQTXJ8QympQw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
Date: Mon,  6 Apr 2026 01:52:43 +0200
Message-ID: <20260405235309.418950-8-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12653-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C82673A065D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

`clippy::incompatible_msrv` is not buying us much, and we discussed
allowing it several times in the past.

For instance, there was recently another patch sent to `allow` it where
needed [1]. While that particular case would not be needed after the
minimum version bump to 1.85.0, it is simpler to just allow it to prevent
future instances.

Thus do so, and remove the last instance of locally allowing it we have
in the tree (except the one in the vendored `proc_macro2` crate).

Note that we still keep the `msrv` config option in `clippy.toml` since
that affects other lints as well.

Link: https://lore.kernel.org/rust-for-linux/20260404212831.78971-4-jhubbard@nvidia.com/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile               | 1 +
 rust/macros/helpers.rs | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a63684c36d60..78f5ee173eda 100644
--- a/Makefile
+++ b/Makefile
@@ -486,6 +486,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::as_underscore \
 			    -Wclippy::cast_lossless \
 			    -Wclippy::ignored_unit_patterns \
+			    -Aclippy::incompatible_msrv \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
 			    -Aclippy::needless_lifetimes \
diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index 37ef6a6f2c85..d18fbf4daa0a 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -49,7 +49,6 @@ pub(crate) fn file() -> String {
     }
 
     #[cfg(CONFIG_RUSTC_HAS_SPAN_FILE)]
-    #[allow(clippy::incompatible_msrv)]
     {
         proc_macro::Span::call_site().file()
     }
-- 
2.53.0


