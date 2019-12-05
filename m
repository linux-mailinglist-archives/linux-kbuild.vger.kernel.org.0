Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B04113A54
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 04:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbfLEDZU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Dec 2019 22:25:20 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39576 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbfLEDZU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 22:25:20 -0500
Received: by mail-pl1-f195.google.com with SMTP id o9so619781plk.6;
        Wed, 04 Dec 2019 19:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7zAIt0+ebLHyVVxag6H3172nMR4IPY6g59wkTHZTPjs=;
        b=DXTMhGFgvbI8d4eB0ZL5yNlE4HFdkQ5Bbj5CD73XBYmUmzpxfnMNRN8prt3hPvTRpp
         zUZ9/tj9WLvtemB1X3RQOVY7Zt3CWUdS6sjaTXgsI7ewE9ByRvFA64AMGLjhQ/HYcaEK
         ehhH/+x6oNqhogXvgwkLUx/D0WjZCQy1jqlTlW6ShEs0BpFzNekybemELCm87slLzuKa
         cCxON/yL2K1oq1mfGMh7HLL7MgBWgTWB7vUufNgzkZC0GlmjT2Ibevga7oPGKRw9kbme
         1fqacyZlj/8LkdkdXc3Cbpjq6VytGNm0A39FVUboyUF9s+IzEBqM8gzQvH3vnMZWHaJb
         PiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=7zAIt0+ebLHyVVxag6H3172nMR4IPY6g59wkTHZTPjs=;
        b=iaDM3I9s1v4QU/ugsgnw/zeTxskjvOy2owRwZJaoW8kkvLRZsjbeL4dAq4N0NeugN/
         OqD1RGKfoq4HNplfLRTTLjYmBRUU7dtLqEApwCDDbaSj22Xg03HAHDJdFsMdYR6WNt4o
         iTJ1pe0d/aaVhtz9/nVt+Umx/0XE0zNa6rDvQDtz0tcUoxyFnnr2lvXJRyXOSGfAoS3k
         2LrJPlcSonEgp9C65zO7ELZMtD5mmsvfcquu7b2QEUatRUB7WtC5d7DJbDWmqzdWWCbO
         YH3ooHbtYGe7P/ySdH3dixp2gHsvlfFoMT1rOufby2x5J+IhSTK2XG3BGbJqQT2a+aEa
         qHCQ==
X-Gm-Message-State: APjAAAUxD9yA1BXVqxT3xtec5ETGTD1hx1AtcQnnElr3C4PJ747++8zD
        Q/jUhYe1vC6f2U6mD8+fbpw=
X-Google-Smtp-Source: APXvYqyv94FQzl6F84pzaKxzO6wzKQPukwZH+ug6S8/V8KDseJ/bDFnL7CTQmGQLl2VLBIrEAkAo+Q==
X-Received: by 2002:a17:90a:970b:: with SMTP id x11mr6751934pjo.35.1575516319399;
        Wed, 04 Dec 2019 19:25:19 -0800 (PST)
Received: from debian ([103.231.91.70])
        by smtp.gmail.com with ESMTPSA id i9sm9987452pfk.24.2019.12.04.19.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 19:25:18 -0800 (PST)
Date:   Thu, 5 Dec 2019 08:55:07 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     dsterba@suse.cz, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Message-ID: <20191205032503.GA3981@debian>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        dsterba@suse.cz, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
 <20191204150728.GD2734@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline
In-Reply-To: <20191204150728.GD2734@twin.jikos.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 16:07 Wed 04 Dec 2019, David Sterba wrote:
>On Wed, Dec 04, 2019 at 12:10:25PM +0900, Masahiro Yamada wrote:
>> On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury <unixbhaskar@gmail.com>=
 wrote:
>> > +awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|d=
esc|depends)/'
>>=20
>> I want to see a good reason (e.g. useful for other developers) for upstr=
eaming.
>> This script looks like your custom script, which you can maintain locall=
y.
>
>I think the verbosity should be added to either lsmod or modinfo, not
>some script in kernel git.

lsmod and modinfo already are pretty verbose and the one liner is using
one of them to cut thing out of it....can you give it another look???

Moreover,this is sort and precise and can be parsed by other scripts.

The whole point behind this is to give the developers a convenient point
without going through all the rigorous details.

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3oeIsACgkQsjqdtxFL
KRX3RQf9Ebo/O6Fv1Psf3ytEbvXQWfRvqqK6lVruZnNzgdDAW4mkeGWevG+9viHd
4Vdx94bKDHNGDRPSJs1lsm1aZH7k+Jwr6tHMUWDAFzcXHOQz3bnwM57r2gmsd0nb
YAlNscQGYEO5g6Q2TWgm+7gZVcCSupoyNrx8z8GWERhF+gsR9aUrqNyV26qGeI2T
PpkBqMhuXigTF0qkS7V5IPWNX7B2TT/caB3jrEIYHwTAVk2ozuENsQxqD27QvUPu
pdGyf+0XYAnhkJy0nvxPmurQrTcpyd5dMUW9gUymJdogQGxImZ0Hyg83f6nv8yqU
Wkwkpahx3O/d7p68WismcO9e+ssO2A==
=QvmI
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
