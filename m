Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07CB265545
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Sep 2020 00:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725283AbgIJW7n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 18:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgIJW7l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 18:59:41 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1144DC061573;
        Thu, 10 Sep 2020 15:59:40 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id f2so3139817pgd.3;
        Thu, 10 Sep 2020 15:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=WCk2bX/YNT7z2/9JsWe2t1BL4uka1nrZfC0S8q18cWg=;
        b=u4lbT73q0nerUhyGRrZhfauivZnhEdime4oYipvCQgKO0oO7EFtCkJDUBgK//5dhMF
         lWSfYGfefinVBYICgP0Okh4VYVkzfx0sVF6W4neUHdwJOkpvohP9Raj9BO9sa2kM8s3q
         FUnaW1SrZ32LoryghWN4OkKqZ3mLV9pKfM2ND+bItHSovlGJXEflkjbncWZmBRiji4Lu
         a1wuqYgvWQ+O7/DRoYIl7Q+DE6OMTyEiLaRGZsRUGAvcaQGmAINaGAE7/96M1ks/wzJ4
         IFby0BcA/4J2XEcj2j0RTyz2FX7DPNUrE8VKlAKMcoU52fBUX7s6dmrrraHZVqSII5dI
         y+0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=WCk2bX/YNT7z2/9JsWe2t1BL4uka1nrZfC0S8q18cWg=;
        b=fyQXftWJCGHMD4DOy0rgiFKsI51ReRYcdF4VwdwG4nocY+UCZs+m0BG9U/jf3rg7Dd
         NG9wS4iCZnyvpAO8uE+tpY4tRMIJDqtidninovmLf1xNztXS9Es2cALfUIjRa1iO8Tpw
         EXApLu/yCwVpO4bjg/1DnMiDsQHGHTNnQvXDXaOSlDmvn+TQc/mBKp8zGe1WuZuue+BT
         eY3dVOETGA7s0wIV2Ng4unmB3iv3VmemoYzCeGIacRN1Nb0BuyfxWIeHRLAxuhWpnNS3
         CughbhPrSBYNdZESth+22WPLl1ortONvfj64PmAglf0qq1iZj5kSrNUzgdh5LCxGG7x2
         ijUw==
X-Gm-Message-State: AOAM532T/8fZhNQNLceczdA0iYmShOP4RH7o46pLfQ7TWgvAQATThUm5
        mX3I98UO+VhVpJzGF0Kc+WYU4HaPWIp5j6RM
X-Google-Smtp-Source: ABdhPJyf0FVUXmww71xlcWMxj12unsFtmF5ULtApqJcGRrSioIPcEAT3x7hvtGIhL+ESycOZMzX1sg==
X-Received: by 2002:a17:902:b216:: with SMTP id t22mr8011535plr.35.1599778779423;
        Thu, 10 Sep 2020 15:59:39 -0700 (PDT)
Received: from Gentoo (sau-ff5be-or.servercontrol.com.au. [43.250.207.3])
        by smtp.gmail.com with ESMTPSA id a14sm82578pju.30.2020.09.10.15.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 15:59:38 -0700 (PDT)
Date:   Fri, 11 Sep 2020 04:29:28 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     masahiroy@kernel.org, jeremie.francois@gmail.com,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts : config : Added example use when run without
 argument,extend help
Message-ID: <20200910225928.GB10714@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>, masahiroy@kernel.org,
        jeremie.francois@gmail.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
References: <20200910110713.12782-1-unixbhaskar@gmail.com>
 <13084d55-6b9a-5c6b-0ce0-84739b3e1072@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline
In-Reply-To: <13084d55-6b9a-5c6b-0ce0-84739b3e1072@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15:52 Thu 10 Sep 2020, Randy Dunlap wrote:
>Hi,
>
>Please be more careful. There are many errors here. (see below)

Silly me! thanks Randy :)

~Bhaskar=20
>
>On 9/10/20 4:07 AM, Bhaskar Chowdhury wrote:
>> This patch extends the help section by adding an explicit example of use.
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/config | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>=20
>> diff --git a/scripts/config b/scripts/config
>> index eee5b7f3a092..b75a5aab2453 100755
>> --- a/scripts/config
>> +++ b/scripts/config
>> @@ -45,6 +45,25 @@ make time.
>>  By default, $myname will upper-case the given symbol. Use --keep-case t=
o keep
>>  the case of all following symbols unchanged.
>> =20
>> +The concerete example, say, you want to change any particular config ,l=
ike
>
>       concrete                                                  config, l=
ike
>
>> +GKOV for profiling , you can simply use this command
>
>   GCOV
>
>> +
>> +To enable :
>
>      enable:
>
>> +
>> +#scripts/config --enable GKOV_KERNEL  && grep GKOV .config
>
>                            GCOV_KERNEL          GCOV
>
>> +
>> + and the output will be like this :
>
>                                this:
>
>> +
>> +  CONFIG_GKOV_KERNEL=3Dy
>
>            GCOV
>
>> +
>> +To disable :
>
>      disable:
>
>> +
>> +#scripts/config --disable GKOV_KERNEL  && grep GKOV .config
>
>                             GCOV                 GCOV
>
>> +
>> +  and the output will be like this :
>
>                                 this:
>
>> +
>> +# CONFIG_GKOV_KERNEL is not set
>
>            GCOV
>
>> +
>>  $myname uses 'CONFIG_' as the default symbol prefix. Set the environment
>>  variable CONFIG_ to the prefix to use. Eg.: CONFIG_=3D"FOO_" $myname ...
>>  EOL
>>=20
>
>
>--=20
>~Randy
>

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl9ar9AACgkQsjqdtxFL
KRUTfAgAzU37uG52mvMQo0s0FEZ9QRGFIjQTNCDSCYz7J7ET+eZ5UjKX6TtLZKWy
fH04zN4/wlBinTXiKJ7ZxcP0daIw6EKehB+pxCkNs8OWeSSJHLSzDOAlm3i21m/x
FnfW0ona3lTGz02a/jy/II2SmRVQ19iwO490eEg4XNJimgmGRbRqM8UDAbeSlfzD
tFQsd/zADMtbY9XxWwJUz70uysfVyRaN2k9YjvepWvPnIChCWU4j49SCS+kMEMSB
KltGxycLXytvWVArFLLrt3n+vVMwTbM387cr9vR4RSrSP+4qOZMjqNVFhLq4M3Ce
VcMSo5j3YpkiWGZeHCat6+iEMA/TOA==
=jhvs
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
