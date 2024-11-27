Return-Path: <linux-kbuild+bounces-4897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1F9DABD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 17:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 349822825A6
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 16:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248E5200132;
	Wed, 27 Nov 2024 16:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xw5SRFX5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97983200BBE;
	Wed, 27 Nov 2024 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732724956; cv=none; b=TQW3BlGdIKwKUGCaktQhy3NKnAKeg+bANQqe6xZSDLQrgo7FNsQKz283ncqmzoqnITczEgMgPNKAoxeKwqwi/O27DSVSmCnAV0rbyNNFa2lUfcvWfqIhbbfdGmRaQSuU+rfLUto/1+QPukmyscgwXGGZpellD1UBi7l27e1hLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732724956; c=relaxed/simple;
	bh=BT7FKnE3ZuGvZUWOI7ZqkFfTyIKYJ3WQk1uFh3TGyDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kIqky2nmLEdjsZ74rGv5k+0RCms75l4XYazB6W/sKlJV4HPK5Ra0/79Kyzs03dUTQYv1uxAwhhfYHg3eMWJPQkxyNLl3QtvENgFDDpOYbWLwEoJU2kfrPEWZH6bKD+6+42psJpAGTEU5TDFTUonZGRDQ8oChlGqTexi/C21FAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xw5SRFX5; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71d4e043dd9so1761267a34.1;
        Wed, 27 Nov 2024 08:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732724954; x=1733329754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEbOcpwCHHByZ33Qa2Qn9wfHf3trRgJBBvEbwMai9W0=;
        b=Xw5SRFX59VAw8byx6r6PKKfWH4isp19ykzppf0YDIHy06FqU/vnAx3dytkgAFTJqXr
         Fd24W95dYYPa+zQC5PzuNXsOjbdjHsjvR7ZfGx2HPjaDKwQE7v7RbZ0qOdXX0KQtL7Qr
         01r+txlkmtyzLueqdVL4a1mClJ7gVhKkMH0oHptCXoUv9z1NEiKLfSS56kWkazAs1gKX
         tjjgBDq7ZHgYC3o739R6tqSUfCqoaRfMc6eicTkCHMPh+ccpZM0HB70+rNgKTdUI2vfe
         weSBUEHXo4cGqW/+w9ilvuSCo5FPGtOERi3YNiUPKdpFhhPrxGsoDIOZ+JbmfZZVlnHI
         Q9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724954; x=1733329754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEbOcpwCHHByZ33Qa2Qn9wfHf3trRgJBBvEbwMai9W0=;
        b=IyNr+5ed6+acKfsIKZBbtpdILVFuB0h8nzZ0yqslePYqabty/CpxONWkWWnu73e8eG
         TvhoExwW1QIkHmn/LFL8Lqw/YVNhMS1Yg+khv/6jVyMgRf2g8Z3ubqLqjSfaVZNwYsxd
         3LeEwYq9jgk+JP/6HL+Iuk4hdtUwwoHKz0fvC4RvmlMsfT9b97gpBXh0TwmB2lfkE7AP
         4QFTF6lfJmMmu+RfAJPdTqctTv347bL1OWrI1+upO3Ced+bFuaNuE1XuaYB7Sai2IsEz
         iuoRL0GRwax7nD94nKKP6HyF5EXxR/pTa3Q7BIL4Xo9HUpCE+aJ8BXE/+aaPuNLWX5M7
         dmlA==
X-Forwarded-Encrypted: i=1; AJvYcCWgGrlXCM/y5qqlwS2JwE5T6wy+laCkRuLimwnXyJToGWTvI7OEfJZZv5Rqj+7AUCzTd+9x6d7vjkLXVC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBIEknnmqbfGyO6BmMIRjnKp50cORJY6Mum8ngO+tx2wMS0Lo
	bcA8gRq+mVf+d+1+n/eTTYR1sRgpSrIhWquchxIdfxg1kJZF1il2
X-Gm-Gg: ASbGncuVP+gbqh5/o/DGcE0Cyru1hS00DLLPij4OkefxHpOrejI1/s7eaxB05CL8nS5
	JonWPu8zDW22H/l8JUPKQ/CyawED+CsYCaHi2GqhrjVmrA9L3nL1sLVzN0z5KIkdNHxVS6QsC/1
	GWTlh2/0IZi1dN8E8Bi2crgIgsrLXhrnriIXQmvTRWKmMu7ZMunXjRIzGPZJ2rZeFPJhKFXPfdg
	259USgvjuxjB42zHPEJ/JOnYrftLrBy2us3uVNh92zfaQeOGrhf7TSBHhcCAm5s7A==
X-Google-Smtp-Source: AGHT+IF2vfHF1QgvwSYQaUoi2cG8BE7AtUui3c9FQG/3h1Z+63tLhgbi2jIb9KzoqLbG00WrXFPq+A==
X-Received: by 2002:a05:6830:6e99:b0:71d:62bc:85ec with SMTP id 46e09a7af769-71d65caea6dmr4404180a34.13.1732724953651;
        Wed, 27 Nov 2024 08:29:13 -0800 (PST)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:c7bb:6d40:86ac:b512])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e1921sm9395861a12.25.2024.11.27.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 08:29:13 -0800 (PST)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: [PATCH-next] modpost: Remove logically dead condition
Date: Wed, 27 Nov 2024 21:59:04 +0530
Message-Id: <20241127162904.28182-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case of failure vsnprintf returns `pos`, an unsigned long integer.
An unsigned value can never be negative, so this test will always evaluate 
the same way. 

Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 scripts/mod/file2alias.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 81f20ef13a0d..8ce48d7dd36d 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -57,11 +57,6 @@ module_alias_printf(struct module *mod, bool append_wildcard,
 	n = vsnprintf(NULL, 0, fmt, ap);
 	va_end(ap);
 
-	if (n < 0) {
-		error("vsnprintf failed\n");
-		return;
-	}
-
 	len = n + 1;	/* extra byte for '\0' */
 
 	if (append_wildcard)
-- 
2.34.1


