Return-Path: <linux-kbuild+bounces-12491-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ix7DhALzWnhZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12491-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:09:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF037A318
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7812F31E3E85
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357773FE67B;
	Wed,  1 Apr 2026 11:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjWiQDPS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5233FE371;
	Wed,  1 Apr 2026 11:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044188; cv=none; b=YLAGGuDSaUEVJCtDLzOESUBomLs1G71nMgPERREQ4EjdbnH/WUy/fcw2aAtx/PiIuZ71C5wai4SQZbOkpYdtqTG2u5s/bmmvhATWzuvKyoJ+VitTkoTrC6MaK+jBvsHdGy4XEMdUS8CO7ZmsbPaXzl7K89/GohHgblZoD8oX/tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044188; c=relaxed/simple;
	bh=F0SYtjFbh6kBuMGsAC3B+F39gCPSuEhNtbzMf6XGsWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxnvmGLdlZ9lasiLHB2rgMEUKDXA4OCdHxA1HMPYNAF6pQ/wTdgpQ6pMI2Nn33Frtod9IkEyube1lRYG1oUc4hJL8nwcjCT4v/X9N0R14GvlBrVdmwtUcg5CR6U9ZgHYaGkpqOIupADr4dLwNTK6Y30CD/CI0Ai/RzHbBoPz+xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjWiQDPS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ED1C4CEF7;
	Wed,  1 Apr 2026 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044187;
	bh=F0SYtjFbh6kBuMGsAC3B+F39gCPSuEhNtbzMf6XGsWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bjWiQDPS7KU8dGTln8W81nRJSDxVd935z9qep1PRx54VbkqUXW/NAm70R8Hb3bcsR
	 8kFWrBfwoF6D3u90VQt9gfnLw+5MkYjBrLJXy59CfwzSQzbJ9ghvKmP0T6jqh07qPX
	 nZgsxUNmMLQsOvMX+rmKU3cgAlYC8M5VsyLNlSoNCF1/ehwDrZSSxWO/ZDc9AkNKOl
	 dYN2s9Ca/uJe6eLXRE8O15eARgij9XreonoLWpWBUt7AKmqzZWMSIV0sfB6T/jdTcH
	 +x5bDQUczhl7SyXgJ6FO0IyhyMs4MyB6F3wzluhQW+3OP5KL9D3tvpD1rv5UJ4jY5I
	 xOkZx8Uz53dQA==
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
Subject: [PATCH 19/33] rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
Date: Wed,  1 Apr 2026 13:45:26 +0200
Message-ID: <20260401114540.30108-20-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12491-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B7FF037A318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a workaround that has not been needed, even already after commit
08ab786556ff ("rust: bindgen: upgrade to 0.65.1"), but it does not hurt.

Thus remove it.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/bindgen_parameters | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index fd2fd1c3cb9a..112ec197ef0a 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -15,10 +15,6 @@
 --opaque-type x86_msi_data
 --opaque-type x86_msi_addr_lo
 
-# `try` is a reserved keyword since Rust 2018; solved in `bindgen` v0.59.2,
-# commit 2aed6b021680 ("context: Escape the try keyword properly").
---opaque-type kunit_try_catch
-
 # If SMP is disabled, `arch_spinlock_t` is defined as a ZST which triggers a Rust
 # warning. We don't need to peek into it anyway.
 --opaque-type spinlock
-- 
2.53.0


