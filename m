Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A393B9B11
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Jul 2021 05:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234963AbhGBDc0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Jul 2021 23:32:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54114 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234957AbhGBDc0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Jul 2021 23:32:26 -0400
X-UUID: a8e0cdab0a1746ccbb52f710fd33de60-20210702
X-UUID: a8e0cdab0a1746ccbb52f710fd33de60-20210702
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1609371012; Fri, 02 Jul 2021 11:29:52 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 11:29:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Jul 2021 11:29:44 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <ndesaulniers@google.com>, <keescook@chromium.org>,
        <samitolvanen@google.com>, <linux-kbuild@vger.kernel.org>,
        <nathan@kernel.org>
CC:     <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH v3 0/2] Kbuild: lto: add make version checking for MODVERSIONS
Date:   Fri, 2 Jul 2021 11:29:41 +0800
Message-ID: <20210702032943.7865-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LTO with MODVERSIONS will fail in generating correct CRC because
the makefile rule doesn't work for make with version 3.8X.

Refer to [1]:
> When building modules(CONFIG_...=m), I found some of module versions
> are incorrect and set to 0.
> This can be found in build log for first clean build which shows

> WARNING: EXPORT symbol "XXXX" [drivers/XXX/XXX.ko] version generation failed,
> symbol will not be versioned.

> But in second build(incremental build), the WARNING disappeared and the
> module version becomes valid CRC and make someone who want to change
> modules without updating kernel image can't insert their modules.

> The problematic code is
> + $(foreach n, $(filter-out FORCE,$^),        \
> +   $(if $(wildcard $(n).symversions),      \
> +     ; cat $(n).symversions >> $@.symversions))

The issue is fixed when make version upgrading to 4.2.

Thus we need to check make version during selecting on LTO Kconfig.
Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
for arithmetic comparisons.

[1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>


----
v3:
- fix comment in make-version.sh

v2:
https://lore.kernel.org/lkml/20210701092841.1419-1-lecopzer.chen@mediatek.com/
- change MAKE_VERSION_INT to MAKE_VERSION
- remove $(make-version)
- tweak commit message

v1:
https://lore.kernel.org/lkml/20210630121436.19581-1-lecopzer.chen@mediatek.com/
----


Lecopzer Chen (2):
  Kbuild: lto: add CONFIG_MAKE_VERSION
  Kbuild: lto: add make version checking

 Makefile                |  2 +-
 arch/Kconfig            |  1 +
 init/Kconfig            |  4 ++++
 scripts/make-version.sh | 13 +++++++++++++
 4 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100755 scripts/make-version.sh

-- 
2.18.0

