Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69233AA8D3
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 03:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbhFQCBH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Jun 2021 22:01:07 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40286 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229951AbhFQCBH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jun 2021 22:01:07 -0400
X-UUID: b889ef0790d8420989e32647fe327073-20210617
X-UUID: b889ef0790d8420989e32647fe327073-20210617
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 365747547; Thu, 17 Jun 2021 09:58:56 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 09:58:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Jun 2021 09:58:55 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>
CC:     <clang-built-linux@googlegroups.com>, <lecopzer.chen@mediatek.com>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <nathan@kernel.org>, <ndesaulniers@google.com>,
        <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] kbuild: lto: fix module versionings mismatch in incremental build
Date:   Thu, 17 Jun 2021 09:58:55 +0800
Message-ID: <20210617015855.6098-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202106160942.A89674E54@keescook>
References: <202106160942.A89674E54@keescook>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Wed, Jun 16, 2021 at 04:02:52PM +0800, Lecopzer Chen wrote:
> > Yes, We can imitate how CLANG_VERSION was implemented in Kconfig.
> > 
> > Accroding to GNU make release page[1], I've only tested for 3.81,
> > 4.2 and 4.3.
> > 4.2 was released in 2016, I think it's fine for LTO lowest version.
> 
> Okay, sounds good. Are you able to build a patch for this?
> 
> Thanks for figuring it out!
> 

Okay, I'll send a patch in a couple of weeks.

Thanks,
Lecopzer
