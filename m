Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9208D1B2D97
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 18:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729263AbgDUQ5d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Apr 2020 12:57:33 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58547 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgDUQ5d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 12:57:33 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 03LGvEj5031859;
        Wed, 22 Apr 2020 01:57:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 03LGvEj5031859
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587488235;
        bh=0MIZIdr4fBCK3Yoce+UMPDPVNmXUHKOW6MWFJWH0lAQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qsCRW5Bw27iY40H7KR5uIdSgpBFGAJfjIaxK7Z1S8hYL72GOz+gdAElRC2mrVJ9M4
         xIeoGnBQJewGHqa7+cr94Y0pL5pZDVBpjGC6qbbhg8SnhubKlWTDpEDBIHAfMzeKqs
         X6CytiYmi14Iga2NC6Wt1Uho0zC/PKMQv8bzmwlHM+C0dMq0VbPBvXW/uMhzQ8yayU
         VzcWahZF2rwnZBKsxxlATWpDse4gik/HC5UfjcLS8d70ZvLi4QuEhGulGOpMjL6RHA
         1bQrd3St86PYKKkuTW2Nu7cppB4KT0ihANxv+Vqj4evhWBalntvL8cgLIjeJNO34ZO
         DA0cET3ollb4g==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id y10so620739uao.8;
        Tue, 21 Apr 2020 09:57:15 -0700 (PDT)
X-Gm-Message-State: AGi0PuZWcMSx+CuloHSEbnC+gbzYzcNAeh6fj03I7GHsL3lSBms8uIll
        L7DDT83ib5iLegLnO1DDxrrKS6L9t5KKFb4UBcI=
X-Google-Smtp-Source: APiQypJTwwiXGd5ZdKfg7M8ctVP8B4S8M+FevkD4FoRWpvVGUV/Zo52e5fsFqmYhdH7wmh+sMLm27fTKLVLn4dMu514=
X-Received: by 2002:ab0:1166:: with SMTP id g38mr11765307uac.40.1587488234071;
 Tue, 21 Apr 2020 09:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com> <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
In-Reply-To: <CAL_JsqJQpwN4tH0KWOB1s6NWf3sRqqGRsRiKazi=CJGCwb2T+Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Apr 2020 01:56:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com>
Message-ID: <CAK7LNASe9ahgo04=cAuXcsaoffb9CtnUCYOObJd5=Awaak+YZw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
To:     Rob Herring <robh@kernel.org>
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

Hi Rob,


On Tue, Apr 21, 2020 at 11:01 PM Rob Herring <robh@kernel.org> wrote:
> >
> > It seems to only fail with out of tree builds (O=...). I expect that
> > failures will become more common the more YAML bindings we have, even
> > without long directory names.
>
> dt-mk-schema can take and recurse a single directory already, so does
> this fix it for you:
>
> @@ -22,7 +22,7 @@ $(obj)/%.example.dts: $(src)/%.yaml
> check_dtschema_version FORCE
>  DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
>
>  quiet_cmd_mk_schema = SCHEMA  $@
> -      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> $(real-prereqs)
> +      cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
> $(srctree)/$(src)


I am just curious.

How come the tool excludes 'processed-schema*' and '*.example.dt.yaml'
from $(srctree)/$(src) ?





-- 
Best Regards
Masahiro Yamada
