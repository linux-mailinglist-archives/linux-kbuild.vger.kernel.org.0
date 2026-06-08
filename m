Return-Path: <linux-kbuild+bounces-13621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V0hlOUvPJmqvkwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13621-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:18:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFF657128
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mLJcj05f;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13621-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13621-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A60963032E4D
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D243CB2C7;
	Mon,  8 Jun 2026 14:15:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0633C9EE9;
	Mon,  8 Jun 2026 14:15:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928122; cv=none; b=r9nQcngDSDVYBmYsgZXQ2oibfLnpJRXWXf66b82SoJgIdFKyjS86sd38z4OolXXq4YlAs6vEZoxlmBc2ldxPUwtNnQEdK3Eo20RTv48ebPCuWyqle5niuy+Wwvv7H0feZYgJN8WkwjxhSqICPEXtBNkJpUXa550rWlALJtFcm5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928122; c=relaxed/simple;
	bh=g9Gazt+mOCemUQWkV9TDuTnSoNBxKVwfMntv1lHjPew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fx4tsbRxZoBJs1CH4xSno4IQkGwrL6q17MFtjEBXr7DOqHhw6CagAOdgD7B0CIHi33BJ/CXkgneFFsfvmHCT1gn6WULicYhC2tcsIo6DQ699S8YyqzyOQlguphwdh/i2VlcYeS11GstRcduzUAHa7Ve2QpYqvauAqiUOK+/oCWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mLJcj05f; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C006E1F00898;
	Mon,  8 Jun 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928121;
	bh=6MJva3C2P2njtHw5X+XwCGngpujbchDLshApcPNtoqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mLJcj05fC93MvDMXIHd6l0Tbghlb6BwAOA6G+XxBIOj/VKoaKKf6XgOUxtQQv3WzW
	 7Xu83Vdx5wP77SUXgIphMrMH3jpZMJsrA+Hy+80Lucc407891uFqqI6+BJr4lhyrwU
	 /UiWtV4yc/McWMq/hDrJw5IS/QqtrqADbHmIu4Rg8ZUZ6E6BsY4S/L9VHkIRPrSp2E
	 nwPl1tkRnO8244xUTNAAovAU5GZ11syE8jdJsoiNIx/9n5Qv5Ze/Raj8iuTWqN9pkR
	 PZtjMrb28pJX9P/dUG84sXO68UGPYnpT3iWX/XSlFJVXY6aL/3L3SxU1SHe2QK6cxY
	 xAQcWjudy14WQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>,
	Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 01/19] scripts: generate_rust_analyzer: support passing env vars
Date: Mon,  8 Jun 2026 16:14:20 +0200
Message-ID: <20260608141439.182634-2-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13621-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:tamird@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7DFFF657128

A future commit adding `zerocopy` support will need to pass an environment
variable during its build.

Thus add support for an `--envs` parameter, similar to `--cfgs`, that
allows to pass a map of variables to set for a given crate.

This allows us to keep a single source of truth for those values.

No change intended in the generated `rust-project.json`.

Acked-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/generate_rust_analyzer.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index d5f9a0ca742c..2477209e1e94 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -26,6 +26,14 @@ def args_crates_cfgs(cfgs: List[str]) -> Dict[str, List[str]]:
 
     return crates_cfgs
 
+def args_crates_envs(envs: List[str]) -> Dict[str, Dict[str, str]]:
+    crates_envs = {}
+    for env in envs:
+        crate, vals = env.split("=", 1)
+        crates_envs[crate] = dict(v.split("=", 1) for v in vals.split())
+
+    return crates_envs
+
 class Dependency(TypedDict):
     crate: int
     name: str
@@ -61,6 +69,7 @@ def generate_crates(
     sysroot_src: pathlib.Path,
     external_src: Optional[pathlib.Path],
     cfgs: List[str],
+    envs: List[str],
     core_edition: str,
 ) -> List[Crate]:
     # Generate the configuration list.
@@ -74,6 +83,7 @@ def generate_crates(
     # Now fill the crates list.
     crates: List[Crate] = []
     crates_cfgs = args_crates_cfgs(cfgs)
+    crates_envs = args_crates_envs(envs)
 
     def get_crate_name(path: pathlib.Path) -> str:
         return invoke_rustc(["--print", "crate-name", str(path)])
@@ -92,6 +102,10 @@ def generate_crates(
             is_workspace_member if is_workspace_member is not None else True
         )
         edition = edition if edition is not None else "2021"
+        crate_env = {
+            "RUST_MODFILE": "This is only for rust-analyzer",
+            **crates_envs.get(display_name, {}),
+        }
         return {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -99,9 +113,7 @@ def generate_crates(
             "deps": deps,
             "cfg": cfg,
             "edition": edition,
-            "env": {
-                "RUST_MODFILE": "This is only for rust-analyzer"
-            }
+            "env": crate_env,
         }
 
     def append_proc_macro_crate(
@@ -347,6 +359,7 @@ def main() -> None:
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
     parser.add_argument('--cfgs', action='append', default=[])
+    parser.add_argument('--envs', action='append', default=[])
     parser.add_argument("core_edition")
     parser.add_argument("srctree", type=pathlib.Path)
     parser.add_argument("objtree", type=pathlib.Path)
@@ -357,6 +370,7 @@ def main() -> None:
     class Args(argparse.Namespace):
         verbose: bool
         cfgs: List[str]
+        envs: List[str]
         srctree: pathlib.Path
         objtree: pathlib.Path
         sysroot: pathlib.Path
@@ -372,7 +386,7 @@ def main() -> None:
     )
 
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.core_edition),
+        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs, args.envs, args.core_edition),
         "sysroot": str(args.sysroot),
     }
 
-- 
2.54.0


