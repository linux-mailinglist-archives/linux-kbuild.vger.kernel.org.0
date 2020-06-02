Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C56D91EBE5B
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2020 16:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgFBOnW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Jun 2020 10:43:22 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:58939 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgFBOnV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Jun 2020 10:43:21 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 052Eh31q014219
        for <linux-kbuild@vger.kernel.org>; Tue, 2 Jun 2020 23:43:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 052Eh31q014219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591108984;
        bh=W573HsIosAMWqqbiqsoOrBeTNWbVQ6cfXMymsv58ARo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Dqi8sZagFmsTEur0jCLsEeBIuytxMq/ifVgGYedvW13Zg/7iWc/R3pb5JG0wQBS2l
         CHA24QClMVNa6h9RvLmbUrw7jOIG8LZF0icSpQnD/6E6AgCXGGFs2uqUZkF/UwcR+n
         PEJ1I7j//Xn2Ox7UUfsR3AoB3tid9A8UExQ7aPEVYClT3I4MGsDLjSJbpPwhYitbfV
         1KEF3Tf7A/B7CD/Czhr2uehqh877ZdL2xkGtlNXwTTV3d2aRB/cVoAz2rzUtHgrL/m
         tSco9+s3SdzONddDa9EVI6nrW02XhgYL0P61gD8mD+uaXEAJGRSwc87hnLL7jnG9of
         tdJ1fPXDP0iEQ==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id a10so1324818uan.8
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2020 07:43:03 -0700 (PDT)
X-Gm-Message-State: AOAM533yqiYE+vTI3wAlLreT8s8EDPPric5gsXm8tR78kwBfSjtCqic0
        brvXF+anQplSpmAebAIZXqe78ROPBA+ix6GfXH4=
X-Google-Smtp-Source: ABdhPJy1jxXmxQx3sR/veDSvVu4trGmV/cPF5gN5N1fOVYpCE2LI2uRx0hT/CySFm7Kq3c0dhwFWC06WWjnwq4dY+L0=
X-Received: by 2002:ab0:3ae:: with SMTP id 43mr18621102uau.25.1591108982576;
 Tue, 02 Jun 2020 07:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <1590920904-60002-1-git-send-email-alios_sys_security@linux.alibaba.com>
 <1591083917-63371-1-git-send-email-ashimida@linux.alibaba.com>
In-Reply-To: <1591083917-63371-1-git-send-email-ashimida@linux.alibaba.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 2 Jun 2020 23:42:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASLZ4t1=5pDBMvTNryQf_1=-1GASA=unk8asumUDEzsoQ@mail.gmail.com>
Message-ID: <CAK7LNASLZ4t1=5pDBMvTNryQf_1=-1GASA=unk8asumUDEzsoQ@mail.gmail.com>
Subject: Re: [PATCH v2] mksysmap: Fix the mismatch of '.L' symbols in System.map
To:     ashimida <ashimida@linux.alibaba.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 2, 2020 at 4:45 PM ashimida <ashimida@linux.alibaba.com> wrote:
>
> When System.map was generated, the kernel used mksysmap to
> filter the kernel symbols, but all the symbols with the
> second letter 'L' in the kernel were filtered out, not just
> the symbols starting with 'dot + L'.
>
> For example:
> ashimida@ubuntu:~/linux$ cat System.map |grep ' .L'
> ashimida@ubuntu:~/linux$ nm -n vmlinux |grep ' .L'
> ffff0000088028e0 t bLength_show
> ......
> ffff0000092e0408 b PLLP_OUTC_lock
> ffff0000092e0410 b PLLP_OUTA_lock
>
> In the original patch[1], the original intent should
> be to filter out all local symbols starting with '.L',
> so the dot should be escaped.
>
> [1]. mksysmap: Add h8300 local symbol pattern
>
> Signed-off-by: ashimida <ashimida@linux.alibaba.com>
> ---

Applied to linux-kbuild. Thanks.






-- 
Best Regards
Masahiro Yamada
