Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6E0723CD9
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jun 2023 11:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbjFFJRF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Jun 2023 05:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236069AbjFFJRC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Jun 2023 05:17:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF57CE51
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 02:16:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 79F5862F81
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 09:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE37FC433D2
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Jun 2023 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686043012;
        bh=fnwNAebMwuEjn+2lKhDY20cum9QmvWsokY0mDHSMffI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DQMHI5JZ96cIbGbgmkr/LaLcM2WkMVmmoG8RACz+eH9L7LiXe/rlqTAuMMOxGDP5V
         wEmlOulSsqM6oX1yRAw//ZDFiVI1c39hVYyLXdy2JDfoZvspeecm3vRTnLVjvmddPY
         iU5NLDbwUsKoLCTDzjBpHAc4RwaFZyZ+QotjTXHwri8MrfDZK2BDy6WmRC5tmLiMOv
         UxM5/7kQ/PG7Uhh9OGNyMMsewSJ3aN0j1O0f4jGwRSXd8x2IhxzIpwqyXZ0eFSjQyg
         Eu0I05K1UgnqfECrZcEOGxj/VAjeTfI/En+HxwfattbQzIsXWaXJ+NKcI8E2wW37HV
         VqxjRz3RaYwHA==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1a2ad8f4075so4494538fac.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jun 2023 02:16:52 -0700 (PDT)
X-Gm-Message-State: AC+VfDwMUC0wbguTB7ZjFltzhNtT2wbuUW+b6GL3VRpRt6dm2Cz6rjk1
        TUFFpR+HZ29w+BDHD54dJ/ECKCZVsSYklICI4Ho=
X-Google-Smtp-Source: ACHHUZ7Mlbe4oXQfgHZSOIQolgi5gfyYq4lZD3PKKtkhAaxh/WNqihdsgbMzGYDx419Zr5c/SWeCXc1NAh6HQPHUMSU=
X-Received: by 2002:a05:6870:7f07:b0:19f:2346:b59d with SMTP id
 xa7-20020a0568707f0700b0019f2346b59dmr2789669oab.55.1686043012221; Tue, 06
 Jun 2023 02:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <ZH7uxFaLhjul0jp1@moroto>
In-Reply-To: <ZH7uxFaLhjul0jp1@moroto>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 6 Jun 2023 18:16:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_40O2VohUraVP--PVj2ZrX6SbNhLR99a_WYMXhHU4ng@mail.gmail.com>
Message-ID: <CAK7LNAS_40O2VohUraVP--PVj2ZrX6SbNhLR99a_WYMXhHU4ng@mail.gmail.com>
Subject: Re: [bug report] modpost: handle relocations mismatch in __ex_table.
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     quentin.casasnovas@oracle.com,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 6, 2023 at 5:31=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> [ Ancient code warning. - dan ]
>
> Hello Quentin Casasnovas,
>
> The patch 52dc0595d540: "modpost: handle relocations mismatch in
> __ex_table." from Apr 13, 2015, leads to the following Smatch static
> checker warning:
>
>         ./scripts/mod/modpost.c:1154 is_executable_section()
>         warn: array off by one? 'elf->sechdrs[secndx]'
>
> ./scripts/mod/modpost.c
>     1149 static bool is_executable_section(struct elf_info *elf, unsigned=
 int secndx)
>     1150 {
>     1151         if (secndx > elf->num_sections)
>                      ^^^^^^^^^^^^^^^^^^^^^^^^^^
> I'm not positive, but I think this should be >=3D.


Ah, right. This is a bug, and your fix is correct.





>
>     1152                 return false;
>     1153
> --> 1154         return (elf->sechdrs[secndx].sh_flags & SHF_EXECINSTR) !=
=3D 0;
>                                       ^^^^^^
> out of bounds read.
>
>     1155 }
>
> regards,
> dan carpenter






--=20
Best Regards
Masahiro Yamada
