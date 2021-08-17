Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA80C3EE5F7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 06:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhHQE4D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 00:56:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230272AbhHQE4C (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 00:56:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7AD7D60F5C;
        Tue, 17 Aug 2021 04:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629176130;
        bh=zlCG6TyqdnDAfWusRcSyF23uFUU7SsCl5cvLhJSJpKc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KcIO1Mdm6d59M7z/WSPAI7ewM15r5aeGwejgZggC7qIMDQAy9J9H4napExPxX0hiI
         MExJijv0G35sMLI59JiMSLlVIc58x3+RT8mSAWM06kXjtdbH7LxktdLxz3YtEOe/as
         l9ShwyMFc6qIBK1y/AtnX9zgNG6EosXk8YJeHZP5DG0K92/eSYpqO/dy5EG+GMDnI5
         tcvqL25yu535vVWGenjtDSGoPLpqb6AlNTHHtbDyqJ7t0jVWgnmWA228xMBBuV9So2
         HycG7kbdWapNKuF2KSrxLJK/LCq6LUMYOL8SjBujK/HcXYsmiNLrRS9PXrIqj3tSVs
         QIH8U7FCF1fbw==
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <20210817005624.1455428-1-nathan@kernel.org>
 <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
Date:   Mon, 16 Aug 2021 21:55:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/16/2021 9:37 PM, Linus Torvalds wrote:
> On Mon, Aug 16, 2021 at 6:20 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> Additionally, there should be some time for the CI systems to update
>> their clang-14 builds, as the recent 0day report shows.
> 
> What?
> 
> No, the 0day report shows that the patch is buggy, and that the
> 
>    ifeq ($(shell test $(CONFIG_CLANG_VERSION) -ge 140000; echo $$?),0)
> 
> clearly doesn't work at all, since the flag is enabled on those
> systems with old clang versions.
> 
> Alternatively, the test works, but the 140000 version is not enough.

So technically speaking, the 140000 is not enough at this very moment 
for the fact that there are certain systems that test with clang-14 
builds that do not have my clang patch in it yet; however, those systems 
do update clang regularly (the 0day version is just seven hours old at 
the time of writing this) so they will have a version that contains my 
patch shortly, making the check work just fine. We have done this in the 
past with checks that are gated on clang versions that are in 
development, with the expectation that if someone is using a development 
release of clang, they are keeping it up to date so that they get fixes 
that we push there; otherwise, it is just better to stick with the 
release branches.

> So no. This patch is simply completely wrong, and doesn't fix the
> problem with Clang's buggy -Wimplicit-fallthrough flag.

If you/Gustavo would prefer, I can upgrade that check to

ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)

I was just trying to save a call to the compiler, as that is more 
expensive than a shell test call.

Cheers,
Nathan
