Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCC3215E16
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jul 2020 20:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729569AbgGFSPw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 14:15:52 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:21635 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbgGFSPw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 14:15:52 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 066IFHOD005116;
        Tue, 7 Jul 2020 03:15:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 066IFHOD005116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1594059318;
        bh=Q+48gTKGnNNAyaZpkSljO3/+f87VrYhlKUVJ5FKjmdQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Go6ByYbk3w6ZqfzY+bcPEPfdQfjSDMmaa6f7z4KGrPRgiJJhVvFX0zG/wdRmgZlNg
         fJTpHeNu8RVg7HoRCqN2GZxiXEZp2S76ErzL9nr07q+JH7oEhnOp3qzCLAiRsYRgzW
         4sXuqhEX3EHJGIPC2K90ZNZVGxta6AAY3nLwwqnKU5AiXTqseg+g4DmWdA+ju4NdX/
         u3rtdKZRVojNvHpJbD5nmIHE4eTRwzZPmoVxbN7MZ3KlsszTCjUdjsMIZlEJR5waRC
         kQvyoW3byTZEbBTB0DnuSKMXAvEpdAs1vEuIS1owDD0UyqTFxLJqTS0J5glaKV+nk/
         UG3FkSjjPkTqQ==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id b24so4902198uak.2;
        Mon, 06 Jul 2020 11:15:17 -0700 (PDT)
X-Gm-Message-State: AOAM533ysYQukM7UbfBGahAKtfOG6W8SW434JfWDP0AXg7EvhcnRf4ZG
        nGMt5Sn8vDnyMK2WX5cYouRoliY/Lz6pmQXB5sU=
X-Google-Smtp-Source: ABdhPJzoaiAwOpILAwYbp3vbz8/vfjd18YvPHG7eMlv5+34w/dyjTF009kfyXsQdMimrRPhduooTnxiTT2c1jqAYb+8=
X-Received: by 2002:ab0:21c6:: with SMTP id u6mr18691153uan.109.1594059316651;
 Mon, 06 Jul 2020 11:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200628015041.1000002-1-masahiroy@kernel.org>
 <87imfa8le0.fsf@mpe.ellerman.id.au> <CAK7LNATusciypBJ4dYZcyrugdi_rXEV_s=zxAehDxsX+Sd5z4g@mail.gmail.com>
 <CADYN=9JnzPC6Ja9s3_01k-CDTSuxKBMRdrqU5rqp0xw1r9XpRw@mail.gmail.com>
In-Reply-To: <CADYN=9JnzPC6Ja9s3_01k-CDTSuxKBMRdrqU5rqp0xw1r9XpRw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 7 Jul 2020 03:14:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNARg_B+tcbduBzrh2_Q3dwk_XxDcaw+sMTwsMOxNYM7hnQ@mail.gmail.com>
Message-ID: <CAK7LNARg_B+tcbduBzrh2_Q3dwk_XxDcaw+sMTwsMOxNYM7hnQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Mackerras <paulus@samba.org>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Anders,

On Mon, Jul 6, 2020 at 8:24 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>

> The full log can be found here [1].
>
> Without this patch for  'trace_selftest_dynamic' for instance, CC_FLAGS_FTRACE
> was removed from kernel/trace/*, and then added back to
> kernel/trace/trace_selftest_dynamic.
> While with this patch it looks like we add the flag (even though it is
> already there), and then
> removes the flag for all files in kernel/trace/* .


You are right.

I will drop this patch,
and send v2.


Thank you.




-- 
Best Regards
Masahiro Yamada
