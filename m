Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0AB20C7DC
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 14:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgF1M0y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 08:26:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:51108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726317AbgF1M0x (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 08:26:53 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80EBB20702;
        Sun, 28 Jun 2020 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593347213;
        bh=PEqWE01pJtCnN4l5106iuG8ByK1Snm/wjjGAjMJI54k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f9lqQ4cKP3Y9H1ERR2atcTQUFoextdFxk3SXRLGIS1O+Mq0iqBODO9CK0dZEz1r6s
         rr5gW4cMEw3WJk4Ic0cPAtYF0HvDzQDMxD7J3qm2Lo+9m9Ydc8fIaWsWS733TCuon8
         GQ70Lo2GtNJPeOdG/F9PHKL8WSU5uw3RtN81JxFY=
Date:   Sun, 28 Jun 2020 14:26:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
Message-ID: <20200628142648.2748d56d@coco.lan>
In-Reply-To: <9048b1ca-87aa-dfee-2be3-2f399d2b7fe6@web.de>
References: <9048b1ca-87aa-dfee-2be3-2f399d2b7fe6@web.de>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Sun, 28 Jun 2020 14:18:22 +0200
Markus Elfring <Markus.Elfring@web.de> escreveu:

> > The logic handling find on split mode is currently broken. =20
>=20
> * Is there a word missing in this change description?
>=20
> * Can any information become clearer another bit?
>=20
>=20
> > Fix it, =E2=80=A6 =20
>=20
> Please replace the beginning of this sentence with the tag =E2=80=9CFixes=
=E2=80=9D.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?id=3D719fdd32921fb7e3208db8832d=
32ae1c2d68900f#n183
>=20
> Regards,
> Markus

Please ignore this one. I ended re-submitting a previously
merged patch.

Thanks,
Mauro
