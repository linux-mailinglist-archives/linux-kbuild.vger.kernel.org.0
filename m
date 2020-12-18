Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 331AA2DEA47
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Dec 2020 21:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387424AbgLRUeZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Dec 2020 15:34:25 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2456 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgLRUeZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Dec 2020 15:34:25 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fdd12280000>; Fri, 18 Dec 2020 12:33:44 -0800
Received: from [10.26.73.104] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec
 2020 20:33:40 +0000
Subject: Re: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        "Emese Revfy" <re.emese@gmail.com>,
        <linux-hardening@vger.kernel.org>,
        "Nathan Chancellor" <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
 <CAHk-=wjjiYjCp61gdAMpDOsUBU-A2hFFKJoVx5VAC7yV4K6WYg@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <95ce88c6-59bd-55b9-9299-51fa20aeb95c@nvidia.com>
Date:   Fri, 18 Dec 2020 20:33:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjjiYjCp61gdAMpDOsUBU-A2hFFKJoVx5VAC7yV4K6WYg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1608323624; bh=Vkw+uLqloTF34H+X6XM+h7o523zkguJSKp2ANgZpfIM=;
        h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
         MIME-Version:In-Reply-To:Content-Type:Content-Language:
         Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
        b=Pok/cBh0wN8IAVvzeF5jEn57A5ob4lQ1P0qK2Bdc2cm6N1/z37Qv7pfizvNmSoPOh
         zmWAyonWTbySw/djJhHH7OYkSRAQJqhYXqJizNSFs5P7zbFyIPWPVkodGEXhKNwC54
         k0/10wuhaKlZ8mYM8E7wSbu2yx3tdnAnTlDAeiLQerZK192CPRJG02/nNWko2zHkb9
         spqvrpQBWAdonaLDuNtUEyLSlj91WLKZbPGK4t+kB8TljXisxsoh6nAzclRnvHEqz5
         I9+U5YlOOEFDyVDP4IY9LvX3A0+zc+eO9iX3NWBgaEeWgcj1E72ufVLx1XdCrU/zyr
         Y6j+R7r179QTg==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 18/12/2020 17:54, Linus Torvalds wrote:
> On Fri, Dec 18, 2020 at 7:33 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>> However, if you are saying that this is a problem/bug with our builders,
>> then of course we will have to get this fixed.
> 
> This seems to be a package dependency problem with the gcc plugins -
> they clearly want libgmp, but apparently the package hasn't specified
> that dependency.
> 
> If this turns out to be a big problem, I guess we can't simplify the
> plugin check after all.
> 
> We historically just disabled gcc-plugins if that header didn't build,
> which obviously meant that it "worked" for people, but it also means
> that clearly the coverage can't have been as good as it could/should
> be.
> 
> So if it's as simple as just installing the GNU multiprecision
> libraries ("gmp-devel" on most rpm-based systems, "libgmp-dev" on most
> debian systems), then I think that's the right thing to do. You'll get
> a working build again, and equally importantly, your build servers
> will actually do a better job of covering the different build options.


Thanks. I have reported this issue to the team that administers the
builders. So hopefully, they will install the necessary packages for us
now.

Cheers
Jon

-- 
nvpublic
