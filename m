Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3803A28BFEA
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 20:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgJLSmv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 14:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgJLSmv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 14:42:51 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1199FC0613D0;
        Mon, 12 Oct 2020 11:42:51 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n9so15194511pgf.9;
        Mon, 12 Oct 2020 11:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c68FH0ayGziDihZ9IYbZBNMjx/y2IsXlW9Ldybbm4jU=;
        b=ie6zixgXJeTa6LHBerbXDBYBBNXGY2lUgcJxg3YweIzpWPNzPLKMhG+gD+ewRcglrM
         Sjvtw/TFUr2XUNjqd6rgulNzpTG226xhPwQ57kxnnMeyvscqWT523AIK9kYUDgIqkYj9
         k4ONBw4T1knBe+YoImKNG3lUzqrUrEeXO7C/dlyWjk1AS4OUR6xnKieDS3an+omlvd+x
         uFIiDJqWi4gKKoIWde0kfX1sqZqidYDU/WV9tn7EdCFLb00DXf3P/vPaotpMdZE+G9sC
         u/AqAL/+oTVh/3LdoRX8VFkB/hJP1UuenBgwYAyKYM6Q/XBCf2DsBKZSXL8V02RmP6tM
         elcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c68FH0ayGziDihZ9IYbZBNMjx/y2IsXlW9Ldybbm4jU=;
        b=TSdV4961faCBu/AzzNK0oJwJpD2BqEgrLjB9IKvglZNPhgc0xl6WC+YCFfMO2UwsMD
         een67Jbeh2hd/Qt73cauahrDyY5Rk8U8dmeWqk/iH8Ekswe5BSdyGHLgMlYshv4q57S7
         rVAENFspWlr9YSz98qT7xQKOAXkG5KRl2tg/RWEG1D+QtJUU20wpFqqc8Opz0wcKFR1C
         KZrvon7NcNNXWKOADfGxx85bkwzcfTXPYVeHPsrgB6YWu+VSYMKjFtkymXy0uIBPn4S1
         02N8IW5xXfVh77ra1TtJYJ3wCzGvTUl+v0+b5qFeQkh8ltD6CZNECBOyoQ8x76H6nTd0
         z2dQ==
X-Gm-Message-State: AOAM5331QDeilCn3QaaDJitj+pXU0aRtxQ2lLevE3JGDQKuK19swH9YX
        +ra6+UB2pNsqONl4xmcEjkw=
X-Google-Smtp-Source: ABdhPJxUl9gci4/N41y7sONJDgGFBjycbw30Mwd3jwVk5l13YuKgeIkuPnhxJyNVL46QE57cXsBv2w==
X-Received: by 2002:a17:90a:b64:: with SMTP id 91mr21130861pjq.93.1602528170431;
        Mon, 12 Oct 2020 11:42:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
        by smtp.gmail.com with ESMTPSA id f1sm19566915pfe.145.2020.10.12.11.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 11:42:49 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] kbuild: use interpreters to invoke scripts
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
 <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010122019410.17866@felia>
From:   Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
Date:   Tue, 13 Oct 2020 00:12:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010122019410.17866@felia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12/10/20 11:50 pm, Lukas Bulwahn wrote:
> 
> 
> On Mon, 12 Oct 2020, Ujjwal Kumar wrote:
> 
>> We cannot rely on execute bits to be set on files in the repository.
>> The build script should use the explicit interpreter when invoking any
>> script from the repository.
>>
>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>>
>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>> Suggested-by: Kees Cook <keescook@chromium.org>
>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>> ---
>>  Makefile                          | 4 ++--
>>  arch/arm64/kernel/vdso/Makefile   | 2 +-
>>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>>  arch/ia64/Makefile                | 4 ++--
>>  arch/nds32/kernel/vdso/Makefile   | 2 +-
>>  scripts/Makefile.build            | 2 +-
>>  scripts/Makefile.package          | 4 ++--
>>  7 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 0af7945caa61..df20e71dd7c8 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1256,7 +1256,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
>>  PHONY += headerdep
>>  headerdep:
>>  	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
>> -	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
>> +	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
>>
>>  # ---------------------------------------------------------------------------
>>  # Kernel headers
>> @@ -1312,7 +1312,7 @@ PHONY += kselftest-merge
>>  kselftest-merge:
>>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
>>  	$(Q)find $(srctree)/tools/testing/selftests -name config | \
>> -		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>> +		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>>
>>  # ---------------------------------------------------------------------------
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>> index edccdb77c53e..fb07804b7fc1 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>  # Generate VDSO offsets using helper script
>>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>>  quiet_cmd_vdsosym = VDSOSYM $@
>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>
>>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>>  	$(call if_changed,vdsosym)
>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
>> index 7f96a1a9f68c..617c9ac58156 100644
>> --- a/arch/arm64/kernel/vdso32/Makefile
>> +++ b/arch/arm64/kernel/vdso32/Makefile
>> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
>>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
>>  quiet_cmd_vdsosym = VDSOSYM $@
>>  # The AArch64 nm should be able to read an AArch32 binary
>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>
>>  # Install commands for the unstripped file
>>  quiet_cmd_vdso_install = INSTALL32 $@
>> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
>> index 703b1c4f6d12..86d42a2d09cb 100644
>> --- a/arch/ia64/Makefile
>> +++ b/arch/ia64/Makefile
>> @@ -27,8 +27,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
>>
>> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> 
> Here is an instance of what Masahiro-san pointed out being wrong.
> 
> Ujjwal, will you send a v3?

Following is the quoted text from the reply mail from Masahiro

>> -GAS_STATUS     = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>> +GAS_STATUS     = $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> +KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> 
> 
> 
> These changes look wrong to me.
> 
> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
> 

From the above text, I understand as follows:

That my proposed change:
$(shell $(src...)    ->  $($(CONFIG_SHELL) $(src...)

is WRONG

and in the next line he suggested the required correction.
That being:
$($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)

Which is in v2 of the patch series.

Lukas, please correct me if I'm wrong so that I can work on v3
if required.

Also, Nathan reviewed both the patches in v1 of this series. So,
should I be the one who adds his tag in next iterations?


Thanks
Ujjwal Kumar
