Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27CEC445123
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Nov 2021 10:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhKDJdv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Nov 2021 05:33:51 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:33905 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhKDJdv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Nov 2021 05:33:51 -0400
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1A49UvIe030394
        for <linux-kbuild@vger.kernel.org>; Thu, 4 Nov 2021 18:30:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1A49UvIe030394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636018257;
        bh=2pU+uxILUskZzQfoOTUDLCNSjqBEi9YqcyQ2btKoSGQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I14T3IZxhgaXiDNgmw4yyVeYTY/CHh3ml5ekJkZXC4sYCA9WmWzNn6+4ju9WZqB+J
         P2Lv07tf7GqlDlmKeCL8hjAoVLvkdZmPUqe86JZ4h3zLH4uF4UFbsGRigs17nv6Zpr
         ISnCumqO7bTqGl57PqV4f1ZN+BZPMa1p23vPxMNGdKOefxf4G6MXbnLDnY2DWNJmyI
         wMYPzpXr/CGgVGe6x+a2X1EGYyOHC171MtqosE1CiqkpzdgJwkcxCKT3fGu9Pn1bpc
         DfMsHzzyzUvD+MbegSTgC6PsMC3Ylt0qk+EbZUfo66/qadpYsMLd520HBzT4kdr/Jz
         kUxcwUUqyaHGg==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id n85so777477pfd.10
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Nov 2021 02:30:57 -0700 (PDT)
X-Gm-Message-State: AOAM532vgSdEcXKD15muynnM5OZGfEq72XByIUII5Hs7S323vFh5VavZ
        0ZO0BqlDNzLJpLzTL+s8ZrVJO33DPI9tqb6/kBY=
X-Google-Smtp-Source: ABdhPJz6FuTyPp6D39e0DQv4BJ7U0zSqsXo5JxkwrqkOLkUpciBcIchx1YSiM52V02W5uhf1DWUwCG6eEVq0syxn23w=
X-Received: by 2002:a63:f542:: with SMTP id e2mr20530224pgk.186.1636018256686;
 Thu, 04 Nov 2021 02:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <7706ed5e-4771-770a-5cf2-d3c8346fa1dc@rub.de> <c3df3ea3-a711-dff7-4ae4-b0e77f05a983@rub.de>
In-Reply-To: <c3df3ea3-a711-dff7-4ae4-b0e77f05a983@rub.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 4 Nov 2021 18:30:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5wBH+Rn08+LT8knxaTBp7Hsj7eq=jk-V_zLQpCMiTvA@mail.gmail.com>
Message-ID: <CAK7LNAR5wBH+Rn08+LT8knxaTBp7Hsj7eq=jk-V_zLQpCMiTvA@mail.gmail.com>
Subject: Re: [RFC v3 11/12] Add xconfig-modifications
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        deltaone@debian.org, phayax@gmail.com,
        Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 22, 2021 at 10:47 PM Thorsten Berger <thorsten.berger@rub.de> wrote:
>
> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
>
> The tool can be called from any configurator. We chose to modify xconfig for
> this purpose. These files contain the necessary modifications to xconfig
> in order to resolve conflicts.



> ---
>  scripts/kconfig/qconf.cc | 1003 +++++++++++++++++++++++++++++---------
>  scripts/kconfig/qconf.h  |  179 ++++++-
>  2 files changed, 929 insertions(+), 253 deletions(-)
>

This includes too many unneeded changes.
(it is reverting many commits).

Please rebase it properly.


--
Best Regards
Masahiro Yamada
