Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFA6A89BC8
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 12:43:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfHLKnh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 06:43:37 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47776 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727846AbfHLKnh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 06:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5f1LVO8QdFJyE68ZCC91n/Q5s1P2Ep2IZ7wHAqzVO+I=; b=W4efOoZCeQrUkgzP8LczH5zrO
        yV0ofc5y4W1995dSPwKP624vkPjXbGdJjXVzAfUlqBYom5TMDTeF69662XO5WcWHmDAYh2GTCXtZI
        a68ogHKNW+1Je7/8tywox78lsZM9kMslTTrd01GFPDYE16QU1Cn9UtrTx+mO4FH1ynmJ0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hx7na-0000s2-3J; Mon, 12 Aug 2019 10:43:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2FA3327430B7; Mon, 12 Aug 2019 11:43:33 +0100 (BST)
Date:   Mon, 12 Aug 2019 11:43:33 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: [PATCH] merge_config.sh: Check error codes from make
Message-ID: <20190812104333.GC4592@sirena.co.uk>
References: <20190808222705.35973-1-broonie@kernel.org>
 <CAK7LNARkfLY94D=B_h_s7Cz_DAmMUYvoYq4-xB1bt-RRJZP77Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eRtJSFbw+EEWtPj3"
Content-Disposition: inline
In-Reply-To: <CAK7LNARkfLY94D=B_h_s7Cz_DAmMUYvoYq4-xB1bt-RRJZP77Q@mail.gmail.com>
X-Cookie: Decaffeinated coffee?  Just Say No.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--eRtJSFbw+EEWtPj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 10, 2019 at 06:11:10PM +0900, Masahiro Yamada wrote:
> On Fri, Aug 9, 2019 at 7:27 AM Mark Brown <broonie@kernel.org> wrote:

> > When we execute make after merging the configurations we ignore any
> > errors it produces causing whatever is running merge_config.sh to be
> > unaware of any failures.  This issue was noticed by Guillaume Tucker

> I am not a big fan of this way of fixing.

> [1] 'set -e' is useful to catch any error in this script.

Right, that was actually my first thought but since there was a handler
and it was already being called directly this must be a deliberate style
so I did things this way in order to fit in with the existing style :/

> [2] I think trapping only EXIT is smarter.
>     The clean() help will be invoked when this script exits
>     for whatever reason; the temporary files will be cleaned up
>     when the script is interrupted, errors-out, or finishes
>     successfully.

> I would change like follows:

That works for me,=20

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

--eRtJSFbw+EEWtPj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1RQtQACgkQJNaLcl1U
h9CP1gf/XX+eXOYHMI9aH70hZlG2FXdfrke5+ZDdtFbM7OI+pEBwVxe6gpnkeBYY
0OVXegZeeeM+aLnb3zIXXkX88i0VFlwuEFGDEhyds5eHQOwXljK9JddMwaUKf2Qk
47jRgLYyKmIukt9WV45V5fhcz4FxujzEH+gHTYFqKaDEk+WvvUKe0NvuicGCqEzA
oqV9R4A9aYunhJdSkY9mIYSorP67Z9jBNeLYCYEbZx2Uj01kxCAh2rekAPUZOd4w
yf1jXsuIO2Osz0f3ZmEpGpxyLQvBlpZeo92/K2dHovxz2LitGlnugQcDMth/8fS+
hoHqfgbVF4iONB4gM4cNweJdpu7KZg==
=kLUK
-----END PGP SIGNATURE-----

--eRtJSFbw+EEWtPj3--
