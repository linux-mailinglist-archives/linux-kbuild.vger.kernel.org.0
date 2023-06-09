Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7F672A56A
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jun 2023 23:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbjFIVfN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 17:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231661AbjFIVfM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 17:35:12 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBE73A96
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 14:34:56 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-43b315e9024so719778137.2
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Jun 2023 14:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686346496; x=1688938496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7g2CkLL/4yGzWZqO3b6RZAXklev+mp6Fy0i6OZOPQIk=;
        b=EO09QpsjpKrLGL7DHyLbPLp+EWHMBIFl3CGbn03V+M9RmYJaSLIVwEycdhNNy7ifKi
         Ign6Sy4zZkhiHyKeFymndPSMkSJqy2WIMxjqKrZVHDXVM8/juTkKFKs5oT7abFw77Kub
         CESJnLTikhwVXJs3B0OMVH5N4K1kV8OLARSfKfZoePsneLfQvb7kHRyuoE8cy71iwJsx
         f1oJ2gmHelpkOxHNsZaTa/netb0FZAIYUggjQO7No4ttZ/MBVTq6wjP9FzF5tCbL4Bxm
         Y/xedyP3uaKAw4C3o2dv9jSH6U71N4G81qRvBR4lhK2M5uGGSYzE+wCtpNPxQeLbtMxH
         t+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686346496; x=1688938496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7g2CkLL/4yGzWZqO3b6RZAXklev+mp6Fy0i6OZOPQIk=;
        b=JAoAlN6vAhWV0QyQb6mLQamkIifC2prGTLp4X/rTxaPI8fu7eRbBpHAKHdeGFL4gJV
         qe2NACJDa87zgy7J5sREAPYf7s7plCBNsjfD15QlSTWwf2v5Xb4FdSbky1o3rDnA+7pb
         wn9V13FQYVm2rRXzZO+zGndDEoT/esu6zn6/s1EwOCxQfi13tu6/8brzJR/BLH2JkIOD
         wmm6dCKdZaTn+hWuD4eFyzGn4mAIXaM6LuQ8hkZe83grzgWaGsI5v4/Fw02xFSnZ2/bJ
         yXJ8+83Cku4Pav5dnLTH6QvMnlmEhM8TGXhmlKyoW9X+HSqqkLehxli+30ZFr8TfG2wm
         5JJQ==
X-Gm-Message-State: AC+VfDwodM1piQO6mQc0TK+OZy4gO86Vp4vo/cUBcbCUGX+GKFQnt1Q/
        l5awLUtp/d07O1J9c0tAB7zX6IGDresPy4Dx/gJNzQ==
X-Google-Smtp-Source: ACHHUZ4uOlZrQzARsnpEKvHVVeGTzA69TCoAo9WRUuK65g8a56cI413B+BDwzV32gGdkFpzHAkebZEqdVXOVyAdVUe0=
X-Received: by 2002:a67:fc59:0:b0:43b:37d8:2608 with SMTP id
 p25-20020a67fc59000000b0043b37d82608mr1882079vsq.29.1686346495600; Fri, 09
 Jun 2023 14:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230608142428.256985-1-masahiroy@kernel.org> <20230608142428.256985-4-masahiroy@kernel.org>
In-Reply-To: <20230608142428.256985-4-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 9 Jun 2023 14:34:10 -0700
Message-ID: <CAKwvOdmA7oPvUZ-AhY8J9DGk0j5z=xCED8r3Ug=n2S9q-BWb+Q@mail.gmail.com>
Subject: Re: [PATCH v7 03/11] kbuild: generate KSYMTAB entries by modpost
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 8, 2023 at 7:24=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Commit 7b4537199a4a ("kbuild: link symbol CRCs at final link, removing
> CONFIG_MODULE_REL_CRCS") made modpost output CRCs in the same way
> whether the EXPORT_SYMBOL() is placed in *.c or *.S.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


--=20
Thanks,
~Nick Desaulniers
