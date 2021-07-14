Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F30C3C7E72
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 08:18:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237996AbhGNGU4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 02:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237948AbhGNGU4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 02:20:56 -0400
X-Greylist: delayed 343 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 13 Jul 2021 23:18:04 PDT
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7448C0613DD;
        Tue, 13 Jul 2021 23:18:04 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4GPnGT6q6QzQk3d;
        Wed, 14 Jul 2021 08:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-language:content-type
        :content-type:in-reply-to:mime-version:date:date:message-id:from
        :from:references:subject:subject:received; s=mail20150812; t=
        1626243134; bh=vlNTnkBfUB5MLj0/Iuk1a1zuTb4uLJWi+80vpr7Y25U=; b=R
        Lhs3LZRhXh9FAwv+bPmVnCvy+NoZ6BGWgYSK5lw7AaogYzHhcmA57/8cx7siZ6mv
        bEkCfee38c3vpk5wpkgcTyXLkp3sWU+Y7AVp9Qe9FakEH6TXVBzpYj5vA+ZZgKGa
        6wbrIJSZZ3Ck9weClx/mzg85t8Sl1h8ibD2B6gFWpo4qC/z31szMzo5CW27uJG/t
        TJOd7W74bUGK5XzfHnwiTgTU7sNWs7w1QALPBHvnSdReoGm6aTg6v1QlMNt8fRyA
        o0ZKV4tnNIhDxqw+wxCBM/eQN8VpR8fItbYfezbw+cYdtv2EJNxnLbqOGtXBPsyF
        lGZ2xjm6av6ESX3WHtTFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1626243135;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u8TFJMgWKOmcO+28hmJrz0iPOxBa0A3O0wrqY6cmBhI=;
        b=nh0LhA2SeJoAF51xRJ4T119QxB2StlkJheSWb5mnwp+IDGWzuNu+orKjmpyTgVWMEpF1BN
        +P4zCuksDimr/4k7dJpXIPCVYtxBtFe3/BqaxqhTCSqt5kSt0T4woc0XuEd31HlAd8t1bM
        lz8r+fRNGDIWPwJ5DPb1dF7jCqD+W+di9SnBX76mzucke6rm79K7puHQj2KwChfH+DD2i/
        HizRAQqjOs4u0NQYfgNUWuFTqRvBj+mSuNzSDopQIsdxR8txJC2umIFLO73KEd/4sJssr5
        kG5pDc5TCGaKE3gXF1SyKb0trCLCYIaVD9Dy9j3zfN56IdReLm3iY55KGM/qxw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id 2bGwqixyoJ1K; Wed, 14 Jul 2021 08:12:14 +0200 (CEST)
Subject: Re: [PATCH v2 1/1] Kbuild, clang: add option for choosing a ThinLTO
 cache directory
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>
References: <a6eea2c4-6d90-3ddf-33d6-973d1ae917e7@mailbox.org>
 <CAK7LNAT9oMkSthmCJ9sq3PFRcYgZoC6O0o==WQnKOU0znzT6hQ@mail.gmail.com>
From:   Tor Vic <torvic9@mailbox.org>
Message-ID: <bef18150-3f34-9739-5532-3a3533574fa4@mailbox.org>
Date:   Wed, 14 Jul 2021 06:12:07 +0000
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT9oMkSthmCJ9sq3PFRcYgZoC6O0o==WQnKOU0znzT6hQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -6.54 / 15.00 / 15.00
X-Rspamd-Queue-Id: ABB921847
X-Rspamd-UID: 981490
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 14.07.21 02:46, Masahiro Yamada wrote:
> On Wed, Jul 14, 2021 at 1:41 AM Tor Vic <torvic9@mailbox.org> wrote:
>>
>> On some distros and configurations, it might be useful to allow for
>> specifying a directory where Clang stores its ThinLTO cache.
>>
>> More specifically, when building the VirtualBox extramodules on Arch with
>> its proper 'makepkg' build system and DKMS, against an already installed
>> ThinLTO kernel, the build fails because it tries to create the ThinLTO
>> cache in a directory that is not user-writable.
> 
> 
> Again, I do not understand.

