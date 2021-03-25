Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8939348ED2
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 12:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCYLUD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 07:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhCYLTa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 07:19:30 -0400
X-Greylist: delayed 174 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 25 Mar 2021 04:19:27 PDT
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:400:200::c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBA3C06174A
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Mar 2021 04:19:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616670982; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=RVum/hs/TVp2wSc3M6pvMW5hWRHPXd6wNhefDqvI5XlGSPHNAWKfBz8HLP+ypcpPVr
    MWwj1IDU9475i8uSzU3rmfCF15JfaLsUICYpLBsd9ls135ICZuC64DBY5vuEqnxjjMpB
    NTWwmZFTjx9X1O334W58C6qNuZ+uvLqaNrAGn60IWFlXxfOUZFUFsElnDzt74I4Glpdb
    15mWH1iVQIAuK9u8WAzHwXqrsouXMjl0xERWrhPAxhRyvmPELOKdtLT3n4mbk0Z30B1J
    4Ou3h9xqm8x1jk1ihQhu2LHhrVggJI68LEWmdPxlufpDwhw4GH5lPCzUGppsVI8qPDxq
    JUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1616670982;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=5Gkv344oVbx0n0ugG/dKLLSrYBZEUe5i9Mt0XagagP0=;
    b=MnVm1xgw0lGi7IjGv6twn44PssYumREzxVGnWkz5ipZK8WkL2XA/J0jFXSGN4CRItB
    dBrMVeTt40zb5RHCZYFKSFQnpwFh5HNHf7q8lDjBUcVlOh9SyLZXSGixPFaxZamUOKMo
    tl9BAEyOp0q3rTid8V7/0wkkpKdi3do1izFqft8spx/tz+uYss7Sx9P0MkQhxn9A39Az
    aQdvPqORty5LLPAXgOVs3TighF94Vuu/QJ91LYQs7f0fVKXk4xgiSGKZNCvaqUENKBjm
    3h6YktTbO1VOwQohOB85Y42faP+aZqMED2ZsFVFxBfAC8NwSVmMGRu9TVY/tMRY3m081
    N+Xg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1616670982;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=5Gkv344oVbx0n0ugG/dKLLSrYBZEUe5i9Mt0XagagP0=;
    b=FzNX2AZmWmL+U/9amCWev6J4375NmAvkuLKJLn9wbGVEQOKDZ/3T92l4/7fdGaHpoE
    iw2Wd5ZsM9pJe+IZvsaP21oNRvJgMQmjtPwM1ur4VsUJrEkrFwfOI8149sD0Hq6/CmFS
    KrYLvIfZCP1Nz13tKGU9dc4YRTzpQDxYFsN3KnnuZs2SgEHGLvO67VBfCBdueqASfrgw
    0WVCJv8R8d0fZZSIivITSKSGyMVBAd6wajJA7StIArcmHWqnOHG53J6df4S+Q4NsfjR+
    KGn7soHbFLM2C5vZxlbNdC8XwE72vJsXk4krIjHbiVubQb1VRDGymbfVJDTu+37CgZjA
    OOcA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+n4/A=="
X-RZG-CLASS-ID: mo00
Received: from sender
    by smtp.strato.de (RZmta 47.22.0 SBL|AUTH)
    with ESMTPSA id 204541x2PBGM51g
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 25 Mar 2021 12:16:22 +0100 (CET)
Date:   Thu, 25 Mar 2021 12:16:06 +0100
From:   Olaf Hering <olaf@aepfle.de>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: enforce -Werror=unused-result
Message-ID: <20210325121606.6a2e4e00.olaf@aepfle.de>
In-Reply-To: <20210319143231.25500-1-olaf@aepfle.de>
References: <20210319143231.25500-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2021.03.05 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mI2gCRk_pRE=_/zv9FiMrfa"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/mI2gCRk_pRE=_/zv9FiMrfa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 19 Mar 2021 15:32:31 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> It is a hard error if a return value is ignored.

The automated builds found only a single error, in load_em86().

Let me know if there are other reasons why the patch was rejected.

Olaf

--Sig_/mI2gCRk_pRE=_/zv9FiMrfa
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmBccPcACgkQ86SN7mm1
DoDmZg//X7FpRVVZ72GefZUJUZUy8b05UNQNLp+hTAQzI1N+xWa3J6w6Ud3DsO3n
6olJg+KfEwOX22c8I14dxxR3S7YdKdzVLlsl+65kjpF2BgYgSQhIgrtUjjXOxOig
3zKY+VRTUE4I5RfoTfNRFqX3IW4POdBqKo2cZP0ixH2dfTtOWZff94zTHRsACmk6
yLqc+DjPjfg//0euOr5GGfV7o4BfqzaMaXQ5YeQju8q5nenBSywu0mEv45lFA/mf
fJ3MqujpKddx5g6rVrqMeKYlY/9AYPkiGFZshVu0d+AG8djWzRw/5HlhnW5As9Ah
z9WDhegiwVBbZTpXdeJ/10zKN8s5QFRfbmIC/AKXGO+UByenvHH8WfWmxuiUSi06
0aJ19ppBtXd4sfCtkUhDpvZ+VEOtxFRE9VCdTCeaYqyNQEFtmNFLgl9/VWH6iMfP
ZaTRNaa5Fcja4CifIXimFT99XY/P2iG/C/7csgLyBC0VV6m31G5JiZF0xDIh5MdJ
c5rsRBalkTcIPoYhDrqaoGjsgTUAeFfqekCMxJfkWx6ZlgZnmmP9rDRu6THzXQWA
rTueoEJSO/Veja0g6kXIBwUtSS3/uRC8IAEEaCfy6ezFCxjGPL7yOFkW+WqKicIL
2bUk1VMfH18orCGiDrKZCBzyFmF9f7KDCiZxHXIMzOpN8RIzRYY=
=Zvt/
-----END PGP SIGNATURE-----

--Sig_/mI2gCRk_pRE=_/zv9FiMrfa--
