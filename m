Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 173DA78C4D
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 15:07:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfG2NHf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 09:07:35 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:36367 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbfG2NHf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 09:07:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45y0N4318cz9s7T;
        Mon, 29 Jul 2019 23:07:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1564405653;
        bh=9BSgC6HUx9P80dZxCiTUXg9Mj/ElpC95nKwavHWsdsU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=p1r/NGO7BXi3AYZrkl+DjLPhfjV4zjeWwb3fM1WRiS8pCn4FvcewqbHY+HCnP3pSC
         j6b5JFqE6wVcGnpRSqtKQT+0LxRy7eGxO1FkpVBkhU9HZXjE7T8tatzkq0PaWr+vsb
         b/VmBR1dlTd3f0FE+tw4geusKclkWksMbu+L4NNaGWaePN5Mt9qdoX1OhURg1Z30Qu
         pIzbT+QvCHoMY5osDM6XDjdX5owDcuixrmkloFFnovVaNMbxBm/jHd+4zotbPHZda/
         OntOOSQkqgGkTSuQpKotYdE9QabP3dJsBClAZ/+vFuxPFuhkw1ayaITAYCWJzzQ/Re
         Xq4eW3UYjUInw==
Date:   Mon, 29 Jul 2019 23:07:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Denis Efremov <efremov@linux.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
Message-ID: <20190729230730.75b9cdb2@canb.auug.org.au>
In-Reply-To: <65ea1c44-ac7f-b63f-8ba0-85bb12349383@linux.com>
References: <20190714152817.24693-1-efremov@linux.com>
        <20190728100906.18847-1-efremov@linux.com>
        <20190729151351.24f9eeb9@canb.auug.org.au>
        <e2b5607f-0f74-41c6-a83d-5a22d6828778@linux.com>
        <20190729224007.2f7fdcb4@canb.auug.org.au>
        <65ea1c44-ac7f-b63f-8ba0-85bb12349383@linux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2W90F=MHXEZ4iTRH57J9Hgw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/2W90F=MHXEZ4iTRH57J9Hgw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Denis,

On Mon, 29 Jul 2019 15:52:15 +0300 Denis Efremov <efremov@linux.com> wrote:
>
> Is it worth to include your measurements instead of mine in the commit
> description? Maybe the note about performance downgrade could be omitted
> at all in this case?

Just leave your measurements (they are yours after all), but maybe say
"less than a minute" rather than "approx. 1 min".

--=20
Cheers,
Stephen Rothwell

--Sig_/2W90F=MHXEZ4iTRH57J9Hgw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0+75IACgkQAVBC80lX
0GyKvgf/VAVbgQo5Pnmqvd2qHZi+Wx3xxNAm6IaFnvO5V+25wBz0vhmDdtBkaY0N
1OvWOOZgC31NXxaiXtnDCkRqYgEm16t+pC8DUxoD/17q61Lz7/rqqmKMyZgROkKj
ybMhUUQ4o51SUVoF7gRT5OnjmR4L6OVs079NVTYZpZ/cR2VZ4M6kh2QDLPhR1qA9
FVX8J20RBIRCpNKuf+YMTqxqhR06lXHvkK3FpcZKY0M3oukKRG7kQlUcNNeSPXlq
p1EsoRb3NxdLi2CdbgggBL0yFxsGCEfxYS/99/J3wuNUvERocPMtlJGGtXiZfzE8
BE27RusVNM0P87NoV1UEdM99STT0QA==
=O4kY
-----END PGP SIGNATURE-----

--Sig_/2W90F=MHXEZ4iTRH57J9Hgw--
