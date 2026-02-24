Return-Path: <linux-kbuild+bounces-11399-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD/fAetxnWmAQAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11399-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 10:39:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EC5184C6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 10:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 36B4B30C0266
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 09:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58A136D501;
	Tue, 24 Feb 2026 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QDqfC4Nn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A5836CE17
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925926; cv=none; b=qlPFMW7tDMToVjOB+wTAj1k4rfHgAZCNECdq+98aw286euuQLOxS182WGu4VJe6wPzAxr8hrx6dUwUZMP0YdC6W98tQcHtBWuU5MxdC9lpEID8TFyG12cYbRI6eP9nTUwg8QZnbAmUQWoqCmIfkrc2m0wXBndYVpjpn2b7mWb2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925926; c=relaxed/simple;
	bh=oBt0IdxnnhkZ0g5np5ZbxHi8G2tHQUQMowfTi1g3uy4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QSJdTVHLKORfDtDysfqTVWWQkZ6VQAp9riQkMOHsW9Oi+s3C4Vt45uEX1mpnpyl/odxgo1h1vjuw4I4vb4/ADIfeK1xX4/rbYTJhX7pXm1olKiSvL30CocOAtFz1xrijeLXu3DYe0+UND2lZM6irctpptvD7Dqm0gxp3beYybHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QDqfC4Nn; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4363333c102so4038032f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Feb 2026 01:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771925924; x=1772530724; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmoyykDD/w79A51QbLaUJSobDaeNleJFCFG+lFijE94=;
        b=QDqfC4Nn+T8qXCY+QJGyl55/R7khA95shBOFwkwXThS9tZ043fY8hn0h6Mw6qOGkuL
         dLxpI+jnajcfvfZKHXOaS9zm+CNGqxTd2XwFQW/NRa4QXbSFRPiiC6M6LBC4vL+l9LDK
         p5rXhY9Umf1pB+pS+5aczfbeH3IiUKjsC6SlzPFK8JfI34t73nZLRzmPntsEM3/SW+lX
         yLeCVg8Ww6NkBuGkJC31e6kQPppbJQny9o0Z4h615vAKlsC0OQwhrlg5aR9rtlmVKdFW
         3myKBAvjL6MaYvPtJ4B8kz8gzWUjmShIRmJF+6E1U81nprKVCnATxr57Euho3QxSZBxQ
         wtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925924; x=1772530724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmoyykDD/w79A51QbLaUJSobDaeNleJFCFG+lFijE94=;
        b=GzQqo+YOV8kofI1GltGVVFc/ntmCEjM+JmtsmoPFXfAkJdXsYOcjuI1EkwvIhaEVcF
         p2IR9zCssCEViA9iGELU0KmLuNznrlwtEf5NTxdlglzODl02s+DHRwbbICjvYN4yrT+8
         ADM2XTm6ihKK+oHluZa30VcVpoMNInSPhfuTBo2KKYowZc2hVzhIoEWwvwypvc/y/bbT
         zbF2D0lwXK7Vuz1jX1BN8KfnxZ3g6S4Dvp+g4CsHUVIK3ts9qSBM1+EnDEuU6ThdXMzQ
         ooLq470JjnzflNW8poAySl7YgN7nkQ+0zB+msDMe5it/c+dn6Q0FlrGmqXheNUn4QHMx
         Mk0A==
X-Forwarded-Encrypted: i=1; AJvYcCUho8uzZ7L8X5L6+HVEQXZoXLeIaOus6IULfklsn43VXLX5kalRSNsS9CwVtTMO3ClbCND7+8Fd3pKjqqE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+W8odrmAk522k6sATHoEtFHXpulXFDeRiUzjc9EHRgY4zMWU
	7Srhmv9fRo0Y/axrxyjKsoQOrlkam3dNnAN9D/PV79EJoq78kEfykztxlQJiP0hJubI4CluZ6qb
	KSvoprL5VKNsVsRez3A==
