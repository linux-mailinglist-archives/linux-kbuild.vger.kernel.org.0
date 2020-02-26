Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAED170681
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 18:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgBZRsh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 12:48:37 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:61027 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgBZRsg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:48:36 -0500
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01QHmCq9012021;
        Thu, 27 Feb 2020 02:48:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01QHmCq9012021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582739293;
        bh=xgJl1blQU86umeJmNxilnyVsYxkgOlk7eA5gh9LCkvo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CI/0ftnrcP1jDlvsNYqy1wCRmpqGS30HfCLQ7Ldgl60+0ftVjmYse9f0p8lMEPP3H
         P/FJZLDmCUvZhxY7z2LrdO0phu3A48HkUwBXd3JCF81imCFH6sAsJkO5a6XkSgV+BY
         gq4NRq/yR/PCB+gpqm4jlifnkhOX9eIEAwjbEqxT0gkRT+w/FK4G2Vgx1AfpDxgRv7
         xH+LQjPiasLTdjSe/NRAA6AS0DNnyHdYLDDTnughlzYwJQnYn09QAWIwNeKwwfnxWM
         /XlpvToOgxLXz+1qTzYmd5eVTft5ecy1iAWiexTyFk5FY9Y9aGPVzyw4jxW7Z/Fl7i
         IF9OA1i2oPH1g==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id f7so1277818uaa.8;
        Wed, 26 Feb 2020 09:48:12 -0800 (PST)
X-Gm-Message-State: APjAAAWdSjOAdxobVYbMQHrsQmyOumZAsv3niRoNImN09qmruu3V2h5i
        Ggow8F4fUbtBw+J50NspFgvI/gNuXBnwbMvngvw=
X-Google-Smtp-Source: APXvYqzpYiAGWcX0PZ9Cf1kXLn0Wj6iCVXsMhuHGUjBn2Nok9OJYYRHJXguuDnTCkK3RWGETDFPTxak9tpz21S+oYFo=
X-Received: by 2002:ab0:14ea:: with SMTP id f39mr220178uae.40.1582739291939;
 Wed, 26 Feb 2020 09:48:11 -0800 (PST)
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200222190435.11767-2-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-2-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 27 Feb 2020 02:47:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNATMKS9vAOtKTncDYTN1kmx1iZN4LHBmP-XLPGBn9TmxaA@mail.gmail.com>
Message-ID: <CAK7LNATMKS9vAOtKTncDYTN1kmx1iZN4LHBmP-XLPGBn9TmxaA@mail.gmail.com>
Subject: Re: [PATCH 2/5] kbuild: remove unneeded semicolon at the end of cmd_dtb_check
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 23, 2020 at 4:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This trailing semicolon is unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied with Rob's Ack.


>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 64b938c10039..752ff0a225a9 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -300,7 +300,7 @@ DT_BINDING_DIR := Documentation/devicetree/bindings
>  DT_TMP_SCHEMA := $(objtree)/$(DT_BINDING_DIR)/processed-schema.yaml
>
>  quiet_cmd_dtb_check =  CHECK   $@
> -      cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@ ;
> +      cmd_dtb_check =  $(DT_CHECKER) -u $(srctree)/$(DT_BINDING_DIR) -p $(DT_TMP_SCHEMA) $@
>
>  define rule_dtc
>         $(call cmd_and_fixdep,dtc,yaml)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
