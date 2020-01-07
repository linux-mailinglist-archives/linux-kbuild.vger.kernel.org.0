Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6611334EA
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jan 2020 22:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgAGVcF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jan 2020 16:32:05 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:52919 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgAGVcE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jan 2020 16:32:04 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MryCb-1jRWuS0SDV-00nw7r; Tue, 07 Jan 2020 22:31:29 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] x86: orc: fix unused-function warning
Date:   Tue,  7 Jan 2020 22:31:20 +0100
Message-Id: <20200107213127.209139-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XOliWfarmDdbXwOaX1cryXLanvy/Ux9O/pAvX/PsYzyLh/YhekX
 0sdfbcoHMf3m7sQj66aLv5lggIX2YMEEy+7zP5aCm/tOBl9pdz1SNKTLNP2Dui24NRmPpK2
 RU0MxkbUAehWuziErddaKeUlbl5nMp6UPzaiEd/zQmkfNp1cfs6pu+GJyukt4E6Ywa92F70
 awHWEeVxBPSJsek9fvBqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kZj9Nx193zs=:l0CPDOzFFkf3BIxQnkgcY5
 oOIMt9bCH9EnzVSc+sV38WRJ3ESdn1wapQA+LBJ0pxQlu49YmWMslf9WVV23fDp/VzPmLMYXF
 O2g8Q9Wl77JVINvy2+TyhVQpuwkIadZ+j2BQAuixGwswutfKOJFEuojhT3krnY6FUJUz91TEY
 KzIqHCF891u3mC5OJjBfnFt10iYZMpRrrcmzoh8WFsERQ97RWiJCWYFOJ5KmnZzevrJ3m1/2Y
 j2jT/4nvSloHcHksI5Fkxi1fwtznzI+w8OuX/J40SLruT1HF/FLCHLGpUyJCpS5YfsKfsgV4n
 W/y8Z3C3xSxIRYleEwuX8+Ei4bhjisqe4HVZNN1uvvj68eigPePCLVMwpAa1PL4NM1O66Ro1V
 HAp+uHzKxcAGyaLpNX6jcgkyXEmTzTpXovoSZ8P4vlRTaGdfLF5YgK6JCRxYFk5Sj2UCYQUl2
 3mavlJgR0lrllI0AfUGKQsVwF6CP1bWY0/BUHp7A04R5/l6BiEt1A30PLFH8LH+mIijCUQ+EK
 eam2cRFuDmoKQngmN2zpN86lpE5496UkwAnX5vhIfAzQxj6WS/95kptMRKLjfa2LbvPcpLUK8
 JM73VjnNxaGbJAojt1zzmSxh/9j6F3j3iZL/CU2mkkH/5df9n0BOuQ18wrIoDfXk3kSypARAk
 Nw/wFKAJJP5Y6UeCIKrApDCkEwqS8C9xOQ3I6xyPXZu4k0L6t6W8Zv4pdCLct/wSHM6b/wJOf
 V9jOXWeRLPuqVJ8vPYYgbzrxIrYyMMiimnV72Ft3bJsUjqBEWCZoNwh8gBlQEsBe9gfqsRVp2
 CObKuxpLvKtK04juyXQ1XKZWh+wvg3g0claAWO0sL/WPbJXpCLonrfsZVDx2GfYpkrwp4YO4y
 7OpbdLhLQzXW2QFw8ERw==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The orc unwinder contains a new warning:

arch/x86/kernel/unwind_orc.c:210:12: error: 'orc_sort_cmp' defined but not used [-Werror=unused-function]
 static int orc_sort_cmp(const void *_a, const void *_b)
            ^~~~~~~~~~~~
arch/x86/kernel/unwind_orc.c:190:13: error: 'orc_sort_swap' defined but not used [-Werror=unused-function]
 static void orc_sort_swap(void *_a, void *_b, int size)
             ^~~~~~~~~~~~~

Move the #ifdef to hide the now unused functions.

Fixes: f14bf6a350df ("x86/unwind/orc: Remove boot-time ORC unwind tables sorting")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/kernel/unwind_orc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index abdf8911a1fb..538152cca46b 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -187,6 +187,7 @@ static struct orc_entry *orc_find(unsigned long ip)
 	return orc_ftrace_find(ip);
 }
 
+#ifdef CONFIG_MODULES
 static void orc_sort_swap(void *_a, void *_b, int size)
 {
 	struct orc_entry *orc_a, *orc_b;
@@ -229,7 +230,6 @@ static int orc_sort_cmp(const void *_a, const void *_b)
 	return orc_a->sp_reg == ORC_REG_UNDEFINED && !orc_a->end ? -1 : 1;
 }
 
-#ifdef CONFIG_MODULES
 void unwind_module_init(struct module *mod, void *_orc_ip, size_t orc_ip_size,
 			void *_orc, size_t orc_size)
 {
-- 
2.20.0

