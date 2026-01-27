Return-Path: <linux-kbuild+bounces-10896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPMeOkDEeGmltAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10896-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 14:57:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9045295393
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 14:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D31273042983
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 13:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33E135BDDB;
	Tue, 27 Jan 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLGp59SL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEFE35B631;
	Tue, 27 Jan 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522161; cv=none; b=SYQ9BLW89cN5eDV4z4ldTM3yo4ZBfXIycbWttMsS2sxdIzhYeTummpcnj+REsUKdFMMjl0DnnfsJZ21+zg1MDVgn0rLS8PQeMkCBDfxTQCTvs1TYfxHiXlPjP6Vos+aeQ7YlE8RO/DxWHtVojoJ2RYJM2eehfc5cL+6rZhqQsWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522161; c=relaxed/simple;
	bh=J9h3BctZhtdKmb7cEw6+613P+IgYkCI1Ng1aDGOU9BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NA0akFJSCfis1F3Ib27q1Snb1Wvo1b0JVa4OVmQZ1CktTOUp5h9aZLXQNHP9TbYnt5+7ohiWmrhkZuSQaFdcIf+VUf/NU0SIvEk5MAHKz9NkvXoLz0RwVzxnfzpL36iIsplebq8Gqhv0xmfLiyHX2bOlX/fVjWgT9KjuPemgBn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLGp59SL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FCAC116C6;
	Tue, 27 Jan 2026 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769522161;
	bh=J9h3BctZhtdKmb7cEw6+613P+IgYkCI1Ng1aDGOU9BE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cLGp59SLBETGrLCr8IhrFVBMRpxpWZ0YgVhxDDIJo8XiYF6+dGgQZJmIDr7oxjyw+
	 pcrT5IFEJjElXEVbf1fbAIeC3zVNm/4eBwZR5zPFK/Pehs1Hhx48OmTuEbaBRC0Ki8
	 zrf3uJgWINYmPFOajC10ORnKTXuQsD+W1OFCDIsYLjGTE/nItPyr3Sm2EI+Lx6GF6o
	 ZACA81I099sCQV6eYKWPbSJlc+q/mHb2HCB1XLm42p7zd2mb+OHxZBY4B/+fGd3WvL
	 XYwLYKZbJo9ilGEyDNTPG30Y24DUdBjaO7fE6+LWDXzf4WFDjZ/fz+6zF5O81I7eqH
	 kswLWS6Fbd54Q==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 08:55:51 -0500
Subject: [PATCH v3 2/2] scripts: generate_rust_analyzer.py: reduce cfg
 plumbing
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-rust-analyzer-pin-init-duplication-v3-2-118c48c35e88@kernel.org>
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
In-Reply-To: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1769522154; l=4239;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=J9h3BctZhtdKmb7cEw6+613P+IgYkCI1Ng1aDGOU9BE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPemx9I9p0FL8tYmnhHr/FuvsMLBa4PzD0WMq4+BxhjiGn0JSqE02nwJc7QJsBXrtN4BWJ+MPIh
 8RbI7Hoq9/ww=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10896-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9045295393
X-Rspamd-Action: no action

- rust/Makefile: pass `pin_init{,_internal}-cfgs` from rust/Makefile to
  scripts/generate_rust_analyzer.py.
- scripts/generate_rust_analyzer.py: centralize `cfg` lookup in
  `append_crate` to avoid having to do so for each crate. Remove
  hardcoded `cfg`s for `pin-init{,-internal}` now that these are passed
  from `rust/Makefile`.

Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>
Acked-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 rust/Makefile                     |  2 ++
 scripts/generate_rust_analyzer.py | 13 +++++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 280a18617627..2461c5835a7e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -583,6 +583,8 @@ rust-analyzer:
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		--cfgs='quote=$(quote-cfgs)' \
 		--cfgs='syn=$(syn-cfgs)' \
+		--cfgs='pin_init_internal=$(pin_init_internal-cfgs)' \
+		--cfgs='pin_init=$(pin_init-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc94068..b96d3cbe3df1 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -35,7 +35,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     crates_indexes = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False, edition="2021"):
+    def append_crate(display_name, root_module, deps, cfg=None, is_workspace_member=True, is_proc_macro=False, edition="2021"):
+        if cfg is None:
+            cfg = crates_cfgs.get(display_name, [])
         crate = {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -60,7 +62,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     def append_sysroot_crate(
         display_name,
         deps,
-        cfg=[],
+        cfg=None,
         edition="2021",
     ):
         append_crate(
@@ -75,7 +77,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []), edition=core_edition)
+    append_sysroot_crate("core", [], edition=core_edition)
     append_sysroot_crate("alloc", ["core"])
     append_sysroot_crate("std", ["alloc", "core"])
     append_sysroot_crate("proc_macro", ["core", "std"])
@@ -90,21 +92,18 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         "proc_macro2",
         srctree / "rust" / "proc-macro2" / "lib.rs",
         ["core", "alloc", "std", "proc_macro"],
-        cfg=crates_cfgs["proc_macro2"],
     )
 
     append_crate(
         "quote",
         srctree / "rust" / "quote" / "lib.rs",
         ["alloc", "proc_macro", "proc_macro2"],
-        cfg=crates_cfgs["quote"],
     )
 
     append_crate(
         "syn",
         srctree / "rust" / "syn" / "lib.rs",
         ["proc_macro", "proc_macro2", "quote"],
-        cfg=crates_cfgs["syn"],
     )
 
     append_crate(
@@ -124,7 +123,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
         [],
-        cfg=["kernel"],
         is_proc_macro=True,
     )
 
@@ -132,7 +130,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         "pin_init",
         srctree / "rust" / "pin-init" / "src" / "lib.rs",
         ["core", "pin_init_internal", "macros"],
-        cfg=["kernel"],
     )
 
     append_crate(

-- 
2.52.0


