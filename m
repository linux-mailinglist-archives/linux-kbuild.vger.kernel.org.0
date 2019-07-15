Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A77688E0
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 14:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbfGOM3Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 08:29:24 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30835 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728933AbfGOM3Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 08:29:24 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x6FCT6cf021447;
        Mon, 15 Jul 2019 21:29:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x6FCT6cf021447
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563193747;
        bh=yAufAdrjbVZeLo2XKE8YwT7x8b4qwlGxGHKZaKC8OiE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=epIJpluQMn/A5uXoItj+a9fCiitzzHgVapQnSQ6gXwMCNTUr6gLM4wYLAi6UDqz9v
         DBqoYqnORzcTAvzrctniOj+rX4rK5gAs5njV3NOPo7xEBbJo9IwdolOvZF62FG1xH7
         ocS8lNTxYbiZOPrcX0hL7SfezLKSHfU+1qQg1RQXhIkGDzTXI9T06SI7xYciSOfUlr
         TE0YU7P4guaBMWWsOV7jUzQF83dfpXHQkLcEjVJ+UnhhUKoisHb7suMi8WyW3iD9D9
         QQP7Lljui+D5R68E6Gusped9NvK8ObE72zgHjetsP40KfJKm81x0Pigc7hOtJU1pJc
         T18TBJKP7taLg==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id v20so6660096uao.3;
        Mon, 15 Jul 2019 05:29:07 -0700 (PDT)
X-Gm-Message-State: APjAAAX5Vjnf5k6rX4rKG1QSNUa6l3fwqx5JLddRZppuhoEc8IJVqAtJ
        3tONuoNrmqZF1l5lMP2p7jhxng+YvI6d8GwWpEc=
X-Google-Smtp-Source: APXvYqxzkyUT0iZjK1QVWY25ZVaKJaxxn64RERk2SmEwo7a1tSGZWRyJCpcrJqjGgLDWFGhIeN/hfzmCIPLb2QQGnI4=
X-Received: by 2002:ab0:70d9:: with SMTP id r25mr400188ual.109.1563193746045;
 Mon, 15 Jul 2019 05:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <1562664759-16009-1-git-send-email-info@metux.net> <1562664759-16009-4-git-send-email-info@metux.net>
In-Reply-To: <1562664759-16009-4-git-send-email-info@metux.net>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 15 Jul 2019 21:28:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
Message-ID: <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
Subject: Re: [PATCH 4/4] debian: add generic rule file
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 9, 2019 at 6:33 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Adding a generic debian rule file, so we can build the directly
> via usual Debian package build tools (eg. git-buildpackage,
> dck-buildpackage, etc). It expects the .config file already
> placed in the source tree.
>
> The rule file contains a rule for creating debian/control and
> other metadata - this is done similar to the 'deb-pkg' make rule,
> scripts/packaging/mkdebian.

I saw a similar patch submission before, and negative feedback about it.

Debian maintains its own debian/rules, and it is fine.
I do not like to check-in the one in the kernel tree.



> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  .gitignore   |  1 +
>  MAINTAINERS  |  6 ++++++
>  debian/rules | 27 +++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100755 debian/rules
>
> diff --git a/.gitignore b/.gitignore
> index 7587ef56..01d742c 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -69,6 +69,7 @@ modules.builtin
>  # Debian directory (make deb-pkg)
>  #
>  /debian/
> +!/debian/rules
>
>  #
>  # Snap directory (make snap-pkg)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 558acf2..56e034c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4516,6 +4516,12 @@ F:       include/uapi/linux/dccp.h
>  F:     include/linux/tfrc.h
>  F:     net/dccp/
>
> +DEBIAN PACKAGING FILES
> +M:     Enrico Weigelt <info@metux.net>
> +L:     linux-kbuild@vger.kernel.org
> +S:     Maintained
> +F:     debian/
> +
>  DECnet NETWORK LAYER
>  W:     http://linux-decnet.sourceforge.net
>  L:     linux-decnet-user@lists.sourceforge.net
> diff --git a/debian/rules b/debian/rules
> new file mode 100755
> index 0000000..c2f0319
> --- /dev/null
> +++ b/debian/rules
> @@ -0,0 +1,27 @@
> +#!/usr/bin/make -f
> +# SPDX-License-Identifier: GPL-2.0
> +
> +export MAKE
> +export KERNELARCH           = $(shell $(MAKE) kernelarch)
> +export KERNELRELEASE        = $(shell $(MAKE) kernelrelease)
> +export KBUILD_DEBARCH       = $(shell dpkg-architecture -qDEB_HOST_ARCH)
> +export KBUILD_BUILD_VERSION = $(shell $(MAKE) kernellocalversion)
> +export KDEB_RULES           = debian/rules.auto
> +export KDEB_SOURCENAME      = linux-source
> +export ARCH                 = $(KERNELARCH)
> +
> +debian/control debian/changelong debian/arch debian/copyright:
> +debian/control:
> +       ./scripts/package/mkdebian
> +
> +build: debian/control
> +       $(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC=
> +
> +binary-arch:   debian/control
> +       $(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC= intdeb-pkg
> +
> +clean:
> +       rm -rf debian/*tmp debian/files debian/changelog debian/control debian/copyright debian/rules.auto debian/arch
> +       $(MAKE) clean
> +
> +binary: binary-arch
> --
> 1.9.1
>


-- 
Best Regards
Masahiro Yamada
