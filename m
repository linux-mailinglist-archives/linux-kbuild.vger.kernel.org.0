Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48C843A94B8
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jun 2021 10:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhFPII3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Jun 2021 04:08:29 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:43266 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231195AbhFPII3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jun 2021 04:08:29 -0400
X-UUID: 26ae6738386344e88258b709a2c20f1c-20210616
X-UUID: 26ae6738386344e88258b709a2c20f1c-20210616
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <lecopzer.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1960171326; Wed, 16 Jun 2021 16:02:54 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 16:02:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 16:02:52 +0800
From:   Lecopzer Chen <lecopzer.chen@mediatek.com>
To:     <keescook@chromium.org>
CC:     <clang-built-linux@googlegroups.com>, <lecopzer.chen@mediatek.com>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <nathan@kernel.org>, <ndesaulniers@google.com>,
        <samitolvanen@google.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] kbuild: lto: fix module versionings mismatch in incremental build
Date:   Wed, 16 Jun 2021 16:02:52 +0800
Message-ID: <20210616080252.32046-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <202106150821.B4D3E02@keescook>
References: <202106150821.B4D3E02@keescook>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Tue, Jun 15, 2021 at 02:26:58PM +0800, Lecopzer Chen wrote:
> > > On Mon, Jun 14, 2021 at 01:51:09PM +0800, Lecopzer Chen wrote:
> > > > When building modules(CONFIG_...=m), I found some of module versions
> > > > are incorrect and set to 0.
> > > > This can be found in build log for first clean build which shows
> > > > 
> > > > WARNING: EXPORT symbol "XXXX" [drivers/XXX/XXX.ko] version generation failed, symbol will not be versioned.
> > > 
> > > I'm doing this, and I don't see the problem:
> > > 
> > > $ make LLVM=1 LLVM_IAS=1 distclean
> > > $ make LLVM=1 LLVM_IAS=1 menuconfig
> > > 	*enable LTO*
> > > 	*enable a module*
> > > $ make LLVM=1 LLVM_IAS=1 -j...
> > > 
> > > What series of commands (and .config) shows this for you?
> > 
> > Hi Kees,
> > 
> > Thanks for you checking.
> > 
> > After double checking in clean android kernel build, this causes by
> > make version.
> > (I have build failed in Linux LTO,
> > seems it's not well support in contract to android?)
> > 
> > I knew Google has LTO first in Android and upstream later, and most code
> > are same as upstream, so the env here I use Android common kernel for
> > easily testing.
> > 
> > 
> > Test env is android common kernel: android12-5.4 [1] with its latest code
> > and it builds from build.sh[2]
> > 
> > $ BUILD_CONFIG=common/build.config.gki.aarch64 build/build.sh
> > + make O=.... LLVM=1 LLVM_IAS=1 DEPMOD=depmod -j12 Image modules Image.lz4
> > 
> > With make set to v3.81, this can be reproduced with CONFIG_TEE=m.
> > With version >= 4.2 this is not reproducible.
> 
> Ah, very interesting. While there are tests in Makefile for
> MAKE_VERSION, if we want to do this, it should likely be extended to
> Kconfig, as that's where the initial version tests for things happen. We
> could require MAKE_VERSION >= 4.2 for LTO?
> 
> -Kees
 
Yes, We can imitate how CLANG_VERSION was implemented in Kconfig.

Accroding to GNU make release page[1], I've only tested for 3.81,
4.2 and 4.3.
4.2 was released in 2016, I think it's fine for LTO lowest version.


[1] https://ftp.gnu.org/gnu/make/


thanks,
Lecopzer



