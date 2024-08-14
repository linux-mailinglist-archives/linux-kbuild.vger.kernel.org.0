Return-Path: <linux-kbuild+bounces-2972-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548E89512E1
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 05:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15557282B6B
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 03:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496B8381BE;
	Wed, 14 Aug 2024 03:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GvFlf4LE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C220B33
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Aug 2024 03:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723604688; cv=none; b=FdInR6X63x7qXwLDqFQa+8Y7j1taxyZgAtxbRTAb2zRyvBnK0Pd+JUPI0ilhV4dE5lr+dpGOskdjrImrpWOVVaN+/l1ziMHePLgn5+MOza/mTcYws98S3GOh2UOw2Y96nFIthGgcuMbyHStIr76nQcZTmpsSiDwjUxhYlB+LHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723604688; c=relaxed/simple;
	bh=7UJu/2PsOEHOhwnyEG3i9TZeYYxvGGCWRhh8Ql7+FLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GF0krwUSHHOhBn36cCUxLiPS9ds6r7M+7IMpZjc4CPj7AEYxvEVtW336oO1TCKNLRCUlAU3Z952Wuh8FCD7zE/GyDwbwx/bYlpuKk9wfrU4YWvhA9shdzryHV1AB5EJXbo3E4MDSN33MszYQkLViewiyKJDITC5S7OiE3ZcmncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GvFlf4LE; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-70b3b62025dso4016164a34.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2024 20:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723604685; x=1724209485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3J0fEUvbHMhAPJWdImRyNu59MSY0IJb+fU9MhfF+WQ=;
        b=GvFlf4LELb7hvUwyw9IbuQOancOinDUCXXJCwyXf8m+LSkF/v6ywPb7d9rZQ7D+m9j
         zMmzj9K164tFZdbOL/u6CHErU/gA0LVmgDTtQ/8D/QohjONUWpeM679zo3k8E9QmFzx1
         TiPhjCfRR6qYbtwkvlh9AvtjWZy8T7AkfbIPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723604685; x=1724209485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3J0fEUvbHMhAPJWdImRyNu59MSY0IJb+fU9MhfF+WQ=;
        b=tthN+5N4J6Oz9YGs2gLaIrU9RXh/dYsgxNuu6BRqREmYTPNqtbTXH3F/igMHrEMgEO
         C+0Sz4fs8vR8WEq15b0+sooCl6mQ72E1YlS5nE8e5B9tnGmVYthIPacvxHhFnAURSIFz
         QcrdZKgxyy+XSCdHm3EBJ13AOiwNG0IuBTQuRXmkKNt+On925LWIWmvqfP1wUChGb4n6
         9cPtKCI/UtlNrxvf3FLnuT72wMJ1ohBUpWtPgXvWhJjg9mNY/aIhULkgJXlU63fFkoF+
         M9M3hkewHpiiYCvFAlhY+Dh7C7xgJndI5GBbDo0z1gmCAvNSCIHpVmXP/XAt6/STilJk
         R8+A==
X-Forwarded-Encrypted: i=1; AJvYcCVTvK5qChtFYs7WNiHhtlrYVbDYQb/j7BDzjDKD114w3/JckhheuaGZKUN7Jjmxa9qlAZoyJp9++n2jPAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4EqARUGbF1fPBNTO6CPsYHHQ4AiloCC9mQFbiWwYwk4SeU96
	Bkg71EMghFzNMYYE5myEO1Wey92SVmKwAxF1QyNRCVgMpVQPnU5r6JYJNf5Gvg==
X-Google-Smtp-Source: AGHT+IEuPm6gxy7zj+fU+81SpVfOU29yyUWzz3ZXSQQZUPg354kPeGsGkveX0zmBzn6UCnv07eUfFA==
X-Received: by 2002:a05:6358:3110:b0:1aa:ba92:e7be with SMTP id e5c5f4694b2df-1b1aad69299mr154584955d.30.1723604684705;
        Tue, 13 Aug 2024 20:04:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:517b:be8c:b248:98cf])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7c6979d4b3asm2182709a12.4.2024.08.13.20.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 20:04:43 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: bpf@vger.kernel.org,
	Thorsten Leemhuis <linux@leemhuis.info>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] tools build: Respect HOSTCFLAGS in 'fixdep' compilation
Date: Tue, 13 Aug 2024 20:03:51 -0700
Message-ID: <20240814030436.2022155-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When refactoring the Makefile rules for 'fixdep', I open-coded the
compilation rule (avoiding the "Build" recursive make, and therefore
tools/build/Build.include). In doing so, I omitted HOSTCFLAGS, which was
previously part of the host_c_flags definition.

Add that back in, so builds get a matching set of host CFLAGS and
LDFLAGS for this step.

Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Closes: https://lore.kernel.org/lkml/99ae0d34-ed76-4ca0-a9fd-c337da33c9f9@leemhuis.info/
Tested-by: Thorsten Leemhuis <linux@leemhuis.info>
Fixes: ea974028a049 ("tools build: Avoid circular .fixdep-in.o.cmd issues")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 tools/build/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/build/Makefile b/tools/build/Makefile
index fea3cf647f5b..85321c7b6804 100644
--- a/tools/build/Makefile
+++ b/tools/build/Makefile
@@ -44,4 +44,4 @@ ifneq ($(wildcard $(TMP_O)),)
 endif
 
 $(OUTPUT)fixdep: $(srctree)/tools/build/fixdep.c
-	$(QUIET_CC)$(HOSTCC) $(KBUILD_HOSTLDFLAGS) -o $@ $<
+	$(QUIET_CC)$(HOSTCC) $(HOSTCFLAGS) $(KBUILD_HOSTLDFLAGS) -o $@ $<
-- 
2.46.0.76


