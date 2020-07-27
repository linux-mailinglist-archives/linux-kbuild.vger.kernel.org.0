Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF2022E6F9
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jul 2020 09:54:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgG0Hyd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 03:54:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:42162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgG0Hyd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 03:54:33 -0400
Received: from localhost (p5486cd33.dip0.t-ipconnect.de [84.134.205.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98B6020672;
        Mon, 27 Jul 2020 07:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595836473;
        bh=vHJPyOIaDO7M52I9mxPFFQr0aat7HJiMweOB62Vo0Vs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IbfpM99sEWb8unPf3FOlfN6nuDiBeqoWN4brSUNRk7zG52DuLi7Mt7yGXqoQms92r
         SvD11vioDaRuazKiTeUAPxYt4YDm/yASAw7lC1pPRIkSBKyfjKzF66rdBbLJC1wn6c
         wsdMUOV8Ga9Z901i1vcxpjAG146Lv3e9TJTbACno=
Date:   Mon, 27 Jul 2020 09:54:26 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] modpost: explain why we can't use strsep
Message-ID: <20200727075426.GB1040@kunai>
References: <20200726214419.3362-1-wsa@kernel.org>
 <CAK7LNAShZUwgvDccDqpA44Rc4XkqHQuY4CDbg0msg8PO5YgjKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline
In-Reply-To: <CAK7LNAShZUwgvDccDqpA44Rc4XkqHQuY4CDbg0msg8PO5YgjKg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Mention why we open-code strsep, so it is clear that it is intentional.
> >
> > Fixes: 736bb11898ef ("modpost: remove use of non-standard strsep() in H=
OSTCC code")
>=20
> Applied, but this Fixes tag looks questionable to me
> because this patch is just adding a comment.

Yes, agreed.


--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8eiDIACgkQFA3kzBSg
KbabQg//cIiGRHn9FvoOJdrSXs1W/MS7bvDE2e2sSltZpyUxPFywSgu0z640rmJi
9TT2xf3owQfFpcwHrJACtn/NAA6whsiV/H1Q1k8/PhVxS+92JWUz/gvGZTNtL/q6
fGtWleig8UrRN3O/rYACwZRMPoT/enuP55oaFnwpsM1YfyB4x0SO5j39U/Pgu1ct
XlQJvjxsc9OdeUgX7x+v0fIomzHy1Gim9S3QhBO39DB4LuQCW+cPfyK1lwQlmwpw
TvnQmiE5TKO3Sd8KDQDVypoEKbL0Xnw4anR/QUVjC48HvQihun5kjBppqnUFa6HC
JVFyRPcii6mlf0HfjO5V10plA1PRDEmijm4j6jsZtWDvQG9SnrtfxdfasGDB70lt
E58EtEQTM7KlQN4u4gpp90zvo61YTo85L+OODZZPM+N95F/rMMHn2wHmH3PoC3t8
5WpuqiDdoCwrtmOu5u1MOVXxQ0rTyGGkzZo369WuMTXhq2pDU4l44le1nAnITfmQ
B7HPqnXWkI4GCyddsbudnksuCHrcg1gEXJu9UHx8a5EHi1+6LzV12XxEefocwcar
9bx+S3s4ibZl/7BXU4Xyb43Afemg06LJRqRKfvH/3RkApoS+Qr9L3WCLFsFfDtj4
JffS6RgMNBMUfOqsk/u7mp0w0wbduf5WFcCb16OroZdeNb4xiw0=
=SUEq
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
