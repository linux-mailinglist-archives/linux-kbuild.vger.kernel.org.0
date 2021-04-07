Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63D9356EB1
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 16:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344525AbhDGObf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 10:31:35 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:17482 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344515AbhDGObf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 10:31:35 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 137EV5xM030432;
        Wed, 7 Apr 2021 23:31:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 137EV5xM030432
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617805865;
        bh=8e+q4Ikd5AQvAiW7XE9ViCmXAkg92qw2Ri8DAzyoZpQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ws4+NWf9aORKzCEvNDVlI8gmV5vYxPtUJ/jlTv35z/687xk1FYHDBZMzeifAz51np
         g1Ihc9w0yC7M/Ma1jNISBXnNYbvIEnlh2KO7vPJS/VH1eKNZVzM379Y8+7s81gKeaW
         lWEI7cTzgweXysFPfjw3+M+2d7waOt8GxZBjdghBpY5bR/AcOVC/6z66NqPNknxQV/
         OeYdT7k4AOtPMvyyMa255PvGEJLAbyO1l/hYB4pjUdg+Aj90ybhSZT/Mb6k4UBD8Bc
         zYKYR5W5mXv+NZaC/iRq91fFYonec5S5xKRy387Zt4CQ+QpS1+LQavf5ivlO3R/q4s
         AkrPGQSMUq6hQ==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id t24so5823318pjw.4;
        Wed, 07 Apr 2021 07:31:05 -0700 (PDT)
X-Gm-Message-State: AOAM530SeYF43vkf2oqMVI9ymEXbtR9nNep9ys8Qqh6e7noi7qxcn90u
        tWct2QJYDEBo5KO2fdQ59QykjnpD3b1couhU0HE=
X-Google-Smtp-Source: ABdhPJycxGYoCKPfR6zSNJ7A/kdmtVtCH1E4kkCfWh56LdVlXOo7pkhStwKnPIv0Kj6KAqjaSk/5pj/ns8A9479/sl4=
X-Received: by 2002:a17:90a:1056:: with SMTP id y22mr3359843pjd.153.1617805864677;
 Wed, 07 Apr 2021 07:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210331133811.3221540-1-masahiroy@kernel.org>
In-Reply-To: <20210331133811.3221540-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 23:30:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4=hu1B9fg4dHQdjF-AOevhowhz=O2by4L77428GJBNw@mail.gmail.com>
Message-ID: <CAK7LNAQ4=hu1B9fg4dHQdjF-AOevhowhz=O2by4L77428GJBNw@mail.gmail.com>
Subject: Re: [PATCH 1/9] kbuild: remove unneeded mkdir for external modules_install
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 31, 2021 at 10:38 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> scripts/Makefile.modinst creates directories as needed.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>
>  Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index ed8bd815e8a3..0e06db5ed9d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1779,10 +1779,8 @@ $(MODORDER): descend
>  PHONY += modules_install
>  modules_install: _emodinst_ _emodinst_post
>
> -install-dir := $(if $(INSTALL_MOD_DIR),$(INSTALL_MOD_DIR),extra)
>  PHONY += _emodinst_
>  _emodinst_:
> -       $(Q)mkdir -p $(MODLIB)/$(install-dir)
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst
>
>  PHONY += _emodinst_post
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
