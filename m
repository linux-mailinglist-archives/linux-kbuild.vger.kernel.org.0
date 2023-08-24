Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164F47879B8
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Aug 2023 22:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243605AbjHXUzc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Aug 2023 16:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243610AbjHXUzR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Aug 2023 16:55:17 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF38B1BD8
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Aug 2023 13:55:14 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-649a653479bso1625116d6.0
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Aug 2023 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=cNir2zO4Jw1bY15AO+BvLzyudCZQgZOZ6wmKu3gTiOE6O5d8uld/TL1ezLjaI6QYbm
         WOGGPHYDU/pK4dxlnF7Ms+FTC/sMRd3w0UHs5vWl7Ok8xxNThnUi40LTsEqvRgt612yt
         78aWAjEVTurY9yP/vzKIVztJ70N6XuOBe4TzTTYoIN4ZaN51LMOSChOtgvQbcVaqgblP
         cXZz8KRbjOvTDGzMC8MqwpETfoHXd3UWkIm9s5iVgENo6DP/sbX4cOh9u7J1okj8PlZZ
         BokMSSDN911JlFclyP8hVqyb+sA6fCfvwhQTmJ3jDmPDMIreFp+riuf57qJzWHHRcB6x
         9FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=e83h2hKIvPXt/SihOnx5pq48wInyKdGPDt2DmlcJ8WzZWOGkqdBnJwBioMqfIS2Riv
         0ZaoUWXHFDsaA+iYBxsWLmGGS6GELEj9tkcvdWjzu1ZEUKMsNNDbdpg7eel3q0USAbI+
         wGUmEMnTj4fDtCAvfxOPiHOEG+HFcZeiA+3mRcAg2uODc1AJOvGS4C4qsIc+jt/2EhGD
         ueZsFY5HO1bnIvMCp4fV0YzDB1yXHeqi4ZzUVz2YWLupMuJIYO/u0+exuQNR0MAX6vnz
         8C/WYoq66x109IYKLOiDtMoSJYlEEdJVhEN2BjoKIovS3XmXKV2LMVbf5QQNgEvleupV
         VgLw==
X-Gm-Message-State: AOJu0YwUfyS3jYMaQyaIVjwWtXJHzz18FuKhlftvm+RbzXz6s3rWdBFT
        36EAhl34JfvlKYqiBoIt+HTxSsfn34edv7wZZsJiTpQXOFltMZI4x3I=
X-Google-Smtp-Source: AGHT+IGp1K8B09Bdl+oZ3RkqbVetgjSDMnQuEIy2o3NTYbqmOnwJtltpQ9JU5CwHn6kcCYZRMLaYXjyuarXlr9l4qDA=
X-Received: by 2002:a0c:e2ca:0:b0:64f:3b07:c50a with SMTP id
 t10-20020a0ce2ca000000b0064f3b07c50amr13629295qvl.58.1692910513818; Thu, 24
 Aug 2023 13:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
In-Reply-To: <20230824184910.GA2015748@dev-arch.thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 24 Aug 2023 13:55:03 -0700
Message-ID: <CAKwvOdkas2gmcyVKSp0DSXC56jxUB1HW8XRYKVBfS0sz3MSi5w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, Tom Rix <trix@redhat.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 24, 2023 at 11:49=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Thu, Aug 24, 2023 at 11:03:17AM -0700, ndesaulniers@google.com wrote:
> > -We provide prebuilt stable versions of LLVM on `kernel.org <https://ke=
rnel.org/pub/tools/llvm/>`_.
> > -Below are links that may be useful for building LLVM from source or pr=
ocuring
> > -it through a distribution's package manager.
> > +We provide prebuilt stable versions of LLVM on `kernel.org
> > +<https://kernel.org/pub/tools/llvm/>`_. These have been optimized with=
 profile
> > +data for building Linux kernels. Below are links that may be useful fo=
r
>
> Maybe make a note of why this matters? ", which should lower kernel
> build times compared to non-optimized LLVM toolchains."?

Oh, I forgot to address this in v2. Will send a v3.

--=20
Thanks,
~Nick Desaulniers
