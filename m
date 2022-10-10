Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30ACE5F9F9E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Oct 2022 15:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiJJNtq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Oct 2022 09:49:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiJJNtp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2022 09:49:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD132103D
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 06:49:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51E3360F58
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 13:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE11C433C1;
        Mon, 10 Oct 2022 13:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665409777;
        bh=BuwmmTIHvXZ/laRjaztEIy49vCnkhUbhf5xF+6tG7+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Trr7ZKFE6EpMs4+hDm9ByE87WpHUAsCighIIj6CuLJB+Ek1nQTDZ65z/mTT0SXDdo
         0Wodoa6b/yhPZKiJO/ZZY5qTi72U2UDBcVFlAfjJESDIcmbjpevnxBw+647Yne76si
         gFwsKRhbIFvoUmXKf0OO4HUMglAVta+T7cLuSScJ/1+9fT1A9jN5udmfhPY40D2jkl
         ohe63CZ7RMsmWF6G75r6TVa6H7FwveNxON5k+8MJcxff2zPDB8hAVCSeuZ/I3/sV8z
         HYZF8SOdtLbttI5MOpnI1LDSCCirTgFZFZ8skgbOURg7FhDMfvyHpVBU0U2Nt8Hs29
         MKB06P4jb7Bjg==
Date:   Mon, 10 Oct 2022 14:49:32 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
Message-ID: <Y0Qi7APbIpNn/Z08@sirena.org.uk>
References: <633f0406.050a0220.9431e.d406@mx.google.com>
 <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
 <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
 <Y0AOD/EfGEiGevsD@sirena.org.uk>
 <CAK7LNASR0ufUDmAUdkH1sEtXH9DoG5_==XcNw+KxvpoUg=57bA@mail.gmail.com>
 <Y0P1cBijSd2OfYVD@sirena.org.uk>
 <CAK7LNATK10aT20SbGdJGLFebSQb3EnnMQ2pmy=_=gG7dpLB6JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rAglQHLJ0eFxJZEj"
Content-Disposition: inline
In-Reply-To: <CAK7LNATK10aT20SbGdJGLFebSQb3EnnMQ2pmy=_=gG7dpLB6JA@mail.gmail.com>
X-Cookie: This sentence no verb.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--rAglQHLJ0eFxJZEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 10, 2022 at 10:31:51PM +0900, Masahiro Yamada wrote:
> On Mon, Oct 10, 2022 at 7:35 PM Mark Brown <broonie@kernel.org> wrote:
> > On Fri, Oct 07, 2022 at 11:35:25PM +0900, Masahiro Yamada wrote:

> > The baseline config and fragment are both in:

> >    https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defconfig%2Bdebug/gcc-10/config/

> Thanks for sharing the .config file.

> With it applied, I can reproduce the boot error.

> And, I see the same boot error on v6.0-rc7, which my branch is based on.

> So, arm is already broken in the mainline, and
> my kbuild patches are irrelevant.

> Also, please check the bisection logic of kernelci.

I *suspect* there's some involvement from link ordering, object sizes
and exact placements here and there's probably some toolchain variance
(the KernelCI results are with Debian's GCC 10).

--rAglQHLJ0eFxJZEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNEIusACgkQJNaLcl1U
h9DCuAf+NRHMVK95JkgWwfEmHQHvQ4jY3u3QEbEEmpNXLMMvb1suXdaDkf/pACBM
k8bZCAUgsmEfg/++LiYclTKDhrPCtvhkMGMHGYQSgnLQdZ6l/d+Yr52xwMWlQrZI
/1Z37UToFbg6aMOk+y6pMaD40vkgYxVRilJ6tixWzn/Qr9dBduZRLfoqAko8JuAV
z+HB8gWolfcB+kq1/jE0etB9sMZNvR7h2yhnIHivZrMPdK4rBzVw5cyhycl8qRUP
KwWP7pmwZExcpU7ZEL9eGqlcYw36V/9KpzD4rd/gpxjNmoNGfssUZQ1lE4praO9Y
mILYMoKODk8xS+vwVvllmraXZjw7JQ==
=B59R
-----END PGP SIGNATURE-----

--rAglQHLJ0eFxJZEj--
