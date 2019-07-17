Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF336C050
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 19:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfGQRXG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 13:23:06 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:53606 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbfGQRXG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 13:23:06 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6HHMcFN026464;
        Thu, 18 Jul 2019 02:22:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6HHMcFN026464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563384159;
        bh=IvZ7SC20dxc7X+546O7iFUVvinUcZEEQvyGPucg162c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n0O2kljSpN7bM4J5jb8zs4bblEKtEnYD34Gp/o9ZrEMhEn+MKk8R0uoXaTI7/NB1E
         gx5ISUq9jBxzokoLXkBf73il0+32ldOzlyT631daenzjotVIQ0NC3Tm3uELTpmkYVN
         8dFVfASt4Xp+Jym9uksnoVfhyOAjTD40M6VSz2yDdGsBwVuahnmCd+56ejybyVK0gU
         4juLOd0XljlHOv9+JRXoScYjON+ar5v67ql/nfTS2nOmNwRhkDpyzRNA9UMaWq1Za/
         vpcezvPmThp5vTYmzFOyXgusvtMd0XEtyMZEXcwEaBFC73fVqYpjPIXO9RzGzruoRR
         dcywYNazrfCOw==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id v6so17057989vsq.4;
        Wed, 17 Jul 2019 10:22:39 -0700 (PDT)
X-Gm-Message-State: APjAAAWQfVpkL0kLwiAHRjsqlQ6MCCv1L9Ds7NKes6F73tiWpbJeVPsP
        86qRpRQewLCEL9BexKv1GGuRwN58Z2dFSSQWYiI=
X-Google-Smtp-Source: APXvYqw9jEx7hbtW9LzvI1Jj9HtHNLv1zygWCUdwJHeZD6RgBkfmF4ytMTb7w/QiSf5lovPyIfYE1Q4SMaHviUe6NR4=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr2283107vsd.215.1563384157905;
 Wed, 17 Jul 2019 10:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190717160626.26293-1-seth.forshee@canonical.com>
In-Reply-To: <20190717160626.26293-1-seth.forshee@canonical.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 18 Jul 2019 02:22:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASPqp6eK_3bx2PPQ6nUyh=7RBhABNxNY0Yw7vqdn=Ej1g@mail.gmail.com>
Message-ID: <CAK7LNASPqp6eK_3bx2PPQ6nUyh=7RBhABNxNY0Yw7vqdn=Ej1g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add -fcf-protection=none when using retpoline flags
To:     Seth Forshee <seth.forshee@canonical.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 18, 2019 at 1:07 AM Seth Forshee <seth.forshee@canonical.com> wrote:
>
> The gcc -fcf-protection=branch option is not compatible with
> -mindirect-branch=thunk-extern. The latter is used when
> CONFIG_RETPOLINE is selected, and this will fail to build with
> a gcc which has -fcf-protection=branch enabled by default. Adding
> -fcf-protection=none when building with retpoline enabled
> prevents such build failures.
>
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>

Applied to linux-kbuild. Thanks.

-- 
Best Regards
Masahiro Yamada
