Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0187D3A5F60
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 11:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbhFNJv4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 05:51:56 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:45486 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232658AbhFNJvz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 05:51:55 -0400
X-UUID: 0c74c225e2fe454b810425872e916ca6-20210614
X-UUID: 0c74c225e2fe454b810425872e916ca6-20210614
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 7990773; Mon, 14 Jun 2021 17:49:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 17:49:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Jun 2021 17:49:48 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <lecopzer.chen@mediatek.com>
CC:     <clang-built-linux@googlegroups.com>, <keescook@chromium.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <nathan@kernel.org>, <ndesaulniers@google.com>,
        <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: RE: [PATCH] kbuild: lto: fix module versionings mismatch in incremental build
Date:   Mon, 14 Jun 2021 17:49:48 +0800
Message-ID: <20210614094948.30023-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210614055109.28774-1-lecopzer.chen@mediatek.com>
References: <20210614055109.28774-1-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Andy Lavr <andy.lavr@gmail.com> point out there is a build failed for

M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifog84.o

make[6]: /bin/sh: Argument list too long

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

make[6]: *** [/scripts/Makefile.build:463: 
drivers/gpu/drm/amd/amdgpu/amdgpu.o] Error 127
make[5]: *** [/scripts/Makefile.build:529: drivers/gpu/drm/amd/amdgpu] 
Error 2
make[5]: *** Waiting for unfinished jobs....
   CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/fifo/gpfifogf100.o


I'll fix it in patch v2.

thanks Andy

Lecopzer
