Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7EE972A9FB
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Jun 2023 09:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbjFJHni (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Jun 2023 03:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFJHnh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Jun 2023 03:43:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2173735B0
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Jun 2023 00:43:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7D6660C48
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Jun 2023 07:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05048C433D2
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Jun 2023 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686383016;
        bh=jRowYUxngOD3EZp8k3CU4Tp7JEssc8FM+K/rOCqPsuM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tFucJiHysaYciEnk5WP3hzmBFqCKbr/3k5uslbVxc+2rc2WmkR4CQVFyE5HOZp1hj
         LAVi+8iuKHhYzmfPiLtMI4z7L3/UCAN9oBnUrkPzq+jyH+uacAcctnde755PeCFdcn
         pwRLGwfUzGG+EQ/5cpFPe3tzt4R4Gqm33caRzkUbijzpfVDNOFfXEMTPch6UXLA7Ru
         ISFBEgSjw9H5rVx8FMAxWTOBhNOxYvOLc4TES0u+Q/HS5s20CtTFrHbs3q+FgNrgAu
         XkXaOT6E3v6Bh0Y7wbjyGcLrYWEDWqm0mbya4D+s3fmY6prxrHQ+Gah6mf9zCn3et3
         v5mEq341zWYPA==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-55afa2472d9so1679461eaf.0
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Jun 2023 00:43:35 -0700 (PDT)
X-Gm-Message-State: AC+VfDx9+wF9Qvv3HF+hcDPOM0fMv+SmWyMI6AbvPzgpUrEthlEOY0CD
        fzQm/5xN9AxzUi9WvDROKtfR19T/R6kcIMGRRGQ=
X-Google-Smtp-Source: ACHHUZ79rTf9UXsrE4th6ZKLrgu50hmhwikmXx/fsjY7tO5lxzkWRh3hAFmwd4s0rHPeNtzXPI+lTCb9SYi8ULb2oR8=
X-Received: by 2002:a4a:a3c6:0:b0:55b:b54:781c with SMTP id
 t6-20020a4aa3c6000000b0055b0b54781cmr2136520ool.1.1686383015313; Sat, 10 Jun
 2023 00:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <1912422946.266461.1686045667325.ref@mail.yahoo.com>
 <1912422946.266461.1686045667325@mail.yahoo.com> <1289987364.1419400.1686304232810@mail.yahoo.com>
In-Reply-To: <1289987364.1419400.1686304232810@mail.yahoo.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 10 Jun 2023 16:42:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQJh98XhY_hSaojM6mwF3Cvk9o+dLvd0FurYyNV=v2AsA@mail.gmail.com>
Message-ID: <CAK7LNAQJh98XhY_hSaojM6mwF3Cvk9o+dLvd0FurYyNV=v2AsA@mail.gmail.com>
Subject: Re: About Kconfig tree
To:     P J P <pj.pandit@yahoo.co.in>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
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

On Fri, Jun 9, 2023 at 6:50=E2=80=AFPM P J P <pjp@fedoraproject.org> wrote:
>
> Hello Masahiro,
>
>
> * I've been reading linux/scripts/kconfig sources and trying to understan=
d how it works. I'm wondering if we can read Kconfig sources and build a tr=
ee/graph structure in memory, which can then be traversed by a user.
>
>
> * Is there any code/library under scripts/kconfig/ directory which create=
s such tree/graph data-structure from kconfig source files? Which can be re=
used? OR we'll have to write such a code from scratch?
>
>
> * I'd appreciate your inputs/comments to confirm the same? And any guidan=
ce if we have to write code to create such data-structure.



'common-objs' in scripts/kconfig/Makefile is the core code.

It is not written in a separate library with user APIs.






>
> Thank you.
> ---
>   -Prasad



--=20
Best Regards
Masahiro Yamada
