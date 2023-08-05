Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFFE770DBD
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Aug 2023 06:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjHEEiY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 5 Aug 2023 00:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHEEiX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 5 Aug 2023 00:38:23 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3998468C
        for <linux-kbuild@vger.kernel.org>; Fri,  4 Aug 2023 21:38:22 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6bca3311b4fso2449582a34.0
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Aug 2023 21:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691210302; x=1691815102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUJDMDidDuTLe0ykXCqzOVWEYvRUe4+HaAVUhNOSJY0=;
        b=e8UaHIPlzrFl34ed40tdJ4LlEUytSYqW73A4Y+BM7Vy+Z1EciqRAE9jS2JkuHfzCt4
         UZ8a6X5urdZuu0aDjAXkFYeD0YRQZL1U56mq5RD06XVCLMaNdfWwXmqbiXJxk6zRLBDJ
         jSR5DWY2UQXTbzBXJARBKmA0UPfOhw4l829a9lXJLWlLibGo/hZbkklGAOEzYffjNVop
         68vqFfSnm9gtBgbuHWgZO3EPm3xSPf/VEWw4oosi2dSldPc5W34Yqe6itMiOgow+s4BW
         uR7O7zf6+ajruknc+CV300ocMU+L0WKwNrWx1Ke9r0Md/rBV1OnkTe+3iEdtATs+B+L8
         t3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691210302; x=1691815102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUJDMDidDuTLe0ykXCqzOVWEYvRUe4+HaAVUhNOSJY0=;
        b=b/AKOOz+ec2naUbQCpIpwTvp1jw+umPwuvmoTvtY9S/PC74yJynwmarGvHaGPopMcW
         d+b3l3D/rA5N5ClK9rjqp1K7gFUy0xAcuIoeA6jXRLiLvhi93gaGpB9WC5P6PCOuYeve
         N/Yo/XXZfNQ7BLt9O4Ppu26tipIr1OHCyC8H9gAPvtaqL2FrppcPo0hxb8q9q14oWHxV
         ++13K8gsy6Y3I0H5u6GHlQJl/vdTXaAXci2iMji0IQKY1Ux8/ivXv0wsszbljccROgu2
         qbs6nOl5IQsEUzeQ9iAK5AzCR1DOxxSpRnImrIvBKSkDzhyfMSMQbaMZZ4IatjsFDtVO
         /y1A==
X-Gm-Message-State: AOJu0Yy4RO8GI4VoENefuJmqogAglYXowR+V6zO0m7TX3/+ixepGprtg
        JI99jq/y9Y6mEJcsWhO/Cr7IM0YGcg2KMT3F2/n+blTv988=
X-Google-Smtp-Source: AGHT+IFM/ajPH05+twIdHKQXUClckMT4qfcbVeROfubFdqUAJ6q42PxLt8ZAM40ogWqvPt6zWxZASTuKLi4+P2FO388=
X-Received: by 2002:a05:6870:73d4:b0:1b0:43b6:e13b with SMTP id
 a20-20020a05687073d400b001b043b6e13bmr4729732oan.54.1691210301786; Fri, 04
 Aug 2023 21:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230805034256.2478162-1-Mr.Bossman075@gmail.com> <1df1527b-6929-eca1-9e6d-8a4d9a2f8b1e@infradead.org>
In-Reply-To: <1df1527b-6929-eca1-9e6d-8a4d9a2f8b1e@infradead.org>
From:   Jesse T <mr.bossman075@gmail.com>
Date:   Sat, 5 Aug 2023 00:38:10 -0400
Message-ID: <CAJFTR8Q2H+Z8pXTx1VNT94=me_rqTunU0sAxZCnKQuqW_3Mt6w@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: Alias mconfig to menuconfig, qconfig to xconfig
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 4, 2023 at 11:54=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> On 8/4/23 20:42, Jesse Taube wrote:
> > All the other menu-based config tools have a one-letter prefix, and
> > are named the same as their respective file,
> > except for mconfig and qconfig. This commit adds an alias for mconfig
> > to menuconfig and qconfig to xconfig.
> >
> > Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> > ---
> >  scripts/kconfig/Makefile | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index af1c96198f49..319cd623acb9 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
>
> > @@ -45,7 +47,7 @@ PHONY +=3D build_$(1)
> >  build_$(1): $(obj)/$($(1)-prog)
> >  endef
> >
> > -$(foreach c, config menuconfig nconfig gconfig xconfig, $(eval $(call =
config_rule,$(c))))
> > +$(foreach c, config menuconfig mconfig nconfig gconfig xconfig qconfig=
, $(eval $(call config_rule,$(c))))
> >
> >  PHONY +=3D localmodconfig localyesconfig
> >  localyesconfig localmodconfig: $(obj)/conf
> > @@ -118,7 +120,9 @@ help:
> >       @echo  '  config          - Update current config utilising a lin=
e-oriented program'
> >       @echo  '  nconfig         - Update current config utilising a ncu=
rses menu based program'
> >       @echo  '  menuconfig      - Update current config utilising a men=
u based program'
> > +     @echo  '  mconfig         - Alias to menuconfig'
> >       @echo  '  xconfig         - Update current config utilising a Qt =
based front-end'
> > +     @echo  '  qconfig         - Alias to xconfig'

Crap how did I miss this.
@Masahiro, can you add that when applying?
I'll take a reviewed-by as a yes otherwise I will submit V2 tomorrow.

>
> Seems to be missing an ending ' mark above... if we need this.
>
> >       @echo  '  gconfig         - Update current config utilising a GTK=
+ based front-end'
> >       @echo  '  oldconfig       - Update current config utilising a pro=
vided .config as base'
> >       @echo  '  localmodconfig  - Update current config disabling modul=
es not loaded'
>
> --
> ~Randy
