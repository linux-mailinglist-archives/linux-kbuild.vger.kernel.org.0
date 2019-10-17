Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2F4DB305
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 19:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440557AbfJQRKY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 13:10:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43329 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbfJQRKY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 13:10:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id i32so1702790pgl.10;
        Thu, 17 Oct 2019 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=svqV4zOfagjPkCxlf2FnOeOhTBOGPslcQb282PoDogM=;
        b=pjO6HPCM8bnE7QNBsxFGs3r/KvtDB2ekWoqRrMDeWfocoZ7Ma3Jd0IM4vJO3dU7+J7
         Yuh59SQ59Q3SkZ5FSNj0y2QtEbTy+N0gIOGePAhtdbVucyqWUrLO+GgkhXy43CTbv86+
         aikotljj6yEiaCTq7uYa88RI8Qt/weSlUEKmnYnf5VHn7EYAggA0kbM/wwbSAkuljzeP
         fWWS+ocmU40Y8hp/pdF8JTDBoubFQXg9qA01qqcHuvdX6mGMi3kAJYaufu8M6kiFREle
         BAHCqw6phjgJxcW72tBwRKPL4Mu6O9VI+ERVw/31Bugx3OEISCgwEAb/SIN6TCF3cdwc
         bPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=svqV4zOfagjPkCxlf2FnOeOhTBOGPslcQb282PoDogM=;
        b=unRqWVMtka5sKzul8xbzC49XaC0RzpiBZ/PL4BQZx/k2v2djRjzy+zd32TWBpiYD82
         E+IlpClwXFEq9WzFV0445IcTA46eo9f+xxTuuL5fll0hSCiady/1rcAEH8E53uJVrv1C
         92SJ72wzWHiKErNgsYplMNKAa+CR8KIa447JWgfqjwkq0TuQeUlPfmkvXI5TKt81OGkC
         qitTlmoUIMKiplhSEnabGI3WQMn+KaJccbtGT9rrPHUMk1rM+h4VUTLyxFdKsgZxfTCs
         kK9PnnVFvwmd4j+BsUwTA5QpZRR88VqEaGE0p5ZvEV1m2PHfxb4Q4r643dLkssttc//j
         GNQQ==
X-Gm-Message-State: APjAAAUnXO7PuIv/rlGBDCBvNUszu7Xb8jHoBoHbwnbK9pt5gx/yAbda
        WaYgvyVGf4ooJbn54fbMRdo=
X-Google-Smtp-Source: APXvYqxxJcFRWKAOUQwVZB2ifmOzq2hrajjCg/H91fPDWrhev4BRbDpU0RT+y2MMjN6eZn5sJB7UEA==
X-Received: by 2002:a62:7a8c:: with SMTP id v134mr1387010pfc.143.1571332223204;
        Thu, 17 Oct 2019 10:10:23 -0700 (PDT)
Received: from Gentoo ([103.231.91.74])
        by smtp.gmail.com with ESMTPSA id a11sm3135357pfo.165.2019.10.17.10.10.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 10:10:22 -0700 (PDT)
Date:   Thu, 17 Oct 2019 22:40:09 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org
Subject: Re: [PATCH] scripts : mksysmap : NM variable missed the value,so
 fixed
Message-ID: <20191017171006.GA4995@Gentoo>
References: <20191017102506.22192-1-unixbhaskar@gmail.com>
 <265d9be5-217d-3f67-ba94-095efdcf5787@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <265d9be5-217d-3f67-ba94-095efdcf5787@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08:48 Thu 17 Oct 2019, Randy Dunlap wrote:
>On 10/17/19 3:25 AM, Bhaskar Chowdhury wrote:
>> This patch will provide the missing value for NM variable.
>>=20
>
>Hi,
>
>Does this patch fix some build error that you have encountered?
>If so, please describe it and how to cause it.
>
Okay, I tried to do that ,the script spit out not finding the nm.
Now, the sole reason being I misread it in the first place.
>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>> TO all,
>> Adjusted the subject line, missed in previous one,sorry
>>=20
>>  scripts/mksysmap | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/mksysmap b/scripts/mksysmap
>> index a35acc0d0b82..4b2f45c45f14 100755
>> --- a/scripts/mksysmap
>> +++ b/scripts/mksysmap
>> @@ -40,5 +40,5 @@
>>  # 'W' or 'w'. __crc_ are 'A' and placed in the middle
>>  # so we just ignore them to let readprofile continue to work.
>>  # (At least sparc64 has __crc_ in the middle).
>> -
>> +NM=3D$(which nm)
>
>That's not the POSIX way to do that.  It should be
>
>NM=3D$(command -v nm)
>
>But why is this needed at all?
>The top-level Makefile exports the NM variable (and many more) to scripts
>that it calls.
>
Misread it.=20
>>  $NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' >=
 $2
>> --
>> 2.21.0
>>=20
>
Sorry about the noise. Thanks Randy for catch up lackluster stuff.
>
>--=20
>~Randy
>

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2ooGoACgkQsjqdtxFL
KRX5ywf+K6wUurRjCH9BENWJSsb7+xvmm88Qlg8XtNNjsZYa3GhJXwkVRJulTqqJ
m9GKTCgwx+amP60CNSUjYguBfE/sUDVEBATsVKjHMz0ieosNVZwVvKoAQzhW8TXH
TcmWvWnrr4cX4QmTc/4gAkfuLz2rnWg+jbtv/pOmvnaQ582VXCbyKJiXQJnVLT0A
5GUJJdeDm/UGWTaR3pzdOz/yXLK+2YdEWH40aSTkQOVey29EjepW5tweMbOe9Rvd
eSoDEhlYBVYEkwTids77GJjVQNKACSqPBEFD7+RYci1TiHvRx4PqP9RFCPxycdjA
RgIBvteYuc432yRZBfQV9VZFxegsHw==
=ZXiZ
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
