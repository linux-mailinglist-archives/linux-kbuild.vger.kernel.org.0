Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36ED63B0AEC
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 18:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhFVQ67 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Jun 2021 12:58:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:34758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230076AbhFVQ67 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Jun 2021 12:58:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8197D61353;
        Tue, 22 Jun 2021 16:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624381003;
        bh=dHo7p4pFLbwF2dP3g+Avw3Zi/j24BOyKxt9PufO3Kt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YrGVdZN/qOXPhZVKacZef4rWUzGqDWEgaqTkbLs8Mkq4Kwrdlt7eE4ObHXwZ+alPV
         1q15Xs1rl6oLeRc3nkV3U98eNJLCHY4Am3DL/Wp+pK+qrYXzFIW+vNx2oHsrShMQVU
         0b6OoaGngQiQyQQKVBz1tlM4gXca3Kuhq8cl3yukiYRV+29ugNARQNK8hyHw5V6meX
         1PbUfHTFWKX4KMNzMWBbyn45i3aVgR9pDwW6PJ2gkCg+np7KbroSmY3stUD3K1nyTI
         tJOAWyqR2+kR15N37wUirENL+OPD+brDMYUGXMz8eWnPYeNGJ+F8xRAfL8E0kXADvt
         YVdTI+KU4q4LA==
Date:   Tue, 22 Jun 2021 17:56:19 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: modpost: Explicitly warn about unprototyped
 symbols
Message-ID: <20210622165619.GH4574@sirena.org.uk>
References: <20210607140206.38131-1-broonie@kernel.org>
 <CAK7LNAT7cy8Kn1w2ceRdH_O4P8PMut4Bivcyas88gVa+wu7HGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aF3LVLvitz/VQU3c"
Content-Disposition: inline
In-Reply-To: <CAK7LNAT7cy8Kn1w2ceRdH_O4P8PMut4Bivcyas88gVa+wu7HGA@mail.gmail.com>
X-Cookie: fortune: not found
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--aF3LVLvitz/VQU3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 17, 2021 at 10:05:44AM +0900, Masahiro Yamada wrote:
> On Mon, Jun 7, 2021 at 11:02 PM Mark Brown <broonie@kernel.org> wrote:

> > One common cause of modpost version generation failures is a failure to
> > prototype exported assembly functions - the tooling requires this for
> > exported functions even if they are not and should not be called from C

> Applied to linux-kbuild. Thanks.

This doesn't seem to be showing up in -next, was there some issue?
Looks like the kbuild tree that -next is picking up wasn't updated since
1st June.

--aF3LVLvitz/VQU3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDSFjIACgkQJNaLcl1U
h9CpGQf8Cgrv/jMY92zReOi6c/lGLCLPUpROphTq82PEtBA16etJo6BUUQqKDV7z
AiRcJ50oi9d7Mn1EXNFUefdDmVALq+ZF2kSSpt35RblxheXSfBRNRwjaMm5jRI3+
9ys0DLeKrAbX2zRL3MP1bx99TAhqHf31fwtbqLcqOC5Drll4ebZjcHqDFY+6KX2p
dZpkujqsWdfNlV2AQSsPNGYTrq0X/OQ9KFzRO10e59WkW+SLj8CyUUMxgUIIlFx2
asmiO9+0fK4nL/tVEUPhlRqZK5JnmK7q9BR5/zQDN0z4cWVg+SBJnqgZ4r6jrIfW
SV4cNLEHib9s1lWqZegpFJhZQlcxlA==
=oj5e
-----END PGP SIGNATURE-----

--aF3LVLvitz/VQU3c--
