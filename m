Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091521DFC23
	for <lists+linux-kbuild@lfdr.de>; Sun, 24 May 2020 02:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388223AbgEXAkx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 May 2020 20:40:53 -0400
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55126 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388106AbgEXAkx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 May 2020 20:40:53 -0400
Received: from [192.168.4.242] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1jceh9-000480-Vm; Sun, 24 May 2020 01:40:52 +0100
Received: from ben by deadeye with local (Exim 4.93)
        (envelope-from <ben@decadent.org.uk>)
        id 1jceh9-007swq-Iy; Sun, 24 May 2020 01:40:51 +0100
Message-ID: <70d277727ce1dbc4052152ba1fe45c81abb71cbf.camel@decadent.org.uk>
Subject: Re: [PATCH] make builddeb invoke calls to linux-update-symlinks
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Jason Self <j@jxself.org>, linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org
Date:   Sun, 24 May 2020 01:40:32 +0100
In-Reply-To: <20200523203801.18277-1-j@jxself.org>
References: <235c4776ddc5cbb94a45643098a50a20b14e530e.camel@decadent.org.uk>
         <20200523203801.18277-1-j@jxself.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-2ARtPPDZFPVGhSRt0Uyd"
User-Agent: Evolution 3.36.2-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-2ARtPPDZFPVGhSRt0Uyd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-05-23 at 13:38 -0700, Jason Self wrote:
> The official Debian kernel packages, in addition to running the
> scripts in /etc/kernel, also runs linux-update-symlinks via the
> postinst script. This updates the /vmlinuz and /initrd.img (if it uses
> an initramfs) symlinks to point to the newly installed kernel. This
> update causes the builddeb script to do the same.
>=20
> This version of the patch incorporates the feedback from Ben
> Hutchings.

Well, partly.  You implemented detection of upgrades on the install
side, but not on the remove side.

In case of an upgrade, both the old version's prerm and postrm, and the
new version's preinst and postinst, will be run:
https://www.debian.org/doc/debian-policy/ch-maintainerscripts.html#details-=
of-unpack-phase-of-installation-or-upgrade

> Signed-off-by: Jason Self <j@jxself.org>
> ---
>  scripts/package/builddeb | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 6df3c9f8b2da..707693867c29 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -195,6 +195,37 @@ export DEB_MAINT_PARAMS=3D"\$*"
>  # Tell initramfs builder whether it's wanted
>  export INITRD=3D$(if_enabled_echo CONFIG_BLK_DEV_INITRD Yes No)
> =20
> +$(case $script in
> +    postinst)
> +        echo "if [ -f /lib/modules/$version/.fresh-install ]; then
> +    change=3Dinstall
> +else
> +    change=3Dupgrade
> +fi
> +if command -v linux-update-symlinks > /dev/null; then
> +    linux-update-symlinks $change $version /$installed_image_path
> +fi
> +rm -f /lib/modules/$version/.fresh-install"
> +        ;;
> +    postrm)
> +        echo "if command -v linux-update-symlinks > /dev/null; then
> +    linux-update-symlinks remove $version /$installed_image_path
> +fi"

postrm should not run linux-update-symlinks if "$1" is "upgrade".

> +        ;;
> +    preinst)
> +        echo 'if [ "$1" =3D install ]; then
> +    # Create a flag file for postinst
> +    mkdir -p /lib/modules/$version
> +    touch /lib/modules/$version/.fresh-install
> +fi'
> +        ;;
> +    prerm)
> +        echo "if command -v linux-check-removal > /dev/null; then
> +    linux-check-removal $version
> +fi"

prerm should not run linux-check-removal if "$1" is "upgrade".

Also, you should mention use of linux-check-removal in the commit
message.

Ben.

> +        ;;
> +esac)
> +
>  test -d $debhookdir/$script.d && run-parts --arg=3D"$version" --arg=3D"/=
$installed_image_path" $debhookdir/$script.d
>  exit 0
>  EOF
--=20
Ben Hutchings
You can't have everything.  Where would you put it?


--=-2ARtPPDZFPVGhSRt0Uyd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl7JwoAACgkQ57/I7JWG
EQktRw//cT4x7bjEwbJSKFWVT+j3CKmwtSVNeU9/rOWQfyKN/cNcm5DcoS8rkZDu
I37Mt6hAjHmQDvV3zV7S4Odoc1xpiSNThw9qgGfoYtEtXE3UoP7VK7YhCrcpFK3p
U0CRzljRWrcMiJ79Eoe/es32oBMar+2vFq5RA4EedudRCo8uHUofByUk4lf4h3GZ
6/dXRr+KKbT6kVy20bV6aOm4WAzWWL7CPykRSUUPdCy4gaKIcSn1NzSroeuvqJdk
MyvileMFydh7PAZoYeeR6RocUXTBnhNXVTutXXPp9q02P68FjxuCCZAKbpF2vA9L
ESvpc1kCE1BmUKgC6vtiPdJ7GxhXDmHtY/3AeEWWaKuKS45n4jF1cByfbEd9lWKb
fnj53oDbe4RSyzo9czGGCvrtV2V3g8M9+/pImNVcK9zq1wlWeFVMpW769SkAFqry
tC2ZyBKzlh80CHtr4ymkxXE9lXB6kmgiEPnFehEsOr6azDoPWArRGMxOpnFmNcoQ
xooUoJWVJcyEj8HCxn2sP2Y7E/EQTpLUxbocfVLSOKXlcboGN155tLMZERlTDJuz
tuzAvFcj2VuvTw7LgWmQ1amvaVZ62UMSFPNFr+dIMJKa16dD4wWffuyMcKb642FL
PjeBPkm4Eq2nrqazI9Dag8qk67ZmO8kjqGyWuYhgNN7PktlMvFE=
=lup8
-----END PGP SIGNATURE-----

--=-2ARtPPDZFPVGhSRt0Uyd--
