Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 106001401BD
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 03:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgAQCSM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jan 2020 21:18:12 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19373 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726726AbgAQCSM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 21:18:12 -0500
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 00H2HqMP010111;
        Fri, 17 Jan 2020 11:17:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 00H2HqMP010111
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579227473;
        bh=8ybG8LjXBlt8T0MqbW/EKhRw7vw4GK5v/Kz9EhLSiY0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F35/WcRvhA1a/o5pzi3b7XEcrkYuaJ9HjJR4tSAZQzHyl0nNPSC4nULLCaydo7oir
         S3xRpZEhGYcn32Dkj6Yyn39G2HxOjMDcxrI+iSGRuvaOcs2MBai+ClrieZiuzJCntF
         L9r4UOoP25mIv5LzUM1+/ioVO+HGBOTVptw88Ed5touScLztlXdDAp9tSqksw/IKX+
         H9GjhA2gCNkaTA6sPXS76lcuPJLf9ymx1Y5lqGftbgHEkrnDsKdtDh5sPcB7/mrsmM
         GhG1DfiTJGrTS0YPyy316J6sv8bARzpkYAsC0oaKLZpmqsTudgXNqy+LVN0KfXG8cU
         RBizO/H0l2sKg==
X-Nifty-SrcIP: [209.85.221.182]
Received: by mail-vk1-f182.google.com with SMTP id h13so6266761vkn.10;
        Thu, 16 Jan 2020 18:17:52 -0800 (PST)
X-Gm-Message-State: APjAAAWhpsyZV3ciMCOs9UJ9oZIi1a3Lox6L3UKvbGi75bK5EQA+jn+Q
        xfnj0XP2K+GabScy4wstve27lu5pX3hoqilusDk=
X-Google-Smtp-Source: APXvYqxamBGY9Xjvh/06M1RPyeCEPFEdU4pr1Pslrd08CuggEi5cr4/SLwz18imIp0B/VXH59K8k/Vym1YLZr2jWIfw=
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr22174033vkc.12.1579227471741;
 Thu, 16 Jan 2020 18:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20200113232212.138327-1-helgaas@kernel.org>
In-Reply-To: <20200113232212.138327-1-helgaas@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 17 Jan 2020 11:17:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Message-ID: <CAK7LNASYynBVaaGROEjy1PC7+9xatO7gf2LTRGG1UOpiXtzENw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix documentation typos
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 14, 2020 at 8:22 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Fix a couple typos in kconfig-language documentation.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  Documentation/kbuild/kconfig-language.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 74bef19f69f0..f547720bd82d 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -594,7 +594,7 @@ The two different resolutions for b) can be tested in the sample Kconfig file
>  Documentation/kbuild/Kconfig.recursion-issue-02.
>
>  Below is a list of examples of prior fixes for these types of recursive issues;
> -all errors appear to involve one or more select's and one or more "depends on".
> +all errors appear to involve one or more "selects" and one or more "depends on".


I think "selects" is strange here.

"select" is a Kconfig keyword.
select's is intentional, I guess.


Keep it as-is, or perhaps change it into "select" (singular) ?






>
>  ============    ===================================
>  commit          fix
> @@ -656,7 +656,7 @@ the use of the xconfig configurator [1]_. Work should be done to confirm if
>  the deduced semantics matches our intended Kconfig design goals.
>
>  Having well defined semantics can be useful for tools for practical
> -evaluation of depenencies, for instance one such use known case was work to
> +evaluation of dependencies, for instance one such case was work to
>  express in boolean abstraction of the inferred semantics of Kconfig to
>  translate Kconfig logic into boolean formulas and run a SAT solver on this to
>  find dead code / features (always inactive), 114 dead features were found in
> @@ -683,7 +683,7 @@ abstraction the inferred semantics of Kconfig to translate Kconfig logic into
>  boolean formulas and run a SAT solver on it [5]_. Another known related project
>  is CADOS [6]_ (former VAMOS [7]_) and the tools, mainly undertaker [8]_, which
>  has been introduced first with [9]_.  The basic concept of undertaker is to
> -exract variability models from Kconfig, and put them together with a
> +extract variability models from Kconfig and put them together with a
>  propositional formula extracted from CPP #ifdefs and build-rules into a SAT
>  solver in order to find dead code, dead files, and dead symbols. If using a SAT
>  solver is desirable on Kconfig one approach would be to evaluate repurposing
> --
> 2.25.0.rc1.283.g88dfdc4193-goog
>


-- 
Best Regards
Masahiro Yamada
