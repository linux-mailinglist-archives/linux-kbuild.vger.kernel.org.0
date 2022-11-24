Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95FF56371A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Nov 2022 06:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbiKXFAW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Nov 2022 00:00:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKXFAV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Nov 2022 00:00:21 -0500
X-Greylist: delayed 868 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Nov 2022 21:00:13 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED99423158
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 21:00:13 -0800 (PST)
Received: from leknes.fjasle.eu ([46.142.96.241]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKKpV-1ocozR2Xr5-00Lj9g; Thu, 24 Nov 2022 05:59:34 +0100
Received: from localhost.fjasle.eu (bergen.fjasle.eu [IPv6:fdda:8718:be81:0:6f0:21ff:fe91:394])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by leknes.fjasle.eu (Postfix) with ESMTPS id 424403C09F;
        Thu, 24 Nov 2022 05:59:31 +0100 (CET)
Authentication-Results: leknes.fjasle.eu; dkim=none; dkim-atps=neutral
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
        id 18F7D337; Thu, 24 Nov 2022 05:59:29 +0100 (CET)
Date:   Thu, 24 Nov 2022 05:59:29 +0100
From:   Nicolas Schier <nicolas@fjasle.eu>
To:     Don Zickus <dzickus@redhat.com>
Cc:     linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
        jforbes@fedoraproject.org, prarit@redhat.com, scweaver@redhat.com,
        ptalbert@redhat.com, herton@redhat.com, jtoppins@redhat.com
Subject: Re: [OS-BUILD PATCH] Adding support for distro targets in Makefile
Message-ID: <Y376McMQxcRSbo2/@bergen.fjasle.eu>
References: <20221123153202.1814324-1-dzickus@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bHei/Nr/eLiDwpxJ"
Content-Disposition: inline
In-Reply-To: <20221123153202.1814324-1-dzickus@redhat.com>
Jabber-ID: nicolas@fjasle.eu
X-Operating-System: Debian GNU/Linux bookworm/sid
X-Provags-ID: V03:K1:oimdUcE/302YL7wH0KGoQ+KW5P9mU3Yc53oTyKhScRLuVq4WZ8n
 k0tTFAFsPdQFJI4GFQWYKKgOs9nm5/PmoPKDA6tGLz+E1fr2Ha0UZQeJuStCYi88r4nzI67
 20dBJpOveF/0YT8/mBP0h8b+3PABkqEgadirHQgvO3pMcXK34z8pv1uA+d6/G8GkDAlyQX4
 wb98Q1oa3KP06lAfn/T/w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Oh2npKpuoo=:E3S8fmLEeV2L0LkB904Ocx
 x3X77eUOAWaMgqjM9ooqI6tyg55vpAhGdGP2D/N4T93JPcwhEUPZQBH9u4vTAXjDeBzkXhBkC
 uDTebdv8s2aSvYM9ZdN/TM1zdxLM2sv9HmvMrqXf5ReyXRau1KhDRatJCryZgyqKsrIivH8di
 hrIkpA3h6G+puKKgwHGtsyxpPb/B8mioDIZxvC04MKe0AU/+ninMgp7forTFOuekya5c8aOTI
 T8ichdATfjQ3/uPKI9hMPxiKyHheZ1DHVPgZV6xKHKL4LpaREcj9oOLM5Vm9BuOoA5j4oY/TQ
 1RZbI1TDEqZYEAUjwOwjMDYf9ETdujjGv5VtsIDISmK0ubp2u5x0CyeTU5KFHZcyp/WkNULR0
 r1CM5I8PxOrVIm8sTKty0PiDKvGsxOUrJvUJi+SCW778D1WHJVCz+wzUD6cRXR6F3XXIAI3Ud
 dWumPk8Edc1GDZmvWvhzqh1YTu3A5CC9Ofjn47Q77iNSo9YwYx2eYllrfWU03u05yrdD/7xqp
 nL26rtB3z9ALW/vUPKWpKQnE9HqamEx533a7W5Z9soQsRksH3IOq0F6aMLrJtg5qBe7NQDKgC
 5pkG7KNBpNC3xYYFwLvutxLzi+RLceF2MqX/cfFfLctUzNMQz+DjXsbjN6KLNlG6G2y0udOLo
 o9bg8xaeWCAm4h9c0PT9qe7AdH5f8pzakpUfcHWecIaGKO0yblrNIX/CvgjdIy430eP0zRKHA
 jfkCDS86EYp/0wNrRcCPCBrDvYyfsfW8upSkFUj6H6ff0c83N+TQUC60/B9RKv3KD6lbeN6RH
 xtpGx2A
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--bHei/Nr/eLiDwpxJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 23 Nov 2022 10:32:03 GMT, Don Zickus wrote:
> Fedora adds a directory to its source git tree to provide packaging
> information[1] specific for its distro.  We would like to propagate our
> 'help' section to the toplevel to be seen by 'make help' as it isn't
> obvious to users to use 'make dist-help'[2].
>=20
> Instead of keeping Fedora changes local, I am proposing a generic
> mechanism for other distros to use if they would like.  The change looks
> for a distro directory and leverages that Makefile if it exists.
> Otherwise it is ignored.
>=20
> [1] - https://gitlab.com/cki-project/kernel-ark/-/tree/os-build/redhat
> [2] - https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/redhat/Ma=
kefile#L809
>=20
> Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
> Signed-off-by: Don Zickus <dzickus@redhat.com>
>=20
> ----
> This patch is more of a conversation starter than anything.=20
>=20
> I think other distros might find this useful and examples of what we would
> populate the directory with can be found in [1].
>=20
> Thoughts?
>=20
> ---
>  Makefile | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618f..45fdb18dde46f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1635,6 +1635,16 @@ distclean: mrproper
>  %pkg: include/config/kernel.release FORCE
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
> =20
> +# Distribution of the kernel
> +# ----------------------------------------------------------------------=
-----
> +
> +dist%: FORCE
> +	@if ! test -f $(srctree)/distro/Makefile; then \
> +		echo 'No distribution targets defined'; \
> +		exit 1; \
> +	fi
> +	$(Q)$(MAKE) -C $(srctree)/distro $@
> +
>  # Brief documentation of the typical targets used
>  # ----------------------------------------------------------------------=
-----
> =20
> @@ -1732,6 +1742,11 @@ help:
>  	@echo  ''
>  	@echo  'Kernel packaging:'
>  	@$(MAKE) -f $(srctree)/scripts/Makefile.package help
> +	@if test -f $(srctree)/distro/Makefile; then \
> +		echo ''; \
> +		echo 'Distro targets:'; \
> +		$(MAKE) -C $(srctree)/distro dist-help; \
> +	fi
>  	@echo  ''
>  	@echo  'Documentation targets:'
>  	@$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
> --=20
> 2.38.1

Have you tried to wrap upstream main Makefile?  E.g. you can add a=20
GNUmakefile that simply forwards all targets to Makefile.  It could be=20
used to add new targets, or to extends one or the other target from=20
Makefile.

(Further, you could make use of MAKEFILES variable and force inclusion=20
of a makefile that extends the upstream makefiles "on-the-fly", but as=20
this is quite fragile, I cannot recommend it.)

Kind regards,
Nicolas


--=20
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--bHei/Nr/eLiDwpxJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmN++iwACgkQB1IKcBYm
Emn/6g/8CftSWT8KRmATeXVyYE56ymLlZpgRb87qmet6QRZxN/UPjFy9V5PSoKF/
s9w1vx/Xura/91ewDMw2pg2hCJTUmxwg1JVtrxvHD+K88/C+xMFxD7sQy15ftdQL
Ep4tUabNb2vSfOjk2teDHg7sTmu0PTAMH7KB6MyC32DEnUAs0vy2Q1rEqqrlp+Xv
ltkCg8UtbHF3gg1tYXtocFUfW4ZHMSPLO8wirJmj6je/x35bnTjA0I6wlsHIqml/
+oq7dqPDkRnkbkgEOyfZpG9a02r+GiYqV85sdt4o1foVJxT4jitHXxPyJ8xRK4Vn
LjRBAofGNZAkIC57lUg7NwwSupmd/uz7ekKxYyA/BF/vZ3MtP8eKjEdCBkulZIFk
VDfIefcPeS6wFx8trvJY7GrdywZUIDysAlbYVfQhD6RsvyRT56yhBcfO8cHrEIx5
G+kRGnsNVuAc3cr6cwV+Ztg/7rNEXrWZ7OmHbAzrw0ht/KkVD66H8GRcdlXbyhEQ
TDXrREk5tU9pl3RwRXBRFy4bv3CdVe5IUJI+fiZ3pdgnjsssWT21Iyf2+G3LMFAX
coqgMRd0hCm8sK+7RQbBJAtjvd8+yb/NmRUNld1lroVngsV+cGzWd4BYWe+uJa50
XGLOsL2Lvy4hs5u13LzxVTSBeREtP6JwtzSkamsKzzlWlBtnQCA=
=RfiI
-----END PGP SIGNATURE-----

--bHei/Nr/eLiDwpxJ--
