Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600011B305C
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 21:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgDUTbd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 15:31:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:35266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbgDUTbd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 15:31:33 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 781A72074B;
        Tue, 21 Apr 2020 19:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587497492;
        bh=FbedF9MkS5eUgPiKSYbu2gEhsu/YFqRKU2igx1LyO0A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=heh7HSg0OO64M2XG26/1/H7Oyc2lGiZMLU3ctWLMjlBATqKdQ+oKtEuw79g7TPuuX
         ni5S9ABu+Pcl8TRa74jXlwPCWOhIgEhkx/VuVt+4Rer7X20zdyhMZDtndDzN0qPA7G
         gkzwg90dVHF6QaHFW5p9G5n/JVJSu7bj1uoGr+KA=
Received: by mail-qk1-f173.google.com with SMTP id x66so15764017qkd.9;
        Tue, 21 Apr 2020 12:31:32 -0700 (PDT)
X-Gm-Message-State: AGi0Pua9gKhpMXo5Jo534kblIwhb2uYQAc48cy+ZB9ocLzYR4K0j2q1M
        ERHtSprdzr4hJC9yqKduqezcghDoqBP63sIonA==
X-Google-Smtp-Source: APiQypK+SNrDy3Sm4PczTJQzUksQronXA87RGw2UOqjJ46tD8crLtew/o7kmZa8CWFruSj8e2XxBtDl12SpaD3UpgRg=
X-Received: by 2002:a37:61cd:: with SMTP id v196mr22897372qkb.393.1587497491552;
 Tue, 21 Apr 2020 12:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com> <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
 <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com>
In-Reply-To: <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Apr 2020 14:31:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKV4UQeSX1ArJb4es1_kkMp1kbkd2kd17qVc=Oy988F7Q@mail.gmail.com>
Message-ID: <CAL_JsqKV4UQeSX1ArJb4es1_kkMp1kbkd2kd17qVc=Oy988F7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 21, 2020 at 11:57 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Rob,
>
>
> On Tue, Apr 21, 2020 at 11:01 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > It seems to only fail with out of tree builds (O=...). I expect that
> > > failures will become more common the more YAML bindings we have, even
> > > without long directory names.
> >
> > dt-mk-schema can take and recurse a single directory already, so does
> > this fix it for you:
> >
> > @@ -22,7 +22,7 @@ $(obj)/%.example.dts: $(src)/%.yaml
> > check_dtschema_version FORCE
> >  DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
> >
> >  quiet_cmd_mk_schema = SCHEMA  $@
> > -      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> > $(real-prereqs)
> > +      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> > $(srctree)/$(src)
>
>
> I am just curious.
>
> How come the tool excludes 'processed-schema*' and '*.example.dt.yaml'
> from $(srctree)/$(src) ?

Uggg, it wouldn't. Can't everyone build out of tree. ;) I guess the options are:

- Call dt-mk-schema on each file individually appending the result
- Make dt-mk-schema take stdin or a file with a list of files as
Masahiro suggested

I'd like to avoid a dt-mk-schema change so I'll try to make the former
work. It's only been a day since adding a minimum version. :(

Rob
