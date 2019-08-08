Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFBD86D01
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2019 00:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390492AbfHHWSQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 18:18:16 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36764 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390340AbfHHWSQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 18:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WA+5wwyO0cQ66cmRNLflj37G+/VcsFFok4xItrxFjec=; b=E69UrCDuGcfV/rYolMLOtC0h8
        g6wEWT6frabyam8H5lgEo9zLxcF+Jsp3nFLTbAHfu2BHNtXp1iGMWSBLwvwPmtYjj6qmhp625SBfO
        504q2iyLoqUiwNK3MI18t6Mz6HoHuarbI11oADth7SvVJR+0ranzdw5u3WIJUjZkdb7GI=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hvqjL-0004D6-OV; Thu, 08 Aug 2019 22:17:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D15F72742BDD; Thu,  8 Aug 2019 23:17:54 +0100 (BST)
Date:   Thu, 8 Aug 2019 23:17:54 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH RFC 0/1] kbuild: enable overriding the compiler using the
 environment
Message-ID: <20190808221754.GP3795@sirena.co.uk>
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iq/fWD14IMVFWBCD"
Content-Disposition: inline
In-Reply-To: <cover.1565297255.git.guillaume.tucker@collabora.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--iq/fWD14IMVFWBCD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 11:06:51PM +0200, Guillaume Tucker wrote:

> While this fix seems like a very obvious thing to do, it's equally
> surprising that it hasn't been done before.  This is why I'm sending this
> as an RFC; there may be a very good reason why the compiler variables
> still need to be hard-coded with gcc in the top-level Makefile.

Probably the few people building kernels who didn't have GCC installed
and ran into this just went and installed it when they saw the error.

--iq/fWD14IMVFWBCD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Mn5IACgkQJNaLcl1U
h9DY1Af+NqU3cOOFQVhT9tHvETuiNHGUGmHdw+yNH2FL0oD+g/TnIDUwt/LzUXv5
f1ZbtgZjdjQWsKzmhZCrPC5im8DngacGB1SUF3gZP09voM6xJ6GcaD/kpGk3+jDW
Xqlfc7Z2s1t73CAAJ1E8+vh20kRVnzZD326f2XBIP7i72gVjB2NbwMJidkvLEANO
1G7YgkXtxG8C7jfyif+3HIbq65G9sgcHj0WBhCoEn/Vh1kPgYIiGf7E7ebdwlYIW
aoWBYxAiMDLoPq2QxC2Kw6P2tQMdUgOimmrkPbRCX+JhCfKeJw4EySGbcCedt0vL
uVbmpSx17MVaxjRzQEsWapcMATznGA==
=1asF
-----END PGP SIGNATURE-----

--iq/fWD14IMVFWBCD--
