Return-Path: <linux-kbuild+bounces-7203-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF5ABF2BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 13:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273838E088B
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 11:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1CA25A2CB;
	Wed, 21 May 2025 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhCqSeWR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10ED923498F;
	Wed, 21 May 2025 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826709; cv=none; b=iWTqFTu15knErdIYfzde5BvbbyPNywoJg6GYDoevl2YCdT25Nw2O2j/w8sHcnEQ+Dywd0QVjYy5n7y8DWHv9ITGbNCKIfobKXID2/56kdN4Wg/WZiygbj78Lc4gIZTM0LY1vLROPcoj8iKmpq7M8onmNJoAgcb4QlJb+kotVehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826709; c=relaxed/simple;
	bh=uTd7GhTLIz5+DxHTwAgNehFyUM7n+s0sXNYes37XIuA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HY73H27GDzR85fb9Yh6QsNQ8hbWftxGV/D9LHDn7R80Yad4O7nZ+yTvT/vYfHW9hT6Wz/dZOBAJmpQlqKoxECGUC/cEjkCOCfOSfW0h6jDRNEma3F1h1q9ofiSDcpgd6bNShM4MAc+4yPHirVlO5iZCL0R+adyaRTPY9wrYgPEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhCqSeWR; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e740a09eae0so5939602276.1;
        Wed, 21 May 2025 04:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747826707; x=1748431507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXyesZCoIswIbtLJ6qYZr+d21vajyiv4f0JIKWqbSfU=;
        b=YhCqSeWRHxhlPw/MiYjA1DinJy0/r8ex+I70lMZzbYRTu+pbm5eJEG+Pg+XNBWGOYY
         8IZRKN0Q8NBbHAmJEBp0F7UetSrj8FldKdpN1yVNLkDaKtYNjcXItlvs+tVnHM2F4xzl
         GhDrJng4cTjHWJLvRpVsxkZfLWkxs4lcVlZAFIXctUOxE5Ft8rsmzPE8g3lCsS40lynX
         OunFtoXLwl5Jp8D2Eu7aGMrKXeCN5jF1vSFWP6JEnNUJ+tUGUNfblSh3xKBKdFvWqIXC
         zEdyPxc9nornLuwC+nGFJv2l5O+5APRfnn9OvSWPp8ddFIld9so8ix6q+QARxI/NMxJX
         vJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747826707; x=1748431507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXyesZCoIswIbtLJ6qYZr+d21vajyiv4f0JIKWqbSfU=;
        b=rEl/MnoRPJx9mA8QrelaHFkJIxDXykHrGDmwpujySC1ykeFHsXmaG0e9CEtvazXvjY
         rU8cxUsyA/1SKzGjpcNedDUam1BIEX/X0bG1KXGHhiLdFqDBHLdlLuEB2K70PcdODGjS
         tFmKcVpFgiHnO/dAmgcFhk502ZZcyp5rQ0g3DtwvyVUiYxkKlhDrf9lqcN9L+LaGT9J1
         XOZkbehC7qplHBA24Ff7FpKqXEAQ3XyQtWVVlZYEgaSPrgw9dEzb4Hr+YzqE5iA3jlAS
         ta0bXySGTwXN1hJXBb/bgmohfnlWcsHJpdm6+b4ydnXtPC5u5hGuucdnT0AE5dVAvA9N
         3h7w==
X-Forwarded-Encrypted: i=1; AJvYcCUykLMKtq8Iyh6ZAVJRPCFMRGx49nLjwkIvq+rCSJM3sxKb2wmAWAJ0wlkTtq+V0NYQ32BY4/1ZAGLUoT8a@vger.kernel.org, AJvYcCXKiWvxxcE+DIysIG8JBAk6QfHCxDe+VvKH2Z6OveIgohitHD2ssf+Jz1u0s53pXw8P9ZkvH0Rz3Sea+oE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysEE1rk/XtqnoXtNek0tpLkdLnVQSrGXnnTu/zBGs5SRkavXjV
	H0nDJELknnUL2nNhVe967p5QmPlE8rFN8W/BkMQlBnveJNLGGXicKZ1c
X-Gm-Gg: ASbGnculcRapwZK7rD/44lAMAYQvyfSQtBhvniF4vue4wB/KIYd+54ZpHmQSSiVRSHY
	j0Sz413LRm4OJkUtHaX8Ptjbq0v0WpBQstpQCv0+6yefMKZsrOhJI9PT8g0YKgnSJMN8k8Ymvwb
	OiZiOv0Xyxd22XpmpNkmc9kLyV9DeEPD+2qOWgT+8K+zBzwJKNPIO89WO31qs8Q0Yhs3jfTt+Nj
	u2W0UU/gsHPvhJjcYPFkrtyw3jRTgK/4z/v/Qp+vVps+mnHY+b1AwWyYPOEJA6fYz7BKXss7nPq
	JjRhY2f7LPVRAoETHFWxdiT6wEkobf14HpaCJZGGZ4aHuAszZXv1e2yx6E6+Mrk=
X-Google-Smtp-Source: AGHT+IFMhLkFOWNu7fR8zHKCoDWQmlmxOBqQStwfNUxXq2aoXa7CkceTeF+6VU8t8r9+DaLwmRvaDQ==
X-Received: by 2002:a05:6902:124b:b0:e7b:9763:6673 with SMTP id 3f1490d57ef6-e7b97636a55mr16633916276.13.1747826706681;
        Wed, 21 May 2025 04:25:06 -0700 (PDT)
Received: from Gentoo.localdomain ([154.16.192.116])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6adaa721sm3928538276.44.2025.05.21.04.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 04:25:06 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts: Correct the function name in comment
Date: Wed, 21 May 2025 16:53:03 +0530
Message-ID: <20250521112425.20218-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simple correction about the function name to match in the comment section.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 scripts/link-vmlinux.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 51367c2bfc21..6ff23a77bf96 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -165,7 +165,7 @@ sysmap_and_kallsyms()
 }

 # Create map file with all symbols from ${1}
-# See mksymap for additional details
+# See mksysmap for additional details
 mksysmap()
 {
 	info NM ${2}
--
2.49.0


