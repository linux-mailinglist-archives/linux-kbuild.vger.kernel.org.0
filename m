Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD05D16907E
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 17:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgBVQuu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Feb 2020 11:50:50 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:50631 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbgBVQuu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Feb 2020 11:50:50 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01MGokUG022778;
        Sun, 23 Feb 2020 01:50:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01MGokUG022778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582390247;
        bh=ntkgHYUYCfIwZNIh8WL84KmzpWPirlhPyraQtzsQYdk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Dyup2KWKIfIIEZ2JS8/N7vw5FHYnQYVHFcchipX13bXB88ywC3RTO+17LPMXaWEZQ
         WBSly9tizmDr+QlJ74VN7Y9JPuOr3yv6xMC3H2tbiSLIf4uQ97jRYe/L/EcxtABdDa
         7MswKFgm03WqAYug/KQfFk7ZFTF01Fr5HwaQf0G4coMlsOJg3LOTopaPaZgzGp5B4n
         xP5RGE4l2Nk1EOZpeFVI4Enm7DQIiKCYGtzI6h8F+9i4IVrEjYAxr1nbO6X7p4fX1V
         a+pzsKvMCBSa789GVoHw5fEwwQJ87lopDW1KCapEWmHQGLpfi6HwQl0gUmihyNaj28
         dyIkwQ80x0VzQ==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id a2so3236286vso.3;
        Sat, 22 Feb 2020 08:50:46 -0800 (PST)
X-Gm-Message-State: APjAAAW0ghFXyxZKhHDoD5RKDz5fL3tryd7KXNLJhjLNWDM5BCyxM0KX
        dYOTbgPXVK8aOWPvsicXT/IsI9U2T+qBxU9y/tU=
X-Google-Smtp-Source: APXvYqyWutBden8aJ3HU4rqJhQ+/ltavj3SvOxpcg7LDa5NGabG42XSuDN8zg7hRQTNqH2n5elTn/BHqmpBgtmFCqyY=
X-Received: by 2002:a67:fa4b:: with SMTP id j11mr23386621vsq.155.1582390245902;
 Sat, 22 Feb 2020 08:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20200221222955.21038-1-robh@kernel.org> <20200221222955.21038-2-robh@kernel.org>
In-Reply-To: <20200221222955.21038-2-robh@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 23 Feb 2020 01:50:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATo6b178Zfj3gOdnicFfP6s5-yNwbPg+CAd4YcKHYdFqA@mail.gmail.com>
Message-ID: <CAK7LNATo6b178Zfj3gOdnicFfP6s5-yNwbPg+CAd4YcKHYdFqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Build DT binding examples with dtc warnings enabled
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Rob,

On Sat, Feb 22, 2020 at 7:29 AM Rob Herring <robh@kernel.org> wrote:
>
> Now that we have a separate rule for DT binding examples, we can customize
> the dtc options. Let's adjust the dtc warnings to me more strict by
> default so the examples get cleaned up as they get converted to schema.
>
> Leaving 'avoid_unnecessary_addr_size' and 'graph_child_address' warnings
> disabled as examples tend to be incomplete and they generates a lot of
> warnings.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  scripts/Makefile.lib | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 78fa1a3d983a..1a149e680308 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -308,6 +308,10 @@ define rule_dtc_dt_yaml
>         $(call cmd,dtb_check,$(word 2, $(real-prereqs)))
>  endef
>
> +$(obj)/%.example.dt.yaml: DTC_FLAGS = \
> +       -Wno-avoid_unnecessary_addr_size \
> +       -Wno-graph_child_address
> +



This does not work since I suggested to
not add this pattern rule in 1/2.


Instead, you can override DTC_FLAGS
from Documentation/devicetree/bindings/Makefile

So, alternative solution is like follows
(on top of my suggestion in 1/2)



diff --git a/Documentation/devicetree/bindings/Makefile
b/Documentation/devicetree/bindings/Makefile
index 7c40d5ba1b51..e44c972849e6 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -12,6 +12,8 @@ $(obj)/%.example.dts: $(src)/%.yaml FORCE

 # Use full schemas when checking %.example.dts
 DT_TMP_SCHEMA := $(obj)/processed-schema-examples.yaml
+# More strict checks for examples
+override DTC_FLAGS := -Wno-avoid_unnecessary_addr_size -Wno-graph_child_address

 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = $(DT_MK_SCHEMA) $(DT_MK_SCHEMA_FLAGS) -o $@
$(real-prereqs)





One limitation for this way is that
you cannot use W=1, W=2, W=3 for example DT.



>  $(obj)/%.example.dt.yaml: $(src)/%.example.dts $(DT_EXAMPLES_SCHEMA) $(DTC) FORCE
>         $(call if_changed_rule,dtc_dt_yaml)





-- 
Best Regards
Masahiro Yamada
