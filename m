Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47153E6BAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Oct 2019 05:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725829AbfJ1EIC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Oct 2019 00:08:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40869 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbfJ1EIC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Oct 2019 00:08:02 -0400
Received: by mail-pf1-f195.google.com with SMTP id r4so291913pfl.7;
        Sun, 27 Oct 2019 21:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=M+JCnLVO7k5sgL7e6vUUqOzfMKUozwuBzdcMo3Begoc=;
        b=A/gJI3YW/e0s3g7Z7hjRGYPHHn46UbLpe/WW/B3TmoKKkeog9YTPW93VXb/u3HEJkc
         wgTtPTn6hbJpldju6kCXODxaqkqODNTvr1KsFnWS0dp009BD9pJzbTsSYQIREs+c0APc
         LSb2q1PvpFltmlFgCA7o6He3E0UeQ5ccAojPBTlg5/lka1G0M7YJ4/RFKfRh0JS80tMY
         1Jo+ypmh2buQAJkALUnaST89qJerunVEsO+pLv2JH3DGCJRuK5ytXWDqD0OTYR7bTaVU
         VqraANNzP/pinJEpW76cDLaSUIEH+PRq80JNRmufEHz7zWjZgxFMe28dJlgIBV1Ehxdw
         WCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=M+JCnLVO7k5sgL7e6vUUqOzfMKUozwuBzdcMo3Begoc=;
        b=bfcnhJWFuMDG8ed1/HtLwud8M9Jt7lzkXKVwqpV5FrnQx3JpA07DJwl3dM0Tu9026I
         Aku2rnH4ClPnhTp/D9jRr+gj2Wlm2+iuJ2iokOEi6jlTzcH1YApUjjRsYJ8kqNkItsdg
         3JcQ1SZX4JyRs+iLKr8ryvmBAFfFy6WdDxOXj4jCroo+b2lhslaMJYLj/Pt7oihXaEr+
         ULc9/vR/KJFtoSi8cOBU/jHENOU+mjVXm/knW4w5Akp6J/CDfagc91LoDF5Fd0cHlPeu
         iivfvgCTbfhe+lFmkdmLwN4IaX/PmWj6TTAy0uDafjNYwiCkbAgGhbN96ORgPQlu7NXX
         JFnA==
X-Gm-Message-State: APjAAAXwjj9uny+vcbo4HxGd7G8Qk/9UR+417PAQK2wiNnQshYfoHACD
        scfVyKPWnnDhAIvdUjMlDWSi6STa6psR0w==
X-Google-Smtp-Source: APXvYqxLtx6TSf2nK3x/ltWsorhYQvUuPphrsy4mzzP5JMokHqSVbZ/q79yeYMZfEH2HxirM6A2bbg==
X-Received: by 2002:a17:90a:c406:: with SMTP id i6mr19491573pjt.98.1572235681412;
        Sun, 27 Oct 2019 21:08:01 -0700 (PDT)
Received: from Gentoo ([103.231.91.74])
        by smtp.gmail.com with ESMTPSA id b128sm5887220pga.59.2019.10.27.21.07.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 21:08:00 -0700 (PDT)
Date:   Mon, 28 Oct 2019 09:37:48 +0530
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        bfields@fieldses.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts:prune-kernel:prune old kernels and modules dir
Message-ID: <20191028040745.GB28082@Gentoo>
References: <20191025054703.16400-1-unixbhaskar@gmail.com>
 <4adba61c-9c1b-dee3-0a9b-9159dcce5a82@infradead.org>
 <20191028032203.GA28082@Gentoo>
 <83f11555-8364-1e2d-f0df-c90e889710a3@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H+4ONPRPur6+Ovig"
Content-Disposition: inline
In-Reply-To: <83f11555-8364-1e2d-f0df-c90e889710a3@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--H+4ONPRPur6+Ovig
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 20:28 Sun 27 Oct 2019, Randy Dunlap wrote:
>On 10/27/19 8:22 PM, Bhaskar Chowdhury wrote:
>>>> +do=20
>>>
>>> 'do'=C2=A0has=C2=A0a=C2=A0trailing=C2=A0space=C2=A0after=C2=A0it.=C2=A0=
=C2=A0drop=C2=A0it.
>>>
>> Certain=C2=A0thing=C2=A0..this=C2=A0space=C2=A0and=C2=A0tab=C2=A0killing=
=C2=A0me...how=C2=A0fix=C2=A0these=C2=A0damn=C2=A0thing
>> Randy??
>
>I dunno.  It depends on what editor you are using and what
>options.  So what editor?
vim all the way.
>--=20
>~Randy
>

--H+4ONPRPur6+Ovig
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl22aY4ACgkQsjqdtxFL
KRUlwwf/STbFVq+ib1g9RyBsAvd5yEx9SKUxfo2+/Y6JPgL5DyK5Kq/mx9jiFJPj
es7wzHmGskfLDaNIpO6to1AzWYvxIr4vdDvIXk6ZS8WwL+XR1mnVv5cVEXOKoW55
TmgPOpgEsA47dWaKsmg1E9WP5974El1teB/mv16+bRcfhLFLCsqkaffks5FqBI3o
cdF3E2WsW/lwfsNh2RQK3/0Pmm6I57uQnhxKHUEIaDS7c8WGrjaYtvw7/S/jQ25B
R3ToFeeUUWPswZNH1e4hSr5awhUi+Ogb915ziVHzmhVOsTjq6yViIoSHliJfgQa4
VCS9zOt/48VVb6/ZjmeQDVbi4Ohe2g==
=jZuj
-----END PGP SIGNATURE-----

--H+4ONPRPur6+Ovig--
