Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D8626579E
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Sep 2020 05:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgIKDk4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 23:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgIKDky (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 23:40:54 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F91C061573;
        Thu, 10 Sep 2020 20:40:53 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f18so6196499pfa.10;
        Thu, 10 Sep 2020 20:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6YommAFs/DzwZq5AZZ2OWdEKY/cFA6itjVdaLg6Vkbg=;
        b=qiTVKyW8w5c/loI0VnWOGr8I6QdWFRX2uaXqDZ94IBRS0nhD4A1i2UN+sx+FCkd3EU
         KZg2ivPPz716pKsgLBQ9iFKyZpjM1sT0mvotlcixZ78Kv4Gx4r6Vr4PQ+20dywVGXFj3
         2fI+lBqQgVRR087tjSLJe8v7UsD2dXwXkQHfDmyaRfQOAdg8vFoBHcXafaKmyKG6jUSx
         hwhiGrHRhABX/dL4/kxb4UkVU3zVDQVbMl9N/GJbKStpCguRmTWLl21g6lSmFvQetP5Z
         X1oW/a079CwHEZsud7hvls/QYHKHeaqC+MmMvs+lF3tZpURYux53BkiCuDoctIlfq5qB
         +iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=6YommAFs/DzwZq5AZZ2OWdEKY/cFA6itjVdaLg6Vkbg=;
        b=Cwy08Kcbcaq7UFs7SG50A9VRlgZtwsAO6IBdVSrSXlD80miLWY8fJLt3KkbnMIFpVw
         BqS5gdEcZKHvdi90reoFnZwXsGRp8mr/+X6XrPk6dbGnk9NsScisIz0r8JeKKMGMFShx
         k2fYktj5uV6A5JiOZMwzW4la4FzSGza7Jic341aqGLXRjNx1h/xY5VmJETqQ2rPgtut3
         6EijF1UWFHTm8m+8Yo0M28W8IoASKssgiDqKdLSYwp5gbkG98QVTan186abEVKvl0rqA
         iG8bjON/QLjo1RJ4guQxlYGK5I6pmBA46vigZBWNNlkHYgkBp+PzkGcaD8NE02eo27Nx
         2xkA==
X-Gm-Message-State: AOAM533GvH2Tq/JhSt6y0gWy/5cJNLAVqvcr0xOrupCXT/kxzLfKAaQM
        skNZB6JtD5pwLQ5kbM5m29u97+eko4NAC+Rj
X-Google-Smtp-Source: ABdhPJz8Ys1gBF8bphhDCNo4LT5i8GDB5UT/QzOn9Zaz8zAGjGMh37HeWEJckSRvr9/hXloE4oQOyw==
X-Received: by 2002:a17:902:8a98:: with SMTP id p24mr73541plo.58.1599795653185;
        Thu, 10 Sep 2020 20:40:53 -0700 (PDT)
Received: from debian (sau-ff5be-or.servercontrol.com.au. [43.250.207.3])
        by smtp.gmail.com with ESMTPSA id g32sm404085pgl.89.2020.09.10.20.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 20:40:52 -0700 (PDT)
Date:   Fri, 11 Sep 2020 09:10:41 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     masahiroy@kernel.org, jeremie.francois@gmail.com,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH V2] scripts : config : Added example use when run without
 argument,extend help
Message-ID: <20200911034037.GA4063@debian>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>, masahiroy@kernel.org,
        jeremie.francois@gmail.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
References: <20200911015421.22193-1-unixbhaskar@gmail.com>
 <508f3917-8b3f-fe38-f6bf-43f5026fc4e2@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <508f3917-8b3f-fe38-f6bf-43f5026fc4e2@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20:08 Thu 10 Sep 2020, Randy Dunlap wrote:
>On 9/10/20 6:54 PM, Bhaskar Chowdhury wrote:
>> This patch extends the help section by adding an explicit example of use.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>
>Difference between versions goes here.
>
>>  scripts/config | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>=20
>> diff --git a/scripts/config b/scripts/config
>> index eee5b7f3a092..d905dccabb94 100755
>> --- a/scripts/config
>> +++ b/scripts/config
>> @@ -45,6 +45,23 @@ make time.
>>  By default, $myname will upper-case the given symbol. Use --keep-case t=
o keep
>>  the case of all following symbols unchanged.
>> =20
>> +The concrete example, say, you want to change any particular config,like
>
>                                                                config, li=
ke
>
>> +GCOV for profiling, you can simply use this command
>
>                                               command.
>
>> +
>> +To enable:
>> +
>> +#scripts/config --enable GCOV_KERNEL  && grep GCOV .config
>> +
>> + and the output will be like this:
>> +
>> +  CONFIG_GCOV_KERNEL=3Dy
>> +
>> +To disable:
>> +
>> +#scripts/config --disable GCOV_KERNEL  && grep GCOV .config
>> +
>> +# CONFIG_GCOV_KERNEL is not set
>> +
>>  $myname uses 'CONFIG_' as the default symbol prefix. Set the environment
>>  variable CONFIG_ to the prefix to use. Eg.: CONFIG_=3D"FOO_" $myname ...
>>  EOL
>>=20
>
>I don't know why we need this extra help text.

I am not sure I get you ...should have mentioned in the first place, so it
save some of my time ....moreover, I was doing it because I felt it necessa=
ry
to let the user of this script to know what/how easily things can be
done.Period.

Look like decision making is badly bugged.=20

~Bhaskar=20
>--=20
>~Randy
>

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl9a8bIACgkQsjqdtxFL
KRX4LAf/SAS+VQ9m3u7u+dCla1Ey+5tRVkXNDI+8rko4iJUMJF6WJnQ2bHQSgeo3
x6wtaroyZZ8OfOblF0dgqwK5WG2EcDlWzTdB3DR5KPosvXATukE0llY/USv31TcH
fvcJHDV2/5hOxSmDg+3QWfBknMy4n5hc1zrSEvCRvo4CUe2B4doDe5AxFtGWLvG9
eQFlx9HGO/YEgHJFwv7fkU+ttqbFnV3yM4gXq0XApAVN7lS9mVmVVPZzFwrW8L6x
OIvWUgrQKtPjMDSEZvpgaLuW15AIXOJByZ0Z2PGCa38bqR5NTecd0asnV9BJW2nP
mr+wz+dm1FyhbtCRmhw9jZ3u7HEdiw==
=GWJq
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
