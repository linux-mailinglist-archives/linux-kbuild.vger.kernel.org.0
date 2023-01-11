Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48EA9665A8D
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Jan 2023 12:44:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbjAKLoD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Jan 2023 06:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238549AbjAKLnf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Jan 2023 06:43:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC47FB15
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 03:42:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7F3FAB81B77
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 11:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3346FC433F1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 11:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673437339;
        bh=LTnMQ+Pvg5HdM/flrieIFG8uNsXiww1jLFIUJsRuEEE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VQ+XHugww9zO5NqjdhjYbAM/jQR0csoAbxzFsyA7p3ZOKKhIGL7Q3Ec+0Fhn/pVrV
         +5EX7j5sHJiVKFgNtaBR9O6E1KNL2t2Qwh888CPRrDa5E61AEnYa6upfSUw0Yc8rOF
         Wyj+B0RVA38l4xVjQ3+Vgydc12ATGUITJ38rmUnO9lAtuzpYIrNRGPplQPq4zcpGb0
         kgEciXM4R9HjrYh2sVNMzbAgrGA61+TxSnD9L9bm68zaSflv/sUwphYilv1KGnRsQM
         LOgsq3fqA1tkzsBBHgLBh3IcujBO7bClol5EHvge6UN+WHTS1hnDxKcCMlpowhCIP1
         TsxVV9H4D5X0g==
Received: by mail-ot1-f49.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so8640072oti.4
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Jan 2023 03:42:19 -0800 (PST)
X-Gm-Message-State: AFqh2kqYtYVbmnmBNzJUNefDmkF81MJPoKwF/I5tpGg+duE95RVETScA
        SglZeKej0mj0qMJwC6dC05EgcgWIt26Sv5ebIsU=
X-Google-Smtp-Source: AMrXdXvA2pBZa5tu1YkO/dt9cmrPltSQfyxaE2tjvebwmNpIlZjLrzanC3Xm4kqtjxk8WZS/ES0H2UOJ6TzbR+K2L+4=
X-Received: by 2002:a9d:128c:0:b0:66c:794e:f8c6 with SMTP id
 g12-20020a9d128c000000b0066c794ef8c6mr4672285otg.343.1673437338410; Wed, 11
 Jan 2023 03:42:18 -0800 (PST)
MIME-Version: 1.0
References: <20230111101156.83028-1-arend.vanspriel@broadcom.com>
In-Reply-To: <20230111101156.83028-1-arend.vanspriel@broadcom.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 11 Jan 2023 20:41:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARYNksm6aG8hxLmn65u2Vi83006fqJhvJqoq5rqfgPwoQ@mail.gmail.com>
Message-ID: <CAK7LNARYNksm6aG8hxLmn65u2Vi83006fqJhvJqoq5rqfgPwoQ@mail.gmail.com>
Subject: Re: [PATCH V2] scripts: rpm: make clear that mkspec script contains
 4.13 feature
To:     Arend van Spriel <arend.vanspriel@broadcom.com>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 11, 2023 at 7:12 PM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> A fix was made in the mkspec script that uses a feature, ie. the
> OR expression, which requires RPM 4.13. However, the script indicates
> another minimum version. Lower versions may have success by using
> the --no-deps option as suggested, but feels like bumping the version
> to 4.13 is reasonable as it put me on the wrong track at first with
> RPM 4.11 on my Centos7 machine.
>
> Fixes: 02a893bc9975 ("kbuild: rpm-pkg: add libelf-devel as alternative for BuildRequires")
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> ---
>  scripts/package/mkspec | 2 +-


Applied to linux-kbuild/fixes.
Thanks.


>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index adab28fa7f89..094e52c979a8 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -1,7 +1,7 @@
>  #!/bin/sh
>  #
>  #      Output a simple RPM spec file.
> -#      This version assumes a minimum of RPM 4.0.3.
> +#      This version assumes a minimum of RPM 4.13
>  #
>  #      The only gothic bit here is redefining install_post to avoid
>  #      stripping the symbols from files in the kernel which we want
> --
> 2.32.0
>


-- 
Best Regards
Masahiro Yamada
