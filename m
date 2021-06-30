Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837853B81D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jun 2021 14:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhF3MRZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Jun 2021 08:17:25 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:48706 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234376AbhF3MRZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Jun 2021 08:17:25 -0400
X-UUID: 9d6fbbcc74bf4ff4af69faa03283266a-20210630
X-UUID: 9d6fbbcc74bf4ff4af69faa03283266a-20210630
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 529085922; Wed, 30 Jun 2021 20:14:51 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 20:14:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 20:14:50 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>, <samitolvanen@google.com>,
        <linux-kbuild@vger.kernel.org>
CC:     <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <yj.chiang@mediatek.com>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        Lecopzer Chen <lecopzer.chen@mediatek.com>
Subject: [PATCH 0/2] Kbuild: lto: add make version checking
Date:   Wed, 30 Jun 2021 20:14:34 +0800
Message-ID: <20210630121436.19581-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LTO with MODVERSION will fail in generating correct CRC because
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

The issue fixed when make version upgrading to 4.2.

Thus we need to check make version during selecting on LTO Kconfig.
The MAKE_VERSION_INT means MAKE_VERSION in canonical digits integer and
implemnted by imitating CLANG_VERSION.

[1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Lecopzer Chen (2):
  Kbuild: lto: add make-version macros
  Kbuild: lto: add make version checking

 Makefile                |  2 +-
 arch/Kconfig            |  1 +
 init/Kconfig            |  4 ++++
 scripts/Kconfig.include |  3 +++
 scripts/make-version.sh | 13 +++++++++++++
 5 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100755 scripts/make-version.sh

-- 
2.18.0

