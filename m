Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B662748A0
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 20:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgIVSyg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Sep 2020 14:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgIVSyg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Sep 2020 14:54:36 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1057C061755;
        Tue, 22 Sep 2020 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=blIyqqgTJtskVwRezLM/PzcHrdM1mNHlZ4dbdp1FBAA=; b=m4jM/3lgM+Mrw9FzqMaV3g/QZH
        N18GMuJZHbBgVHWgWh9jFI1gHWU1kHFewiHuIQo+1su3U4eI5qkQs9+6ZLdkyV3GxxMG2xo9dipgp
        DowGYMIeZYDl95rw/8R9Z/pUUjt9zcl0I5dyJP4cgCZOFzzc2EUAb5TjuHFVJHPA+0vbicRsatDvt
        xyheP0c/fv7FJJHk4fRK4smW5va8x3L5tZIESXvF5C17ggPd3lcYbJUoaRfiQWjIabfOadT3m8S1C
        cYFENTmDHGVHh6IOVUAMewfIkDMsmSkYvycnWclHwAvqRifv+Yp065gwlO1SYgKFgv5hVSLqbnX3B
        6Ns+y/4w==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKnQv-0007Sz-Fs; Tue, 22 Sep 2020 18:54:33 +0000
Subject: Re: [PATCH 0/1] Add explicit error for missing CONFIG_ASN1
To:     James Bottomley <James.Bottomley@HansenPartnership.com>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dfae4d4f-aa96-674d-93b1-d4c097e720e4@infradead.org>
Date:   Tue, 22 Sep 2020 11:54:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/22/20 8:53 AM, James Bottomley wrote:
> I recently ran into this as an error from 0day.  On x86 it's pretty
> much impossible to build a configuration where CONFIG_ASN1 isn't set,
> so you rarely notice a problem using the ASN.1 compiler because
> something else has selected it.  However, this compiler is never built
> if CONFIG_ASN1 isn't set and the error you get from kbuild is
> particularly unhelpful:
> 
>    make[4]: *** No rule to make target 'security/keys/trusted-keys/tpm2key.asn1.o', needed by 'security/keys/trusted-keys/built-in.a'.
>    make[4]: *** [scripts/Makefile.build:283: security/keys/trusted-keys/trusted_tpm2.o] Error 1
>    make[4]: Target '__build' not remade because of errors.
> 
> This patch changes the above error to the much easier to diagnose:
> 
>    scripts/Makefile.build:387: *** CONFIG_ASN1 must be defined for the asn1_compiler.  Stop.
>    make[3]: *** [scripts/Makefile.build:505: security/keys/trusted-keys] Error 2
> 
> James
> 
> ---
> 
> James Bottomley (1):
>   Makefile.build: Add an explicit error for missing ASN.1 compiler
> 
>  scripts/Makefile.build | 5 +++++
>  1 file changed, 5 insertions(+)

Is there a missing
	select ASN1
somewhere?


-- 
~Randy

