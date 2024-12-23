Return-Path: <linux-kbuild+bounces-5230-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 746FF9FAE59
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 13:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA9BD188376E
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 12:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E211AB6FF;
	Mon, 23 Dec 2024 12:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PyuhYEdx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C253719DFB4
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734957902; cv=none; b=maE30OA892M2UT26Uu00Hq9k54vdpRF05I6/pYD/WZy1BSSmzewwgCfnQfdKg6B45GfkcRQeCxEg+ZrrpY8Hp0z0ZeDUVTzEgsh7siQBJre02sR9CuUHUpkKu40qRF0jCG5rmgJ8xjBHkXPET0sh6UORSHnfuGxzpsl/mSdokEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734957902; c=relaxed/simple;
	bh=lwWhSJor70Ao5E7XuioLVn9/hTewFG1gJ62VeDNOvjI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iG4MeyDpaxsR1QdS0r7TOoLqO2pvH8pIZJrO0AY1EBRQFDaJZvXWsYYwKFyMbH3NuzlJAZqS5pkWsp5XPSORCjQ4nJrzeM3CntnvfoE3yzp4q20kEDWa48mZ66YQfUv5hRo6MJ0XtAtTbSzMN0wqc3NjDBQlfW132b0fMlTQuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PyuhYEdx; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-38a2140a400so2366430f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 04:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734957899; x=1735562699; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x5xkxyf/fJ7AWRCCb8PshzppcFMVARnro3P3GPEsN6o=;
        b=PyuhYEdxnUaa2T/aoBS2EBC605LBEZMALAf8JexphV5cWlTxrPoeVQxNWcCbzmgGS6
         /JNFLGnPdIrLo78KvOEpgxLVKYP+cUXrw3gHxhG/yqZjTkEv/SUwGI98U4yyPmIaT/mt
         dlfqCkkx3yKZhkEbaFTvBc51hdu+I9seLojrfyyCPgV+DADzkAb4w5+gT+CmuPhqSO6P
         mue0DNuS+DrlwZ6HzxHhE9krShNdzmUwwc4XuAye8CjPjzvUnu1s/TFhLHxvE0U+7aty
         JyutpnDSJ87EarWLC4R/k/t37Ov6ROGOl2T9lTImRiPRNhyY9CcO+4Pu16mSq1n75hMn
         KPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734957899; x=1735562699;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x5xkxyf/fJ7AWRCCb8PshzppcFMVARnro3P3GPEsN6o=;
        b=DhoCiBjT6DQfHu1uD/7uQBvdzOmd5PWc+RZmvCY/aGIgGni1VveBSf4oi0weMluT3o
         xPXLanczeG19Fe1xOc2rPnKt0qMHUzsNsytoL5Klfbx2dThIt6QOQgj37dxkSeIjOs86
         so7F5lL1E9kV2eMyAlAUlmHxAnUhZXr9YG/BQE3mni3a75vga+1CZucEj7dUCCbKVN9I
         LgB7d+uYnQUcHT+6YHQKM142sdbBDtFSU5NX9TBwb+1m5o826+BZmPQP+u00j9e0hVdk
         DLXPOuAyylTKK1seh46IOaRxC19AwZWU+VjQm4I8HiPhVtJRwwN9CE6FVBQ0vX1sH/ft
         Z7xg==
X-Forwarded-Encrypted: i=1; AJvYcCUKs7qPmLmENJ+PSJ3qhI8zEIXn5vgZO2MPsOsugwZvCkizwq6hOoY6+/Ymc74j7Sx2fdm7KXodPC2p400=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKgVim5PxZhcElfmow+XmYm0kWJJ0muk8bQ7YtMF9QKzHDxB+J
	HLJHFns7jXaK7T0EOy0qu0i7Uo+TcSPoRIac/YeTjlnt5MNmej4Ii2GqZIRRVVHUzDpdapl+oaH
	8zgNFa7d+FQ==
X-Google-Smtp-Source: AGHT+IGzqiM/ML7pombc/HJ5fAC0cI1UxrZiPq2ejCGXS71bF7Jh7eXLWvs4vqbrW9Am0oPZ+fLrbfwGDBBO6A==
X-Received: from wmbka3.prod.google.com ([2002:a05:600c:5843:b0:436:37ed:f33b])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2af:b0:386:3752:b28c with SMTP id ffacd0b85a97d-38a223f5c3bmr9825547f8f.41.1734957899196;
 Mon, 23 Dec 2024 04:44:59 -0800 (PST)
Date: Mon, 23 Dec 2024 12:44:53 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241223124454.3614680-1-smostafa@google.com>
Subject: [PATCH] scripts/mksysmap: Fix escape chars '$'
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, 
	ptosi@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

commit b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
changed the invocation of the script, to call sed directly without
shell.

That means, the current extra escape that was added in:
commit ec336aa83162 ("scripts/mksysmap: Fix badly escaped '$'")
for the shell is not correct any more, at the moment the stack traces
for nvhe are corrupted:
[   22.840904] kvm [190]:  [<ffff80008116dd54>] __kvm_nvhe_$x.220+0x58/0x9c
[   22.842913] kvm [190]:  [<ffff8000811709bc>] __kvm_nvhe_$x.9+0x44/0x50
[   22.844112] kvm [190]:  [<ffff80008116f8fc>] __kvm_nvhe___skip_pauth_save+0x4/0x4

With this patch:
[   25.793513] kvm [192]: nVHE call trace:
[   25.794141] kvm [192]:  [<ffff80008116dd54>] __kvm_nvhe_hyp_panic+0xb0/0xf4
[   25.796590] kvm [192]:  [<ffff8000811709bc>] __kvm_nvhe_handle_trap+0xe4/0x188
[   25.797553] kvm [192]:  [<ffff80008116f8fc>] __kvm_nvhe___skip_pauth_save+0x4/0x4

Fixes: b18b047002b7 ("kbuild: change scripts/mksysmap into sed script")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 scripts/mksysmap | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index c12723a04655..3accbdb269ac 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -26,7 +26,7 @@
 #  (do not forget a space before each pattern)
 
 # local symbols for ARM, MIPS, etc.
-/ \\$/d
+/ \$/d
 
 # local labels, .LBB, .Ltmpxxx, .L__unnamed_xx, .LASANPC, etc.
 / \.L/d
@@ -39,7 +39,7 @@
 / __pi_\.L/d
 
 # arm64 local symbols in non-VHE KVM namespace
-/ __kvm_nvhe_\\$/d
+/ __kvm_nvhe_\$/d
 / __kvm_nvhe_\.L/d
 
 # lld arm/aarch64/mips thunks
-- 
2.47.1.613.gc27f4b7a9f-goog


