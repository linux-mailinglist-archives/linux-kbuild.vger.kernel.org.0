Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEA814450B
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 20:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgAUTYu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 14:24:50 -0500
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:48326 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727813AbgAUTYu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 14:24:50 -0500
Received: from [167.98.27.226] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1itz8p-0006hJ-Sg; Tue, 21 Jan 2020 19:24:47 +0000
Received: from ben by deadeye with local (Exim 4.93)
        (envelope-from <ben@decadent.org.uk>)
        id 1itz8p-000s7l-Bx; Tue, 21 Jan 2020 19:24:47 +0000
Message-ID: <2bedc86669d33dd2e9f3b97954710f1a8139be19.camel@decadent.org.uk>
Subject: Re: [PATCH v2 4/7] builddeb: avoid invoking sub-shells where
 possible
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Riku Voipio <riku.voipio@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Date:   Tue, 21 Jan 2020 19:24:46 +0000
In-Reply-To: <20200115162529.11089-4-masahiroy@kernel.org>
References: <20200115162529.11089-1-masahiroy@kernel.org>
         <20200115162529.11089-4-masahiroy@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-Tbqpn5MaD1+AX9Mc0zpp"
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-Tbqpn5MaD1+AX9Mc0zpp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-01-16 at 01:25 +0900, Masahiro Yamada wrote:
[...]
> -if is_enabled CONFIG_STACK_VALIDATION; then
> -	echo tools/objtool/objtool >> debian/hdrobjfiles
> -fi
[...]
> +{
> +	if is_enabled CONFIG_STACK_VALIDATION; then
> +		find tools/objtool -type f -executable
> +	fi
[...]

And this is still undoing part of patch 1.

Ben.

--=20
Ben Hutchings
If God had intended Man to program,
we'd have been born with serial I/O ports.



--=-Tbqpn5MaD1+AX9Mc0zpp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl4nT/8ACgkQ57/I7JWG
EQlJyw//YuIym2yFGPjtsaCb20pDP3IO8pPgbY1k2jhXVCLWIPXqF63WOTxbdip1
6aWbjOBm+WXo8QFPQFiSoPZlQCvRIFvQRBj031rYF0jiZTw8MEw+tTpOSmn+W8wf
t6rF1yNvWWMx/MlcTQWIAB5GmNWe555V0/ua29l7Kew6Ydj3r8DOHppAcbdOnU+D
DnWyeahue5FDszpmEwf5aGPBiOSGubC9LreL8fA0nG9lKuBuWpzKEgGRPueAdDG2
5ALy+f9rtBqU+F2VcYZj3a8pLHzslyJrt+xI04eaLX58i/2xxaO7QNB8bptEFc83
tSs5Qhxa5lIHJO4lb9iG1mTqgo6Ms9WUVnPWjPZnu2YpxoQmX11q9p7UgmON4BpL
NauhN+MV9gD3ZUGvQEg7L72z2z/Vsmeg8bd4nQ+avgiAdIr+O4wnqGIbqdWsAhbE
pLpIxMyM8BiXFL8ck8+mC6lGkdZX89S64Ba8L4NCB33XfdZ0DGUIhl3gpUHrnVEM
492cDnE8QuLdq2uvJ6JMIlguboeHlmGgXMYcT8uBVmBMO569sj0pjuOpzBwm8IHn
YG9NT8scIS5AAM9eakXC9NyQvZzd7qSF4keCH0WCAFzK6kABHC5Hk02f/stt7c5D
y62Ih+nP9yO1cuTs3RSEbe9bTIpg/qEkowblaFnisPYVgSoIt+4=
=uAc1
-----END PGP SIGNATURE-----

--=-Tbqpn5MaD1+AX9Mc0zpp--
