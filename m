Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF53468AD8E
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Feb 2023 01:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjBEASb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 19:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjBEASa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 19:18:30 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6581E2BB;
        Sat,  4 Feb 2023 16:18:29 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-526f0b3d8d9so49771577b3.3;
        Sat, 04 Feb 2023 16:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ydIEfotXDWwFfNGKcCo/siDYBQ4m/BsbRKkwoVldgw=;
        b=iihm0pPbr1UAhdWY4SkYk0FqK+H7dpLtZiTQipTtSYn0ASJlWlEI406dVHAGI+2XKU
         FuKVASIiRh49l6Mwuy0iMuExFKXfdeXbmB7J5jqYTQgajT3e7Ff2u9D6CCwGLjh6Dxv+
         8NnAlmdqirgPAhPyuds5EsqvaMh2sxieP9iNQszlyEIjpEzZ8N0XE1MgIFxXRy5FMsrG
         n6OgxKV3s12vAh2a+eu98Wym0kwQ6nx48WXjCW6Dfuzj8j6oDJKe93KlwIJjV991clDe
         Y0RKqWoj7uv5yRkxzhCWBHZ0pjrDObeQvCLxUSdcrZADpn/5ouuwV2lrrk/UY8bbpK75
         LT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ydIEfotXDWwFfNGKcCo/siDYBQ4m/BsbRKkwoVldgw=;
        b=XbxiKt4URaLNun0MKgDl+YFUTZE+2QoPuH9b447IjkwjVZnxF/sZK3c9+n3mI6tsOp
         X4xOP1LH6pGlWPPt+Ozl5MBFigohimh/7ZhKXOBy3YadNg2g+G/xnJmYy3CDzuFERQtK
         Xn8tmSCJYNrJEBeo3SYBnY77JpZc8Hi99HhjhFncN/EPHvx+PQyMB+S7Dt1n8NcWQJBz
         /HlxeOrKZRcsQP5+fZRxiHCFS20vfOGlmv2bI8HCU/sLL+f5u3aKUPtIbHALh3kPBhkw
         GS69aUPz5BToMIWiHErLVxnnxid5KEGMMOpu4QPYvRpRNgofOO/wuHU8h7m5N9EYVLxB
         iiUg==
X-Gm-Message-State: AO0yUKV7YtQsddC+7szGhkt54mC8c4vkpI+LsXdueXNQsgDVaGeEzfFx
        gdhTJ22gA161sCGMzEcu6Cl21a0VCQ8px9UaXuY=
X-Google-Smtp-Source: AK7set/KuOPzw7BWG3UKxJVo60sysR6/kcgBObntvbLyPayzsMWI769QsdfcHWaza3lJFiPBTPHwBu3+gKO7wF5GGk8=
X-Received: by 2002:a81:5e41:0:b0:501:2887:8c8e with SMTP id
 s62-20020a815e41000000b0050128878c8emr2100790ywb.256.1675556308450; Sat, 04
 Feb 2023 16:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20230203173704.108942-1-mcanal@igalia.com>
In-Reply-To: <20230203173704.108942-1-mcanal@igalia.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 5 Feb 2023 01:18:17 +0100
Message-ID: <CANiq72ke4GAK40F_vMKhZrpBSpX2xT1ADUxSm8=_+0QciYxVmw@mail.gmail.com>
Subject: Re: [PATCH] rust: delete rust-project.json when running make clean
To:     =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Melissa Wen <mwen@igalia.com>, linux-kbuild@vger.kernel.org,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 3, 2023 at 6:37 PM Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> rust-project.json is the configuration file used by rust-analyzer.
> As it is a configuration file and it is not needed to build external
> modules, it should be delete by make clean. So, delete rust-project.json
> when running make clean.

Applied to `rust-next`, thanks!

Cheers,
Miguel
