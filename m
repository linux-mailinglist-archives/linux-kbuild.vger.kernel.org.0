Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38367374742
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 May 2021 19:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234165AbhEERyT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 May 2021 13:54:19 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52611 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbhEERxl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 May 2021 13:53:41 -0400
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 145HqREB017289;
        Thu, 6 May 2021 02:52:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 145HqREB017289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620237148;
        bh=18ou+g7OK3u3gkUuE5/R5rN8Vplhh/fI5mnkpi7CnZM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NCsb5lo1QosYExCTDPuYOIqfDL1JCs58WQuOxYf/59ITfGaDfvYl+z5PBS3i8yBbj
         4dRdvdbS+GVRvlB826wJMeCA+B/cpMA60u0sal8JTLlq4tHMpBK3WD13itF9SqrWtm
         OwKPOdY4W7Ad8JP1IWR9UJNUr2ABowsXLuHQstrsSfQVc8DCC5+EEoRr6BoVz8eRAm
         j8QovC8pFfsHO8RMYJW369iNaeTucFbRpWCVjYE5p8PLbECNOLvMh95th7PCeCoIKn
         7B0jgSm8Z2tkVGElAzhBk9pUNB+33H36aDfztNKtsllc+jwtoLtv8bJd0O7EavuKj+
         5CzJdirlJXbpg==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id s22so2315396pgk.6;
        Wed, 05 May 2021 10:52:28 -0700 (PDT)
X-Gm-Message-State: AOAM532sgeI/px8KO3qNYaQB1uwFa3UKqWKW7SrC9vdNrsGt3qjZqKGq
        q43XSoxiL0hz1Y5vSf1lC0rZhkIRijaLK9W0RMM=
X-Google-Smtp-Source: ABdhPJxLDcLruVdNClMyGG+e/5NXyEcB4TVe8Gf5ERvv4Kcw+wyW0ic+fLdN/Lk4jB++81hOxUlCjXOkyUxxINIO5GA=
X-Received: by 2002:a63:e044:: with SMTP id n4mr121371pgj.47.1620237147212;
 Wed, 05 May 2021 10:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210502180957.3419490-1-masahiroy@kernel.org>
In-Reply-To: <20210502180957.3419490-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 6 May 2021 02:51:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4F9aSF2hZPVmy1vFOFRyOvMsrGtxKN0AMEB9Jp6Dtpw@mail.gmail.com>
Message-ID: <CAK7LNAS4F9aSF2hZPVmy1vFOFRyOvMsrGtxKN0AMEB9Jp6Dtpw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: parameterize the .o part of suffix-search
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 3, 2021 at 3:10 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The suffix-search macro hard-codes the suffix, '.o'.
>
> Make it a parameter so that the multi-search and real-search macros
> can be reused for foo-dtbs syntax introduced by commit 15d16d6dadf6
> ("kbuild: Add generic rule to apply fdtoverlay").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.


>  scripts/Makefile.lib | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 64daf37e874b..88b446ed6532 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -44,19 +44,22 @@ else
>  obj-y          := $(filter-out %/, $(obj-y))
>  endif
>
> -# Expand $(foo-objs) $(foo-y) by calling $(call suffix-search,foo.o,-objs -y)
> -suffix-search = $(strip $(foreach s, $2, $($(1:.o=$s))))
> +# Expand $(foo-objs) $(foo-y) etc. by replacing their individuals
> +suffix-search = $(strip $(foreach s, $3, $($(1:%$(strip $2)=%$s))))
> +# List composite targets that are constructed by combining other targets
> +multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $m)))
> +# List primitive targets that are compiled from source files
> +real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $(call suffix-search, $m, $2, $3), $m))
> +
>  # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
> -multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2 -), $m)))
> -multi-obj-y := $(call multi-search,$(obj-y),-objs -y)
> -multi-obj-m := $(call multi-search,$(obj-m),-objs -y -m)
> +multi-obj-y := $(call multi-search, $(obj-y), .o, -objs -y)
> +multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
>  multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
>
>  # Replace multi-part objects by their individual parts,
>  # including built-in.a from subdirectories
> -real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2 -), $(call suffix-search, $m, $2), $m))
> -real-obj-y := $(call real-search, $(obj-y),-objs -y)
> -real-obj-m := $(call real-search, $(obj-m),-objs -y -m)
> +real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
> +real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
>
>  always-y += $(always-m)
>
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
