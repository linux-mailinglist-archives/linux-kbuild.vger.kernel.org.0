Return-Path: <linux-kbuild+bounces-12074-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FaJOWvcu2kkpQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12074-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:22:19 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B18B32CA3AF
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 12:22:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F3E7D3003356
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 11:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EB43C2772;
	Thu, 19 Mar 2026 11:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SN0c/R+5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D83C73C8
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773919337; cv=none; b=coRXqOlTJOAvxSbva7WWtx1WvcabMQrRKL9pKSb2X+0ahgef/WryaJVoYZ+95FUpNmPWHuxmRJziAFwCoy3nsIc7mzT+C+Q4WDjAMm9/XbPGOrKoLtaD1RirTlgY9aHnkwigspSZdBpD/quZfcDB13upgXgy2ghavsmGJmE76bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773919337; c=relaxed/simple;
	bh=e0Zpth0xENilYAiHoLUsESSVt6CUGdFjDZPbUhHoRps=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tviVqGXVK4pHaZLzVEOv1nuasAKUVS77fPqn19Cfx5LQ/RLYha9eIe1z2dxsJiFwTFrQNS1heDpLwBULCLDZh2lvnsmbvFlSv1DouKP0wEBT3gs4MaPKobO2uqy9hSxpx2HZyL90zmw88wVq+PVle1aKCdVQRNFQOIdNPCEbttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SN0c/R+5; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-485375aa56eso8372345e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Mar 2026 04:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773919333; x=1774524133; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XvS2xh7yYCxlzJtQTGiJSbAhQMvgrKBaX7EN8AyPms4=;
        b=SN0c/R+5kEFJutEHqMfL21OXnX3IHTOpy4uSSTQc9xmJGP7m6LqKfc+c/bqbNNx7ff
         QsDomVkB2cBaCQa1P87MYXHpIvaINAfpOPt9FkezofzHSyVmbhxGTIMC4VP9Smx68h9+
         +PxWTWHprI7pwkaew5fxiLq6/nN2sKsptcTx6S767kNtuQt9zsgMvxDkhUlxEDv+271f
         wqKc5M1wtRI+KjSn6+D4urSnViTYk8c6XD08IUmZ9tK02LZfb5Lz56HX5zIp/s6fep1V
         zzvEGrMcOJywsGwoNPhD+i76xpe7UUVKpkJL2P8IMO0IWpFTGZD3iHIfpGZApaRKRgPd
         3+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773919333; x=1774524133;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XvS2xh7yYCxlzJtQTGiJSbAhQMvgrKBaX7EN8AyPms4=;
        b=tSkIUhmUBnSNCnXp5b/lYrTqf6XvXo9IvOnCgHkV0fnuRHItRjRZF5eJJmHpZsv/AL
         6TnaHzkwaN1rO5au7KfWFE+hf0RwD88RM3iCU7Vl+3gDaJ5s6T42sesWGxyll4BUE/qu
         MTVqAn6neOKW5+iXlcynEkkvDmybXxvbfv/LPMksJBbJnMq32hDt4jnMNuBF9lmdu9Wa
         WtpUcaPayveTMAF+wYTkZ1pHqp1SqX/t9pkJ4h96PqJXQubbqQmVRbIGT/OzPfVq+9dm
         ciQD+UMrRhaAdipVi6H7xLg+skY4rxHyqSOMEs0tCM1VEddNnGWJTQzoheTf0vMX4nnL
         zhiA==
X-Forwarded-Encrypted: i=1; AJvYcCVnl2PtwokqdxXrLhVENuu2A4c3+u+qW/ATGDtUpzdGEPU/aTxqLV+urS6c1fUQLq7UlZjTH+BikTfLA+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfsObOzayaHPmIfIw/qhnOMd4I/TWkMlkZJViv+onIp0GR2Luv
	YfQH5CcewspMimchKy+ka8y02XOsfMO9rZwctz6M08tEjIMvHrGCi91vJpZUCP9gU27Y7AqrEqy
	pacrt2MkaY1xyWzaWeA==
X-Received: from wmma23.prod.google.com ([2002:a05:600c:2257:b0:485:3c21:d5f0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154e:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-486f4441232mr112177335e9.21.1773919333288;
 Thu, 19 Mar 2026 04:22:13 -0700 (PDT)
Date: Thu, 19 Mar 2026 11:22:03 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFrcu2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNL3cTSkvy0lHxdixQDw1RzS3PztNQUJaDqgqLUtMwKsEnRsbW1AOC G4A9ZAAAA
X-Change-Id: 20260309-autofdo-8d01e7977fed
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2639; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=e0Zpth0xENilYAiHoLUsESSVt6CUGdFjDZPbUhHoRps=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpu9xdSWTy9LuQk9ExZvJlbrjZxbwQxgw88U1JH
 6NXUrfULKKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCabvcXQAKCRAEWL7uWMY5
 Rv2nD/0d3DXgsxieHaRYXZ7u4cbl7OglTI7v52Nr+8YC3CGmWuQ5ywM7ew0M7WegYf6QRQcO3L5
 5dJgsthSXyoEH4uno80Usv82sTwJSRVx6FgywUyzmhK4XfRdC18nxPLRLtIU3XJd3QjPqSpFSmz
 xTa9J2u44A7qOPy02HeLMF5ifgKEkpYOsAVLYZF1rFsgnY4iCPeywhGR5Xf4hDRt3FGSEy+e+U0
 TcHkxkMbxyhUwKznzcnf+zfwAeG84RaI+/vC1q7pqBvwWvP9xqOge/MdKol3gaznVlS9NQMxNAX
 RxklzMf9kaFmiIXddq8anW9+52bxOMgHg1EsImAHjz7bDwW3sj9bRqSFCTsKRAwyijf6lmaS5Qf
 EivfxpzHXhUz0EvmmEtobdEXCFo3Im7DqrNGBAB9COWfc4UydO29nnWXlE/6Eq4iMNcJPw+PJdn
 b+rt0a/gXZrPe4ggRUXs0ytjgdBpQktEJ9uqkwCqXTuIwmAfadCMTxe6dlJjLk8AloiBXHb1X8Y
 Mz1aWKEqgWV7T9CNAEq7ZhDhuyerS2ireq+SVaCu8PAStb769Y3pBeefZhDBVq3/8oKPKr4ynEn
 gjWz3axa4YQtmudN1drxo+avD22QX7bIR6KkoOdlyAuGK3CkvdWT69yWdYU3qdjV7qqODTyQnyA gj57PmzeqGBJMyA==
X-Mailer: b4 0.14.3
Message-ID: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
Subject: [PATCH] kbuild: rust: add AutoFDO support
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12074-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,google.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.925];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B18B32CA3AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch enables AutoFDO build support for Rust code within the Linux
kernel. This allows Rust code to be profiled and optimized based on the
profile.

This was verified by inspecting the object files and confirming that
they look correct. It was also verified in conjuction with my helpers
inlining series, and it also appears to have worked correctly when
combined with that series once one missing thing [1] was fixed in the
helpers inlining series.

Link: https://lore.kernel.org/all/aasPsbMEsX6iGUl8@google.com/ [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
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


