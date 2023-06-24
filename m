Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F0673C8B7
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Jun 2023 10:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjFXIMB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Jun 2023 04:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjFXIMA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Jun 2023 04:12:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B615D212B
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 01:11:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4283C60C07
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 08:11:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59DCC433C8
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 08:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687594318;
        bh=ENj7Kkm6lPnIXuGTVlzbD8jqYTvAWmy+nk4SpklpL1M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YLiPJlOe0M+Ysiw//lTxon7P6HWS6B3FboxSiOKX2IBbtCOx7wvSczjz8NbgpGXXg
         3QhX+j1788coN91k9O+WqxQUoTLU2EklaCb8m1Fbf+210/SiqkAUFy1mj8ZC2i6k75
         E5f4ddi2JVE55gxSJr9pINjWghyfeUfcYtkDHnGWvfRT8HaQghteB5Om5BzKg92pjm
         IdIlphXC8uOHG5LKjyTqVxcnrPj8VkmlYv0dKV0a1VUEyFKRb2hdaHqE5uH1WUswRt
         4RQfVGOhYblRn4GMwP5S/UNdbCapJ81M6TYlP2nr5+oVLoyYVxCm8Yu5mlLWATyKUL
         fg7TXomLR5vEg==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-55e4b840858so1003136eaf.1
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Jun 2023 01:11:58 -0700 (PDT)
X-Gm-Message-State: AC+VfDyg943taKfXTH27suHFzmEDypcuLXILZlu+z6zT8M/XTHCeU3x5
        r392e2LDuhqw3Pd/gS54wdHYvKWxv90KwiC0Wbs=
X-Google-Smtp-Source: ACHHUZ7G+0fH0OJ9bpNP+APH4uIXV7b8s56On3B3pkpPQby89+EySpDzJq4Bsrb1ktPzLtdB6QIUoeb+WZ80bOp4MfE=
X-Received: by 2002:a4a:eacf:0:b0:562:f72f:ac0e with SMTP id
 s15-20020a4aeacf000000b00562f72fac0emr4065646ooh.0.1687594317939; Sat, 24 Jun
 2023 01:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230618001646.1228521-1-Mr.Bossman075@gmail.com>
In-Reply-To: <20230618001646.1228521-1-Mr.Bossman075@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 24 Jun 2023 17:11:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT=jKNFcQmrrZsF5Lis_fmex+1KZe0U-VpsxeekH7aZYw@mail.gmail.com>
Message-ID: <CAK7LNAT=jKNFcQmrrZsF5Lis_fmex+1KZe0U-VpsxeekH7aZYw@mail.gmail.com>
Subject: Re: [PATCH v1] scripts: kconfig: nconf: Add search jump feature
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 18, 2023 at 9:16=E2=80=AFAM Jesse Taube <mr.bossman075@gmail.co=
m> wrote:
>
> Menuconfig has a feature where you can "press the key in the (#) prefix
> to jump directly to that location. You will be returned to the current
> search results after exiting this new menu."
>
> This commit adds this feature to nconfig, with almost identical code.
>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>


Setting the code duplication aside,
does this patch work correctly?



$ make defconfig
$ make nconfig

Press F8

Input "MODULES" in the search box.

You will see:

(1) -> Enable loadable module support

Press the "1" key.


It will navigate to "General setup"
instead of "Enable loadable module support".






--=20
Best Regards
Masahiro Yamada
