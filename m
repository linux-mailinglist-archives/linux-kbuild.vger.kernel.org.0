Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04162F0F65
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 08:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730921AbfKFHBj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 02:01:39 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42111 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfKFHBi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 02:01:38 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so9024576plt.9;
        Tue, 05 Nov 2019 23:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MxSa1n+gHrOp6PMKGpdNcDU3YHnlnlTnVOvtpXq96hQ=;
        b=FLii/lUKFxSP7NlBkRW8TcsfS8d12PrwyIgYxduQTcjuvyO9CSyhsJnn2Qk0TNlYZL
         lB34iRpSXhlGGdUXgX5MmRflnU7KXpwFcbmIbkCWCtnMpq6GtOvYzOjEesFtxoTL92Nv
         sMALWipHX2DnW1kFC+Akjuc9TXl6Zh7EP3kWO85NfzZkDgE/uuUvOeigxT1LF9oUjSee
         s43QZDIWgxX7Z/CWGUm53hnu6aL+EoYztEHHblxLBrYIgu9aZCxgiUe94EotG4FLe1SD
         NtpM8j7GArccqwtORn/sMlN/fuI4za73VDm5Ebe3neYfj5/ddYthqtwdXiro5ZMVOWjW
         Y/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MxSa1n+gHrOp6PMKGpdNcDU3YHnlnlTnVOvtpXq96hQ=;
        b=Zcr14IFdH/7TlCTXKzIo9ootrVfXcHvyz8Gav/mwf5UTRu75ozWonzlDoBusY+uEVW
         0Z2esHW0A8OwalJgQSgBJ/CJ++mAhwsT/dnyiw32T+4oM6Lbo8bVWZ459x6YFvKRGYqp
         Z4RsMSKx4Mj4vdra4dpT7VpthQbUSCmFof/er9gNr1p/fdVK5dNbfZwO2ASCljJs4Okh
         kINDCnfLHSsKFLJLkKiVql9FDfmcCL+vezqtru/7rusegK38YISXa8KdBoHv3Ut16x6I
         BPKrey+TWcFKwZx7Zd1hOxJ6youpBhJfPiSuu3ueXgwnQW9dF1XNL3PDlisesKs0dZo2
         YpAg==
X-Gm-Message-State: APjAAAWjGzzF4NptmVat0deV8BF9wAyqsKmuc3+qLJdTQwxhFV3V1AXO
        8z1BCcKSOsMhiaFRQs6VwDk=
X-Google-Smtp-Source: APXvYqzJbw0+dj2HtLWRRpzgQPo9WOyJIwJJXerw9Xlczh2u7AtxkcVMkYZ8LmD3j/nBrXCnbQzT+g==
X-Received: by 2002:a17:902:7c8d:: with SMTP id y13mr1021481pll.155.1573023697546;
        Tue, 05 Nov 2019 23:01:37 -0800 (PST)
Received: from Gentoo ([103.231.91.67])
        by smtp.gmail.com with ESMTPSA id 65sm13508394pff.2.2019.11.05.23.01.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 23:01:36 -0800 (PST)
Date:   Wed, 6 Nov 2019 12:31:23 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
Message-ID: <20191106070120.GB18076@Gentoo>
References: <20191025080544.7209-1-unixbhaskar@gmail.com>
 <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
 <20191106042049.GC20442@Gentoo>
 <CAK7LNARdxhr1Ab1bkUqRjz4LGuH6mUg9kmp_4U0sYcK8uWzRyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <CAK7LNARdxhr1Ab1bkUqRjz4LGuH6mUg9kmp_4U0sYcK8uWzRyw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15:25 Wed 06 Nov 2019, Masahiro Yamada wrote:
>On Wed, Nov 6, 2019 at 1:21 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> w=
rote:
>>
>> On 13:15 Wed 06 Nov 2019, Masahiro Yamada wrote:
>> >On Fri, Oct 25, 2019 at 5:06 PM Bhaskar Chowdhury <unixbhaskar@gmail.co=
m> wrote:
>> >>
>> >> This patch will replace backquote to dollar parenthesis syntax
>> >> for better readability.Corrected one.
>> >
>> >Talking about the commit subject,
>> >which part is 'bash syntax' ?
>> >
>> >One more thing,
>> >"correct one" is not the correct way to send
>> >a new patch version.
>> >See the patch submission from other people.
>> >The version number is enclosed in the square brackets.
>> >
>> >[PATCH v2]
>> >
>> >
>> >The commit subject should describe what it does
>> >in imperative mood.
>> >
>> >https://patchwork.kernel.org/patch/11205593/
>> You are right ..my mistake ..shouldn't have included the
>> "correct one" ...and you are absolutely right..."bash syntax"
>> is as vague and confusing .
>>
>> Again , Would you mind if I send you the correct one with
>> proper subject line and explained what changed.
>
>
>I will pick up the patch with the subject corrected
>but you do not need to send similar patches any more.
>
>`...` is the correct syntax.
>Even if $(...) is more readable,
>the added value is quite small.
>
Okay , noted.
>
>
>
>--=20
>Best Regards
>Masahiro Yamada

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3Cb7wACgkQsjqdtxFL
KRWlBwgAj6yVqeQEReDZGWZ7OHnr0GRoGU13xPVK27xr0ibe2N7SJq1fwDeno/Fw
edI7d8aufFlP+vvpzZVdjdLvbMkWv/mOW3kxnURxXcq3X95nkGDoceE5Fyh7tZ+i
hxLrYMYOYFwlJikJJnI4S5HTGQ7A4B884zGRMqcC8bpAWAe6BNPDUZbmNaCZ02sW
C/3olrDvpffviu4APEtLN1lAeuKVegz4k8Mybf+5dR1wH/G9FCp1/Q/oOSCUcLpt
g7JZXEsw0xfXWtBmbI3Uwq9gEGoQ/PXDi6MC7+lRiL3LW+JBmDtlik/zKwk6DRM+
Uhm8I6PssRajlg8Pu41UBQT0VVXBMw==
=9wMq
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
