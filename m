Return-Path: <linux-kbuild+bounces-11781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC7AL0s4sGkKhQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11781-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:27:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 339442535F0
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 16:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6248932747BA
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 14:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB22305047;
	Tue, 10 Mar 2026 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wm48STF+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C413309DB1
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154436; cv=none; b=OrQ84nRyA14O0EA1iH2I78KVOLrTiSt2Q4lfFdOlBVTcEVt/CGTgBgdF92wseBWC7y+g2OB0/U0+XHHE7ytXVuwSRC8sa4+1vzfFriufNE0eciqw5TMBntIQ3VMXS8SvlkYEPYsoFWcHdacxzqP47N+fFpxwG3yG6xGFNoSChB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154436; c=relaxed/simple;
	bh=4u4fvhIPXB5kgN/ABSv1+b4y6J62ECuYF2r+Uugelr8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uS/o1CvAxlsKUmR3V8KYSSKwzVg5s3cER6No9S+QaPIlzUfv+LvME8BgTv5Ia9fudLBOhyBknpIwmLDBrd2b7SKbX/fpkZRZYuSyNLt7AP4JZgAvtIaPwZLNWc60xnTi0qW63sPKGg8lhnWHhpGpL1XNikPQyKInhn+qbPjQXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wm48STF+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485390246c8so27512675e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773154430; x=1773759230; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=94L9sp5k37zNcDTmcYvp+EilCNTURvypp4H8uEwmm3k=;
        b=wm48STF+oYtN8Ym1cR3NyFYD8cG/1nD0eHeONn1fLI6OyplfBlF59g0Ww5e2zxP+nB
         49cy9Ip8VPO3NxRpGBf3IZ/wkUlzA4bgWJMyS8C3aIek70/EGW0gWJJlgX1XVvEjn3DZ
         Opi4Qr8lvQ9AhBUCzy5Ck1EQ855nab4mNRcyENyNAMRoJUGongmFognA+DVYtUZEMD4I
         jkP803Env0CyLsJCo7Cmw4W+7A0P935GkRgvvqiJSI8QT8VY3RNfigg/2xtbhTJnG1d3
         cDQaq1EWEAi91G40XqXwkKhe7ZfISbgH0QfL+61Hg295KLOsoUKb5i2LZS8+W7c7yIfs
         F9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154430; x=1773759230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94L9sp5k37zNcDTmcYvp+EilCNTURvypp4H8uEwmm3k=;
        b=exFWLJhXkBU8MJOAXjNOzH02I5Ragohvjchoe4iwnJsdQD6EcmcuP85v508Y8F+7Bh
         MHimTqDvtEdtJ1fsSpO0YuTLBwYln3WnJvCv3HWIVxBoiaVDgmWNm2QjYiFFnswcU0yA
         fFP3VYE48ZCvR2FUCcHIG4AtLgJxZbYpLYu3dsw6Dbx+TUlQIBn5glwzR+0aqg1xbNp6
         k32RkVtPpHq3muKRFKsrlIFNldJ1QIH9MvmErL24vneBQF/g5chaDMPHgQdeQ5eihHQ8
         oIma3NxQ1VDOZFoOHN0Wi9M2tY+3xINS+u4MLMoorLrwGRZX6Q/MDVsSsI0MF7oFN+xW
         nq+w==
X-Forwarded-Encrypted: i=1; AJvYcCUTa4ritmbZgztwLXTOZJE9DrmEry+JGrJ7O9pTNRnfYp2aKT93BJNHYl8GY2GTyMhuQYCpqscgNuvrWaI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx48yeHLLTCkH8YjCmMknwdOSqQmN2MfwarmdmUqZr4oVqttvs8
	dCwsIlCoulbpAPr+ZhRWou2UUSoCxsO943IDHhcO5YT6r1x9fJUD4NFA1Ye2B7yWbJKPrWVHEi/
	Qk3nIBw9GPA3QhClz1A==
