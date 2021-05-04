Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107FA3731C3
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 23:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232493AbhEDVJr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 17:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhEDVJq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 17:09:46 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42998C061574;
        Tue,  4 May 2021 14:08:51 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1le2Hb-004BDH-7z; Tue, 04 May 2021 23:08:43 +0200
Message-ID: <29f3d9e96548574284827b65c63cb2bd142df9c6.camel@sipsolutions.net>
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
Date:   Tue, 04 May 2021 23:08:42 +0200
In-Reply-To: <CAK7LNAROdVMPQq4Qn_M=OWzJrfqNOc4fyMicNKdnCqu7G9rFgw@mail.gmail.com>
References: <20200614144341.1077495-1-masahiroy@kernel.org>
         <20200614144341.1077495-2-masahiroy@kernel.org>
         <70868660127bd13dcc47e94108483ff15827378c.camel@sipsolutions.net>
         <CAK7LNASRSOBy_bqUvMqk-m8WVaHPfwM8xEbiTGtcB2B2-3GBhQ@mail.gmail.com>
         <58e4bd69c15fd0e0cf3de32e8ed53296d34c7e1e.camel@sipsolutions.net>
         <CAK7LNAROdVMPQq4Qn_M=OWzJrfqNOc4fyMicNKdnCqu7G9rFgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2021-05-05 at 06:05 +0900, Masahiro Yamada wrote:
> 
> It was fixed.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=805b2e1d427aab4bb27fa7c51ebb9db7547551b1
> 

Ah, ok, great.

> 
> 
> If you want to make it work without that commit,
> 
>    make -C /lib/modules/$(uname -r)/build/ kernelversion M=/tmp
> 
> will work.

I guess that works. I was just going to ignore the errors now that I
realized what it was :)

Thanks!

johannes

