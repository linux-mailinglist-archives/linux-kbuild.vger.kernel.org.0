Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D272B79C31E
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Sep 2023 04:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234011AbjILCkV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Sep 2023 22:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239094AbjILCkH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Sep 2023 22:40:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A2DA224783
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Sep 2023 19:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694484255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BH+/X6+us+C2Sv1WTpowJCU4Y6vxr+AqH+IpewujWXA=;
        b=ejXfe8gRL/G/WUFxbw7ImP/8R0Pd5huzcZVuBGVkBHE2MoK5ptk1I1NohdD0xFCdOBBhNL
        kwCTZry+mK0eRolco/XV5HUyBd5IdbZUYNNxpdjPcQYTxCrdyQybK5ZFU1MOQQwF4qBYLt
        8b2b0vFjZFC5MtGKBRmmLidKqTNNTxg=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-43CQXuDwM7CzEEczZ3XzAw-1; Mon, 11 Sep 2023 19:44:08 -0400
X-MC-Unique: 43CQXuDwM7CzEEczZ3XzAw-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1c09d82dfc7so61092965ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Sep 2023 16:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694475847; x=1695080647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BH+/X6+us+C2Sv1WTpowJCU4Y6vxr+AqH+IpewujWXA=;
        b=kAdkx9QeRqFn+ccC6z3JEr7WpdhCeld3bK2HEq1itzaXeILJy5s8wMHcTmchKtu74X
         ShSybZjE6yW89AtFogqavjydm3SIvK5A0umuGAGEUbA+rvQQo0mEXuaPkwLUJHkdJYmy
         niEtn+pajtY0badRTodnvbAcsAsDGDCS5Og8ej3z5c7YdVjqz2sPm0z6ndEcC06ljLRL
         wfNcWz+mzoP1xy53plcuuHvFtSiHxqGnu1zsILpJ4seIdrS5x6bW9NOKBsMNi48n9QTJ
         rVef3TLSk1CmTnfDSbO2owliZq4AN9xcUsWTZ5Xc8tHpRtoCm+uac2nZivdMfn4+oPJg
         3MVA==
X-Gm-Message-State: AOJu0Yw6M8DEL56awBlvgAcGssS9l140ahLcKwWdBMkMt4TQwsjZSru+
        gPHknIt9/VLEwx+lpElWy1pI5+XTKq6Bf1a6dRfhQduur3jvAeTvBoU7cKubj5gF40njrkYH4D5
        FOeZoH7sZS+qv1mz7DtcXx2wfx3n9UGpHJE42BHViDb3Q5P++
X-Received: by 2002:a17:903:2450:b0:1c0:b84d:3f73 with SMTP id l16-20020a170903245000b001c0b84d3f73mr10391963pls.53.1694475846926;
        Mon, 11 Sep 2023 16:44:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn7eAyTlkQCrUG+tz74oJzeVrF1RuMLnJWV4zMybfdK4nys8wn27JtmSwAkBl96ENakLemQeTLp2nPL32bjuk=
X-Received: by 2002:a05:620a:4416:b0:76d:83ae:fdcd with SMTP id
 v22-20020a05620a441600b0076d83aefdcdmr13700304qkp.57.1694475364812; Mon, 11
 Sep 2023 16:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230911193752.27642-2-leobras@redhat.com> <85563fd1-b9c1-60a9-24bc-4e5f7ee3bea4@infradead.org>
In-Reply-To: <85563fd1-b9c1-60a9-24bc-4e5f7ee3bea4@infradead.org>
From:   Leonardo Bras Soares Passos <leobras@redhat.com>
Date:   Mon, 11 Sep 2023 20:35:53 -0300
Message-ID: <CAJ6HWG4D9LcChS3_LY7JaFm8wrOwzvyRcU2K_A8q+UgFVY15qQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] scripts: Introduce a default git.orderFile
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 11, 2023 at 7:58=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 9/11/23 12:37, Leonardo Bras wrote:
> > When reviewing patches, it looks much nicer to have some changes shown
> > before others, which allow better understanding of the patch before the
> > the .c files reviewing.
> >
> > Introduce a default git.orderFile, in order to help developers getting =
the
> > best ordering easier.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >
> > Please provide feedback on what else to add / remove / reorder here!
> >
> >  scripts/git.orderFile | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 scripts/git.orderFile
> >
> > diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> > new file mode 100644
> > index 000000000000..3434028be2f2
> > --- /dev/null
> > +++ b/scripts/git.orderFile
> > @@ -0,0 +1,31 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +# order file for git, to produce patches which are easier to review
> > +# by diffing the important stuff like header changes first.
> > +#
> > +# one-off usage:
> > +#   git diff -O scripts/git.orderfile ...
> > +#
> > +# add to git config:
> > +#   git config diff.orderFile scripts/git.orderfile
> > +#
> > +
> > +MAINTAINERS
> > +
> > +# Documentation
> > +Documentation/*
> > +*.rst
> > +
> > +# build system
> > +Kbuild
> > +Makefile*
> > +*.mak
>
> Can we have Kconfig* here also?

Sure!

Thanks for reviewing!

> thanks.
>
> > +
> > +# semantic patches
> > +*.cocci
> > +
> > +# headers
> > +*.h
> > +
> > +# code
> > +*.c
>
> --
> ~Randy
>

