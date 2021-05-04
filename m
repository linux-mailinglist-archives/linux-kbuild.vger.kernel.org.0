Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFD13731A7
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 22:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbhEDUxv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 16:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhEDUxv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 16:53:51 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF7BC061574;
        Tue,  4 May 2021 13:52:55 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1le226-004AwV-RF; Tue, 04 May 2021 22:52:42 +0200
Message-ID: <58e4bd69c15fd0e0cf3de32e8ed53296d34c7e1e.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] kconfig: unify cc-option and as-option
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Changbin Du <changbin.du@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Tue, 04 May 2021 22:52:41 +0200
In-Reply-To: <CAK7LNASRSOBy_bqUvMqk-m8WVaHPfwM8xEbiTGtcB2B2-3GBhQ@mail.gmail.com>
References: <20200614144341.1077495-1-masahiroy@kernel.org>
         <20200614144341.1077495-2-masahiroy@kernel.org>
         <70868660127bd13dcc47e94108483ff15827378c.camel@sipsolutions.net>
         <CAK7LNASRSOBy_bqUvMqk-m8WVaHPfwM8xEbiTGtcB2B2-3GBhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2021-05-05 at 05:46 +0900, Masahiro Yamada wrote:
> 
>  - This commit touches scripts/Kconfig.include.
>  - External module builds (M= builds) never invoke Kconfig
> 
> Putting these two together, your claim is really odd.

Hmm.

> If external module builds invoke Kconfig,
> your kernel is already broken.

Well, it's not about the kernel, that's just the normal upstream (or
perhaps distribution) kernel.

Anyway, you're right, it's much simpler. The problem isn't invoking M=
or something like that, that happens much later and sent me on the
completely wrong track.

The problem is simply doing

	make kernelversion

to determine the version of a tree that's not writable to the user, e.g.

	make -C /lib/modules/$(uname -r)/build/ kernelversion

Which basically also means that it's harmless, since the version is of
course not affected by cc-option.

johannes

