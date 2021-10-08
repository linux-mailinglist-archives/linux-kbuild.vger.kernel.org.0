Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098834268A9
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Oct 2021 13:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240126AbhJHL1U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 8 Oct 2021 07:27:20 -0400
Received: from m12-17.163.com ([220.181.12.17]:39482 "EHLO m12-17.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240084AbhJHL1J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Oct 2021 07:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=5HVMS
        eqZsrmCC0TSlZDhftcpk/fS1mwC4NRf/YiHee8=; b=RfJGL1+0m15Dr70k4QY6l
        V1xKeqldshiDjynfah48JYD5WAkH65lD8RvF/jR8OLPal6gfk+3suwNqsh7EH9ia
        S0xe5jVOPztpEl8VEA/ayFzYwVmMN++zju8ZLbNMvPXjU19tkPa1prgSYhwFiHV1
        5OykwXcUgrJELQiZWsT26k=
Received: from localhost (unknown [49.235.41.28])
        by smtp13 (Coremail) with SMTP id EcCowACHsIR3KmBhHRbaQQ--.23614S2;
        Fri, 08 Oct 2021 19:24:39 +0800 (CST)
Date:   Fri, 8 Oct 2021 19:24:38 +0800
From:   Hui Su <suhui_kernel@163.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net,
        ndesaulniers@google.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: update the comments of kallsyms support
Message-ID: <20211008112438.GA1243425@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: EcCowACHsIR3KmBhHRbaQQ--.23614S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar45ZFW8Ar45XF1DurW7urg_yoW8JFWxpa
        9Yk3yDZF18GrykZw17Zr4j9ry2gFn5GrZ7XryDKF4jyF98Zw10v3sF9w47J3yDGrWxAF1x
        Xrn7XrZFga4DArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jVFALUUUUU=
X-Originating-IP: [49.235.41.28]
X-CM-SenderInfo: 5vxk3xhbnh20lho6il2tof0z/1tbiMxcmbVXl+eF6EQAAss
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

update the comments of kallsyms support

Signed-off-by: Hui Su <suhui_kernel@163.com>
---
 scripts/link-vmlinux.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d74cee5c4326..a98c4f045302 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -369,14 +369,14 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	# kallsyms support
 	# Generate section listing all symbols and add it into vmlinux
 	# It's a three step process:
-	# 1)  Link .tmp_vmlinux1 so it has all symbols and sections,
+	# 1)  Link .tmp_vmlinux.kallsyms1 so it has all symbols and sections,
 	#     but __kallsyms is empty.
 	#     Running kallsyms on that gives us .tmp_kallsyms1.o with
 	#     the right size
-	# 2)  Link .tmp_vmlinux2 so it now has a __kallsyms section of
+	# 2)  Link .tmp_vmlinux.kallsyms2 so it now has a __kallsyms section of
 	#     the right size, but due to the added section, some
 	#     addresses have shifted.
-	#     From here, we generate a correct .tmp_kallsyms2.o
+	#     From here, we generate a correct .tmp_vmlinux.kallsyms2.o
 	# 3)  That link may have expanded the kernel image enough that
 	#     more linker branch stubs / trampolines had to be added, which
 	#     introduces new names, which further expands kallsyms. Do another
-- 
2.25.1


