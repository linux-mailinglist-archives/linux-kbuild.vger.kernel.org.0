Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47FA2DE703
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 16:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbgLRP42 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 10:56:28 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:13459 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725949AbgLRP41 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 10:56:27 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fdcd1030000>; Fri, 18 Dec 2020 07:55:47 -0800
Received: from [10.26.73.104] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec
 2020 15:55:41 +0000
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Masahiro Yamada <masahiroy@kernel.org>
CC:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        "Emese Revfy" <re.emese@gmail.com>,
        <linux-hardening@vger.kernel.org>,
        "Linus Torvalds" <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
References: <CGME20201218075758eucas1p1605768803a5c9edce4fbe54b3e3b859a@eucas1p1.samsung.com>
 <20201203125700.161354-1-masahiroy@kernel.org>
 <b9b17126-9af5-2f73-526e-91bb9fd27f71@samsung.com>
 <CAK7LNART2qQBY7Vc8rhMiXS_Fwty7qpWjwwfPrUegTb-gjy6sA@mail.gmail.com>
 <9f959875-1a30-b1a1-b626-3805e24a6df3@samsung.com>
 <e5b06d9a-9b24-2440-e0c2-8bf7095eccd9@nvidia.com>
 <25030057-86b1-5619-25fd-acfa0728b850@samsung.com>
 <4ab4f62f-8b37-01e1-f81c-270155b13a51@nvidia.com>
 <7e691a61-bf4b-0594-8d6d-36d62a5def0b@nvidia.com>
 <CAK7LNAQ6pzMGm=L9389Xtfghjfjr_wDqRntZC2XqP3JDQuhLhQ@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <c2a968fa-5a98-d9ea-3255-1e3be3e9c704@nvidia.com>
Date:   Fri, 18 Dec 2020 15:55:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ6pzMGm=L9389Xtfghjfjr_wDqRntZC2XqP3JDQuhLhQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1608306947; bh=Vf95MzpRH15xDbnzDYz9T/qpYpIZeGHo+3utb3dK3p0=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=gG1/wrOtHRdihF20uuUYpsjhtLGEJ5rvCJOx94H2d7uzNK19cqpHiseyv8P0NMLnv
         I8Zi4EIzJDUESASrLirKD8QcdqAyICwtSnYzjefHZfkdImiC/meaX6PB4jWksKyPn3
         NXHBxyDYBsPaGvIZ501PqOkAVxG0tSXgtdtUHyu7vZ8LnAkWl2orGfSQ/aKjOvU0gK
         sooRrWLWtSoa9pZjxe/t09QaLppo6aGzGKrhF0D8JG21EijrBMc9Eb0V6ol/6FEdsg
         QZ5CwULlbPQOI299ues3dhGG3lEJU8VMBTHUof23kR279uTCiRUmzbkTxDCXNCLbaG
         yi8K0JAnpKkIQ==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 18/12/2020 15:42, Masahiro Yamada wrote:

...

>> However, if you are saying that this is a problem/bug with our builders,
>> then of course we will have to get this fixed.
>>
> 
> 
> Yes, please do so.
> 
> 
> Kconfig evaluates $(CC) capabilities, and
> hides CONFIG options it cannot support.
> 
> 
> In contrast, we do not do that for $(HOSTCC)
> capabilities because it is just a matter of some
> missing packages.
> 
> 
> For example, if you enable CONFIG_SYSTEM_TRUSTED_KEYRING
> and fail to build scripts/extrace-cert.c
> due to missing <openssl/bio.h>,
> you need to install the openssl dev package.
> 
> It is the same pattern.


OK, thanks for confirming. We will get this fixed.

Cheers Jon

-- 
nvpublic
