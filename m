Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3397919713B
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2020 02:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgC3Ad7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 20:33:59 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41809 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgC3Ad7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 20:33:59 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02U0Xiqw031238
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2020 09:33:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02U0Xiqw031238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585528425;
        bh=hLIxpwTbkpeFIMN+1dOfo2onjue8vkp2qZL+EihgJUE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WNzwQe3CJ9iTKChaxOudOeDRwS94iMQgyvp7k/CFh+1B7H9spHz+wR6lauWw3TZjt
         plPIqLl+e9utTAoVLoO7nfGl5v15e6ePhWxBIGPEGex/yrl++INGLckzZHqZj72PHr
         qEeVH5zyz3gFcvgOwLJ56QsKlhQ71dA/OXUzbr+FDYgyn15imgpcZGksHsv1KuO32l
         kGlhuKwMUkzMVEq+yrUzoSrujRHA73r+Rh0ul67u+bgrwSJiJdXhPv+lbxp/H4hH+F
         ryO4OuNptktU8HbcSYFlL2uU5pZd72Rz/2jmZcQgXUi+ldem0FtwhaTs9sIUpYV10L
         u2WOBDtVYEu7g==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id y138so9944024vsy.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 17:33:44 -0700 (PDT)
X-Gm-Message-State: AGi0PuZnebc2YhBO6Y0PjLdWQkMpJk0C4FQYYoXWvwEG51XSkR7RAfXK
        HODhhvh0GXWBKqmuEgY53oUyZxHrXiFGn+jh2/s=
X-Google-Smtp-Source: APiQypJBNO/+wpIb4pduFw3xBmRl1W1Lhn17gB8vMlTa/0Uyyl3trtl827NMIFdQUgK2H040w5rnCwl8vcZytdbe2bY=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr6468438vsz.155.1585528423943;
 Sun, 29 Mar 2020 17:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <1966103.4dT7el1ifK@apollon> <2516578.0xqDLvIEN0@apollon>
 <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com> <3026651.zccbJs9ps7@apollon>
In-Reply-To: <3026651.zccbJs9ps7@apollon>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 30 Mar 2020 09:33:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYss1OzYvQVSaMVfGY45XShteudLm9f=wuH9gAZSmmxQ@mail.gmail.com>
Message-ID: <CAK7LNASYss1OzYvQVSaMVfGY45XShteudLm9f=wuH9gAZSmmxQ@mail.gmail.com>
Subject: Re: Bug#954778: Patch: Suppress irrelevant warning when generating a
 debian package
To:     Reinhard Karcher <reinhard.karcher@gmx.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        954778@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 30, 2020 at 12:01 AM Reinhard Karcher
<reinhard.karcher@gmx.net> wrote:
>
> There was a blank line missing between the package definitions.
> Sorry for late testing.
>
> --
> Best regards
> Reinhard Karcher


The attached patch is not in a correct patch format.

This time, I manually crufted the format, and applied.

But, next time, please send it to ML instead of attachment,
in a correct format.

git supports useful commands to do this.

  [1]  "git format-patch"  to create a patch
  [2]  "git send-email" to send it to ML


I reworded the log as follows:

------------------>8---------------
kbuild: deb-pkg: fix warning when CONFIG_DEBUG_INFO is unset

Creating a Debian package without CONFIG_DEBUG_INFO produces
a warning that no debug package was created.

This patch excludes the debug package from the control file,
if no debug package is created by this configuration.

Signed-off-by: Reinhard Karcher <reinhard.karcher@gmx.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
------------------>8---------------


-- 
Best Regards
Masahiro Yamada
