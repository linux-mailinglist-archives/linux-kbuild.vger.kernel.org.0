Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF21225E27E
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 22:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728024AbgIDUOw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Sep 2020 16:14:52 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37459 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgIDUOv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Sep 2020 16:14:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id w14so9435116ljj.4;
        Fri, 04 Sep 2020 13:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3XhSnjbH4LNvROC1KGa4RbBBuJXx+HscGx/nuzRhKi4=;
        b=csZ9sQX4GAGvZlWqM5lO8SFjSpai02VKLj37OFXJHhmyYVCn19+zE4Uisx7tojS2i8
         YbHo4WEwvJUPNHhf+idQyagjDWx7RETME7VsDtnk/D2TlieLK/hUTOLvN42cR5kJoF9d
         bkMHTa8zYrKGMtcVQtLpkJNakcdbZA0SV7lYv2n2UsZ2gmgJWaQPRq4nzWoFTfoSfmoZ
         Uuh6HGSvjnNNTe3tgR73Uvj2IY/i4S4pTr2gJmVyNvupug/RmccaBO1jFFMs5fC1fn6h
         Q4WdP3lmw7VWixfD8rRstq2ccVQIFWEuTRXUCs2UgryjwnHg/7eh3CGyPdgfLCL3Okvs
         9KIQ==
X-Gm-Message-State: AOAM532P0BvjivCVBg1p/uUXnF66gWwgAFq66CwhCGX/umHornWmEowA
        VZODoeIBSU84KfNnv3iHo1Q=
X-Google-Smtp-Source: ABdhPJzXJOW130FzdJUGS6UuQt5VBqDxfzwsc9hptue+bOvUkgYU2sQ6YEi41Af7ZkI6ITGH3cgu4w==
X-Received: by 2002:a05:651c:1253:: with SMTP id h19mr2118949ljh.55.1599250489648;
        Fri, 04 Sep 2020 13:14:49 -0700 (PDT)
Received: from localhost.localdomain (broadband-37-110-38-130.ip.moscow.rt.ru. [37.110.38.130])
        by smtp.googlemail.com with ESMTPSA id a16sm1468533ljj.108.2020.09.04.13.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 13:14:49 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     Masahiro Yamada <masahiroy@kernel.org>, Guo Ren <guoren@kernel.org>
Cc:     Denis Efremov <efremov@linux.com>, linux-kernel@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] csky: Drop GZFLAGS definition
Date:   Fri,  4 Sep 2020 23:12:58 +0300
Message-Id: <20200904201258.795438-3-efremov@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904201258.795438-1-efremov@linux.com>
References: <20200904201258.795438-1-efremov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Drop the definition of GZFLAGS because it's not used.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 arch/csky/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/csky/Makefile b/arch/csky/Makefile
index 37f593a4bf53..715b839bf998 100644
--- a/arch/csky/Makefile
+++ b/arch/csky/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 OBJCOPYFLAGS		:=-O binary
-GZFLAGS			:=-9
 
 ifdef CONFIG_CPU_HAS_FPU
 FPUEXT = f
-- 
2.26.2

