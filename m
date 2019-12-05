Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EED5113B14
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Dec 2019 06:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbfLEFPH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Dec 2019 00:15:07 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41572 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfLEFPH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Dec 2019 00:15:07 -0500
Received: by mail-pl1-f195.google.com with SMTP id bd4so726759plb.8;
        Wed, 04 Dec 2019 21:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pik8NFF0x8ORqK3iKOBC400ObajkGGjl3DNLr2vNq4c=;
        b=nEeRGPdPW5PapHVRJzENC8q5hvdUffDMRFkxC+R0sElMr2QEd41x1EaPJgwJ/OED6Q
         nBkoyCAxkq2C4yoY/kazQmVVpOwkWZvd+BUgyGLw14B38/wnBoJnXo/PbHgYsfUtA5eB
         ClF795YiSjEeuIt4EpQecdzz46VUK+ED063SDp1z157n7fchP5uwUAvm8GizqdlI2J8H
         o9NmDi3e1FIcfnU33qTmXdfE3dpeDxg+Wu0RxNUECtpA/m4xMUN+v7HOuA3aqqlIKPRA
         biD5m6py4LRD2KXezk+vrJnAyFjTGn0gbYsz7F26i4oJ7w45FnPebP+C2hRcYTYJtY+I
         CseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=pik8NFF0x8ORqK3iKOBC400ObajkGGjl3DNLr2vNq4c=;
        b=AcNiR0MGLnFdqHvQhMd3QiEAXUoefwrHXL8OwqyGxy0Vd5sE/q0KKfpqupSptfO2kk
         fmLVS0W6SpWWd74qJh19nSosxD+CHul4ug18VM3YooGrBFu6fBgKo4GlGsSTQQjMa3fH
         nKaSMQkFBY77mtqeYjglVqYOSdtsHZIqP2PCR5vVZFfe7qEBVcbEGPYB8i9vh3iRv1rg
         KUUOojxy8Jc5rw0qav2zf+WZpxruzY7WupbsICqA+Wb8lpZ4PwQe4GBnZe8h9/EHzN+t
         pTL6IrJfRJze2LPXrYx5HdVRuHbVV+CiRYH8fK2GzUZzz5JoeT01eVo+CW2EQswEbBmm
         dGhw==
X-Gm-Message-State: APjAAAWThsA+xtw8047d3fBljIaoCmgjum0t5zUT6dRfowJqlQLnwjs0
        JCpPstSoBQBVXN+/Ai/NeeI=
X-Google-Smtp-Source: APXvYqz/wUb2Py7PwTNJK/QXkBECBF3gjxYytODhvYvH0JM58UJuv+9AKF5NAaNtXbnZPs8++iNqkw==
X-Received: by 2002:a17:90b:244:: with SMTP id fz4mr7491746pjb.27.1575522907057;
        Wed, 04 Dec 2019 21:15:07 -0800 (PST)
Received: from Slackware ([103.231.91.38])
        by smtp.gmail.com with ESMTPSA id b190sm10428210pfg.66.2019.12.04.21.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 21:15:06 -0800 (PST)
Date:   Thu, 5 Dec 2019 10:44:54 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] fix the SPDX syntax and bash interprester pointer
Message-ID: <20191205051454.GB1795@Slackware>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191203095339.615774-1-unixbhaskar@gmail.com>
 <56303cd3-fcf8-49cd-f66a-4db7e382774c@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline
In-Reply-To: <56303cd3-fcf8-49cd-f66a-4db7e382774c@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19:36 Wed 04 Dec 2019, Randy Dunlap wrote:
>On 12/3/19 1:53 AM, Bhaskar Chowdhury wrote:
>> SPDX syntax was complining by checkpatch fixed it,added space before it.
>> And add bash interpreter to find by the env .
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/kernel_modules_info.sh | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_inf=
o.sh
>> index f005c47a3aa6..3a9b00988ed3 100755
>> --- a/scripts/kernel_modules_info.sh
>> +++ b/scripts/kernel_modules_info.sh
>> @@ -1,5 +1,5 @@
>> -#!/bin/bash -=20
>> -#SPDX-License-Identifier: GPL-2.0
>> +#!/usr/bin/env bash=20
>> +# SPDX-License-Identifier: GPL-2.0
>>  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>  #
>>  #          FILE: kernel_modules_info.sh
>>=20
>
>a.  There is no good reason for patch 2/2.  Just merge the 2 patches.
>
>b.  The big header comment in patch 1/2 is not needed and is unwanted.
>Just put some or all of that in the patch description/comment message.
>
Sure, will do.
>
>--=20
>~Randy
>

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3okkgACgkQsjqdtxFL
KRXbxQgAhat4587gaoyRNOa21+kvB4Q6ui6yRplOY+G3lUt8lFz1WDylqXgkZJXt
mqHAwXXgZ7UEcYeHN+UQ3Zv9BeJ3z7kdZ9dDjNJlyP+RLJ26w28FshQLRF5k6LyT
PRiprV5e80wxct4OJD+ImS7MpRck5wnKaOxQLqJ46mUMOCC7JKBehA305WZvb5DV
6bZMQ1IErFST+66nuPs/gs6Vqs+MeuaesiCP68+s/iRohYSko6IJedqqK3Smh42J
ecczqKILoZeulJ0MBcA256eKv3U4Jw6vMpsU3rPawy87LJdwLNZ7rHBqTvSXZiB2
FAo1g4Gn1dXPNilqkOIipzObG0G+Fg==
=i601
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
