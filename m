Return-Path: <linux-kbuild+bounces-9633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D46DFC5DA70
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 15:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DBF073589BD
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035D332ABD1;
	Fri, 14 Nov 2025 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J1Ttlg0N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4B8326D51
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130493; cv=none; b=EymRLRoaPPXbhszEdeK6MPB3F3ZNF+Kb+cL86AauWZ1rbAUEMUsri6wqEdez2MTbxu4mkaK8tsu4v8C0c+7VMcUT1Q0NQUt+W+nzc5FC6ughXSyUNAj5h9/WhOs/XJcq9dH/JCk/AMCESuzQXk4M486s3ObC0dI+zTZMtVoh/I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130493; c=relaxed/simple;
	bh=vtbE4iQccIDPAbt51GtKugnCRkvsnDiu597g0q1p1vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O93GOdg3CXdqs9a8CkFm/2+n5ebIkEUPAwOpVrepdIa1W6SM6ZDOMwMGmXs+gJLt8RUEv+4Pn/2doT74ZATIm/lVmeMwVuxA/lOsG2+E/o/5cMcNLc1YBBLHn+0ItczDMag7++9qB905ec+++TboU5FYHYk+QtsS5GEMvhMnJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J1Ttlg0N; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-433692bbe4fso9514935ab.0
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130491; x=1763735291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g04XP369OdIGlU7nO8ZhA20Z4uYWbY8J/2UrhgEgmF8=;
        b=J1Ttlg0N6LKJN8NnZbsH7QqIhk3l6+pthl7S8qvWG1xbUXVbdhnmcWYHXkHTNUNlyO
         myNeB0dhzIOEvZPQtUD6c2brUcF2+QpBXFJxsdE8N64518kKe6nT9J6Th+l4qSkxveGT
         Q170jXhmSOP6fjw7Yu8W3GqRAYil3u+TYAiWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130491; x=1763735291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g04XP369OdIGlU7nO8ZhA20Z4uYWbY8J/2UrhgEgmF8=;
        b=blV+0988tAhiVPk6lNym/LOxy3tF350nlq6a3wP0kUfCEgPEizPtItXEzwPaMjXi81
         9R1dw81UJ9ZiiGz+/0WevXI2QzxMIHuRRKkisLTTM00e8utc2u2ksTSDN0Kbv05Jqecb
         EKYi6r9RzQoPoO/I05u54uIgCbG8rbCsxsJY8QHRiWSYtDZZssW+fyuW46/L97jfuPwu
         nQzDQ6t9yNCxv1PwkSYLd5L+3Cbcw0PzHdXUX0cBm+Ml19gOf+n3vlo8+FEbTxwxUKnx
         zmGbDovujqg9zp1jG/IKlmET+OqUGU5b8IZptXRfPmSAk92A/4gv5ifDivpoNIRi3IER
         GnxA==
X-Forwarded-Encrypted: i=1; AJvYcCVUM/YVuVsJfBDn/f0THFYjuSGimYOey9Do51hQl3k6LYHTXJjdsX4iu5p3E5zCayXgLAjEy31JU2cTrRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzohBiHX0MrEGNcOc3Pbt64DPqXUD/bz4Qpr1HYUrNrH2FyXnKV
	yJNhemVbgaj8C/rs2p4crPeNp3sJchZiluY0KxSM3RPKf7eDbIQZ3QgIM149hxAsSw==
X-Gm-Gg: ASbGncvpZqxddsRx9C5znpfvIzv7BSd7H3Om/ZxU4fZ7L5VQXuNjZ9AamxF7pVVXUwl
	pTuKi9AjYLjwDeYWoohDlKXJiMlxFUKVTx4NnN80Koj6oLdOto6YuAq9YAnKgJ00uvUUKdQV0NF
	ybseTEqWpdzjHqSC1fpEeLBhvTfjAO5oVgR2kTuqLP5R/7rOeJyMpoPh6pxgt6dzIFtUiuj7i28
	L/M4Q3EBmQRdJPOlwRJ2lkLNd442sn97tdXzsv6UuhlDCLFrua1Qv/gwtLEcybx5NhCO89/3woX
	y459tNoSK0wqPtKg4uXjwX/3maH0whfT6O8QtkytgzfjP7w+NIab5eTia7if6CsD7fZBw5xXK/e
	RG2RaI8fNFnn3Fq3Yf1GDOr9ubDa0277EeKJWsDSOgAt+39A17JMaTZHEJs3ICM3zPpvzsr0NyC
	4RcXTVfL9vhOcEJ4o=
X-Google-Smtp-Source: AGHT+IH9WRXDGpQxQ/K/6unFcP6iH5jd3lNOXJwjoIeZqn0+/6i1yonIkDQHVVuUwWSwfsG4BW0P5Q==
X-Received: by 2002:a05:6e02:2389:b0:433:330a:a572 with SMTP id e9e14a558f8ab-4348c8e3e5amr60110435ab.13.1763130491388;
        Fri, 14 Nov 2025 06:28:11 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:10 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 5/8] kbuild: Split out module targets into a variable
Date: Fri, 14 Nov 2025 07:27:31 -0700
Message-ID: <20251114142741.1919072-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a modules-targets variable to list the targets which cause modules
to be built, since we want to add a conditional target.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v5:
- Add a new patch to split out module targets into a variable

 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 638bc09a546a..8cd46222fc48 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,12 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
+modules-targets := all
+modules-targets += modules
+modules-targets += nsdeps
+modules-targets += compile_commands.json
+modules-targets += clang-%
+ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
   KBUILD_MODULES := y
 endif
 
-- 
2.43.0


