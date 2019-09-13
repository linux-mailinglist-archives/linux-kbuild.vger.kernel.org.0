Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF83B1849
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2019 08:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbfIMG2j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Sep 2019 02:28:39 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:36167 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfIMG2i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Sep 2019 02:28:38 -0400
Received: from leknes.fjasle.eu ([92.116.125.99]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MVeDq-1hjOP42w2G-00RdMV; Fri, 13 Sep 2019 08:28:14 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
        id 8BB1E3CCF0; Fri, 13 Sep 2019 08:28:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
        t=1568356091; bh=xyo6lM4jCmLufSco/FyKCrj//g7FNEdceqSRe6r75JY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IYQaL8fErhrTe1SWrhuYGOAy5CXlk3iSazzf4la60ONP6F0EhxCV+jmOkpKP/NaD7
         6ZAcJw0Jv7LFeTpVK5GI799dHnycyP8mY0seLEHRelKh5//sgJgd+O0yUz+VsMKaqM
         wSv0FbSM2iVVQLgQo1fBZ2gfDY57dqXqLE+UxiVc=
Date:   Fri, 13 Sep 2019 08:28:11 +0200
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, ab@php.net
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible
 builds
Message-ID: <20190913062811.GG8267@fjasle.eu>
Mail-Followup-To: Ben Hutchings <ben@decadent.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, ab@php.net
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Provags-ID: V03:K1:b14/kANsEXbOMH7UK1OUf2mg8ui2gdcrMJeystapdZL0NG/+hpX
 jOW+UhotSwo9BXal+yxHI0Ak2gmi7t7pHfWoff9/jpjSxmjy3QRLyFD4MV0vCGoh+vzwkHs
 aScZ9zDUiiFYU1WJj83i29zj7ZZlDBvbJ5s4oMvPA0Xkw8/QhC6awXSebAKGs6x8aVqygdA
 cxAtTv/dN3y3deLptlw/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WKZ397ORvac=:eYOIPEYQbhdd+nYq0qSyM1
 O/r8HbQfK8B/t7r4s4v5UrGaZS1uOTLNrILxNijvJCh2C+Ey4XV6rPpqCcGf9Wd2mdoE6OT25
 n/3zf854C1RE14CBdbF1hZI3wZVzvch8ZvNpqznrj5KeJgGEjyDnhtf4FkwFaXu81m2O75wbf
 q5XOGiV2HOqajN+3jbUTp7IAbbiFtNKSu5EiY5CCSLpFVKCLENGJZfKGiXnGiqvPujLwzYEo7
 zo2MVSToWorPILVL8Pv8VkM5MhrSEH39e8DIRGNnrrroOBd1j2zalISuxAH2h7TKw4vPhDgqh
 nQdcQOQgjy3A2LrJP/vUfGlpyS8PBzUIH+y+//25aKmNVsw+Xu6vnvUeaW4Ct5hD39r37xTee
 ew3YcVBOqTdFImGBjbap9mUSwwsPeV+HZ2wNkmkJ3JFkm7HJDNuW88/9SMmAOtCHSWPcbuw4h
 fRls8Frd5V71s+R3G0SICbJl+1OCuhSnB0RCzpVaRgdQIslWXPFCD3DDUhYFPg688DuTkegJm
 9Cl8T73U1cYmMqG+duEj1lBixy5wc6Fhz44wqRbi2zb4kmXRcfxXd7xyScf+NdBnIHO8IlszZ
 g/hh4t+BZ76/VdgSepadlPZ2gBtwMjl9GAULo1Ifi8W6yMEPrz1bK9SOxI0fHwiDcggSghBRT
 2x2oeBPiY7XItyEWcproHeiCMP2ddlqO/1BkNqXSZVH7wEyeRNfXCeJFSn+p1VGYAPyhuQzpX
 sR3WuSrrFNc5RANLMxDs9B010S4hKkjdoujUcqZnrausKRVbmkuisG9R2ifQTHIm1FhZMtH/h
 tQQkoEGBgLT9XrkXGkUKR8SifADZTikH/rirhNgf7iVvmYw0BaeYMW7leWmfNAkRJQW9yicM9
 xnFOwgT5AzUk6gjC/9Cw==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

thanks for that document, I really enjoyed reading it!

On Wed, Sep 11, 2019 at 12:53:53PM +0100, Ben Hutchings wrote:
[...]
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation=
/kbuild/reproducible-builds.rst
> new file mode 100644
> index 000000000000..4d988faf93b8
> --- /dev/null
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -0,0 +1,115 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Reproducible builds
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +It is generally desirable that the building the same source code with

In this sentence, I think there is either one word to much (the first
'the') or some word is missing (e.h. 'of').

Kind regards,
Nicolas

> +the same set of tools is reproducible, i.e. the output is always
> +exactly the same.  This makes it possible to verify that the build
> +infrastructure for a binary distribution or embedded system has not
> +been subverted.  This can also make it easier to verify that a source
> +or tool change does not make any difference to the resulting binaries.


--=20
epost: nicolas@fjasle.eu               irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAl17NvcACgkQB1IKcBYm
EmmVmQ//QH35Xc9OqVJkaK8WXJdIlEsfxgm4letcgAC8jDRDnKe3YoLKOvtvkarA
lvSNUdeIpPEljqv3RBHbzehqPJo2ci6XG8/n94u7VzTvTkcKFrP8qHxJSR1BGJPB
Dc+DVjQHVwzqJnPXLN4/Fxudi+XZAQELzJgmppOaeYFMQqLzfmAI4jxAvUYtIuJZ
HwMKqUcuohswDPL0yF4GPLN0cJizDf4CHXwNFrgfMU0GLHjnQlOxxQc6gl+hT0A7
aWIkB4x5zA4a05C/0/YJ5h3Dnfqsd62g2ku51Pd50XAMq9p+7JTsP825MDPhb5B9
mHXPvmIGD44rJmfLiiIEWyn//bgOh+RjzTsPIs2NS0xQS4UHjOcHI52RpFQpKGoV
iveYZBAs9x+DeI38sbtVdYU0FHgc4za034Bq3rlIK+0zcUTZgY0m4ANaZQDrLutL
Nj7reGp+RzHF6/FxU6h157M99x2jyxJ1689jgObdMSbFudYzZv1hbQ9qKTTCb4nA
uIKNBtF1Ex4jKlvQdxF46JSFwuBHEf8iow3F1X2K9J+dJiyV5mO49GtKUJuPgxtu
dUAM6VpoInEnUtl8ywfllVBHf+eZd4jo02+hL0tw2ZhwOhxzwbOKRDimPx2gbEzk
AzvK+THZM2sYdqLSz0n0VuEtZJ1mvTATuAblAG7MxU1cEbZDqYs=
=udyO
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
