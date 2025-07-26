Return-Path: <linux-kbuild+bounces-8205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2FB12C08
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 21:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EB94E6D86
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 19:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25E0288525;
	Sat, 26 Jul 2025 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6ax7tKn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171A2868B5;
	Sat, 26 Jul 2025 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753557324; cv=none; b=gQ9hq2eLI6eC38Hp3eHlbI9k9IIL0F1lV3mmZMYTGRhyQKKTCXBoOUHFjHPLAJNyhotOV9ccCZYEkRLTEUwdnRrJlHjT9kWIqk/qWucyIg0+9YOMgvXWG2JL+TlRxKVrKGsR5szGZo22OXXA/pfCLnvdLSlXweZnWqh0cfYWiyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753557324; c=relaxed/simple;
	bh=rbPylg62vbOjdHXx4PRqrOONXmlsrvEE8LVr3InFSKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j1624PEqlBvxmRG7KeS4e//XwVDMaLXHAQgxxCYZfgtaN4Kax5iaRwNpdPV4IcQ/zm3MZNnxPInMYfr3p00SW8auLTJp5ttCIUKAVJmmpGoA0M8HXLlWbQmcCX7HPHLIKm/IzHqg58759++TIYl4bJu85UnY4NcXnT28Qh853SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6ax7tKn; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74ce477af25so2164282b3a.3;
        Sat, 26 Jul 2025 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753557323; x=1754162123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpcPUVrSqgoVbWvUEYVCKv6jr6R7p+WrNPGPv/zX2xc=;
        b=E6ax7tKnV2jTUI2bkk+l63ti1UAI+c6lHrmKe1N2JdPV6Qn5yi+IFL+mbErUakui/u
         Lleqc1qiei/waRlrav7EMVg+v5qqOBtM270v1j/GGmZEf6/fHTLzK1EpNjxXO6eV7/+L
         NGVGgH/ut5Xhsn2tDMRlWmBAUvkNaQGFkhQKc2VR1xX47X0t4ye08H+pmBixVwdgW2cK
         kbx3Cm7iO2v0oJa7FpnYqSf3MSOcp5tilvxPjrrgXvG6eK6fKFFpl1tkeMJmZ/bJ0cEL
         lOvvGrMX5qLpE6chrgvq/nj/IszrqcZ406pvSRxfCkO0IZJkMrVYNcTYfJIN6Vtn59tZ
         T49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753557323; x=1754162123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpcPUVrSqgoVbWvUEYVCKv6jr6R7p+WrNPGPv/zX2xc=;
        b=lAYV5oWO+9TlzufGwYQLim1b/Q7pun+BZAisLXxgTEKMj+fUybTqRYFcQkboEEdSbA
         OXglrzIEeGpaNVL2VoJXrOWUMx+6TzGL/7p40cerekPqO0dNbZq3NE9NthqgeMe1dHqB
         t023iSYiZBBNUlWJLl1MNs7U2NsyLWQoHl9FdbOeGmy7uC+wZjpSTjmTcRYBVqlhhN+M
         lXhKhf+zLiI1xEu9laxJBMbtX/2FJPsrZ9F9avjPDJTgcSuNXuiCQk5ATjSauxBlK0l+
         O+nBndJZSJKk+vUzaaLRBFbjUjTR6RLGIL6v52txgEGXCPbMNXiqKs/schwiJuM9gtWi
         xHmg==
X-Forwarded-Encrypted: i=1; AJvYcCVoTSmcGtP9NsDpjzLFVgKdaQsRTO7f4EGu6biCDJ1ZXHuMKA+9w0k6sWEYX08zTejAO9iixIIlNrQ32d0=@vger.kernel.org, AJvYcCXbIcgUmEKa0zCT/Zkhl0b0w0cnlbjUwghf7Y+64eGpaKY6LgxrrzQa1XqNjyuy3zGp+hinPmlGNVYf6Mkf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08h6n9zp9+s0LeHQKMwiRJBaQPRuWlShwX8Z60xxxOXcYOC2o
	MYg07Ygtffn9Vr78Q5FeflsXWOjQGl380ZT1tC6yx+8VE0kvoOfwyDqw
X-Gm-Gg: ASbGncvoOlyQ4mKJL+Yxz29L2kGJE8Jvn5NcLs+5/knH+rL/Lqj397j2a+fjb3JTk3s
	GW2bh77w1mmoVjnJ0S5PaBhHHv7ZEkCboP/mwkij4Dl0fZJ+QpzjcJztDN41c6TtglKHAr7pI9o
	011O5yaK0yKe4mgstLxeVjX+AcTpXBYb0UODbze+lN84ErpNuFRgBvWAwlkvsLKWl/W9mM+tm15
	De7WE9M9GiDAhD99ofw0h8p7tGNopY4rTWC2ZdW8NP7z4DRiAE+HA3svqJf0T3gG29HIDIz3aDF
	tCKimN64ccrVmhjvhSE023NiKebyd/AJq7/W5jHBwb3zepqF+xQ67oDJXkFDaG7qN6F6dSEBZet
	AM+RvkvmG5qU2zBVnqZZyL1iZxpLlrg==
X-Google-Smtp-Source: AGHT+IHGi72nheJIolzGFekC7V4ue+UFJk6zZYD+HfImkmP0eeJAEQyRuUOJUTy5Olyzc4lrcAy1xg==
X-Received: by 2002:a05:6a00:4614:b0:74e:c917:3b1a with SMTP id d2e1a72fcca58-763385c9e1fmr9669640b3a.24.1753557322618;
        Sat, 26 Jul 2025 12:15:22 -0700 (PDT)
Received: from archlinux ([205.254.163.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c02706sm2202726b3a.39.2025.07.26.12.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 12:15:22 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] kconfig: replace strcpy() with strlcpy() in symbol.c
Date: Sun, 27 Jul 2025 00:45:15 +0530
Message-ID: <20250726191515.171012-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() performs no bounds checking and can lead to buffer overflows if
the input string exceeds the destination buffer size. This patch replaces
it with strlcpy(), which ensures the input is always NULL-terminated and
prevents overflows, following kernel coding guidelines.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/kconfig/symbol.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 26ab10c0fd76..c44e8ac3e9fe 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -777,7 +777,7 @@ bool sym_set_string_value(struct symbol *sym, const char *newval)
 	else
 		return true;
 
-	strcpy(val, newval);
+	strlcpy(val, newval, size);
 	free((void *)oldval);
 	sym_clear_all_valid();
 
-- 
2.50.1


