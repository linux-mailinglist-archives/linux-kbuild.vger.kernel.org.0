Return-Path: <linux-kbuild+bounces-7205-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93318ABF4C2
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 14:51:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21021BC2953
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 12:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E09265633;
	Wed, 21 May 2025 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muzTW4wm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74920265614
	for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831863; cv=none; b=PU0w2redNf7Izfzn9/uu40mqY69Xs+MclhUNRsE2y6klaKF+s8dZFIQs4UscuEqAhhPz+G3fFEmR53iQwskUXppza5ijj12/KSG7CnFDv1Kr+Is38AYjq1IdWyFPftJAv6qoZ/NrVYP3lPrcU8wNFfPPXg1mle7bmysUkgdc1I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831863; c=relaxed/simple;
	bh=c/4UACuglx2lLpsDodEXX+ZZSiGGYxLErCpKAmYQVKY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MZhETTLT/VIaNYVC+7ylmtxCNK6+lT/7WQFZJnEjkr6Du5rzugREtIEDU+XDSWQio8jnTKe+tK5YPRx/ULk9D6CtkjX2MooK34BOdwsspVIQbk5IoSkXDMb44foYxcXpwL5MO2slK9ySoilA6YC1eqAP9RD9Hs/flrZwvpX5iUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muzTW4wm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231f5a7baa2so36680275ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 05:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747831861; x=1748436661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cYzBuTR0AONBqi3bI+vdXXSOsjnAuq0CuTWYQzE0EKA=;
        b=muzTW4wmptVTI8UTv7HH/Ou1OS5zcSXkdY9De3rK9Q7TXkLy2boBrzaWTDuz7cMlJo
         taWlhdyA/9Kt7e9k0vuKlA1R2dNNMhUQdPRXkpKbqohhNC6VTQSj8fsucJYO6E2xj8sy
         GnwcaHQ2I+/T1QKV9pMjnF5D2/Gcrm9B5NehS9e6hJSch8jyMYPAhCE23rFc3O7ubWyy
         9e6o1uB7KEYp/s8IcKpqGtf9/9Gs4HemQ61BtitK/JfZ3TCFRWYIGntA1px15tALq949
         t3uqoJ0SYPitoWcGk2uzLQVv3sIEn6J2r6eUqMPanuctH7CTUZD+3AVrueGb66LJQGFV
         A8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831861; x=1748436661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYzBuTR0AONBqi3bI+vdXXSOsjnAuq0CuTWYQzE0EKA=;
        b=dSRsr20L0j8CogOS3NqM85oLAIRakdE01+zvqoCBo1vFE1lV2CXa3rM754z3cEwtHn
         +Ue0r5ld4BQ/pJtY5HtNh3NDuEbq14k6SWSiCMk2x1l4f9lj5jtUKoCGTVS0tlcjSuCs
         xcdwCiadkADtF0b1wZX9f2mKBQg6yv42XR+3IxOkBtSAkUCtjHw3Yq30nsi1dMreveQl
         WFncbMZfUVyOnNp7tDR/gzgXkwHjQKKM4hVYtbakg0Wc79wPWDKOeJsFAgWTt8PaFVQa
         NnZZAXsGC+kligHmLxm5gk1OgLlGDp/QncafFA79nfH11fGFDpKhHdtnfxHd9J0xjUTl
         IS6w==
X-Gm-Message-State: AOJu0YyC4Ya/gxP/IS7Y5S4XxEVMUdxkKBDk8HUkz3+Fqe8w8t2q2JbD
	YnWr5HrelXto/TbR9o4dtVJ4FGKW9zxIpIuN+ckQJNzKVmpugFAIB5/vb+mqPatl
X-Gm-Gg: ASbGncs5ivkAGeYvV0tKRm2DKdLNAmqHfA9LNjSW/a75T7ENXIr2m7kyb8e4H6vsJaI
	GvrxHdY8tLxeYU+a+ZAYVt5xfrcOQW7ZdINE2CPGilSJamNDhxginj441zKTkRyyzxcfCZ2s7uA
	+RDSliKwPD2L5f/naFQBA7BDi63YxUQWgMqNTmdy7qbhYxq0p3J64AWLBMHfbUxFkOYEFOoKEM7
	9xo3siTQb/NZSTKKMEqMHtKrkRuGmbOOXK8AhoKAduwq1WV0+8mAD3DUcmZboHdrVP0l7GwsoEE
	GLPyyh4L6eq5/eZtzW8ckYEDl7AQxHbHt+SsbkUeAdX6nbYBVCHhreR+wngAEhWSi3g=
X-Google-Smtp-Source: AGHT+IGrJKmJ2xOvKjvePN6rPE+YLuD7VDg1sZKVKAEol+kavWqdF7UtCP7xasi+FOgeBaqcVba/rw==
X-Received: by 2002:a17:903:32ce:b0:220:ca39:d453 with SMTP id d9443c01a7336-231d43a3e56mr269439415ad.17.1747831861207;
        Wed, 21 May 2025 05:51:01 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed276csm92168745ad.229.2025.05.21.05.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:51:00 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org,
	shuah@linuxfoundation.org
Cc: Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH] kconfig: replace unsafe strncpy with safer alternatives in confdata.c
Date: Wed, 21 May 2025 18:20:52 +0530
Message-Id: <20250521125052.3502106-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy silently truncates input without indicating failure and does not guarantee null-termination, making it unsafe for bounded copies.
The added if-condition ensures only valid data is copied, making the code clearer and safer.
strncpy is often misused and its behavior can be confusing. As strncpy() is deprecated (see: kernel.org/doc/html/latest/process/deprecated.html#strcpy),
using memcpy after validating the size ensures that we avoid unintended zero-padding and potential overreads which improves maintainability and clarity in confdata.c.

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 scripts/kconfig/confdata.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index ac95661a1c9d..d01ba3b4dd40 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -101,6 +101,8 @@ static int make_parent_dir(const char *path)
 
 	strncpy(tmp, path, sizeof(tmp));
 	tmp[sizeof(tmp) - 1] = 0;
+	if(strscpy(tmp, path, sizeof(tmp)) < 0)
+		return -1;
 
 	/* Remove the base name. Just return if nothing is left */
 	p = strrchr(tmp, '/');
@@ -970,7 +972,7 @@ static int conf_touch_deps(void)
 	if (depfile_prefix_len + 1 > sizeof(depfile_path))
 		return -1;
 
-	strncpy(depfile_path, name, depfile_prefix_len);
+	memcpy(depfile_path, name, depfile_prefix_len);
 	depfile_path[depfile_prefix_len] = 0;
 
 	conf_read_simple(name, S_DEF_AUTO);
-- 
2.34.1


