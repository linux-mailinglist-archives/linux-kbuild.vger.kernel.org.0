Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B345A23D563
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 04:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgHFCWg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Aug 2020 22:22:36 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:31210 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbgHFCWf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Aug 2020 22:22:35 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0762MGfW005242;
        Thu, 6 Aug 2020 11:22:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0762MGfW005242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596680537;
        bh=sgC4wMyOXq1SDJpZeZcw2hSX1e75t3MVK4Q+P0k1NLU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oaL/Czqy1sTqI7z/ObQV9/lXX2n8BmBIaC55qwNhyYOuM7TuOWQvX3Wn4URhTSABg
         pZD9NbDOJX7sGZGga+hZS8Re+rlHthMrg8oXTv6PKMBY8NYe8EFT1iU+Ua0N2jDHob
         0JfkimM3iXn2iTD621RqFY69Q+RAKPuFhhR5Tt6pZ0QETglHi0lKTwT2nDg/ELnKOI
         9Nx5hY2Bh66gkPh0gpZdPfa/W4N3Jkhf+nWtWFPLVGxmlNYrl1aNee3UGlBZPz/ScJ
         SFNvHsxxTfhOJV0bDXe43O+1YvO/eDsEcPl0Z61NRj/OWMXb7zdnU9reyxi0pmeKXZ
         pFPll+yblEPjQ==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id p27so10107806uaa.12;
        Wed, 05 Aug 2020 19:22:17 -0700 (PDT)
X-Gm-Message-State: AOAM532sa46h1RZflJtgXi8AtXlcFuSU8HfcuuRDu33tmi1uNowfibT8
        o6Pr0TdUHR+I03PSByV65qQCpqCiSsBS3MgLGKg=
X-Google-Smtp-Source: ABdhPJzapV3/tw5sL05iXLx3S/H/o9bbQBZyBcr5IV+1cnkMKhGX2cUkcZKpq0tPVVv2tG3KFnm9OWTFrMiPxcBGMo0=
X-Received: by 2002:ab0:41:: with SMTP id 59mr4087008uai.40.1596680536213;
 Wed, 05 Aug 2020 19:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <1596650328-14869-1-git-send-email-eberman@codeaurora.org>
In-Reply-To: <1596650328-14869-1-git-send-email-eberman@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 6 Aug 2020 11:21:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrFFF5DTQfm3mo0NtdJjP9p4c=h5iM=vTuOSR=JE8Sbg@mail.gmail.com>
Message-ID: <CAK7LNARrFFF5DTQfm3mo0NtdJjP9p4c=h5iM=vTuOSR=JE8Sbg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add dtc flag test
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Steve Muckle <smuckle@google.com>,
        Trilok Soni <tsoni@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 6, 2020 at 2:59 AM Elliot Berman <eberman@codeaurora.org> wrote:
>
> Host dtc may not support the same flags as kernel's copy of dtc. Test
> if dtc supports each flag when the dtc comes from host.
>
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>


I think this supports only the newer external DTC,
but not older ones.

This feature is intended to test the upstream DTC
before resyncing in-kernel scripts/dtc/.






> ---
>  scripts/Makefile.lib | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 841ac03..2722a67 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -274,25 +274,35 @@ quiet_cmd_gzip = GZIP    $@
>
>  # DTC
>  # ---------------------------------------------------------------------------
> +ifeq ("$(origin DTC)", "command line")
> +PHONY += $(DTC)
> +dtc-option = $(call try-run, $(DTC) $1 -v,$1)
> +else
> +# Just add the flag. DTC is compiled later as a prerequisite, so there's no dtc
> +# to test the flag against. This is okay because we're not testing flags which
> +# aren't supported by in-kernel dtc to begin with.
> +dtc-option = $1
> +endif
> +
>  DTC ?= $(objtree)/scripts/dtc/dtc
> -DTC_FLAGS += -Wno-interrupt_provider
> +DTC_FLAGS += $(call dtc-option,-Wno-interrupt_provider)
>
>  # Disable noisy checks by default
>  ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
> -DTC_FLAGS += -Wno-unit_address_vs_reg \
> -       -Wno-unit_address_format \
> -       -Wno-avoid_unnecessary_addr_size \
> -       -Wno-alias_paths \
> -       -Wno-graph_child_address \
> -       -Wno-simple_bus_reg \
> -       -Wno-unique_unit_address \
> -       -Wno-pci_device_reg
> +DTC_FLAGS += $(call dtc-option,-Wno-unit_address_vs_reg) \
> +       $(call dtc-option,-Wno-unit_address_format) \
> +       $(call dtc-option,-Wno-avoid_unnecessary_addr_size) \
> +       $(call dtc-option,-Wno-alias_paths) \
> +       $(call dtc-option,-Wno-graph_child_address) \
> +       $(call dtc-option,-Wno-simple_bus_reg) \
> +       $(call dtc-option,-Wno-unique_unit_address) \
> +       $(call dtc-option,-Wno-pci_device_reg)
>  endif
>
>  ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
> -DTC_FLAGS += -Wnode_name_chars_strict \
> -       -Wproperty_name_chars_strict \
> -       -Winterrupt_provider
> +DTC_FLAGS += $(call dtc-option,-Wnode_name_chars_strict) \
> +       $(call dtc-option,-Wproperty_name_chars_strict) \
> +       $(call dtc-option,-Winterrupt_provider)
>  endif
>
>  DTC_FLAGS += $(DTC_FLAGS_$(basetarget))
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Best Regards
Masahiro Yamada
