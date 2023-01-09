Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11C256632D5
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 22:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237616AbjAIVZn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 16:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238061AbjAIVYz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 16:24:55 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD652EC
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 13:24:38 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id v3so6814633pgh.4
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 13:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cwNgqi/NQkqWmtT2yM6QfKma/Y9yH7Zze7tBPVBivxk=;
        b=BUrkQTa+u/VpDQVrQM/lKNS4FTu2L3sLIIqBbnjlsemezMYlVHS8iPOKK5l8sDB8yf
         M4eQOaPKiijvKhy/SLCWzcZDVz/vrcfFQIx6305wyt+99rkBk/j46H2bPJO4NqwWUeFh
         SkY620a+ghXrYMMXDe+qWeyKu+3Dvw/iW6h4x+aAX3OuOb3gVlFRnttrZ6X5yzPnhfFV
         a4hbYsL2Asa8O8K8Flc+yw3WuHu8TpXa9t3pgAGlKDIZrPieC5OiBBQVM/ABA/0OaMpG
         9l3Kc8GBn58XMHZQT3nc6VjzrTALSMaOkN4yeTt5fG9hcT419bAO6RkFlg+/vznV8Naa
         zz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cwNgqi/NQkqWmtT2yM6QfKma/Y9yH7Zze7tBPVBivxk=;
        b=SqEpNaPq2glA1Xpzj7IHfAbqXM5JN8FqhDjYiYNZS8YXOdLcfl9QH2AGxX2dHwNkMI
         QTHKOcBLkCJLZ1Ct7CyO5wvbo0yWm3TkKWgO/eX+bA0a4ZaYOPn+2fGCouRvGVWzdfOP
         HNJxbiM/w2/9d30Or8q6czJaogP+VWOsCdyudgPMotjxOh4gttPOe+0uwlHD1atfCWQY
         R0nn8Tb0ZnVbvRZkWUNSeRhT8n1t2wdZLm+dyEDgX8NQn7G3gF9Bras/qz7GeVurRIu/
         M8QoacU6jyS+I0K1wmTbSrgZ9PUl1U/oQI9KF9dT+JsHJBktlOQli5WbRmxDgkAhZdc7
         Hxmg==
X-Gm-Message-State: AFqh2kotNa6vUBeyfqo4GN23xms5Z0F8jhujIPKqNFBv9BU2LCkraPqd
        jlcZb0FjVO5GpPrTJPmtcLGfFe0geY4651CZ85RdsyQlCd9jiQ==
X-Google-Smtp-Source: AMrXdXtIh0E/DgOM0QwEcwfy9eQgImnKUYlPyPKRHz81WoFNXLApps0jEhpEfXN0JAZZbWaOYH1ssQGCAd5Wpz9DJLc=
X-Received: by 2002:a63:4943:0:b0:478:e6cf:c24c with SMTP id
 y3-20020a634943000000b00478e6cfc24cmr5119252pgk.365.1673299477404; Mon, 09
 Jan 2023 13:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 13:24:26 -0800
Message-ID: <CAKwvOdkB_+Nf9zpXeeayA6V14QoAEfW0b37DBsro04q5JpjBnw@mail.gmail.com>
Subject: Re: [PATCH 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 4, 2023 at 11:54 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> points out that KBUILD_AFLAGS contains a linker flag, which will be
> used:
>
>   clang: error: -Wl,-a32: 'linker' input unused [-Werror,-Wunused-command-line-argument]
>
> This was likely supposed to be '-Wa,-a$(BITS)'. However, this change is
> unnecessary, as all supported versions of clang and gcc will pass '-a64'
> or '-a32' to GNU as based on the value of '-m'; the behavior of the
> latest stable release of the oldest supported major version of each
> compiler is shown below and each compiler's latest release exhibits the
> same behavior (GCC 12.2.0 and Clang 15.0.6).
>
>   $ powerpc64-linux-gcc --version | head -1
>   powerpc64-linux-gcc (GCC) 5.5.0
>
>   $ powerpc64-linux-gcc -m64 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a64 -mppc64 -many -mbig -o /dev/null /tmp/cctwuBzZ.s
>
>   $ powerpc64-linux-gcc -m32 -### -x assembler-with-cpp -c -o /dev/null /dev/null &| grep 'as '
>   .../as -a32 -mppc -many -mbig -o /dev/null /tmp/ccaZP4mF.sg
>
>   $ clang --version | head -1
>   Ubuntu clang version 11.1.0-++20211011094159+1fdec59bffc1-1~exp1~20211011214622.5
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a64" "-mppc64" "-many" "-o" "/dev/null" "/tmp/null-80267c.s"
>
>   $ clang --target=powerpc64-linux-gnu -fno-integrated-as -m64 -### \
>     -x assembler-with-cpp -c -o /dev/null /dev/null &| grep gnu-as
>    "/usr/bin/powerpc64-linux-gnu-as" "-a32" "-mppc" "-many" "-o" "/dev/null" "/tmp/null-ab8f8d.s"
>
> Remove this flag altogether to avoid future issues.
>
> Fixes: 1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index dc4cbf0a5ca9..4fd630efe39d 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -90,7 +90,7 @@ aflags-$(CONFIG_CPU_LITTLE_ENDIAN)    += -mlittle-endian
>
>  ifeq ($(HAS_BIARCH),y)
>  KBUILD_CFLAGS  += -m$(BITS)
> -KBUILD_AFLAGS  += -m$(BITS) -Wl,-a$(BITS)
> +KBUILD_AFLAGS  += -m$(BITS)
>  KBUILD_LDFLAGS += -m elf$(BITS)$(LDEMULATION)
>  endif
>
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
