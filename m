Return-Path: <linux-kbuild+bounces-11038-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ke0I/EbhGmyywMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11038-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 05:26:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0103EE87A
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Feb 2026 05:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4347A3011131
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Feb 2026 04:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF322C15AA;
	Thu,  5 Feb 2026 04:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVXBsMdD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14655287246
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Feb 2026 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770265100; cv=none; b=KLunRZJFy36OVFZKp965Za0jENi7NnTsb5nFJWJOntHlL5l+qk0RqoeCXLbLH2vU4nE2PovBUYtr1K/loVYv9Do4yVVJde7/2VdJoJdyKo2V2ltPhu8TzlUY/fOLDFyJsiAddisoSMHvz//xlwZKRmJUlrGDVXBxfKy9zO4w3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770265100; c=relaxed/simple;
	bh=31cre535scK5YHPD5e8RzFX5ialuBer/1VI0lInaE4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWoD5Ke4AYjjdlbL5QoMXg6fAeecWo/Ri30VCI3Una/u3OHZ2nwViUXIAR340h16DQ/zpWtukU3jR8dGjdDQh3b3PqzZ1hbWGtf8aFLfK6t4Yofd5sm36jsjh4hvtBts/s07lVTRq2DX14gPF3c8/8buAZDIaf4A3Nwakl6+JP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVXBsMdD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7bceb6cd0so3141315ad.1
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Feb 2026 20:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770265099; x=1770869899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/ASwzBhyPImq3zCtz6w37YhpkrghJ23tPd6aSVQhgI=;
        b=YVXBsMdDoJQvtLN2Pw8sC5fTbdRM6sH7LZERAESET2uSy6fwY2T7FzhEY8QW90lnIf
         EY/n0BwVJDzN1S2bW6KkI4eq0H4PXN3KkCbncNT9SSIm3yZS3jLC6rokBUVzy+C3ASnw
         5dpH0a1QhoMhkTDmLsT1C2BA0VPTagyWGsrTfJEsZiblw8621wNHifQ6lfg/egtm4QBP
         GGiPv/iS4vw7P6JlW3sP3m2uPbGMrqlQUaOOPo99BULZGfFGIadvfygLUd/bUk+PFpUs
         K5854mR0gVY13lBrgaOc9N42GiMZNnwn6DC0f59nbc0le05X0tA7mvdj+4Bit1IqKFVw
         jQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770265099; x=1770869899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/ASwzBhyPImq3zCtz6w37YhpkrghJ23tPd6aSVQhgI=;
        b=UkmU0AM1rqB3S6uYhrNo9alaqnceyEZjhGSpNY2NnCa+Bcgy0AErcunDVybCHkVvv7
         X1NdB7Z2Lzly8Iq+AZSwqLfk1Io4Qkl328Vq3FGV/3CPRSj0Fi2Ea3fh0ZiBCkT+XOtO
         Jxv2xqFTqqZ1+EM0boxQeX1HuL7VzaBZKZkOKMLWe41+lhe3FzZKcSrJ7cwUTUXRXfvr
         1dKvzXLEklL5OPb23ttvUAUtwj6aHHClq4iEtdrrNVOM7oOlPlZypm5WKEetmosId+dj
         N5S7QWcutUP4z0x6ocZ5OY+3OKn3Oskv2EMXdBQ3bY6BWM6w0RV6A8KlS4O2f5yeaD8O
         2OiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0UEUXcY1SfnVk3bBFQmJKOq/VPl11PnMEGN5OBq7EiWNoJdl9hSTdPyDkmZjLGHgBiZC/6Jxe1fpLj3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY8ednFHJXOxSGoFXBMfPCDpbZJ383AZ1n4DHXGwk9fi7WvF2n
	ZecPqh/6dudzQOinRdzO7OhUC4hDy+w5go1SO3IM1FKV9K963tbWyTsk
X-Gm-Gg: AZuq6aK/nSXPdLRfkqtgaSYtIhCRZd5GxlclI3Hx2R2WbQLQCFHuD7R3CttM9bjdtqm
	6hadw9fj4UNzMhHRY5IAM7aiQDrFMOTKE0TR8tukZsh1APit36mUHB1Bxl912VOu6+rVYPCilXT
	TZIYTwQMjXDzSZfmqFP/SWjo5Yf21PSfN4XLirCWmRz8LHujN8LcNge7RMJXepfgpCHLQZ6vXbY
	9+OQDH7ltT6kFSl+WQN8yafhKRcIhhtbxccR1rraB6u4lknr8gd7c6IR5tDxkTBEeYXrIryNmNp
	sRZgPWZAlnPfmC6FcIDhK0zr3mJoRi9v+bSMu8FrSVVooEsvzir/DW7rPKSMnubZNx0tAQiuvrv
	3/SuChOHsmrNn7aL1wu1ySEQccNolCB7iojFlGPBWDCa8Xm0xeX7ova92880xG7tPaAUsEW6ghP
	moTNY=
X-Received: by 2002:a17:903:b4f:b0:2a0:cccf:9d24 with SMTP id d9443c01a7336-2a933cf7dd5mr46866155ad.16.1770265099390;
        Wed, 04 Feb 2026 20:18:19 -0800 (PST)
Received: from misys ([58.120.241.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93396b2eesm38037785ad.78.2026.02.04.20.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 20:18:19 -0800 (PST)
From: HeeSu Kim <mlksvender@gmail.com>
To: nathan@kernel.org
Cc: a.hindborg@kernel.org,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@google.com,
	charmitro@posteo.net,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	nsc@kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org,
	tmgross@umich.edu,
	HeeSu Kim <mlksvender@gmail.com>
Subject: [PATCH v5 1/2] kbuild: add rustc-max-version macro
Date: Thu,  5 Feb 2026 22:18:14 +0900
Message-ID: <20260205131815.2943152-1-mlksvender@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203221224.GA2703490@ax162>
References: <20260203221224.GA2703490@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	DATE_IN_FUTURE(4.00)[8];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-11038-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mlksvender@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0103EE87A
X-Rspamd-Action: no action

Add `rustc-max-version` macro to `scripts/Makefile.compiler` for
version upper bound checks, mirroring the existing `rustc-min-version`.

This will be used to bound workarounds to specific compiler version
ranges.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
Acked-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: HeeSu Kim <mlksvender@gmail.com>
---
Changes in v5:
- Split rustc-max-version macro into separate patch for easier backporting
  (was part of the workaround patch in v4)

 scripts/Makefile.compiler | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index ef91910de265..85268f6f1494 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -71,6 +71,10 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 # Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
 rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
 
+# rustc-max-version
+# Usage: rustc-$(call rustc-max-version, 109000) += -Cfoo
+rustc-max-version = $(call test-le, $(CONFIG_RUSTC_VERSION), $1)
+
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
-- 
2.52.0


