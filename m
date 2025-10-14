Return-Path: <linux-kbuild+bounces-9142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9FBDB023
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 21:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1116219A0741
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Oct 2025 19:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7C32C0278;
	Tue, 14 Oct 2025 19:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Aoxq1xEO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F1C2BE7B0
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 19:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469122; cv=none; b=iZ7tZWzjycv6N/T2IW7ae4BYX0C57sP3elN9PLAzBd78Ja4URBJHnXeRmMgbcPe4nCIpc8ydOcmgibPU0+PjjqxCcCYiwk6xhfqExvOJ9y6pwdcQ7DkAi6TGwUxkwm50zND2kTMcsRrCfqAHQDvncEUBPlOCRsIKhOWNFYvDXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469122; c=relaxed/simple;
	bh=UQnXFdfx5dWAH9sx3W0jjTCJ0moJLOzBU+mWcv09QMo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NyHBFn67CHBW/S94m5V/U0irBJEgj03AOtlV0t2a1t0aruH4SqhhMhUMvfOW6pvtEuyVOwh4s21xaeZTg6d9gZXeW+dV2x3HwycjqilYtBXXV0kspmLnJrUrkp8VK8ZlRZunbdnkS7rWcSryoWq11uwGqRIaMTRUt5G3LA+Zmwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Aoxq1xEO; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7900f597d08so8134616b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Oct 2025 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760469120; x=1761073920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HetZVCC/q2AyiLAEyoUW1UONBOG5swbtHLMRVYpsp5s=;
        b=Aoxq1xEOLGm2VYmciCKJwYwNfqNvXgneohYRCkhTSdhCKPpmySlAaDUUGbREvGHtWz
         MSKkt6/mT/gcFsub3cfM+csZ3aTmEMjpGsOKbbijthw9/WF1DQaPjs2x4XRWUIyMzFdQ
         Yjz6PxBNS+oAK1idc2kQ9F6XFt9CYJ15PWs9wpk5Nt7w5v/FP5HqB1UsZVZn26wZrDFl
         mwdEDLjBRL42YM9zIj4nn4Wo6Ns9TovHA2GrWrM8hZZmrpfWbLCDfCzVoVeMo8oAo7yg
         LPgRJjnJbxR8yTrp+zFC0fvdLFEQbuRVkcEPRyFXDcPrQOHVkwiKmTcKqwQx4LDB5e/b
         4Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760469120; x=1761073920;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HetZVCC/q2AyiLAEyoUW1UONBOG5swbtHLMRVYpsp5s=;
        b=uoDXMXxnz9SOw4tHDW+S95lKU4c/SoN8Oalu4SB4hlhpwEPF6C1YNguN/gRVuyJKBZ
         xT25yB6emH8eKPoV3j4TWX2yW6peTQ8ZRxSu0hch39KFMLe35aNvaLVmeTg3ZcfsE00p
         j7e40JAG3CCZD0by7BC6vVsEXBek+6fhzBHWB5gUaJv8yh0I8BZx2EHabcjg4M/VxhBA
         yxGb6sUN/aE0WzlPh4fOCXzIXSJdluAq6A2t4LbhEJpYBgcJDqOtlxHCMG0tJ7FAEmAG
         GFJzvmYH2cJ3E/Y+f9PT3jx1hME2TbLm5yul8BqsB+8KlEd0r0ljZEMgNf/unCQdKzPC
         ZlhA==
X-Gm-Message-State: AOJu0YyQeL7YzebD2CbdQi6pksRBNEMCjojxjSoKk5DPT/Y+dI7Tb5YR
	wD0+YHcey+C7N+b0gYCkH2ym7J0r1Kly2kTCKNcAUzPH9/1uGNNjCfmEv4mTZl1LDcD6mQ==
X-Google-Smtp-Source: AGHT+IGqxn8ztfvetOUDjhKisKtCGCDVJ4GZc/Y5aNTZgsAPMD/o+pkKchgR04YWi9BC/7CxTDwJF9c=
X-Received: from pga19.prod.google.com ([2002:a05:6a02:4f93:b0:b55:1aa:d75c])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:218d:b0:32a:ce3e:fb9b
 with SMTP id adf61e73a8af0-32da84649eemr35608986637.59.1760469119535; Tue, 14
 Oct 2025 12:11:59 -0700 (PDT)
Date: Tue, 14 Oct 2025 19:11:52 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.788.g6d19910ace-goog
Message-ID: <20251014191156.3836703-1-xur@google.com>
Subject: [PATCH v2 0/4] kbuild: Fixes for AutoFDO and Propeller builds
From: xur@google.com
To: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, Yabin Cui <yabinc@google.com>, 
	Sriraman Tallam <tmsriram@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

ChangeLog:
  V2: filter-out -pie in scripts/Makefile.vmlinux_o
      This fixed the failure reported by kernel test robot.
      https://lore.kernel.org/r/202510120709.Wx3q4Ppg-lkp@intel.com/

Rong Xu (4):
  kbuild: Fix Propeller flags
  kbuild: Disable AutoFDO and Propeller flags for kernel modules
  kbuild: Remove MFS flags from Propeller profile generate builds
  kbuild: Add config to assert profile accuracy for aggressive
    optimization

 Makefile                   |  9 +++++----
 arch/Kconfig               | 11 +++++++++++
 scripts/Makefile.autofdo   | 12 +++++++++---
 scripts/Makefile.lib       |  9 ++++++---
 scripts/Makefile.propeller | 20 ++++++++++++++++----
 scripts/Makefile.vmlinux_o |  3 ++-
 6 files changed, 49 insertions(+), 15 deletions(-)


base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
-- 
2.51.0.788.g6d19910ace-goog


