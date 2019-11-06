Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE634F0CC5
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 04:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730963AbfKFDME (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 22:12:04 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34202 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730752AbfKFDMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 22:12:03 -0500
Received: by mail-pl1-f194.google.com with SMTP id k7so10751869pll.1;
        Tue, 05 Nov 2019 19:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Lha2oDoZN0tSfiTj9/tLkrzR/D7C50FvvVu/qFpZHiE=;
        b=gQB5aFP5Sq3MmhQu4fv+tNeLWjCDPpPYQWdokpqwr+n90heWUxVqQyG5cuQtCRaS/f
         YeGvnFDt69S8Tunn3K9mm2zRL0Tz+m1WmKfgSo7QgrwMmm2pgbcU15ALsnffmy8x7kcd
         4fKrTlxZTo8h4uE8f9UQoeO6Rn713mEOnUH/1ejSdlL00bL3NPP5Rv1KLiZkfdULU7Qs
         uMx3I6HQXz45+QVulNJ1TJr+TrJyq+qICPbAYf63RPBNJHYnlPtGecSaxkSjoDvki97y
         lybZ9vQumlUdj6UyjDz2dWNHyssqy1WEK4dsYPYpGgiY31cOhajsL2m+pndCFZ0NRu8q
         0bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Lha2oDoZN0tSfiTj9/tLkrzR/D7C50FvvVu/qFpZHiE=;
        b=OplSTkG3a6asgSMcYDgzmYB+zx1QK4nQ/YvKG4ZEbE0lxYFV1CVJCL8S7Gau8TcG4y
         sH3vtUuSRePUNyxrsbws7rMPaQ+KsO2lFFnMSphbfDDNhjK7ptoFdw5f+03tMq9voYmb
         9DxM/WgpwwCBmkj5MRWLCW+caBP5UHl00imIVguuKahTddZ71n97hACBGwx8r+eYL9/Y
         V3M/FFpH7Gm/6QFW/RHZ8Vu88TLrw3OFSuVKPIOdmO6jomN9qCyA1n3XTtOu/Dv6S3KY
         ZuXVAIqlziN1V42wiK6yi6Gby5p8t/iCb6IMIgCpaR7joU/FUxN9LZwhvsmKGDEghpzF
         HCgw==
X-Gm-Message-State: APjAAAXRz/BITtCtnfk0S97Qg9rfa9VZTkLocN+nOUNsYTgLLDX9gmyy
        TiCQ8UObDVQkpP11feokh94=
X-Google-Smtp-Source: APXvYqwh87bMkwPA4PLre6V5QNCsAJtQLqMTJMGvORj1hjtk0F4BddtNuPf95nHdseX5OfQwWq3mdQ==
X-Received: by 2002:a17:902:9f81:: with SMTP id g1mr186846plq.286.1573009921721;
        Tue, 05 Nov 2019 19:12:01 -0800 (PST)
Received: from Gentoo ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id s11sm13309256pgo.85.2019.11.05.19.11.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 19:12:01 -0800 (PST)
Date:   Wed, 6 Nov 2019 08:41:47 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts: ver_linux:add flex, bison and yacc to the
 checklist
Message-ID: <20191106031144.GB20442@Gentoo>
References: <20191105113100.521-1-unixbhaskar@gmail.com>
 <CAK7LNARqHQwiQEQS_6ZX4GiBuVjo92fECLiVJYN2ixCcJUjU5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <CAK7LNARqHQwiQEQS_6ZX4GiBuVjo92fECLiVJYN2ixCcJUjU5w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:33 Wed 06 Nov 2019, Masahiro Yamada wrote:
>On Tue, Nov 5, 2019 at 8:31 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> w=
rote:
>>
>> This patch add three ulities explicitly to the checklist,namely
>> flex,bison and yacc.
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/ver_linux | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/ver_linux b/scripts/ver_linux
>> index 810e608baa24..397497cf9430 100755
>> --- a/scripts/ver_linux
>> +++ b/scripts/ver_linux
>> @@ -32,6 +32,9 @@ BEGIN {
>>         printversion("PPP", version("pppd --version"))
>>         printversion("Isdn4k-utils", version("isdnctrl"))
>>         printversion("Nfs-utils", version("showmount --version"))
>> +       printversion("Bison", version("bison --version"))
>> +       printversion("Flex", version("flex --version"))
>> +       printversion("Yacc", version("yacc --version"))
>
>I think adding only "Bison" an "Flex" is enough.
>
Will remove yacc from it.
>
>
>>         while (getline <"/proc/self/maps" > 0) {
>>                 if (/libc.*\.so$/) {
>> --
>> 2.23.0
>>
>
>
>--=20
>Best Regards
>Masahiro Yamada

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3COfAACgkQsjqdtxFL
KRWtCgf8CouRnUp+HDpl/vEAFahAEY0o4lqamsshO4cdXap+8KbO2PHfLNLcSmQW
59dALcN1hYR4JkW+Cs29frcKV0vqx/nJExRdakrdlqJsYEmVF7LbEU94B8J8YrUm
Qmqk70nWSHeOFrRkwQ13QWCK5XYY6BgbLQ/qeR3/Vfvn99vNKNSqlO0BViYex3CO
uFqsDTweFhC3PW48Po+13aHksNJVgQM+muztCmRcBhF9bj9ySLI+lcPb3rnrWKJi
8nFDLtPwqhA2icvDdJzg+K8M7uIgTSetdpwu1VDXXMehz2yn/eGx7nQlyPrV1I0I
rTj51Xzr2H1KVxhE6Cq2pHngocTdDQ==
=0RrW
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
