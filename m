Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D4D352EF2
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Apr 2021 20:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbhDBSH1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Apr 2021 14:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbhDBSHZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Apr 2021 14:07:25 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB16EC0613E6
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Apr 2021 11:07:23 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u4so6350349ljo.6
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Apr 2021 11:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PM3yJgN8KwxpiHp9xCT4k+uyrPB+t4rWGu++QPJE560=;
        b=B58X00VnP5DFpJ+hL8Sz5d26e4DTVke1e4z5O+a75+KasfQG3lYwT9qRWCl0q/gnrJ
         Y38HI6ApVd5WAXD/KHTtgTfdlLvR4UJ1F2kYEMFjiijCFZZ3g8w2SgzdJHWkE+fefxJ5
         Q1T97IDU5TpcquAzm+FdjkDl9YBJGmELHnkOxIELa+kKpnuSoAakWEgHIPyaDtHHJ8sC
         3yoftMjuwHr7lLOp4HL/l4Q6lbBMAjXWYkuV7NvrBuF1S7pK8/RFjBeUszrRMzT1vRVZ
         t2Awm28ebPD5p/Yb26LbKyVo/QOfMdwOSkuazsdoH7LGSeL7KT9UbMNaQO9B9dCg4H2f
         yPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PM3yJgN8KwxpiHp9xCT4k+uyrPB+t4rWGu++QPJE560=;
        b=mJsxRM3A0Jv0ALphkrPgpbicH+EivT1BCMnY4fIfh1kr789mJx5nu00LSJfsnmL+hb
         8zFy69CzpweLskGqCrToGnk3MGcx6/ktdEyJB/IHDzc6MbJytL40zQINi+idhW5u8S5N
         wb425lMA7PUr680Rc8jOnh9Kzg9tKUmUjbaP+GYODb7VLfPFCbvFOCkj5xETaTP5QpJA
         BNfy/SjP8BX7981LdZohorIBQHhDNzBI+yW106zFA4rt0dAnUsshKw3KZjZsAriDynqw
         veDHhwizLSk/RlkkiuI2jm3sDNYOaFuuRfIl8EpDaBX3Jaxe0BwgODUsWMcxwR+eskhC
         ZvCw==
X-Gm-Message-State: AOAM533FGubUyo0eW+SzsMUiBWIiqW6RF2G6ixVkJ3YgrD1XnOgn9AWV
        2SPhKajOqMiMUdLwgOfBY6SeizMyaoO/HpCNvfSVSw==
X-Google-Smtp-Source: ABdhPJyqiPydlwE2rpVAqQ8yNauCEz83cMMFmNvzIzt55MPhWfwMmB22LgPejZ7fmWLvnphIAttlAgmJ939SrbYBJFM=
X-Received: by 2002:a2e:5716:: with SMTP id l22mr8865244ljb.244.1617386841985;
 Fri, 02 Apr 2021 11:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210401232723.3571287-1-yhs@fb.com>
In-Reply-To: <20210401232723.3571287-1-yhs@fb.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 2 Apr 2021 11:07:10 -0700
Message-ID: <CAKwvOdmX8d3XTzJFk5rN_PnOQYJ8bXMrh8DrhzqN=UBNdQiO3g@mail.gmail.com>
Subject: Re: [PATCH kbuild v4] kbuild: add an elfnote for whether vmlinux is
 built with lto
