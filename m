Return-Path: <linux-kbuild+bounces-7363-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8DACD132
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 02:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EC303A742E
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Jun 2025 00:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817711531D5;
	Wed,  4 Jun 2025 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRPfEF5L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB414A4F9;
	Wed,  4 Jun 2025 00:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998278; cv=none; b=FrjPVFxYTv8woQc5h7r3+EEN3ybASTg9Zak1ihtIJC5NPdlJXb6u9AqFJB2YsiY5hbXraAKdhl0OE8k0fPZyATm/BkZ2IVKtlCWnFOLDUcU+E6NYcUXo3lOcBTy2Kxjint5txyVIoiMyd0q+Ln79XEzc3zzwl44w8isZiOvuHkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998278; c=relaxed/simple;
	bh=qBzNwBzfolO2/LfeGfIOJHvjCQIIBYm7a0UQHpcr9gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PsSv1pqNlEr/fuWTT9GquoocKnIIrFVaWlTEO72yu/58Lk0zcpSGXnS894Odr3tHsZZLvXdBov7DVl2U5Qh1jlGF6mMnunJSU/GdA9+zvPD1Fn5KL/W30oLUqspL0N1xvigDhhe/8I9BdyBZ8JoTYOcExd1SQ8DUkxAPH9c6tfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRPfEF5L; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so4784641b3a.0;
        Tue, 03 Jun 2025 17:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748998276; x=1749603076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fWmlyCAlnT2OdldqgB6HsoakV73qVZDwnZszdKB+GK8=;
        b=ZRPfEF5Lm+Ji2lM3kWk4k6iAWn8HJr4PIuXgrijSGd1/ERHgG9EXETjKEJqr22G0Om
         K/4220Z/1zAAqOgC+WFqzBo8k1k0UAMKEqTSLsBonWiM+kf8d24E5TNo2LNsuK1Avg0X
         RmArVvYQFx6pXVHeemzSbFXp+WpcDLJuMs8c8AGM+A4fl08fTaxfUx7kncR6UORYO0ys
         R5WxQKuUJ0KNS4MxO6rxl8li5fsx2g2ZiK0kzXoagbREod6+E0qhcRsmrKuez9TmmH65
         xBA8wTZcunEGwkac35qPFU8KpiVi3z5hJkCYu7G+LETYdiHixDUS47bcAgq7U0oxBQ+V
         E4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748998276; x=1749603076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWmlyCAlnT2OdldqgB6HsoakV73qVZDwnZszdKB+GK8=;
        b=kXCq1p29sONQjiCMDmQZwAHZibF+SVu1gUabXEuqdNLjt5foR3pKVICXRnLTsn2G1h
         FPLosbEzIe9dpT6J9O2ehAVWuV2S55Qi6PDZnS7UY9/k+pMIFUf5Hd0LS2G9dynRsCOf
         Cdd1g4y/hYWwazZvP/YXkukUZMkeReVIZEwRQph/ZvAq4yVxn+RsgiXDYnJfZPh9U5TK
         GwqJocE7Kd6wh4pWIXCyBk7rqyKutaHkeDOznjNI93A6JB59UC9wtQZ8TjsY/njN+IHV
         KO+YT+Pt2BebwBKRqTbHbHgJoIfUzC4zpRp0sJNiIM9icZ3j3Zltml0iI3CNiJuPeesc
         A3sA==
X-Forwarded-Encrypted: i=1; AJvYcCUgj3H2UjArU9L/bo+C9OzId2pP8Av3jwlt8c4f8TP/nBI2HZdhr9fUzqzg2GopkCDPw7molIaUVonpAW6v@vger.kernel.org, AJvYcCWdkBnPNb1HyF9z9gMWce57QfcZHgKigF6jB82Tsxwca5/mBllzGUI6GybyBsbeZjniSxrQxRQ7YBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWEPGsxeCJXS4xOIO/1OWvWRnYssPCMJ9Sw86iPD5RREL7hhd8
	FzNlgqKYjwXhA+8n6ax55YqNvRSV0+Hi1b4ObI3tj3wEP0OujfZxM6Tn
X-Gm-Gg: ASbGncsS0YOYpJsNSwuHpVL5TpWWUQrjQfY4JOAvpA1NEQiDJWBF3Ku/WK4xyrpuZOu
	zCY/LQoRvL77yZa3162j9+A4M7s7YfXfVjR5p8WA7/q1pyCkDx68NQAp2n711vgt1ZzhYfZ+/n8
	WSH/DKVVhntfqgTpfHNq3mQmHelGxkwnz8PJUOtI3OcJD44UvNKmqtrmLbGtX+PI4prV/g2LxFu
	42e8HmXsc6I5X53IJ7eCCrsKhppL3zh+rmwmhXbGZQMZO0lCLyzdLalnCaV/6XOFv57ZPhMcbSb
	kiDygarT0tTDRM6oKXJYQFSP445jlZBxvU0SU0kVnIeFDqtWIUg=
X-Google-Smtp-Source: AGHT+IF159HmD5hepvxivJRJH4JtIaxvmo53Xo/sR+42O6QZd7/fg8pOX20EevUWqTdRNYyeLTI7XA==
X-Received: by 2002:a17:902:ea08:b0:235:6aa:1675 with SMTP id d9443c01a7336-235e120f8d4mr9973865ad.52.1748998275999;
        Tue, 03 Jun 2025 17:51:15 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235069fa2c7sm92607795ad.0.2025.06.03.17.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 17:51:15 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7A5B94209E8D; Wed, 04 Jun 2025 07:51:12 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>
Cc: Matthias Maennich <maennich@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] module: Wrap EXPORT_SYMBOL_GPL_FOR_MODULES() example in literal code block
Date: Wed,  4 Jun 2025 07:51:09 +0700
Message-ID: <20250604005110.13040-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380; i=bagasdotme@gmail.com; h=from:subject; bh=qBzNwBzfolO2/LfeGfIOJHvjCQIIBYm7a0UQHpcr9gs=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBn20z/+60rY9kOxaPbm9vOz7ZN9QwQauu1mtiyw7uuXy r6/YlZyRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACYSpMXIMM1k1vk34Ze+Hee1 ZpJft8TQ440LE/evDvd1ZXLTlt84dpDhf8KmsvlcN80iKv7dWd0j8csg1XJig/BqxbtTJud4GQU 48QMA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Stephen Rothwell reports htmldocs warning:

Documentation/core-api/symbol-namespaces.rst:90: WARNING: Inline emphasis start-string without end-string. [docutils]

Fix the warning by wrapping EXPORT_SYMBOL_GPL_FOR_MODULES() example in
literal code block, just like other examples in symbol namespaces
documentation.

Fixes: 707f853d7fa3 ("module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250526180350.06b825de@canb.auug.org.au/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/core-api/symbol-namespaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index f7cfa7b73e974d..32fc73dc5529e8 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -85,7 +85,7 @@ namespace cannot be imported.
 The macro takes a comma separated list of module names, allowing only those
 modules to access this symbol. Simple tail-globs are supported.
 
-For example:
+For example::
 
   EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
 

base-commit: 85c4f3d89b17f569e9b718df6b6e19d6081f01c7
-- 
An old man doll... just what I always wanted! - Clara


