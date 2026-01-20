Return-Path: <linux-kbuild+bounces-10744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EH7OOaexb2nMKgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10744-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:47:35 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C3147EA7
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 17:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C68677A04F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 16:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7059044E02E;
	Tue, 20 Jan 2026 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWpfOe7g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFA45104B;
	Tue, 20 Jan 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925425; cv=none; b=o65RION42NInXRB0G6y4xytdATrN96tuVcD75+S4UDQhJDUojvvSuVoZoxPXKiF/Yw41nGdJrzm24rvJwuxxyvhRwMBTXSMOJrxj+uiNQfiYT2UiPhu+aj3zPO0PiSflZJCQT8En1gFk4E/MunNx6cJ7jnlCIOO4Ct2k3odfLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925425; c=relaxed/simple;
	bh=P2p3NqXP+ArKjNSdDe0MPI8oG8RpEk1GplpdfmV7IZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jGa0+nrub1XB2O5ba6doVBtvYYkYSg58j8vw6QFybIT94IvqThGRXinuZPqaXiwDO7jNbxZd88nrP8r+STOjHEhLaSNawUDy8jSVmLXEpGjRtdMmgNPZHUiQu1TDpeJKVJrYOVS/yK+bJo+vRne3vDbMISeQIiOE/yoJoNLBF88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWpfOe7g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7331EC16AAE;
	Tue, 20 Jan 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925424;
	bh=P2p3NqXP+ArKjNSdDe0MPI8oG8RpEk1GplpdfmV7IZM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWpfOe7g3rCb1m2HRy6OKGQlWs+M+504DS625lWIFA6cFchRE7FWHs+FdbmXz/7U/
	 q3q7ZVokhITYZl5syPymv4VhKTIJpTFoiH/ZIxeZSpVs0y5mFd159sfHPjPqrj0RzX
	 /k7Evs12d3Zti4Z9qFrFlmeMOsuslDeEgo6MRMpHdz+KsRG400jEECzxpFn0ZNhunD
	 ikmsPj5eA2SSw7FUH1TjWDuYunkUi7aJgXH3AnMb+npppO5Btgzsrh07oUn0pZ6gOh
	 T84Osron26VaEMreI0mE7nsr6PRG8K2pHe0LisnZ3To9WWuhS6AYNhoNb3t1VMbLCU
	 YJrU7iyaKRqyg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 11:10:11 -0500
Subject: [PATCH v2 2/2] scripts: generate_rust_analyzer.py: reduce cfg
 plumbing
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-rust-analyzer-pin-init-duplication-v2-2-a1c76f0d3bef@kernel.org>
References: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
In-Reply-To: <20260120-rust-analyzer-pin-init-duplication-v2-0-a1c76f0d3bef@kernel.org>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1768925419; l=3423;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=P2p3NqXP+ArKjNSdDe0MPI8oG8RpEk1GplpdfmV7IZM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKVsFUjvvspVhVQGyxc4AfxPm60drQ+94NFqE4+L87EvsVgNEPRN7z2U/MiGNLSHeGqVRS+2xQG
 qz8isAv/7vww=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10744-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A7C3147EA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Centralize `cfg` lookup in `append_crate` to avoid having to do so for
each crate. Remove hardcoded `cfg`s for `pin-init{,-internal}` now that
these are passed from `rust/Makefile`.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 scripts/generate_rust_analyzer.py | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

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


