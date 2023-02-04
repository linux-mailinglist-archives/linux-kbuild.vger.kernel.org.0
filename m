Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9B468A961
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Feb 2023 11:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbjBDKMf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 05:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjBDKMe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 05:12:34 -0500
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org [IPv6:2001:67c:2050:102:465::110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56551D913;
        Sat,  4 Feb 2023 02:12:32 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4P87cX33swz9slS;
        Sat,  4 Feb 2023 11:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyantec.com; s=default;
        t=1675505548;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wBenN//MSS2FnzUOSFVhxKB8bpeGF5Xem1x3AEUv3BY=;
        b=kYbQRc2hdX3GGIHgmxnC6grhmeksmw779RoTzvoHAI7y/jIbGV4z+snLf8rls6LxgZX5HT
        LhNN2E3d9yGADoBCbwESFikpy2/KTKO6lO3fN7QtctsWyeuTop1G/4iYVWheGLtVGDjlp1
        ekfT0o7sLhp4ybDuMxIlyvDlQhzsTj/lBXeQV5gAeEBLu0BqxCcEzMsRPAH7jL5fc77G+N
        XAIfVHPWM6Jtf55zf3QQ089bSDXfh7nmjq0H+FtT4lEKTeUNXPr4Nw8DzzlVc2R0CDaDr/
        5Ap6d/IyA2unfvpYw7gNV+sf89CH15WXZsXQpi1hUJRczrk5TO2bXQL3EvB7Xg==
From:   Finn Behrens <fin@nyantec.com>
To:     =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
Date:   Sat, 04 Feb 2023 11:12:23 +0100
Message-ID: <BDCE8CA1-9BC1-4E36-9A7A-CA60A387E200@nyantec.com>
In-Reply-To: <20230203173704.108942-1-mcanal@igalia.com>
References: <20230203173704.108942-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 3 Feb 2023, at 18:37, Ma=C3=ADra Canal wrote:

> rust-project.json is the configuration file used by rust-analyzer.
> As it is a configuration file and it is not needed to build external
> modules, it should be delete by make clean. So, delete rust-project.jso=
n
> when running make clean.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/939
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
Reviewed-by: Finn Behrens <fin@nyantec.com>
> ---
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
>
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_FILES +=3D include/config include/generated          \
> -- =

> 2.39.1
