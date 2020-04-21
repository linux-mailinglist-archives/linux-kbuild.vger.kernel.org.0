Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9A61B315B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 22:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgDUUks (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 16:40:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbgDUUkr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 16:40:47 -0400
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B972020736;
        Tue, 21 Apr 2020 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587501646;
        bh=WPjD7z+S47NsJvoNNpoPjH0JcfobjHHPouuiRtqoLlc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=X/LSmDV89g9lH05MfV5FMdtZH65HJR472W7TAL+iEb6Pf4nMNLm04XdA5cCaoYo1c
         ugEC8Z3Ks5QtlYmaErTH9zLTdd1jRF4n3C8Kohw+8OUHS2b2ctFYnJJao6VSPVLnWo
         /FueaH64nNWtyv//yxWjI9jkp6/JoUqNXVd/vzMA=
Received: by mail-qk1-f178.google.com with SMTP id n143so137978qkn.8;
        Tue, 21 Apr 2020 13:40:46 -0700 (PDT)
X-Gm-Message-State: AGi0PuaixUajdiPHqy2qAs8a1fpsQhFzVSTM7l3a0/lIoNzJ94fp3vKm
        BcZfA5dJespPmUZ4CAZ3T5C7v2++caNr7dMAeg==
X-Google-Smtp-Source: APiQypL9lEqMBY0g413ztkmJhsz03wf/mRAORfH1azvObhx0AAUgen3X/vzkaMm75SfIg4yUiygGsZgd1mZKVDmeAoM=
X-Received: by 2002:a37:c43:: with SMTP id 64mr21464433qkm.119.1587501645887;
 Tue, 21 Apr 2020 13:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com> <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
 <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com> <CAL_JsqKV4UQeSX1ArJb4es1_kkMp1kbkd2kd17qVc=Oy988F7Q@mail.gmail.com>
In-Reply-To: <CAL_JsqKV4UQeSX1ArJb4es1_kkMp1kbkd2kd17qVc=Oy988F7Q@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Apr 2020 15:40:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJRsqCW20o3tAxMWE=dQrxts7jG7P=3yfDDx7HP+w38rQ@mail.gmail.com>
Message-ID: <CAL_JsqJRsqCW20o3tAxMWE=dQrxts7jG7P=3yfDDx7HP+w38rQ@mail.gmail.com>
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

On Tue, Apr 21, 2020 at 2:31 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 21, 2020 at 11:57 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi Rob,
> >
> >
> > On Tue, Apr 21, 2020 at 11:01 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > It seems to only fail with out of tree builds (O=...). I expect that
> > > > failures will become more common the more YAML bindings we have, even
> > > > without long directory names.
> > >
> > > dt-mk-schema can take and recurse a single directory already, so does
> > > this fix it for you:
> > >
> > > @@ -22,7 +22,7 @@ $(obj)/%.example.dts: $(src)/%.yaml
> > > check_dtschema_version FORCE
> > >  DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
> > >
> > >  quiet_cmd_mk_schema = SCHEMA  $@
> > > -      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> > > $(real-prereqs)
> > > +      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> > > $(srctree)/$(src)
> >
> >
> > I am just curious.
> >
> > How come the tool excludes 'processed-schema*' and '*.example.dt.yaml'
> > from $(srctree)/$(src) ?
>
> Uggg, it wouldn't. Can't everyone build out of tree. ;) I guess the options are:
>
> - Call dt-mk-schema on each file individually appending the result
> - Make dt-mk-schema take stdin or a file with a list of files as
> Masahiro suggested
>
> I'd like to avoid a dt-mk-schema change so I'll try to make the former
> work. It's only been a day since adding a minimum version. :(

Laurent, does this work for you? I've reproduced the problem, but just
double checking.

 DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml

 quiet_cmd_mk_schema = SCHEMA  $@
-      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
$(real-prereqs)
+      cmd_mk_schema = $(file >$@.tmp, $(real-prereqs)) \
+                      cat $@.tmp | xargs $(DT_MK_SCHEMA)
$(DT_MK_SCHEMA_FLAGS) -o $@

 DT_DOCS = $(addprefix $(src)/, \
        $(shell \
