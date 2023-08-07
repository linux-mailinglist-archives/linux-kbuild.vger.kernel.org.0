Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1327772E59
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Aug 2023 20:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjHGS6W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Aug 2023 14:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbjHGS6U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Aug 2023 14:58:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33E11FC8
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 11:57:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D37A962155
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 18:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B358C433CB
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 18:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691434662;
        bh=16AXJTfadC+k4eaBmP7aCsZ5kIEvivNfsQhZqOROj3c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bQLVhKUZTNfXXXTUWA1vLHjrcBYSOfij3+Qp1RsAuMrG+Ue4YXS1Iuq34mhBL3HZw
         zBgrUB+saaUUmB2V7z/4pxmvnfomHTfNGVcKFr45VZcAMp+HKtHpbZzlUJqb+mR8AY
         ahA4dj6PM6OotgUVJtQD6TbUTZPze6ZOeHinxwZ+nGO18lpp4aayJdx/A7Ynp6+MqO
         Bln+Vo3CRSFhBmeRXIYJx3VTPXdBxeWGXKrYY2LRmomz9gms34un9brmwoJQHJsoAu
         EDvb9wXzjll8QYfPYNmntDV9+lBnhIg65S/OEk1+FFVnlcR8M+vBDbleYRVPDKABEm
         10MP+YM71dD6A==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1bbdddd3c94so3718716fac.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Aug 2023 11:57:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywh8U80EbUpbRoAl9kJQ+DADGpNrZ1S8ItUsoAerFScjZOOZYlX
        K4eVqxVE/3s4uPw1Laiod/TE8RzgIJeubcsdUwA=
X-Google-Smtp-Source: AGHT+IE/kQfAutrIT1nYiXko4IqLYx4nos5NmIxZYz6zPlZbbmJ7hhFuWy5jrwj5oOQggWlttMgfByvETZqLigoI5Ss=
X-Received: by 2002:a05:6870:5494:b0:1be:e1d9:6f88 with SMTP id
 f20-20020a056870549400b001bee1d96f88mr12279170oan.40.1691434661613; Mon, 07
 Aug 2023 11:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230730233415.4178504-1-Mr.Bossman075@gmail.com> <CAK7LNASJvYOVpYV3GY54vT2KALGTd5fPd-qvaqC2ni-Mq_aGZw@mail.gmail.com>
In-Reply-To: <CAK7LNASJvYOVpYV3GY54vT2KALGTd5fPd-qvaqC2ni-Mq_aGZw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 8 Aug 2023 03:57:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQyKG0-fnvPHGPT4znKQLuu9HBMcsTwkvatUtYocZXFxQ@mail.gmail.com>
Message-ID: <CAK7LNAQyKG0-fnvPHGPT4znKQLuu9HBMcsTwkvatUtYocZXFxQ@mail.gmail.com>
Subject: Re: [PATCH v3] scripts: kconfig: nconf: Add search jump feature
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 1, 2023 at 8:12=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Mon, Jul 31, 2023 at 8:34=E2=80=AFAM Jesse Taube <mr.bossman075@gmail.=
com> wrote:
> >
> > Menuconfig has a feature where you can "press the key in the (#) prefix
> > to jump directly to that location. You will be returned to the current
> > search results after exiting this new menu."
> >
> > This commit adds this feature to nconfig, with almost identical code.
> >
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > ---
>
>
> Applied to linux-kbuild. Thanks.


I take this back.

As Randy pointed out, this has some flaws.
Please fix the reported problems and submit v4.


> > +                       if (extra_key_cb) {
> > +                               size_t start =3D (size_t)(get_line(text=
, start_y) - text);
> > +                               size_t end =3D (size_t)(get_line(text, =
start_y + text_lines) - text);

One more request.

I believe the casts '(size_t)' are unneeded here.
Please drop them.




--=20
Best Regards
Masahiro Yamada
