Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2627F74E56D
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jul 2023 05:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjGKDnP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Jul 2023 23:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjGKDnO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jul 2023 23:43:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37415E5
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jul 2023 20:43:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA768612EC
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jul 2023 03:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34014C433C7
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Jul 2023 03:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689046993;
        bh=8W8t1Nr2oSw4znJ/A3c/Fnmkkn3GKHnELnuueXoZcdc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=J+0OmktsKJd9VIWhpInH623Q/CQVBaKCNWGYP/izBaHw0tmCwSFHz244H3p2ujsNi
         QmIbYv3ty02L5zmKwOESe4RNED6Q8u0IT0siJ43SfUmTZa5vsTN+LPN26nhue1O1fh
         wrQ0uocQJjXJi5Z1XqehRXD2h87VccSoWEk3K6PInASXa7FpawB1eqm/y0nU9DhMUL
         l1MBMhG0gxUj0GGNM2PqX+hRtTsDdJry9Jk1kUaX+UTytEHcIHLpX+4fYXNbm952xp
         IbK1I881bBznRhkvu0dy4JnGoe/rjkvEG0KQDmUzdf9NUyDYsolpUrA4iJfcoKUB3J
         WbY7HNgeEJ7MQ==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-565a8d74daeso3253089eaf.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Jul 2023 20:43:13 -0700 (PDT)
X-Gm-Message-State: ABy/qLb68a71CgrvmF/URZ99313bJsIJQxYJGQzCZsLMdif0igsIYND9
        GKq3oTMDvVz/f4M/d0k0Rnq0KQTvn2ICvdaKeOo=
X-Google-Smtp-Source: APBJJlFaPtxhyUYUMkVPgI/RNspa61slHwXMJgfQGv1pk+jOi8yxv6Ol1rIxar4ruQ3ax+/aljcDUe08lNnZwj8UI9E=
X-Received: by 2002:a05:6820:1501:b0:560:c558:b6f9 with SMTP id
 ay1-20020a056820150100b00560c558b6f9mr10739878oob.2.1689046992417; Mon, 10
 Jul 2023 20:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <c7b1cb3d-801b-b78f-d203-edd840c9e98a@infradead.org>
In-Reply-To: <c7b1cb3d-801b-b78f-d203-edd840c9e98a@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 11 Jul 2023 12:42:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS53G=c+nsVGT66GXZsTOJqwzLyWtNbXY_FaBcXcG2Vtg@mail.gmail.com>
Message-ID: <CAK7LNAS53G=c+nsVGT66GXZsTOJqwzLyWtNbXY_FaBcXcG2Vtg@mail.gmail.com>
Subject: Re: gconfig help text quesion
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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

On Tue, Jul 4, 2023 at 9:04=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Hi,
>
> The gconfig help text says:
>
> Toggling Show Debug Info under the Options menu will show
> the dependencies, which you can then match by examining other options.
>
> This is at the end of the intro_text string.
>
> I don't see any way to toggle the Show Debug Info flag,
> or even any such flag.


I guess this comment is left-over after
7b5d87215b38 ("gconfig: remove show_debug option")




> Is it hidden somewhere or should this text be removed?

I think it should be removed.




>
> thanks.
> --
> ~Randy



--=20
Best Regards
Masahiro Yamada
