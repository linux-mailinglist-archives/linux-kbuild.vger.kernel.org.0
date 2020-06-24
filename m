Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF839207361
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 14:34:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403795AbgFXMeH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 08:34:07 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38534 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388761AbgFXMeF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:34:05 -0400
Received: by mail-qt1-f196.google.com with SMTP id z2so1484338qts.5;
        Wed, 24 Jun 2020 05:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r8hAW61/4BUI+NbyFnYc6YqQQjo8d8HK1rSbMU2IkRk=;
        b=DiHfLU1fxBkDc320X8WPOpj7EmmwPUe3YGc4AtX0OQamNzH0GcM46K/GgOMUDGI40v
         +n/Bzqnl9GIeLlEL2nRP0FcjBR0Fif0m1FFpNcw2z0D0rFChPGGfGMQ46LYSfneGsRAL
         janHdWU72hVTr5oVG2FMytgKIIw3/+EiwCBjkRmDzxdfGWMbVXbKqLbTmyEPJL8MQAJn
         AkoSDxxLaOD1216aiODskcCiqRgy0vDSxSwjO5zJjuFSKOEqD7wuEAjsZeAsCJJzS4XP
         jeOlxiLdHTg2nabm3DH/PLRDqZqU7p0Jx+bU3okMJT3aTrbaM/fz8x1C4ZLBpnPLaMzz
         +2Cw==
X-Gm-Message-State: AOAM530c9J7LJ1p0706DAI/qzVQb6vsTyUNRSbHt8HRe0JgGqdG9UCJN
        Eu/36Nk6yzp/hfdHNBjnFbc=
X-Google-Smtp-Source: ABdhPJxPh8KCe1nlxIC9hfI7A611S0zDh6pUHr/hn9DXDH26nDPy4DCeItaOwQUW8SJpgZNlzgTiJw==
X-Received: by 2002:aed:25a2:: with SMTP id x31mr24822436qtc.96.1593002044717;
        Wed, 24 Jun 2020 05:34:04 -0700 (PDT)
Received: from localhost.localdomain ([185.248.161.177])
        by smtp.gmail.com with ESMTPSA id x26sm3354512qtr.4.2020.06.24.05.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 05:34:04 -0700 (PDT)
From:   Alexander Popov <alex.popov@linux.com>
To:     Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Alexander Popov <alex.popov@linux.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org
Cc:     notify@kernel.org
Subject: [PATCH v2 1/5] gcc-plugins/stackleak: Don't instrument itself
Date:   Wed, 24 Jun 2020 15:33:26 +0300
Message-Id: <20200624123330.83226-2-alex.popov@linux.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200624123330.83226-1-alex.popov@linux.com>
References: <20200624123330.83226-1-alex.popov@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no need to try instrumenting functions in kernel/stackleak.c.
Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
is disabled.

Signed-off-by: Alexander Popov <alex.popov@linux.com>
Acked-by: Kees Cook <keescook@chromium.org>
---
 kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/Makefile b/kernel/Makefile
index f3218bc5ec69..155b5380500a 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -125,6 +125,7 @@ obj-$(CONFIG_WATCH_QUEUE) += watch_queue.o
 
 obj-$(CONFIG_SYSCTL_KUNIT_TEST) += sysctl-test.o
 
+CFLAGS_stackleak.o += $(DISABLE_STACKLEAK_PLUGIN)
 obj-$(CONFIG_GCC_PLUGIN_STACKLEAK) += stackleak.o
 KASAN_SANITIZE_stackleak.o := n
 KCSAN_SANITIZE_stackleak.o := n
-- 
2.25.4

