Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6781468ABC6
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Feb 2023 18:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbjBDR7x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 12:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbjBDR7x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 12:59:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB77298E7;
        Sat,  4 Feb 2023 09:59:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 895F960686;
        Sat,  4 Feb 2023 17:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2172C433A4;
        Sat,  4 Feb 2023 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675533590;
        bh=MLnsESm7KSQ2KfPXfR012odIlm0gBxMg3JoRosyTJhY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rXv871YHlgznr9YfoKdQITVF9FD49IBIspiDTgXiOuM8LAHVXISM7LDTAXQppzf/L
         vavrwTGHUchKeEauczTL2qMx6iEd/EAehk8qjChyoYn6+iXriS1Yeex71UPPUVTDbD
         QCKFYtK6XjDiegnymob/YnTDKr7gxL4CK8PN7UjG6ABoDFGxJWD34b0kRLV8SALQ5V
         bVG0z5MmyJgYqVVghDeTorqIPevQO9y+ZfSROBO48a0CeNxpOSGaS30/H9zKmEFAS9
         S9s5HDQf5GrV0Ge+AmHvxi7hNIr8QctHjmG83NqnAx8EkAAGnNVpey17nTSrNY4+We
         RyNH1FdLEp0ZA==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-16a27344a17so1100092fac.4;
        Sat, 04 Feb 2023 09:59:50 -0800 (PST)
X-Gm-Message-State: AO0yUKXmt36k8SIeTrZhaUOw7hOHSUIyG/0NXUeE663AhBREME14kQAt
        YP5R+ZrU2eE9FyQvOYM4lsz2VSdqZwCssRV+HfY=
X-Google-Smtp-Source: AK7set9WUyVpJZAxcRQpZN7Jg4Mae+qUHgTJZY/+DnKYzpSuLLdSbWUsG47wdSL/jAFUoa1GRLmyZXa+cFxVcfEjpZg=
X-Received: by 2002:a05:6871:151:b0:163:a45a:9e41 with SMTP id
 z17-20020a056871015100b00163a45a9e41mr808623oab.194.1675533590117; Sat, 04
 Feb 2023 09:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20230203173704.108942-1-mcanal@igalia.com> <CANiq72mzpKCnf=LDhiHEJ6x7Zx3AhkY7jH3EUo+Fg4ig5e44YA@mail.gmail.com>
In-Reply-To: <CANiq72mzpKCnf=LDhiHEJ6x7Zx3AhkY7jH3EUo+Fg4ig5e44YA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 5 Feb 2023 02:59:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATqPK+weiRwjKzQazQ7usu+GXbx4tz7q10Yaajn+6=dDg@mail.gmail.com>
Message-ID: <CAK7LNATqPK+weiRwjKzQazQ7usu+GXbx4tz7q10Yaajn+6=dDg@mail.gmail.com>
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 4, 2023 at 5:08 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 3, 2023 at 6:37 PM Ma=C3=ADra Canal <mcanal@igalia.com> wrote=
:
> >
> > rust-project.json is the configuration file used by rust-analyzer.
> > As it is a configuration file and it is not needed to build external
> > modules, it should be delete by make clean. So, delete rust-project.jso=
n
> > when running make clean.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/939
>
> Thanks Ma=C3=ADra! I will add a tag with Bj=C3=B6rn as a `Suggested-by`, =
if he
> is OK with that.
>
> Cheers,
> Miguel


Miguel,

Are you applying this to your tree,
or do you want me to pick this up?

For the former case,

Acked-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada
