Return-Path: <linux-kbuild+bounces-12386-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBEUJOGpy2kpKAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12386-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 13:02:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA31736874D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 13:02:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A0E8301A151
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 10:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854253A8734;
	Tue, 31 Mar 2026 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OQKP+vSU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15223A7F54
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954680; cv=none; b=huSNcrwfDVtxbTAXCeAy2gVoigmLGr2f3ExfeTh5qn4vDC1+WLmP6iWPOnpj7/EFhP9S3X1gVC3Opkmi3Pe+Rx0GafROcqFH8l0oIWve7+CgyPwl5+4Gf8HaJKeWmapjkDkKHdmZYRapC2xpZlP9Phcamg2WzxpKQq4osx2N5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954680; c=relaxed/simple;
	bh=4JnYoTktQtoUtJUVdKYqmdqGFIDqGloAiz8fbauijTU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=L5SeVzRB+DZcBDOVZlZWb9hN6ohYRGEZk49hBmm5XmSyP4kMQxpzPj7cKAXkVf1ZQhDdNfn55DZXVrsbARNp1jnw0R33UYt8/64ZxzfEFnCBoO3MOg/xT+vExXwwfuFZcQdd5rgHxuIwhFgKLB27zOEpVLhhR19K67Gp+V/qUF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OQKP+vSU; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43cff5ef652so1353496f8f.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774954676; x=1775559476; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mM/5onz25kE6cU84lJtH4wnlOf71rK5o+L87vsB3QAM=;
        b=OQKP+vSURtMi95uHnHS++Tr06vJ6qY8CcXcs74MNJkkBxki4q35pPBFBvGghbEi5S7
         Hn/yZbUrh9ZQ8ffKt8gpmNGwfaxFLPkrCzAIRDpgwSuNQL/nTyIhfLW5c6WiW7zf0f/X
         oYs9e02NOO51wLyziDpY+VPmENPicJWJUDMtmCFJOZRkRwsDcFaBFhOYwDdY038e+ay2
         vCbPe7IAelHq+/3qk8a2oM5tgMt2ZMirqJiecFn5D5dlU5LYaZ4Mmu3dhEpPOHx6n33O
         sDaMkKBzCaJCWOWtOjtuL4DCUkCJDyM/D0DOQHAS3SWh7nIeWqCOMaYPO/dc7XEOmgkS
         D1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774954676; x=1775559476;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mM/5onz25kE6cU84lJtH4wnlOf71rK5o+L87vsB3QAM=;
        b=XRULijF3HQgRact+w/gTo6//ZHJxygaH8yYWBvn5bATQW+egmhdVWp96WIpy1S/683
         ownUQx1jBfx8sXQBwSAma+j/BUHlh0iqVtOZgy5swClhCS2Jd90CJ9wz94Fyu28KH7Tg
         0BlpOPwMZOjMsolhyKbsXdOh2ij5WBKR6OouYAQTLZcJ95gNfbiE07KIfF26vNVU1RuA
         ie2L7up8urUfGFAx7CRYyRqiWRslBEMBRAQw8iyXEC6wsxOZYTt/DqQJ+JctKoq8E/wy
         4XJnthO1tyIsH484Qgb9+f4k+xvAcF7X5VpKpRW5Yz91NThrR72L24uKzYuWkiGDuLuJ
         DhjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMvMgGEJNZAUvT3Ax3uZbPvQdTOkm2HOIUojWNQfvNAjnGRIDopCubpbpGIIeJLdfKuoRCapRUEJjCAzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nFpVxWCm64HcVC7YW+j+4YlV15sUbVvgl8wuy3aNAIsttKH/
	5Oy2PSuObyu5Ytqu8HYdkgMch89E2EILg80ORz+2LASJOpcW+pLsq3i6dfPsxVpjoBZrDs5nHIn
	9aFiAIjkKmUew6g8rew==
X-Received: from wrux18.prod.google.com ([2002:a5d:6512:0:b0:439:b81f:ad99])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d84:0:b0:43b:4d2e:a004 with SMTP id ffacd0b85a97d-43b9e981468mr28599122f8f.10.1774954676155;
 Tue, 31 Mar 2026 03:57:56 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:57:49 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKyoy2kC/0XMQQrCMBCF4auUWRvJRDTGVe8hXZRkkga0I0kNS
 sndjUVw+T8e3wqZUqQMl26FRCXmyHMLtevATuMcSETXGpRUJ3mQRozPhb1jcXYSSRutPTlo70c iH1+bdB1aTzEvnN4bXPC7/gz8GwUFiiMSqVErI63rA3O40d7yHYZa6wfvtx6nnwAAAA==
