Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B99C1DF398
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2020 02:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387509AbgEWAlr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 20:41:47 -0400
Received: from bluehome.net ([96.66.250.149]:51766 "EHLO bluehome.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387497AbgEWAlq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 20:41:46 -0400
Received: from pc (pc.lan [10.0.0.51])
        by bluehome.net (Postfix) with ESMTPSA id EFE0F4B408AF;
        Fri, 22 May 2020 17:41:44 -0700 (PDT)
Date:   Fri, 22 May 2020 17:41:43 -0700
From:   Jason Self <j@jxself.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] make builddeb invoke calls to linux-update-symlink
Message-ID: <20200522174143.72ac4ddc@pc>
In-Reply-To: <CAK7LNAScfa9bqc3ViVX-+u3uJU=Zv_oWXCWdN6O_N_fw=AdQ5w@mail.gmail.com>
References: <20200510040616.2207-1-j@jxself.org>
        <CAK7LNAScfa9bqc3ViVX-+u3uJU=Zv_oWXCWdN6O_N_fw=AdQ5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/HJc/dD9jaJ6H0tQT55bY4a3"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/HJc/dD9jaJ6H0tQT55bY4a3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 23 May 2020 02:01:17 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> Hi Ben,
>=20
> On Sun, May 10, 2020 at 1:06 PM Jason Self <j@jxself.org> wrote:
> >
> > The official Debian kernel packages, =20
>=20
> I'd like to consult you.
> Does this patch look OK?

No. After submitting the patch I saw that I made a stupid mistake and
forgot to terminate one of the case statements and to use=20
/$installed_image_path instead of $installed_image_path so that it
provides the absolute path. I can resubmit it with those corrections
but have been waiting before doing so in case there is more feedback.

--Sig_/HJc/dD9jaJ6H0tQT55bY4a3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJeyHFIAAoJEJ0NsxtUWjGYWEMP/3gsJki6urbxT2CdCENVkwTY
Pffk7oPTfPY9UHflRAKPeTNlPt9GJNTyaZBsTIPpByu3JQ0tv4CQ7l13kAbRkxEC
RpLWuY/gMhfz22jIugbF/v+yAH7rgIPOMcCB+MeQ4i9Yk2WNaOqVcp27O4551QIS
ROCFpJKjVnAw2CWx0AzdEXeqNVODKj9WaZxvKJ70z7fDiRRpFIn8BhqAgvvVmG8z
GWh7EE+pFn+VJJiix1H9A/kkXfRaT/g0U7nU0vcfC/scphf6PImHLcnz2dZr1Tw1
JFuNqZZ5DW41UI1YOzcz4Xm5+CJEkEJlJgS/FY2t817GaoL3cQUfvQ+8qeiwyfv0
SRwjQ7B22uojzIyBo2hiifV0yY0rdE8FSopbFFQ4d/C4ipIilk/zHSnVZljqI8nY
ywS4vwVHyZBS3FmyhLlWdUreI9teoJk84rQ8FTx3DwveVq1HbE94Tsu1sC3BHplN
gjleH+fwOLVeM3HgTdqTtFYptPfqCiX1lK1OsAvt0AGAbg4O1QFIp2hzM5rIc51m
9ddZmACZfH3c0nlq7Tb45I4HyZF/oNCgYBJJE7GKJfvtooqzmdDMkpWLxOa5XGzu
tHyjrNNzIRY8RvLqfw2ZHGA4mwupIvw/iU3f1aP1Pq4Fj/xmSbDyxVHuTNEZUDHo
BDzSGEcNRfBuoJIEq3Zt
=dW2Y
-----END PGP SIGNATURE-----

--Sig_/HJc/dD9jaJ6H0tQT55bY4a3--
