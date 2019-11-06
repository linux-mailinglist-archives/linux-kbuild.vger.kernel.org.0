Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39CDEF199E
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 16:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfKFPMT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 10:12:19 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44242 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfKFPMT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 10:12:19 -0500
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xA6FBtOV025552;
        Thu, 7 Nov 2019 00:11:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xA6FBtOV025552
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573053116;
        bh=BSCfVPpo8QuHEshLOJB67xUpOWsHYhWolc8rlN2Ikv4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=R+mJewIxb6V7mfcZrb09egVkrbomUNupNtHov9GnQ4E92nFL4rtzY0q4gHmhZ3IUM
         35noIGSpWoVScdl4kt/T7jyC+qemz5JAzIBJuIDsFjGtyqPrvRcg7Vt9SgJZ/Kj6OL
         WWRuH3TVHajlruAAMnQeQtaA3Ya0oUUgNL3Lm1pUYR9mzQB8sPh155CqfYErCvQl8P
         TqexIwlm6Y9itrf3k4UI9e5CR2JVNErw8eTiJbad8iGwkn9yycONhxBpo0YkfOnZVA
         XZ9qUTug//wyeptRI8s/L9tTZMyvsTbYlv188HXuKEQcDv9UMMq47ahM6OCJ8W9IIe
         bhBY/wnD05cYQ==
X-Nifty-SrcIP: [209.85.221.172]
Received: by mail-vk1-f172.google.com with SMTP id k19so5701132vke.10;
        Wed, 06 Nov 2019 07:11:56 -0800 (PST)
X-Gm-Message-State: APjAAAWUvcLDOH1HexMRqa1WYgXYJlzRMNSFPC7mrYCxWeE4rgJfSe9Z
        oEgFnYj6yswydpR0HAfdgu0atiqABJ6+B1oD/F8=
X-Google-Smtp-Source: APXvYqzxN9kXTVWbp8uHasugvvn6qLldZCY0GLlGtqGc2dnG0G/m39sosmrC9vJrS70/Dnw52iZwGpBKxmQwyFuhwZQ=
X-Received: by 2002:a1f:a349:: with SMTP id m70mr1462948vke.26.1573053114991;
 Wed, 06 Nov 2019 07:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20191106033610.29841-1-unixbhaskar@gmail.com>
In-Reply-To: <20191106033610.29841-1-unixbhaskar@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 7 Nov 2019 00:11:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDfcv8RfNq=+05Dqtb1v6f-LaPMjXTWt7bpOAy9qywFA@mail.gmail.com>
Message-ID: <CAK7LNATDfcv8RfNq=+05Dqtb1v6f-LaPMjXTWt7bpOAy9qywFA@mail.gmail.com>
Subject: Re: [PATCH]scripts:ver_linux:Added Bison and Flex to the checklist
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 6, 2019 at 12:36 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> As Masahiro pointed out ,only add Bison and Flex to the checklist.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/ver_linux | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/ver_linux b/scripts/ver_linux
> index 810e608baa24..85005d6b7f10 100755
> --- a/scripts/ver_linux
> +++ b/scripts/ver_linux
> @@ -32,6 +32,8 @@ BEGIN {
>         printversion("PPP", version("pppd --version"))
>         printversion("Isdn4k-utils", version("isdnctrl"))
>         printversion("Nfs-utils", version("showmount --version"))
> +       printversion("Bison", version("bison --version"))
> +       printversion("Flex", version("flex --version"))
>
>         while (getline <"/proc/self/maps" > 0) {
>                 if (/libc.*\.so$/) {
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
