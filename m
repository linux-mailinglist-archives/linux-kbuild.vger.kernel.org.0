Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763FC47D460
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Dec 2021 16:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235736AbhLVPtv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Dec 2021 10:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241525AbhLVPtu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Dec 2021 10:49:50 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A11C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 07:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=/+kIYMglsJl/FwZjHdEx/6c4AhNi7/Hrh2QKPZ9ZKzk=; b=HtVhgiNqZS4HsJXVDdLma0VFQ0
        hmwOKUHXBTQn+T1E+sneW3iQdnOzJmZ+Pzpy+p+zGetoWWP3HzfucSGZOgyJkDsUKVuv3QVUebTtY
        LQjF0PMS5fkiCec01CeH8fj8ARUO/HySWIn67rX59ZGNLlCuwLz/vIDhpmKn7LbhajvkXn6LhJbUu
        AYfpt2qXYR+g1lam3f74qT1FKjRU/5Sz5SiZygSOfxOEgQZqP9RTt0kbYW/jBKP2HCyXv/SjskVi3
        eY3lo1CzYjdqzAkhLI44RnMg4wC4FCLTKVY35gRtbQFZLkRgD2z8oTEo+Ku/V37jwyNdqdM83dtd8
        +ByP4vxg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n03s3-003Ugy-5z; Wed, 22 Dec 2021 15:49:39 +0000
Message-ID: <d96ded7a-f584-db38-4170-c991b772a136@infradead.org>
Date:   Wed, 22 Dec 2021 07:49:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RFC kbuild] lib/crypto: blake2s: include as built-in
Content-Language: en-US
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        yamada.masahiro@socionext.com, ardb@kernel.org,
        linux-kbuild@vger.kernel.org
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211222143628.618436-1-Jason@zx2c4.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20211222143628.618436-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 12/22/21 06:36, Jason A. Donenfeld wrote:
> In preparation for using blake2s in the RNG, we change the way that it
> is wired-in to the build system. Instead of kconfig mazes and ifdefs, we
> use weak symbols, so that an arch version can override the generic
> version. Then we include the generic version in lib-y, so that it can be
> removed from the image if the arch version doesn't fallback to it (as is
> the case on arm though not x86). The result should be a bit simpler and
> smaller than the code it replaces.
> 
> Discussed-with: Ard Biesheuvel <ardb@kernel.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Hi Masahiro,
> 
> This is a commit I'm working on as part of a change to the RNG, which
> got broken out into something standalone because it wound up being a bit
> more involved than originally conceived. With Ard's help, this is using
> weak symbols with the generic code in lib-y, but the only way we figured
> to actually include the lib.a file was via this unseemly
> KBUILD_VMLINUX_LIBS line below, which doesn't seem very okay. I tried
> adding `libs-y += lib/crypto/` to lib/Makefile, but it seemed like the
> build system ignored it. I figure there's probably a right way to do
> this, so thought I should send you this RFC to look at first.

If lib-y ignores (drops) an object file (usually because it is not used),
the usual way to force it to be included is to add it to obj-y instead
of lib-y (see many examples in lib/Makefile).

However, this may cause problems with weak symbols. I don't recall it being
used in that scenario.


> Alternatively, if the KBUILD_VMLINUX_LIBS trick is somehow okay, that'd
> be useful to know too.
> 
> Thanks,
> Jason


-- 
~Randy
