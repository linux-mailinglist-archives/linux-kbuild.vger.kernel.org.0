Return-Path: <linux-kbuild+bounces-4658-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6A9C5B3B
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 16:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B1B0281879
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Nov 2024 15:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34FE2003AE;
	Tue, 12 Nov 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrhzn39U"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2032003A9;
	Tue, 12 Nov 2024 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731423661; cv=none; b=Iz+tNBBuIIX1GAsbvf3bpEOybgKAC56fIfURozBWFGJ7AJwf2MJz7BX637EzG6o6Wq3uJz9pct870ny5I87ns+I/MrOuGhCSNHkwOLJ7xCxdVRkqJHnzw5HiaCzmp23P9/T+L03oGfIeSwLx1dM4BmNIKBf3Ah6oRwxAu8f5P+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731423661; c=relaxed/simple;
	bh=fq9G1Hsbr7N1585fJCE6/DPAyIA64ydEht/eAP8gtHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NPxZBa9JSz+pGKhdrrP5UuPYk77V06ldwYsyt/WkrycgM4zCrhO0PzN4lyvWM5218ZVSil17oYF5jvF5xpLsDVykqZ80geUV695hlXbE2eDUXP4746HohtJ/EPwcLEUh7hjAD8F3PyzZZRZozWk9HH/Um5m0mhmOxemte7MABs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrhzn39U; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d43a9bc03so3971873f8f.2;
        Tue, 12 Nov 2024 07:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731423658; x=1732028458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IqmvX+SxdAffVmub2S37622rNo2JHBYGCOpSigKS02o=;
        b=mrhzn39U/UcdaELLW2h1TshleyEzmIq4YnMdhvrB7NtovLgP2aC7SeEvjiGyV5yD+A
         kjjr5hIQJ0l6Y3VlrugqKZjcde6NJoWt7dSPhdWAhXLIOTm/qZ5hjYoELXmiLeG5pf2H
         mh5TU2+3jbF+AjVjhD8tPeowNsEu2F5Ax9C4wiVDDuzri/H/ObqcLYjMiwBKMhV7QNxw
         TSeWRu10pSE9Y0sjnB25OZiYMyS1EBK0wEWZMH+Iq/7hi9SgloRPY9MiwVcAi9eSf+12
         p30TtTkfOE27ffHH6zyvD30uWAcYoh/TGWw5Rt4FiSvXguNoL6SD/VY7fk5nEhKPpfSf
         /Xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731423658; x=1732028458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqmvX+SxdAffVmub2S37622rNo2JHBYGCOpSigKS02o=;
        b=IpVZTsWOgjBADN8UTUOpt6DtmdvuysW1KpPNgsljuAhOs1g7dPb/9eZ4Lldb4BCE7D
         XdgcoJdVYS8CK+jyaPPyye5SAhMAUmpW3LGKTuOvZ7E2zr2UYn9yRzlnKE84KS9lLmJt
         gR/iMek5IMWnsDVhZ+fWPTBOfSgkKI9BJARm8sJNYgHp6caorTZLqhhaJCLZ9KkMaonw
         CihvyeF6NxO0wDdLJcSFQRx8Y5LyWlByZsd/I3w4gOHS7ch+RMRhA819vfCnL9S8GA1Z
         V/nXWTKC0A+GCb1UkRLeAWHjdLNDvjVr7eocWLfqFUyw3f6v2eLTqeNQaCHfVEcJOaxS
         3Afw==
X-Forwarded-Encrypted: i=1; AJvYcCVuOe4Q1h4IOUPbiOr9z39rBPLEcbssafKEAIT7ECOVJ491v9Os+2Ure/0U03lUE6QQnjssPwradM7pNjg=@vger.kernel.org, AJvYcCWWKrSZCIAooXqlE7WHYlmYvFxTTX+gpU84+EmlK7+vNcDJRzD48ekT7gtQwSfw2SrXaqXw37Rq@vger.kernel.org, AJvYcCXs3AaONZjS9qV5aHZqtjoPA4zUlcVYBrrJQO/JNDBoB9DSgWhKCFcd2LtFHpB2ZXt1eXwavqJlpa0GJxEC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywak3mSRfOOZh4mw9cDgUvoZ2cUjMSAH34rn6ilKJJcn3lo+U/P
	RPMII9cT1G3cUkQavrcCKs+q8bfAao+/6WuHiU25wVVwvWn9hTgT
X-Google-Smtp-Source: AGHT+IGNrcNi9F65h6+8t+PRAUL0bPu2V2+blpIe8qyC+KpDDsoflYU289CxmYaEJHlUtJiROE6UcQ==
X-Received: by 2002:a05:6000:18af:b0:36c:ff0c:36d7 with SMTP id ffacd0b85a97d-381f1863104mr14709742f8f.2.1731423656111;
        Tue, 12 Nov 2024 07:00:56 -0800 (PST)
Received: from partp-nb.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda05f89sm15537386f8f.98.2024.11.12.07.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 07:00:55 -0800 (PST)
From: Parth Pancholi <parth105105@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Parth Pancholi <parth.pancholi@toradex.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH] kbuild: switch from lz4c to lz4 for compression
Date: Tue, 12 Nov 2024 16:00:06 +0100
Message-Id: <20241112150006.265900-1-parth105105@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Parth Pancholi <parth.pancholi@toradex.com>

Replace lz4c with lz4 for kernel image compression.
Although lz4 and lz4c are functionally similar, lz4c has been
deprecated upstream since 2018. Since as early as Ubuntu 16.04 and
Fedora 25, lz4 and lz4c have been packaged together, making it safe
to update the requirement from lz4c to lz4. Consequently, some
distributions and build systems, such as OpenEmbedded, have fully
transitioned to using lz4. OpenEmbedded core adopted this change in
commit fe167e082cbd ("bitbake.conf: require lz4 instead of lz4c"),
causing compatibility issues when building the mainline kernel in
the latest OpenEmbedded environment, as seen in the errors below.
This change maintains compatibility with current kernel builds
because both tools have a similar command-line interface while
fixing the mainline kernel build failures with the latest master
OpenEmbedded builds associated with the mentioned compatibility
issues.

LZ4     arch/arm/boot/compressed/piggy_data
/bin/sh: 1: lz4c: not found
...
...
ERROR: oe_runmake failed

Cc: stable@vger.kernel.org
Link: https://github.com/lz4/lz4/pull/553
Suggested-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 79192a3024bf..7630f763f5b2 100644
--- a/Makefile
+++ b/Makefile
@@ -508,7 +508,7 @@ KGZIP		= gzip
 KBZIP2		= bzip2
 KLZOP		= lzop
 LZMA		= lzma
-LZ4		= lz4c
+LZ4		= lz4
 XZ		= xz
 ZSTD		= zstd
 
-- 
2.34.1


