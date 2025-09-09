Return-Path: <linux-kbuild+bounces-8791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BB5B5050D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 20:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28A6F4E82BF
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 18:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7678435AACA;
	Tue,  9 Sep 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c9KiSISo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A732F4A
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Sep 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441664; cv=none; b=a68If0SRQtZzSL8JNSZj7PJORgrTnf0GBnGUgaAHt4AXTvAN+MVacDCIB6+yUr8p8odZDJ1kVe8XrIAlWEFTcQkX8cGNAwxuMAwTAL/K5u6upfybnhvJwVKsDb+DbAzE6Z6q1JM/so+n8CDFeaOo3Rrye/gIkvzQ+MO6Aqn43oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441664; c=relaxed/simple;
	bh=XKMYR0rZFryWAt82cmAKlov8m+wRjbLtNvTpIjuR2A0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=K5kD/Bd1WvnPI3k9/XgwxQJxI5NtwLA0lY8lSNPZm1/cCD4Eib1ZevJft/7zapgrngn8XRqu4Y8DOgWfkZGdtpE2O7XZbpHrTXtruKmIKjtCAEhMEF7vTTMUyxSLAZ6x/kFPtZJc5Q9kHKC1r7aWJCY4oEMniUc+bkZ+72dsobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c9KiSISo; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b4f87c691a7so11475949a12.3
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Sep 2025 11:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757441661; x=1758046461; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvNduM9s7//sCfdhyoE/HdBETl81FPFKvCYM9u9MkSs=;
        b=c9KiSISoxYnAJI8f8bNQZNUJQI4UwUFwJ9HJv6QqFwwDRGQH7FIXYL8EoVOoQWQ1lZ
         SDNmEeIWXnIaOq+DkgUI5zG4RMDzFRGXAFiK8ayeLgiw+8Kw3qVdJVA/1U5KIu2mpSiI
         BiiVbKNh1APWw/Owlz/2hYa2eACNWM9Tbgsk26wG5WATOIG9nsliewzrC/tWIeWj7bl5
         +2CdmYMv0IiKYxZxeZtpQbP20nab3njbv53ADgKqM7sxxmGsqPbP0rxFwtvqI6unS8uZ
         zWOi8lT/aw8g/PJBSluUlcr7Sis5cbd4Rkz24MWshf+7arJS5XLJYp5BkbQLFBuxHDUP
         xC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441661; x=1758046461;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvNduM9s7//sCfdhyoE/HdBETl81FPFKvCYM9u9MkSs=;
        b=AxdzDa8BDF5K2B6VE30eMvg9QIdj71qkxEl/AgaP9w+11MidspRIi7eEJtsMKvPblb
         CQfZm9ZXVB43NfrlCIXD1WTK6rQ4F68df+n7AXQdicUgMh9BpnSjWNWmaANu3i5AeiWm
         qy5yNZABI8K93huKVasPVUsdxvmxHdznnLNJeZ/k7mUZh1OY1Lhw/RkVLDj2421igGgE
         KcClkYQSzOdUfvRrUoLDGoPzYOKb3rAKOInXXXO94n9d0y6eiEm/DTgt5Hhl07FCPU40
         jpDM1RkPwo11O8Zh4BX6Cq/CQq0L+EA/3ZPRE/1bpR/S+q4SloHWmnIq4BJirQCULGtE
         VvOw==
X-Gm-Message-State: AOJu0YyiBZyu/JqW63W+9viclDb4p8D5xjt8tUbKEgaNxOm/yyvDOzaG
	EzDYPlPGiW+Xhu2Q/fquW9shiYGe7zJmt4MwJfu6Tw8R7ElGzUKg+c+uCHAIHgxqfSPMSu4CqqN
	5MW9g/doF8w==
X-Google-Smtp-Source: AGHT+IFOLpvhmDvGxk6t715bqYf6V40EcsZUuZVEqhl6096A5aJmAvnCAulGYXhst0wLjI2umouHZmOWzc2q
X-Received: from pjoo15.prod.google.com ([2002:a17:90b:582f:b0:329:ec3d:72ad])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:914c:b0:246:6d1:de66
 with SMTP id adf61e73a8af0-2533fab7223mr16781966637.17.1757441661606; Tue, 09
 Sep 2025 11:14:21 -0700 (PDT)
Date: Tue, 09 Sep 2025 18:14:20 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHtuwGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwNL3ZT85KLUXF1DE8tEEwtTI0NDIwsloOKCotS0zAqwQdGxtbUAMDC jAVgAAAA=
X-Change-Id: 20250909-docrem-149a48521128
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757441660; l=1361;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=XKMYR0rZFryWAt82cmAKlov8m+wRjbLtNvTpIjuR2A0=; b=565KgAzEoPasOdaJ+pLXjqvOtQDtjOyYrVdW5SBIneocC/D2PFTKb0bGSsDIlakO8inXipOp7
 zaigKZE71GmDv3gBO0vPhHLkmIR02UghKhqKtVaw6RXZ3ehKuaqEFtF
X-Mailer: b4 0.14.2
Message-ID: <20250909-docrem-v1-1-dcc69059a5cb@google.com>
Subject: [PATCH] rust: kconfig: Don't require RUST_IS_AVAILABLE for rustc-option
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

The final version of this macro does not fail in the absence of an
invokable `$(RUSTC)`, so we don't need to be careful not to invoke it.

Link: https://lore.kernel.org/all/CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com/
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Kconfig.include | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e8030e659d6b321acaea1acd42c387a4..7d9a0b4f66a9667b2cdc9d7e87c582487476f311 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -70,8 +70,6 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise
-# Calls to this should be guarded so that they are not evaluated if
-# CONFIG_RUST_IS_AVAILABLE is not set.
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)

---
base-commit: 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c
change-id: 20250909-docrem-149a48521128

Best regards,
-- 
Matthew Maurer <mmaurer@google.com>


