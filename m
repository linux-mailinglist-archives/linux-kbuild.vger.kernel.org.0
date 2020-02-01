Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEF214F6E1
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 07:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgBAGZL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 01:25:11 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44694 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgBAGZL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 01:25:11 -0500
Received: by mail-pg1-f195.google.com with SMTP id x7so4751243pgl.11;
        Fri, 31 Jan 2020 22:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kIoryQNxUONJRGtWLKxPO60ZclmbdJRMXHgfMgH0QP0=;
        b=a8HWqdZZWAZLkD+sZxA1kKSsILlD5gmRvsj9U3v+N6blQBaQ+8VsYkBRyN7xZV/Zj4
         7e+42qi6iFLM4tVW1fKuZqOFhF+3c0y7S/NOgM2K3ygTBYFWrXRjdIj8e6L+Qj2luhCd
         6MPtjjhO85yBkBKTyI5eVqUUgLgmg1DnxeaIbYTmlJmlMrH4PZIzQ/ZUHJiK+1RaaZ7B
         FLkJfGm0ziM2b/vVZDfB0ksKtHzSyx8kLGiHsqpZSPbVpQMmRL7tf4xD8y8cVDSkgTK7
         pt53OK/25Adx6fP4LRYldqspO0DzKHwCz/Ssc/WTYbEbioyrSCU4Tfwcu+PRP/d4bd2O
         sf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kIoryQNxUONJRGtWLKxPO60ZclmbdJRMXHgfMgH0QP0=;
        b=kgvk68jHXDCYIaUCfh8WlDZBE9ByD3EBgi5H8JQ8LmTsCJErnU8SPZCVhXdTS8Je5v
         JjplsCZ3DoDcENxQ1uaJx7D6/uewFwKvt0oRxDXf3V27FAy3jH1q6tOQqU8lLNd5bXyH
         k7olLJiE0MyMAd6dcmhreh3lvdw72uUCEdxcpoUCUcmmdCHpRzY/qE9kxx4uMGia1Iy4
         /VhKP4P2MGZvfsQb8jXcjWM+ps5+x+sxHnMqeTKgQg2+4i3L9XJBQUWe0vktElijGv2/
         fVKSiXZR4sqXPScMpGRwG4LGeZzSDZ/tV7X+2gdQ1Z4hMWiyPh65tfmXBOEXr8fcsXra
         C0Qw==
X-Gm-Message-State: APjAAAXdgCEoHJqOG4T4r2jdTirc+OtsDikjQ68QnVkDezyuAeiTqWyT
        /DWqAURugH8Erch2qqItrOo=
X-Google-Smtp-Source: APXvYqwxlkeYW4dDNOTkF37a/kTlbvpnPY0f7epfd8y8ApICp5cCAtiaLNv739Lg/+BCp8U9ypEpzg==
X-Received: by 2002:a63:214e:: with SMTP id s14mr14017609pgm.428.1580538310445;
        Fri, 31 Jan 2020 22:25:10 -0800 (PST)
Received: from localhost.localdomain ([149.248.18.167])
        by smtp.gmail.com with ESMTPSA id v4sm13191971pgo.63.2020.01.31.22.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 22:25:09 -0800 (PST)
From:   Changbin Du <changbin.du@gmail.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc:     Alexander Potapenko <glider@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        hpa@zytor.com, x86@kernel.org, Andy Lutomirski <luto@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 0/2] Add SANITIZE_xx.o & SANITIZE and apply them to x86
Date:   Sat,  1 Feb 2020 14:24:57 +0800
Message-Id: <20200201062459.7150-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These two patches add SANITIZE_xx.o and SANITIZE to disable all sanitizers for
specific files, and apply them to x86 booting code.

We need to disable UBSAN for some of ealy stage code:
 o For code which could operate in one-one mapping mode. In this case,
   kernel would crash at accessing data parameter when invoking UBSAN
   handlers.
 o Since UBSAN handlers are instrumented by KASAN, so invoking UBSAN
   handlers before KASAN is initiated also is not allowed.

Changbin Du (2):
  sanitize: Add SANITIZE_xx.o and SANITIZE to disable all sanitizers for
    specific files
  x86: Disable both KASAN and UBSAN for some booting code

 Documentation/dev-tools/kasan.rst | 12 ++++++++++++
 arch/x86/boot/Makefile            |  2 +-
 arch/x86/boot/compressed/Makefile |  2 +-
 arch/x86/entry/vdso/Makefile      |  3 +--
 arch/x86/kernel/Makefile          | 10 +++++-----
 arch/x86/lib/Makefile             |  2 +-
 arch/x86/mm/Makefile              |  4 ++--
 arch/x86/realmode/Makefile        |  2 +-
 arch/x86/realmode/rm/Makefile     |  2 +-
 scripts/Makefile.lib              |  4 ++--
 10 files changed, 27 insertions(+), 16 deletions(-)

-- 
2.24.0