X-Received: from wrs7.prod.google.com ([2002:a05:6000:647:b0:437:6efb:7aeb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f86:b0:437:6efe:94d2 with SMTP id ffacd0b85a97d-4396f153ad3mr21312440f8f.4.1771925923605;
 Tue, 24 Feb 2026 01:38:43 -0800 (PST)
Date: Tue, 24 Feb 2026 09:38:34 +0000
In-Reply-To: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3626; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=oBt0IdxnnhkZ0g5np5ZbxHi8G2tHQUQMowfTi1g3uy4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpnXGg+OFAFDTnKGgsZqWB1MwWC8UuwCbFwr/ts
 WNfNaPSF3uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaZ1xoAAKCRAEWL7uWMY5
 Rh1GD/wNg0UPr1FuQf+jaIunm5aG6ARiukRF5Na8zpJCOCV1zXRCShTNJdm8gRhUCVw07pvhRYw
 ub7bN3BYYpewPWP7EbRujQ9iIejp/WInXwiszB1hwJBOiCG7ENB/SN6kFm3Djrx4NlUfvCYPOs0
 8SsLS4o2Sv0NOl5KjKfaR+FKBGPCqJQzEDJ15txwBeve1g7/TAK6cEk/Z3zU7WbCdq1Jz7JuP3S
 r+Rw6IhwKnFrjU6/t0p1GBsqSg3LAkXO89l5RXTRYiIHPf2pCs0w/erSIcEJZ7J6kNQCB8DYNsG
 uZRp8Hi3MrUzDR+W/0OGtnZnkrxmMX9MWY4axsTnQzkEv4jwa7nIDrUyf30O+wTh83tK9IKnBY/
 wCHlrJULnlN8fQ6sy4qAHsemDvs9pSyzi7f68pjYzZNwU8B679WY1nt/T7Rq9m7CMGC4J8S2wRN
 o/bcUMb/xvrtJ/AhR1C0aRe7US7Z3fBuHQldUEm/5mo3N6cXkLe4MVzcb8Mp66ACd2Vpdc49xP3
 KOTBcPjddmEmdGc3Un7FAgITm5OPXxu20uKoFze2GNGAyLUbrzGcAMg5FF1HWiOAn1AH2RR77WC
 5HxUPGMiKVoIeaECC7UwrhYnSPDYy5KK6S8mhtLrTVqfY1lBUmSyzYtzPTOSVXPA4Pl3LOX8i14 Lv8PbsTxdB8ERXg==
X-Mailer: b4 0.14.3
Message-ID: <20260224-binder-crate-name-v1-1-7dfc1289abbd@google.com>
Subject: [PATCH 1/2] rust: support overriding crate_name
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11399-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,generate_rust_analyzer.py:url]
X-Rspamd-Queue-Id: 73EC5184C6E
X-Rspamd-Action: no action

Currently you cannot filter out the crate-name argument
RUSTFLAGS_REMOVE_stem.o because the Rust filter-out invocation does not
include that particular argument. Since --crate-name is an argument that
can't be passed multiple times, this means that it's currently not
possible to override the crate name. Thus, add a RUST_CRATENAME_ option
to make this possible.

The logic for getting the crate name in generate_rust_analyzer.py is a
bit hacky, but I'm not sure how to do it otherwise.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/Makefile.build            |  4 +++-
 scripts/generate_rust_analyzer.py | 21 ++++++++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..dea8320e5bde 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -324,6 +324,8 @@ rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,of
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
+rust_cratename = $(if $(RUST_CRATENAME_$(target-stem).o),$(RUST_CRATENAME_$(target-stem).o),$(basename $(notdir $@)))
+
 rust_common_cmd = \
 	OBJTREE=$(abspath $(objtree)) \
 	RUST_MODFILE=$(modfile) $(RUSTC_OR_CLIPPY) $(rust_flags) \
@@ -332,7 +334,7 @@ rust_common_cmd = \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	-Zunstable-options --extern pin_init --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
-	--crate-name $(basename $(notdir $@)) \
+	--crate-name $(rust_cratename) \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index f9b545104f21..4126acdc03ec 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -8,6 +8,7 @@ import json
 import logging
 import os
 import pathlib
+import re
 import subprocess
 import sys
 
@@ -194,6 +195,16 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         except FileNotFoundError:
             return False
 
+    def get_crate_name(build_file, target):
+        try:
+            contents = build_file.read_text()
+            match = re.search(rf'RUST_CRATENAME_{target}\.o\s*[:=]+\s*(\w+)', contents)
+            if match:
+                return match.group(1)
+        except FileNotFoundError:
+            pass
+        return target
+
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
@@ -206,13 +217,17 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             name = path.name.replace(".rs", "")
 
             # Skip those that are not crate roots.
-            if not is_root_crate(path.parent / "Makefile", name) and \
-               not is_root_crate(path.parent / "Kbuild", name):
+            makefile = path.parent / "Makefile"
+            kbuild = path.parent / "Kbuild"
+            if not is_root_crate(makefile, name) and \
+               not is_root_crate(kbuild, name):
                 continue
 
             logging.info("Adding %s", name)
+            crate_name = get_crate_name(makefile, name)
+
             append_crate(
-                name,
+                crate_name,
                 path,
                 ["core", "kernel", "pin_init"],
                 cfg=cfg,

-- 
2.53.0.371.g1d285c8824-goog


