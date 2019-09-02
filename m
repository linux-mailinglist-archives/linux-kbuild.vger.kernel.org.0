Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4E64A5AE7
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2019 17:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbfIBP7o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Sep 2019 11:59:44 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:44558 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfIBP7o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Sep 2019 11:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=y50wGX0Un/A4Fwy+umw5sbmAokumtcB85dCMq1fL+es=; b=X4u2QxD90PtZskzs/CUyD9cRg
        HkHr8kVkr3cHoHW/V4YK4GV1ZVvshyNHhBbJrIUw6REv51XdmHEUZZgePfiLFGzgFWPBjZfwli802
        7/QbFThTZylR+b2rL2glT7Fso37Fl4tHwlMwjSvYvSkG5tqTkOJTkgXICtUfsIDEby+Ec=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i4ojy-0003gc-MT; Mon, 02 Sep 2019 15:59:38 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id B818A2742CCB; Mon,  2 Sep 2019 16:59:37 +0100 (BST)
Date:   Mon, 2 Sep 2019 16:59:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2] merge_config.sh: Check error codes from make
Message-ID: <20190902155937.GD5819@sirena.co.uk>
References: <20190819200650.18156-1-broonie@kernel.org>
 <b744485d-3e57-469f-5573-6d8a32ba0aef@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gE7i1rD7pdK0Ng3j"
Content-Disposition: inline
In-Reply-To: <b744485d-3e57-469f-5573-6d8a32ba0aef@nvidia.com>
X-Cookie: Lost ticket pays maximum rate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--gE7i1rD7pdK0Ng3j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 02, 2019 at 03:06:28PM +0100, Jon Hunter wrote:

> If the intent is to catch errors returned by make, then one simple fix would be ...

I proposed a simpler version originally that only caught errors from
make, this version was suggested by Yamada-san.  Like Guillaume says he
posted a proposed fix for this last week.

--gE7i1rD7pdK0Ng3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1tPGgACgkQJNaLcl1U
h9Ay0QgAg/xxPeqP2NZDIjMq3QJRYuPGW0WzVxE5ZNhSp4XYeNPplJo8koUkwApf
FmvBUl0DJSJHwkh/jZNFm+Z6G5T0DrKoM+lgxyzYvDLH7Up6hVUx3Iw5i0v1fuys
kjtgallTF9Jd75gYIYeX1mJWc5HChvKQyx8Q9Vy3UYePbUQ/S/LNZJdquESGSPiq
Nb1Aql0BCqhUVMVKwXf9rk9/fEkvvD/rttciTOfHZiCCqj+eyu5hPrcLXvZgh2VF
ntZSNe61u49S3kwhEN0R8JX0ViZvVpuKE4YqbTccEmVo+A2D7y5NI1na3ODEm/At
jcGbsUlnWjeSpLkD7go+jsqV3ny9Rg==
=jOvy
-----END PGP SIGNATURE-----

--gE7i1rD7pdK0Ng3j--