Example:
1. build and install a kernel+headers with Arch's own makepkg/pacman tools.
2. at the end of the install, dkms is automatically called to rebuild
any out-of-tree modules like e.g. VirtualBox.
3. dkms fails because it tries to store the thinlto cache in a
directory that it not user-writable (very possibly in the installed
kernel headers directory under /usr/lib).
4. By explicitly selecting a place for the cache, e.g. /tmp, the dkms
module rebuild succeeds.

> 
> Is this fixing the root cause?

If only I knew. I have very limited skills, and no IT or coding
background. It's possible that this can be fixed also on dkms but
I'm not sure.
Currently, dkms does not do a compiler check (it only seems to know
gcc) and it will fail unless explicitly told to use clang. e.g.
by specifying 'CC=clang LD=ld.lld" etc.
This has been reported to them.

> 
> To me, it looks like
> "Anyway, this worked for me" patch.

At least one other person reported success by moving the cache to
another place (see link).
Admittedly, it looks the same way to me, I just wanted to get things
to work and it's likely that there are better solutions to this
problem, but AFAIR no one came forward.

> 
> Besides, 'make clean' will never clean up the
> cache directory.

I can have a look at it again.

> 
> 
> 
> 
> 
>> A similar problem has been reported with openSUSE's OBS build system.
>>
>> Add a Kconfig option that allows users to choose a directory in which
>> Clang's ThinLTO can store its cache.
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1104
>> Signed-off-by: Tor Vic <torvic9@mailbox.org>
>> ---
>> Changes from v1 to v2: remove unneeded changes in scripts/Makefile
>>
>>  Makefile     |  5 +++--
>>  arch/Kconfig | 10 ++++++++++
>>  2 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index c3f9bd191b89..472bc8bfff03 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -932,7 +932,8 @@ endif
>>  ifdef CONFIG_LTO_CLANG
>>  ifdef CONFIG_LTO_CLANG_THIN
>>  CC_FLAGS_LTO   := -flto=thin -fsplit-lto-unit
>> -KBUILD_LDFLAGS += --thinlto-cache-dir=$(extmod_prefix).thinlto-cache
>> +export thinlto-dir = $(if
>> $(CONFIG_LTO_CLANG_THIN_CACHEDIR),$(CONFIG_LTO_CLANG_THIN_CACHEDIR)/)
>> +KBUILD_LDFLAGS +=
>> --thinlto-cache-dir=$(thinlto-dir)$(extmod_prefix).thinlto-cache
>>  else
>>  CC_FLAGS_LTO   := -flto
>>  endif
>> @@ -1728,7 +1729,7 @@ PHONY += compile_commands.json
>>
>>  clean-dirs := $(KBUILD_EXTMOD)
>>  clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
>> $(KBUILD_EXTMOD)/modules.nsdeps \
>> -       $(KBUILD_EXTMOD)/compile_commands.json $(KBUILD_EXTMOD)/.thinlto-cache
>> +       $(KBUILD_EXTMOD)/compile_commands.json
>> $(thinlto-dir)$(KBUILD_EXTMOD)/.thinlto-cache
>>
>>  PHONY += help
>>  help:
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index 129df498a8e1..19e4d140e12a 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -696,6 +696,16 @@ config LTO_CLANG_THIN
>>             https://clang.llvm.org/docs/ThinLTO.html
>>
>>           If unsure, say Y.
>> +
>> +config LTO_CLANG_THIN_CACHEDIR
>> +       string "Clang ThinLTO cache directory"
>> +       depends on LTO_CLANG_THIN
>> +       default ""
>> +       help
>> +         This option allows users to choose a directory that stores
>> +         Clang's ThinLTO cache.
>> +         Leave empty for default.
>> +
>>  endchoice
>>
>>  config ARCH_SUPPORTS_CFI_CLANG
>> --
>> 2.32.0
>>
> 
> 
