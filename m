Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE9C8BA11D
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Sep 2019 07:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfIVFLK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Sep 2019 01:11:10 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:56302 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbfIVFLJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Sep 2019 01:11:09 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x8M5B0fW020558
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Sep 2019 14:11:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x8M5B0fW020558
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569129061;
        bh=+4U5brRQefNijSlhrH9EbSKuLGuWtIMXoQ4+IqbrbeM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pB1mg6QAN5cBi4TyRGAVEXCaPDrEoY+prX+hwuKoCzcnqi7Ur3M34cPfmjOJkXu4n
         NN+URZoSwp9nIMqXglh4v0l/OexZMDYm2Pw4s5Y4ig4mjbM6h5gYjFrQbcmRetTs8E
         E7IsdbW9fNe/APF3Ue9MwM24kaQjMGBoOhYRuCSuo5feUba3Kjyv80HYyPK5oeesNi
         LW+5RuFbV4JKo8OBNHPbwGUGwCLnWcj49rt9UtXK+CGYtbAbXe3SpD/SelWyhew5GB
         DSVidOCSkzwJEZ33BkdB0HmyqGq0huU7BSHkXSm54tnhytD3eCubZapB1W4FzCzHgc
         piG+GREsDIrdQ==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id n2so3379930ual.11
        for <linux-kbuild@vger.kernel.org>; Sat, 21 Sep 2019 22:11:01 -0700 (PDT)
X-Gm-Message-State: APjAAAVy7MVgogybElkymsB1E6HT0GLioGlmGHT7wBByMvu27p+Mv6dV
        Kdm7/eCzppLLCwqK13lTI9QKBxRTE+3JohBIuZs=
X-Google-Smtp-Source: APXvYqyZLyjyYKTstnYMLBoj9cSICZifyIpX6t8AQ+LoDyAAcGod/TmaDwppn7qRdaNz7mXTtMO+u16MMW7rFsxjR1A=
X-Received: by 2002:ab0:261a:: with SMTP id c26mr11209051uao.121.1569129059836;
 Sat, 21 Sep 2019 22:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190921222304.23267-1-mjg59@srcf.ucam.org>
In-Reply-To: <20190921222304.23267-1-mjg59@srcf.ucam.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 22 Sep 2019 14:10:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVvUWNMWEd5eTFX1BQ_wZywact_28T70SiCQmOcmz-Jw@mail.gmail.com>
Message-ID: <CAK7LNARVvUWNMWEd5eTFX1BQ_wZywact_28T70SiCQmOcmz-Jw@mail.gmail.com>
Subject: Re: [PATCH] Corrected formatting of header in kbuild module docs
To:     Matthew Garrett <mjg59@srcf.ucam.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Matthew Garrett <mjg59@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Sep 22, 2019 at 7:23 AM Matthew Garrett <mjg59@srcf.ucam.org> wrote:
>
> From: Alex Gaynor <alex.gaynor@gmail.com>
>
> Minor formatting fixup.
>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Matthew Garrett <mjg59@google.com>
> ---

Applied to linux-kbuild.
Thanks.

>  Documentation/kbuild/modules.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index 24e763482650..6716508fb79c 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -495,7 +495,8 @@ build.
>         will be written containing all exported symbols that were not
>         defined in the kernel.
>
> ---- 6.3 Symbols From Another External Module
> +6.3 Symbols From Another External Module
> +----------------------------------------
>
>         Sometimes, an external module uses exported symbols from
>         another external module. kbuild needs to have full knowledge of
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