X-Received: from wmcu18.prod.google.com ([2002:a7b:c052:0:b0:485:29a1:bfbb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c094:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-4853f170524mr89679585e9.21.1773154430332;
 Tue, 10 Mar 2026 07:53:50 -0700 (PDT)
Date: Tue, 10 Mar 2026 14:53:40 +0000
In-Reply-To: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4u4fvhIPXB5kgN/ABSv1+b4y6J62ECuYF2r+Uugelr8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpsDB7GkmnDRMzOeFUAB53R+gB52QijKuyS43tu
 a2O1BemiWmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabAwewAKCRAEWL7uWMY5
 RtN5D/93HcSbicvwB/z25I9ulnaEtffRUX9jVoyA6vf2xxBcJ1Ul2exM6MmQgUAUCe5Itp78qls
 Fw0n3T8PDNq+7+VY2hCIMAfKOXA+DHAufPfAdJMydNeWEBZriF8kMbZtuXCLcYBnae5vYJiGnr8
 TCbD/Ch9IxX2xNqwiEmJ6iIZEnL0gcY2gfzUxl7HwBVcxyWQXSd8UTeDFOaos/DR3KTWT3ZMZ2B
 u9rxqqFit6SqQvIDh7w7tp8FV2v7qkkAZZSpC7PvLdRpQ5kNCl5Jowa6le75SPg4P4nLW9Stvyp
 lRGiTnZ7zYCml+/2ug0OB+J/PqgNwXycSe47CRAmYG9sYwCaLwL/6iuABdfVwzLH3OPntb0zQA4
 9sBh0Nj+Ek4uIl4/FrQr+jjuBNZ+lGztmh0pO4ycUCKj/eVNLMEljhCjQCop4I99YjlLQzAapIo
 MW14P+tEPxT5IoD2LFOkuLCTwHizxztGBcJqOPhSP6L5VgGUuu4U2ILulE+H6hJJfWxX4RixO87
 wvKmkA8v/STXT1S1gFikyjmaB8hhQirCoIE0aNrE91RM1hA9849qM87SKibhK0qPtMM6phl1dMy
 IYPEqDeacZ+q2CgqpT3rc0U3aI5LbWrYqKaVcDrm3bgF1Plz0yzwYFNSzzw6ZNy9N+h2N/I4Zkz 95irDktEr9uSb2g==
X-Mailer: b4 0.14.3
Message-ID: <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com>
Subject: [PATCH v2 1/2] rust: support overriding crate_name
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: 339442535F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11781-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Currently you cannot filter out the crate-name argument
RUSTFLAGS_REMOVE_stem.o because the Rust filter-out invocation does not
include that particular argument. Since --crate-name is an argument that
can't be passed multiple times, this means that it's currently not
possible to override the crate name. Thus, remove the --crate-name
argument for drivers. This allows them to override the crate name using
the #![crate_name] annotation.

The --crate-name argument is kept for the crates under rust/ for
simplicity and to avoid changing many of them by adding #![crate_name].

The rust analyzer script is updated to use rustc to obtain the crate
name of the driver crates, which picks up the right name when it is
configured via #![crate_name] or not.

Note that the crate name in the python script is not actually that
important - the only place where the name actually affects anything is
in the 'deps' array which specifies an index and name for each
dependency, and determines what that dependency is called in *this*
crate. (The same crate may be called different things in each
dependency.) Since driver crates are leaf crates, this doesn't apply and
the rustc invocation only affects the 'display_name' parameter.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/Makefile.build            | 1 -
 scripts/generate_rust_analyzer.py | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 32e209bc7985..adc3e2d1ac78 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -332,7 +332,6 @@ rust_common_cmd = \
 	-Zcrate-attr='feature($(rust_allowed_features))' \
 	-Zunstable-options --extern pin_init --extern kernel \
 	--crate-type rlib -L $(objtree)/rust/ \
-	--crate-name $(basename $(notdir $@)) \
 	--sysroot=/dev/null \
 	--out-dir $(dir $@) --emit=dep-info=$(depfile)
 
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index f9b545104f21..d25bc3d7e719 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -194,6 +194,12 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         except FileNotFoundError:
             return False
 
+    def get_crate_name(path):
+        return subprocess.check_output(
+            [os.environ["RUSTC"], "--print", "crate-name", path],
+            stdin=subprocess.DEVNULL,
+        ).decode('utf-8').strip()
+
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
@@ -212,7 +218,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
 
             logging.info("Adding %s", name)
             append_crate(
-                name,
+                get_crate_name(path),
                 path,
                 ["core", "kernel", "pin_init"],
                 cfg=cfg,

-- 
2.53.0.473.g4a7958ca14-goog


