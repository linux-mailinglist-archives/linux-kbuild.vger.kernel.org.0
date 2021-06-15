Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476303A7711
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Jun 2021 08:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhFOG3I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Jun 2021 02:29:08 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:53390 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229968AbhFOG3I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Jun 2021 02:29:08 -0400
X-UUID: eec2f9026ec84ccfb2496baa8727fbfe-20210615
X-UUID: eec2f9026ec84ccfb2496baa8727fbfe-20210615
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1795548193; Tue, 15 Jun 2021 14:27:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 14:26:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 14:26:58 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>
CC:     <clang-built-linux@googlegroups.com>, <lecopzer.chen@mediatek.com>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <nathan@kernel.org>, <ndesaulniers@google.com>,
        <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] kbuild: lto: fix module versionings mismatch in incremental build
Date:   Tue, 15 Jun 2021 14:26:58 +0800
Message-ID: <20210615062658.21633-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202106141554.A2D26986A@keescook>
References: <202106141554.A2D26986A@keescook>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Mon, Jun 14, 2021 at 01:51:09PM +0800, Lecopzer Chen wrote:
> > When building modules(CONFIG_...=m), I found some of module versions
> > are incorrect and set to 0.
> > This can be found in build log for first clean build which shows
> > 
> > WARNING: EXPORT symbol "XXXX" [drivers/XXX/XXX.ko] version generation failed, symbol will not be versioned.
> 
> I'm doing this, and I don't see the problem:
> 
> $ make LLVM=1 LLVM_IAS=1 distclean
> $ make LLVM=1 LLVM_IAS=1 menuconfig
> 	*enable LTO*
> 	*enable a module*
> $ make LLVM=1 LLVM_IAS=1 -j...
> 
> What series of commands (and .config) shows this for you?

Hi Kees,

Thanks for you checking.

After double checking in clean android kernel build, this causes by
make version.
(I have build failed in Linux LTO,
seems it's not well support in contract to android?)

I knew Google has LTO first in Android and upstream later, and most code
are same as upstream, so the env here I use Android common kernel for
easily testing.


Test env is android common kernel: android12-5.4 [1] with its latest code
and it builds from build.sh[2]

$ BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh
+ make O=.... LLVM=1 LLVM_IAS=1 DEPMOD=depmod -j12 Image modules Image.lz4

With make set to v3.81, this can be reproduced with CONFIG_TEE=m.
With version >= 4.2 this is not reproducible.


Our build env default set make to v3.81, although Android uses hermetic build
and v4.3 now, but Linux doesn't have such things.

Maybe we can add build time checking or comment before CFI module versioning
build rules to avoid anyone struggling with this again:).

[1] https://android.googlesource.com/kernel/common/+/refs/heads/android12-5.4
[2] https://android.googlesource.com/kernel/build/+/refs/heads/master

thanks,
Lecopzer


