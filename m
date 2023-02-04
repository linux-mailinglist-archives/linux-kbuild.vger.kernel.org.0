Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B0B68ABEC
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Feb 2023 19:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbjBDSlK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 13:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjBDSlJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 13:41:09 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB03A2D49;
        Sat,  4 Feb 2023 10:41:07 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id m2so23741629ejb.8;
        Sat, 04 Feb 2023 10:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAU0IM1UCRF7ncrAZxO0aSTqEShO/M6wUIz9M+sV+ZI=;
        b=hEbzq5A7Ov34rRmWdwzaMRN9Lhjurf1rINuKQIl1+9dgPXPxjSTjP2gdfS92sZeqql
         xm7w6BVt5l+ovjlBcv0YzdDumEYrgYpX76CQlKK2+1SkmOseUszsgM2UH5T+/jNZm0Vs
         WPiHFadfnk1HoMwOIPOh+B12362pQM/ZltX2x1qQ5IA6xROPqDekcLJVioXLHqRETnQv
         3QfS2SJAMoEiY5xuBwH2FFr0kgl9E9gH8/WlXTx7JJLOKxYt4/UngdydBdaZcRaN39gV
         aLKYFGUNQszKuVio2MTClIFQtji00YioUOcS4CDBPNiLnbatoVdN1dewzs16OzRih/OA
         MK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OAU0IM1UCRF7ncrAZxO0aSTqEShO/M6wUIz9M+sV+ZI=;
        b=Z/8fgSIK4ykob2Hpg0JUDEy7qYF944GKRoe1zKgxW8m7mrrJZdAqwKWK1EP/VElK1T
         22rvg3EPKPAOHfedqNPl8dKUeu4CqF0HeIi805/czsW0SYUOYCT+mqTxZQjo6O/1SXwY
         RjJcyKNe/dNeG1z6sb/xewlDlM7muXByjh3VnMHBomcFOuFfZPDOEZNNGalx+dOyFnZx
         AM4wdqH//jhTO87ES70VzgUFX3F0v9Z3q8vc3/O6TCCGMWDe8Z75Vvf+ypMO5mWJ3clt
         QNUU4MNjD8mEEHY+oWI/2LV6ktg2n5ZAQAk+Fo4tjX9OcPhWhTiYD5BR6IF+LOqxKOJy
         oRww==
X-Gm-Message-State: AO0yUKXDQhqaTsZRkUVJExYDVOjIe8fkADhGTfrZPiK5SCe6ByenYb0e
        J1BoHNbcxEZD+1GyVlalLyQdamE37ds32k5U+iU=
X-Google-Smtp-Source: AK7set/8PozigBAVW2eFUSbcURNASJMTBoGIidv/4O3sKX2J7fSaYxxY6Bukz5ZHJsIkjvwsjf4OEg==
X-Received: by 2002:a17:906:6d42:b0:88a:a09d:e673 with SMTP id a2-20020a1709066d4200b0088aa09de673mr15087839ejt.31.1675536066340;
        Sat, 04 Feb 2023 10:41:06 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:8c1:b772:7521:b7bd])
        by smtp.gmail.com with ESMTPSA id q19-20020a17090622d300b0088a2397cb2csm3146789eja.143.2023.02.04.10.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 10:41:05 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Sat, 04 Feb 2023 19:41:04 +0100
Message-Id: <CQ9ZYPS9NLN3.2TNK77PA5JUAQ@vincent>
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        "Michal Marek" <michal.lkml@markovi.net>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        "Miguel Ojeda" <ojeda@kernel.org>,
        "Alex Gaynor" <alex.gaynor@gmail.com>,
        "Wedson Almeida Filho" <wedsonaf@gmail.com>,
        "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
        =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc:     "Melissa Wen" <mwen@igalia.com>, <linux-kbuild@vger.kernel.org>,
        <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.14.0-38-gb2afc8117fb7
References: <20230203173704.108942-1-mcanal@igalia.com>
In-Reply-To: <20230203173704.108942-1-mcanal@igalia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri Feb 3, 2023 at 6:37 PM CET, Ma=C3=ADra Canal wrote:
> rust-project.json is the configuration file used by rust-analyzer.
> As it is a configuration file and it is not needed to build external
> modules, it should be delete by make clean. So, delete rust-project.json
> when running make clean.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/939
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
Reviewd-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>

>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index f41ec8c8426b..6223d5f82f66 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1573,7 +1573,7 @@ endif # CONFIG_MODULES
>  CLEAN_FILES +=3D include/ksym vmlinux.symvers modules-only.symvers \
>  	       modules.builtin modules.builtin.modinfo modules.nsdeps \
>  	       compile_commands.json .thinlto-cache rust/test rust/doc \
> -	       .vmlinux.objs .vmlinux.export.c
> +	       rust-project.json .vmlinux.objs .vmlinux.export.c
> =20
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES +=3D include/config include/generated          \
> --=20
> 2.39.1

