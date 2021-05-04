Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75127373149
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 22:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhEDUSo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 16:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbhEDUSn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 16:18:43 -0400
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916D0C061574;
        Tue,  4 May 2021 13:17:48 -0700 (PDT)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <johannes@sipsolutions.net>)
        id 1le1U4-004AHK-M9; Tue, 04 May 2021 22:17:32 +0200
Message-ID: <70868660127bd13dcc47e94108483ff15827378c.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] kconfig: unify cc-option and as-option
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Changbin Du <changbin.du@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 04 May 2021 22:17:30 +0200
In-Reply-To: <20200614144341.1077495-2-masahiroy@kernel.org>
References: <20200614144341.1077495-1-masahiroy@kernel.org>
         <20200614144341.1077495-2-masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

So... I realized it's been a while:

On Sun, 2020-06-14 at 23:43 +0900, Masahiro Yamada wrote:
> cc-option and as-option are almost the same; both pass the flag to
> $(CC). The main difference is the cc-option stops before the assemble
> stage (-S option) whereas as-option stops after it (-c option).
> 

But, I had noticed for a while now that M= build for an out-of-tree
driver were causing some trouble. Not really completely "out-of-tree"
but rather backported (https://backports.wiki.kernel.org/).

And then I finally narrowed it down to this commit, specifically this:

>  # Return y if the compiler supports <flag>, n otherwise
> -cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /dev/null)
> +cc-option = $(success,mkdir .tmp_$$$$; trap "rm -rf .tmp_$$$$" EXIT; $(CC) -Werror $(CLANG_FLAGS) $(1) -c -x c /dev/null -o .tmp_$$$$/tmp.o)

What happens is that we're doing

 make -C /path/to/kernel M=/path/to/driver

But /path/to/kernel may be the installed distro kernel headers, and thus
not be writable to the user doing the driver compile. Obviously, the
user may need to 'sudo' anyway to install the result, but if just test-
compiling, or even as better practice to not run everything as root,
this ".tmp_$$" dir cannot be created.

IOW, this broke compiler option detection when KBUILD_EXTMOD=/M= is
used. It seems this is still supported (documented in kbuild docs), so
I'm kind of hoping it could be fixed? But OTOH, I really don't know how,
perhaps just using "mktemp -d" here instead of the hardcoded temp dir?

Thanks,
johannes