To:     Yonghong Song <yhs@fb.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        bpf <bpf@vger.kernel.org>, kernel-team@fb.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Bill Wendling <morbo@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 1, 2021 at 4:27 PM Yonghong Song <yhs@fb.com> wrote:
>
> Currently, clang LTO built vmlinux won't work with pahole.
> LTO introduced cross-cu dwarf tag references and broke
> current pahole model which handles one cu as a time.
> The solution is to merge all cu's as one pahole cu as in [1].
> We would like to do this merging only if cross-cu dwarf
> references happens. The LTO build mode is a pretty good
> indication for that.
>
> In earlier version of this patch ([2]), clang flag
> -grecord-gcc-switches is proposed to add to compilation flags
> so pahole could detect "-flto" and then merging cu's.
> This will increate the binary size of 1% without LTO though.
>
> Arnaldo suggested to use a note to indicate the vmlinux
> is built with LTO. Such a cheap way to get whether the vmlinux
> is built with LTO or not helps pahole but is also useful
> for tracing as LTO may inline/delete/demote global functions,
> promote static functions, etc.
>
> So this patch added an elfnote with a new type LINUX_ELFNOTE_LTO_INFO.
> The owner of the note is "Linux".
>
> With gcc 8.4.1 and clang trunk, without LTO, I got
>   $ readelf -n vmlinux
>   Displaying notes found in: .notes
>     Owner                Data size        Description
>   ...
>     Linux                0x00000004       func
>      description data: 00 00 00 00
>   ...
> With "readelf -x ".notes" vmlinux", I can verify the above "func"
> with type code 0x101.
>
> With clang thin-LTO, I got the same as above except the following:
>      description data: 01 00 00 00
> which indicates the vmlinux is built with LTO.
>
>   [1] https://lore.kernel.org/bpf/20210325065316.3121287-1-yhs@fb.com/
>   [2] https://lore.kernel.org/bpf/20210331001623.2778934-1-yhs@fb.com/
>
> Suggested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
> Signed-off-by: Yonghong Song <yhs@fb.com>

LGTM thanks Yonghong!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  include/linux/elfnote-lto.h | 14 ++++++++++++++
>  init/version.c              |  2 ++
>  scripts/mod/modpost.c       |  2 ++
>  3 files changed, 18 insertions(+)
>  create mode 100644 include/linux/elfnote-lto.h
>
> Changelogs:
>   v3 -> v4:
>     . put new lto note in its own header file similar to
>       build-salt.h. (Nick)
>   v2 -> v3:
>     . abandoned the approach of adding -grecord-gcc-switches,
>       instead create a note to indicate whether it is a lto build
>       or not. The note definition is in compiler.h. (Arnaldo)
>   v1 -> v2:
>     . limited to add -grecord-gcc-switches for LTO_CLANG
>       instead of all clang build
>
> diff --git a/include/linux/elfnote-lto.h b/include/linux/elfnote-lto.h
> new file mode 100644
> index 000000000000..d4635a3ecc4f
> --- /dev/null
> +++ b/include/linux/elfnote-lto.h
> @@ -0,0 +1,14 @@
> +#ifndef __ELFNOTE_LTO_H
> +#define __ELFNOTE_LTO_H
> +
> +#include <linux/elfnote.h>
> +
> +#define LINUX_ELFNOTE_LTO_INFO 0x101
> +
> +#ifdef CONFIG_LTO
> +#define BUILD_LTO_INFO ELFNOTE32("Linux", LINUX_ELFNOTE_LTO_INFO, 1)
> +#else
> +#define BUILD_LTO_INFO ELFNOTE32("Linux", LINUX_ELFNOTE_LTO_INFO, 0)
> +#endif
> +
> +#endif /* __ELFNOTE_LTO_H */
> diff --git a/init/version.c b/init/version.c
> index 92afc782b043..1a356f5493e8 100644
> --- a/init/version.c
> +++ b/init/version.c
> @@ -9,6 +9,7 @@
>
>  #include <generated/compile.h>
>  #include <linux/build-salt.h>
> +#include <linux/elfnote-lto.h>
>  #include <linux/export.h>
>  #include <linux/uts.h>
>  #include <linux/utsname.h>
> @@ -45,3 +46,4 @@ const char linux_proc_banner[] =
>         " (" LINUX_COMPILER ") %s\n";
>
>  BUILD_SALT;
> +BUILD_LTO_INFO;
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 24725e50c7b4..98fb2bb024db 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2191,10 +2191,12 @@ static void add_header(struct buffer *b, struct module *mod)
>          */
>         buf_printf(b, "#define INCLUDE_VERMAGIC\n");
>         buf_printf(b, "#include <linux/build-salt.h>\n");
> +       buf_printf(b, "#include <linux/elfnote-lto.h>\n");
>         buf_printf(b, "#include <linux/vermagic.h>\n");
>         buf_printf(b, "#include <linux/compiler.h>\n");
>         buf_printf(b, "\n");
>         buf_printf(b, "BUILD_SALT;\n");
> +       buf_printf(b, "BUILD_LTO_INFO;\n");
>         buf_printf(b, "\n");
>         buf_printf(b, "MODULE_INFO(vermagic, VERMAGIC_STRING);\n");
>         buf_printf(b, "MODULE_INFO(name, KBUILD_MODNAME);\n");
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
