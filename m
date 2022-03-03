Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2F14CC55E
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Mar 2022 19:41:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235797AbiCCSmW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Mar 2022 13:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235792AbiCCSmV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Mar 2022 13:42:21 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FCD43A73E
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Mar 2022 10:41:35 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id r20so7996622ljj.1
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Mar 2022 10:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X+bdG8oq1H6/aUnJciOgA74gwshFz66gJB5eQKnp8Ok=;
        b=CYJilK9gZn72SSDzyPFgXwQvqQzgq4+msBhizhleAPt/46c51IFkVj7OiPfMkcggxS
         zgwPowZsx/Fch0FyAxBjN/pMrvkHyrjePqZx4Obi/sjYvZK7xpj7b0LAYLvqSLAME0na
         fAXsUoR9II5hPxAHlKaHc+rhXRQPRJ0p9L0e3r3newuZKu79kz6kSGfYCSUtEjRJA9jk
         QzONQnoQ45G0kpubRQt4Hdpx0GdLKWmeMKeOaVUFnNXiA3JHU+D8VDGeqi0LgvIoLFqt
         c7kaYBXxTjZ7nPv0Y0OXZ659xYswGMM0X4k/dTN6o4bzsFg3CRSD2G7lzQwOlb/TSVoi
         O1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X+bdG8oq1H6/aUnJciOgA74gwshFz66gJB5eQKnp8Ok=;
        b=he3qxVcoEsLWgsKIGKSrBEznZvpsqqt/KHdDCL8wE9DOFeN5qmeC3+kViPBOMvLha0
         JDFkPVeEYAcoccnc6nyNJZXQ8AvlnBihMfhMqLZNMugWNobTZpiJFbPVwFYBxMsqzhrL
         xhjOjPqTfyh27MPXF/2x6k04b/R5z+JW1WU2yS07jWQpZJVg332nzIT67nv/TRDiKNDh
         ON+YRdx8sBwdYEa+TsE2+6Plwq7KNM+HupasHN2srD0RCYhkQ89pqpR951L+J992nSep
         GXwDhs1vnKUXyy9KvO3PXuw9YbCAQW02Ez/2yxAvuxA6n6Vl9ajXP60A8G6AleuXOU4Z
         ofIA==
X-Gm-Message-State: AOAM533EORnmTcF0SkfRc4kyyNHu8tMJv+MrObHHaj3mLn4NuddGO5K+
        /WIbIYvkU+/B8XiIBUxUk4OrUe+bev6ASoi7hAEJeg==
X-Google-Smtp-Source: ABdhPJz0UC7oDFxNw9Swy+2XXfpLSCAUbuM+aYXSo/9oBFDrSwb3jYlCaT80zR8uv7PaXUwAKZ8lHKhKCCd9qiIq178=
X-Received: by 2002:a2e:871a:0:b0:246:ee2:1109 with SMTP id
 m26-20020a2e871a000000b002460ee21109mr23677899lji.165.1646332893237; Thu, 03
 Mar 2022 10:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20220302102705.15c32822@gandalf.local.home> <20220302193638.11034-1-ctshao@google.com>
 <CAKwvOdkWcu5ZPADGieb1Vb+kTbfHNzFAa3FXTWC98xXtzuLwqQ@mail.gmail.com> <20220303074243.29ca40c2@rorschach.local.home>
In-Reply-To: <20220303074243.29ca40c2@rorschach.local.home>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 3 Mar 2022 10:41:21 -0800
Message-ID: <CAKwvOdnHioO_tjBbA0Dzghr-kcXywp-OEROkoCYTcq8STonFVA@mail.gmail.com>
Subject: Re: [PATCH v2] config: Allow kernel installation packaging to
 override pkg-config
To:     Steven Rostedt <rostedt@goodmis.org>,
        Chun-Tse Shao <ctshao@google.com>
Cc:     devicetree@vger.kernel.org, frowand.list@gmail.com,
        jpoimboe@redhat.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, peterz@infradead.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-18.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 3, 2022 at 4:42 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 2 Mar 2022 13:48:01 -0800
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > I'm ok with this patch; a quick grep though shows a few more open
> > coded instances of pkg-config.  Should we fix those up, too? i.e.
> >
> > certs/Makefile:92:HOSTCFLAGS_extract-cert.o = $(shell pkg-config
> > --cflags libcrypto 2> /dev/null)
> > certs/Makefile:93:HOSTLDLIBS_extract-cert = $(shell pkg-config --libs
> > libcrypto 2> /dev/null || echo -lcrypto)
> > scripts/kconfig/gconf-cfg.sh
>
> For this patch set, the above is probably good enough to do (and test
> with a make allmodconfig).
>
> > tools/perf/Makefile.perf
> > tools/ in general
>
> I would hold off on doing tools for a separate patch. With the
> exception of objtool most of tools is not needed for the build process.

SGTM

-- 
Thanks,
~Nick Desaulniers
