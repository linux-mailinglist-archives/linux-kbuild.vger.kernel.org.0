Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F19858815C
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Aug 2022 19:55:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbiHBRzy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Aug 2022 13:55:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232433AbiHBRzx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Aug 2022 13:55:53 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B01E222B0
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Aug 2022 10:55:52 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id w15so7335183ljw.1
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Aug 2022 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMFTPfu+5zncYEkukQRG8ZpUKBpBT3nlb86KyCAQyPA=;
        b=aQoMJrSssxzauOdbFrB9wScBW+nXxpw4uqe3xSTFfXbWSUB1ZNa8czyknKQsXH3Gpb
         xvHwm+NbqgRm688vJvTJ/7TV3Kq58FX3szhuh9gSJL5KWIdhYyxILQfTAKhJkR4Tw0sU
         JDqvhMSSX5F7JfSovXlE+rWOpUIh0XX7jURrhu7/4Afdz0e4EcVwfBPgK/PgicV7stZG
         vMrTnPaDxE68+gmVB1uj7YVPOYL3gqA9J68ILuPaj6J9DKiR3Dc1VQv11QZEawXNmosA
         LR5w/h3HkK9B/DSSms2J0eHdRMcCiEKnfDzAIsIvMuiBLUoIJ1b5ewH54CfDoxq12RJ2
         qgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMFTPfu+5zncYEkukQRG8ZpUKBpBT3nlb86KyCAQyPA=;
        b=x5kiyvoM4cIUndPxPfr9c9KYGhmV62LKd6SiwAtyC0S7njluWatf1EKW9EVycOh+yo
         i5od6rKuqw4cPMHatZbS8liOPfrRh2HNtqCj9lFp/vYAvzInz4Jl4Y1neMn0D4QbBaSt
         if3iUTvXuADrucY5MVUtHsPF9LUVPk1f4sIF5/M3sL1NWPhEW20paExb6oHj1dyjZyLQ
         hM61VSsFWBxcRtsjAu+UxX6rQDbEKf2WKsFLXCINA9Mpggn2MBlDJOIRZ7mBQtWiBCEe
         XYBUROern0BPOoqt2pyFxv4JlQ5Nn6Ovi7+hrAWfxdWksZvQZdYwnU4YI6xo2w/06nst
         XzYQ==
X-Gm-Message-State: AJIora810mTHUgA4ry0bTxhEiavTNbm8XymlyOnuexD6Iec8RuGsiEaa
        lAyqYNOfLwB8nZ+d6dyxLY51rASjK13hrJFA6T7VNQ==
X-Google-Smtp-Source: AGRyM1uIgIyl0P0rXiqFCrTv4ElBVeqbBnQIQw86ggWODHXkXUkRvKdj6ZX4Z6Vje7Uew5gyM+S7n+PJ/Q6WqTACgV0=
X-Received: by 2002:a2e:920e:0:b0:25d:ed6f:e66b with SMTP id
 k14-20020a2e920e000000b0025ded6fe66bmr6558873ljg.103.1659462950708; Tue, 02
 Aug 2022 10:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220730173636.1303357-1-masahiroy@kernel.org>
In-Reply-To: <20220730173636.1303357-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 2 Aug 2022 10:55:39 -0700
Message-ID: <CAKwvOd=gZc6TKaV1yh4pfbtj26xoQasVw=i+Vq+jOu2dgzFsFA@mail.gmail.com>
Subject: Re: [PATCH 1/3] modpost: add array range check to sec_name()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
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
> The section index is always positive, so the argunent, secindex, should
> be unsigned.
>
> Also, inserted the array range check.
>
> If sym->st_shndx is a special section index (between SHN_LORESERVE and
> SHN_HIRESERVE), there is no corresponding section header.
>
> For example, if a symbol specifies an absolute value, sym->st_shndx is
> SHN_ABS (=0xfff1).
>
> The current users do not cause the out-of-range access of
> info->sechddrs[], but it is better to avoid such a pitfall.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I don't mind adding this check; though if it's anomalous I think we
could also just print to stderr and abort.

I would prefer Elf_Sym over unsigned int though.  WDYT?

> ---
>
>  scripts/mod/modpost.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 08411fff3e17..148b38699889 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -336,8 +336,16 @@ static const char *sech_name(const struct elf_info *info, Elf_Shdr *sechdr)
>                                       sechdr->sh_name);
>  }
>
> -static const char *sec_name(const struct elf_info *info, int secindex)
> +static const char *sec_name(const struct elf_info *info, unsigned int secindex)
>  {
> +       /*
> +        * If sym->st_shndx is a special section index, there is no
> +        * corresponding section header.
> +        * Return "" if the index is out of range of info->sechdrs[] array.
> +        */
> +       if (secindex >= info->num_sections)
> +               return "";
> +
>         return sech_name(info, &info->sechdrs[secindex]);
>  }
>
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
