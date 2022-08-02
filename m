Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0FB658816D
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Aug 2022 19:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiHBR6m (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Aug 2022 13:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235439AbiHBR6j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Aug 2022 13:58:39 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4F94B4AC
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Aug 2022 10:58:37 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u1so12796918lfq.4
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Aug 2022 10:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XlyYTnn1kbQZ516FIn+rClIxx0d3BNXJVA7WhFGAQX8=;
        b=T7Njkv8tzTVHHIvYpT9tG294YaM9GVyg71TOexkCuOgsNTAvaFhaA0Vmm2k2noHMhH
         O+VWuJaWwm+LjFlWFWVHlwXo4TvjS0+XOfSCCPvqEYqiwcmdQiIBGsFXaqGJ78XoOZZS
         xWnqhlZ2P61EJ/apxpKqjo2B1Cgy9MBn+/baAzg0ClzSACClmuwVjX2tHTTXL5brtvTZ
         mAUveI1bX+afXCappQ+YkXMvYHQkhOVMcFqk5AL2a+w/13fm/Hi9CoEpn1DHuy8w67Tq
         +ldB4hHTSstKkviAnDrL6uZNiXL0isptAOL/FtYjrgq4EwkJgRetWcdPSsfIpIKyW13M
         HEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XlyYTnn1kbQZ516FIn+rClIxx0d3BNXJVA7WhFGAQX8=;
        b=oh84yMI80HTErZ35EqcWQUimhBuI8G1meG6AThw1asoQx3hfxsGK7fpEPAgdZNnwKG
         IabDha7MEZAvyec62HRZHODn92CN+0ObBoKqAknUw4ePNchmD7SUhRmSC9BX7CxbEQtm
         48y0TT1sfk6uEgyl8P+jcU5E5q5inGoXJ27bnqqSMnZKPCRbbbAVOx9VOD3gXEg634j2
         1TQqwzk2oHBTElDhYU/wLEKvcBgM/EwxbZfgtQ2gO87Yxwk4xZ7eg5yxK3EadZLId3Zw
         1i0BXunCBoWNjj9AHDLaR5JFr5E+YYvXbBK0Bujyo0fMy0Jy22LZZ6wh1ZbfpN8LoqqL
         fWtg==
X-Gm-Message-State: ACgBeo2V1ReyY5Y5WJq89v22TOmOsraTxuzB2yXKbllB+gIOGYZlj6+f
        C72Bw0oy58gQHt5nXWuHLhU7LjWOhaHHO+tWAKpP7l2w4FE=
X-Google-Smtp-Source: AA6agR40G8SCTsMN05WoDpwiLryayqYoZ9acr7piTwCNBrfuVq6ECmM1bRacKcBj0jEU+55VZMSSU8Vxd9uKo7iDo/o=
X-Received: by 2002:a19:ca50:0:b0:48a:f4ce:4559 with SMTP id
 h16-20020a19ca50000000b0048af4ce4559mr4677864lfj.432.1659463115376; Tue, 02
 Aug 2022 10:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220730173636.1303357-1-masahiroy@kernel.org> <20220730173636.1303357-2-masahiroy@kernel.org>
In-Reply-To: <20220730173636.1303357-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 2 Aug 2022 10:58:24 -0700
Message-ID: <CAKwvOdk3-UdsxDwjgF=_=irsGLeDj6LF45oeV+6a5d9CeY-Fkg@mail.gmail.com>
Subject: Re: [PATCH 2/3] modpost: use more reliable way to get fromsec in section_rel(a)()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 30, 2022 at 10:37 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The section name of Rel and Rela starts with ".rel" and ".rela"
> respectively (but, I do not know whether this is specification or
> convention).
>
> For example, ".rela.text" holds relocation entries applied to the
> ".text" section.
>
> So, the code chops the ".rel" or ".rela" prefix to get the name of
> the section to which the relocation applies.
>
> However, I do not like to skip 4 or 5 bytes blindly because it is
> potential memory overrun.
>
> The ELF specification provides a more reliable way to do this.
>
>  - The sh_info field holds extra information, whose interpretation
>    depends on the section type
>
>  - If the section type is SHT_REL or SHT_RELA, the sh_info field holds
>    the section header index of the section to which the relocation
>    applies.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Yes, this seems much safer; thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/mod/modpost.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 148b38699889..c6a055c0291e 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1723,8 +1723,7 @@ static void section_rela(const char *modname, struct elf_info *elf,
>         Elf_Rela *start = (void *)elf->hdr + sechdr->sh_offset;
>         Elf_Rela *stop  = (void *)start + sechdr->sh_size;
>
> -       fromsec = sech_name(elf, sechdr);
> -       fromsec += strlen(".rela");
> +       fromsec = sec_name(elf, sechdr->sh_info);
>         /* if from section (name) is know good then skip it */
>         if (match(fromsec, section_white_list))
>                 return;
> @@ -1776,8 +1775,7 @@ static void section_rel(const char *modname, struct elf_info *elf,
>         Elf_Rel *start = (void *)elf->hdr + sechdr->sh_offset;
>         Elf_Rel *stop  = (void *)start + sechdr->sh_size;
>
> -       fromsec = sech_name(elf, sechdr);
> -       fromsec += strlen(".rel");
> +       fromsec = sec_name(elf, sechdr->sh_info);
>         /* if from section (name) is know good then skip it */
>         if (match(fromsec, section_white_list))
>                 return;
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
