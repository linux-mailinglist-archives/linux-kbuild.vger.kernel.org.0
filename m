Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0AD82BFF49
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 05:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgKWE7F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Nov 2020 23:59:05 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40075 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgKWE7F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Nov 2020 23:59:05 -0500
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0AN4wZji006726;
        Mon, 23 Nov 2020 13:58:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0AN4wZji006726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606107515;
        bh=+LEwj9RIP6B0v+fIagUSiNb+k53AZBbMfGdY35alS/0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iGPwGA/4IAEd9JkZHJZIgkAY2k6Y9HTXqoPP22+LeMQEYSGLFwQemh8NZGwxCg3ah
         qxeITYoWU6eQBr0gDR7Cl5AGbAJY134t2a45EbOa+G/nC7mv4SIu96zVHtNfuSuIMm
         ULQdEUR/eS/NINLlWf27l0JMsWIA7CxcDmnp0mn/HFBLv/yi2qwTVklaj1y3N90To7
         6eUzdXvwATH+3/v6T8/XMYf3oAAVXaUEqEtcw+JCAtXvShQeN9kiJYL5aVWxeABJIg
         fKF5ynoxUNwI/jNt7iJcVA8ABHIF9xbuSOH8O6Yo+3Cu9Ehcv8ZhFlzqr0hGcdlTNY
         UBggMXQGr3BmQ==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id t18so8272929plo.0;
        Sun, 22 Nov 2020 20:58:35 -0800 (PST)
X-Gm-Message-State: AOAM533erxTx0d1b8vYVbOjsW41TRJArp4fuEplxgUB9FD2uHKShqzEk
        xVTaPpjeNY6MrUallkDULEDiVU2jSEvBDPbBusU=
X-Google-Smtp-Source: ABdhPJzCVFp0M56iuKPlCB10k/Z+nsmP4Q0CTPSwcKkybeuvqPFO5caR2C45S+axiewACNiCPqNHmrsPeS9qaX+Q+JQ=
X-Received: by 2002:a17:902:d346:b029:d9:d097:ed15 with SMTP id
 l6-20020a170902d346b02900d9d097ed15mr18191255plk.1.1606107514572; Sun, 22 Nov
 2020 20:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20201123045403.63402-1-masahiroy@kernel.org> <20201123045403.63402-3-masahiroy@kernel.org>
In-Reply-To: <20201123045403.63402-3-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 13:57:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARXem8v+gW-dT2g6_3_4EvZ6=P0t0M9wfLfv7axRUCctQ@mail.gmail.com>
Message-ID: <CAK7LNARXem8v+gW-dT2g6_3_4EvZ6=P0t0M9wfLfv7axRUCctQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] kbuild: doc: fix 'List directories to visit when
 descending' section
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 23, 2020 at 1:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Fix state information:


I mean "Fix stale information"



>
>  - Fix the section number in the reference from 6.4 to 7.4.
>
>  - Remove init-y and net-y. They were removed by commit 23febe375d94
>    ("kbuild: merge init-y into core-y") and commit 95fb6317b3ab
>    ("kbuild: merge net-y and virt-y into drivers-y"), respectively.
>
>  - Update the example because arch/sparc64/Makefile does not exit.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


-- 
Best Regards
Masahiro Yamada
