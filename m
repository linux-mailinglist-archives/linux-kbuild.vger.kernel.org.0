Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7FF305878
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314179AbhAZXAX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:23 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59969 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391537AbhAZSBu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:01:50 -0500
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10QI0MS9024622;
        Wed, 27 Jan 2021 03:00:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10QI0MS9024622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611684023;
        bh=2KqFL28RFkJPzdgE8+EEX7x7hC0N0aefEHBPqOcHy90=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ntt5XJlyVWDHnsLv6X9qX/wv38z2L3RrbC2rSEesqsbIiutXTvl24GTzRwSSCvgzf
         32K3kbsn1NNMUVIXuJ/fCvfrEdr4qzS0L0+xauvuTpSHdJliO7RpggCzmMxAEDltn/
         QL2y04Zi0QTp4VMf/PqmvizhxMevGGFkjOmKGnK5e7+5XFRswAJfOl4XcEFCyj8ATJ
         SGKm1UquxtxcHDjFlJNCaJlseW9OAHfqFuwpg9xC6Yq/J/GKwoHhS7ehCieNZzi0or
         fteXNz1JmD2t+XP5ACKNIucxttvJM+ruSa24GmVPEIQaVLffxbY61F9X4b/veoYEgr
         lDt2rV5Wl50cA==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id z21so11939825pgj.4;
        Tue, 26 Jan 2021 10:00:22 -0800 (PST)
X-Gm-Message-State: AOAM532sqj82+NTNsKIsOf1cdffac1cheKsYpnawNAX0EuhqdVR/QqIy
        66vhgSaF6aqtdwIjutefH+sjpGs/Ki72sp+IBv4=
X-Google-Smtp-Source: ABdhPJyadsrx2K4yBbaQDaYq+JZHE3/V7x9qB3y9ZuJrfotnd1qiXQScEBBfTfGpHKGyPoMQKn02f5TR9ontJxOa0DM=
X-Received: by 2002:aa7:8f13:0:b029:1bd:f965:66d8 with SMTP id
 x19-20020aa78f130000b02901bdf96566d8mr6121622pfr.80.1611684021937; Tue, 26
 Jan 2021 10:00:21 -0800 (PST)
MIME-Version: 1.0
References: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
In-Reply-To: <1611343638-28206-1-git-send-email-eberman@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 27 Jan 2021 02:59:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARLiLzqpMfmvVMJ8pT7-wYjfrP54mey_MCMbULLFY_H+A@mail.gmail.com>
Message-ID: <CAK7LNARLiLzqpMfmvVMJ8pT7-wYjfrP54mey_MCMbULLFY_H+A@mail.gmail.com>
Subject: Re: [RFC 0/2] Kbuild: Support nested composite objects
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Sami Tolvanen <samitolvanen@google.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 23, 2021 at 4:27 AM Elliot Berman <eberman@codeaurora.org> wrote:
>
> This series was developed after discussion in https://lkml.org/lkml/2021/1/19/850
>
> The motivation for this series is an out-of-tree module which contains a large
> number of source files. This causes Kbuild to exceed the maximum command line
> argument length when linking the files. Proposal here permits composite objects
> to contain other composite objects. This allows the driver to split linking into
> several steps and avoid the maximum command line length error.


External modules often get the cold shoulder.

For example,
https://lore.kernel.org/patchwork/patch/1175556/#1372233


This problem has not been observed in the upstream tree.

I do not see a good reason to complicate the build
infrastructure for some external modules.






> Kbuild composite objects only supports one level of composite objects.
> That is, a composite object may only be composed of real compilable
> source files.
>
> As a simple example, the following Kbuild description is now supported:
>
> bar-a-y := a/bar0.o a/bar1.o
> bar-b-y := b/bar2.o b/bar3.o
>
> foo-objs := bar-a.o bar-b.o
>
> obj-m += foo.o
>
> Add such support by recursively searching for composite objects and
> listing them in $(multi-used-*) and $(real-obj-*).
>
> Elliot Berman (2):
>   Kbuild: Make composite object searching more generic
>   Kbuild: Support nested composite objects
>
>  scripts/Makefile.lib | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Best Regards
Masahiro Yamada