X-Change-Id: 20260309-autofdo-8d01e7977fed
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4149; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4JnYoTktQtoUtJUVdKYqmdqGFIDqGloAiz8fbauijTU=;
 b=owEBbAKT/ZANAwAKAQRYvu5YxjlGAcsmYgBpy6iu3PekQeP6M6pAVikQJKtmZHXxDg+XJ8hqD
 fbfpF87i4SJAjIEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCacuorgAKCRAEWL7uWMY5
 RjtbD/d8w5zdhv7xxN0UWADZCc6afSdbzfJG6/7I8BCoLWWCGTzrSiTU3mQp+cBkewSCzq0Z+dy
 ZX0SvZ5KyaWjVXz0ylpZG9Aso1KAVentkoOdkfeyvBH3uAqtRr/ufDG83tjRfiHbS2lChokqVjQ
 E/ATWd1KsIvGgRuKEkwqV+fUoW9ByH/l/qAMS6AINzv5OLvns0PLxfEUyWKsZb3sDUzwIVyvc1s
 rjPsT6zCM0Fi39iBensfm/G1WbTO8PfVNvO03BbZH8ljiYchJbh59iQtSqKPS/abMouQcU+xX0o
 8w8hWPNIeVCE3v1s0tYU/GSz0RWK7mX3Z0yb8wBtujksvAddWKOoGxB0ka112Q6lmlemUWBbiFO
 dsOpFs9q2dWOkfMXU8ALlbAGYLzT0IxGvzop475JwXc52Yeh3QwkAqeYqoVqFu3/lGUCSdQyP/z
 6nKmZxQbymGVCgZnn0jPnmmxVlI8Yef4UFEQmM4baZnfU9Ki+SUcPZR4iIBGq/JL51e6QkUifC+
 5Dzcf4ZobCbgbSYr/rNoLTmrk23IJ+S8FEASvw4l7gR1d5eMwJv3zI7kg3D7RfmJG6D4jnGdhHF
 Lwe0AFOBzpka4Pn6v5bPZR4eLEcBgGokyP1NCXwYQ0JLKVz/IUrzYrPoReTMSQLXCERpZjTeHCZ St9GRaQ73iiSc
X-Mailer: b4 0.14.3
Message-ID: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
Subject: [PATCH v2] kbuild: rust: add AutoFDO support
From: Alice Ryhl <aliceryhl@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12386-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,google.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:email,googlesource.com:url]
X-Rspamd-Queue-Id: DA31736874D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch enables AutoFDO build support for Rust code within the Linux
kernel. This allows Rust code to be profiled and optimized based on the
profile.

The RUSTFLAGS variable was suffixed with *_AUTOFDO_CLANG to match the
naming of the config option, which is called CONFIG_AUTOFDO_CLANG.

This implementation has been verified in Android, first by inspecting
the object files and confirming that they look correct. After that,
it was verified as below:

1. Running the binderAddInts benchmark [1] with Rust Binder built as
   rust_binder.ko module, using a Pixel 9 Pro.
2. Collecting a profile on an Pixel 10 Pro XL using the app-launch
   benchmark, which starts different apps many times, on a device with
   Rust Binder as a built-in kernel module. (C Binder was not present on
   the device.)
3. Using the collected profile, run the binderAddInts benchmark again
   with Rust Binder built both as a rust_binder.ko module, and as a
   built-in kernel module.
4. In both cases, Rust Binder without AutoFDO was approximately 13%
   slower than the AutoFDO optimized version. Built-in vs .ko did not
   make a measurable performance difference.

All of the above was verified in conjuction with my helpers inlining
series [2], which confirmed that this worked correctly for helpers too
once [3] was fixed in the helpers inlining series.

Link: https://android.googlesource.com/platform/system/extras/+/920f089/tests/binder/benchmarks/binderAddInts.cpp [1]
Link: https://lore.kernel.org/r/20260203-inline-helpers-v2-0-beb8547a03c9@google.com [2]
Link: https://lore.kernel.org/r/aasPsbMEsX6iGUl8@google.com [3]
Reviewed-by: Rong Xu <xur@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Discuss RUSTFLAGS_ naming in commit message.
- Update commit message with information about additional testing that
  has now been carried out.
- Pick up tags.
- Link to v1: https://lore.kernel.org/r/20260319-autofdo-v1-1-51ee2a7290cd@google.com
---
 scripts/Makefile.autofdo | 6 +++++-
 scripts/Makefile.lib     | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 1caf2457e585..3f08acab4549 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -3,14 +3,18 @@
 # Enable available and selected Clang AutoFDO features.
 
 CFLAGS_AUTOFDO_CLANG := -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=true -mllvm -improved-fs-discriminator=true
+RUSTFLAGS_AUTOFDO_CLANG := -Zdebug-info-for-profiling -Cllvm-args=-enable-fs-discriminator=true -Cllvm-args=-improved-fs-discriminator=true
 
 ifndef CONFIG_DEBUG_INFO
   CFLAGS_AUTOFDO_CLANG += -gmlt
+  RUSTFLAGS_AUTOFDO_CLANG += -Cdebuginfo=line-tables-only
 endif
 
 ifdef CLANG_AUTOFDO_PROFILE
   CFLAGS_AUTOFDO_CLANG += -fprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -ffunction-sections
   CFLAGS_AUTOFDO_CLANG += -fsplit-machine-functions
+  RUSTFLAGS_AUTOFDO_CLANG += -Zprofile-sample-use=$(CLANG_AUTOFDO_PROFILE) -Zfunction-sections=y
+  RUSTFLAGS_AUTOFDO_CLANG += -Cllvm-args=-split-machine-functions
 endif
 
 ifdef CONFIG_LTO_CLANG_THIN
@@ -21,4 +25,4 @@ ifdef CONFIG_LTO_CLANG_THIN
   KBUILD_LDFLAGS += -plugin-opt=-split-machine-functions
 endif
 
-export CFLAGS_AUTOFDO_CLANG
+export CFLAGS_AUTOFDO_CLANG RUSTFLAGS_AUTOFDO_CLANG
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0718e39cedda..eaddf6637669 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -123,6 +123,9 @@ ifeq ($(CONFIG_AUTOFDO_CLANG),y)
 _c_flags += $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(CFLAGS_AUTOFDO_CLANG))
+_rust_flags += $(if $(patsubst n%,, \
+	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
+	$(RUSTFLAGS_AUTOFDO_CLANG))
 endif
 
 #

---
base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
change-id: 20260309-autofdo-8d01e7977fed

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


