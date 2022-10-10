Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66C975F9CD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Oct 2022 12:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbiJJKfk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Oct 2022 06:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231682AbiJJKfj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Oct 2022 06:35:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E62F57231
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 03:35:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04FA960ED3
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Oct 2022 10:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35210C433D6;
        Mon, 10 Oct 2022 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665398134;
        bh=H453O4Ck3j+EAfetXu92aA++rPyfEXd4RcrhhAoJES4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kk9ufHrnTRvCKqh7mZuh4I6XbSi+lVJMnwdkZ+nvzR2CtTBJiUNjrRazz3h15gGgO
         7W75ddGM67v1Gvbsr2MidVkvRDbqNpkCX5sdFkCPSiTrcp22d8Xj+7WVIvqBTAyW/u
         ti9lbcJCFP9FGi/Boez+h68kvIuaBwT9nAV3CazOVpCKIfpbSxPfPWlwlkj9kAeNpl
         liFTOr8HinuWVDPoU3d4DH32TRm3C+p5G6VGhMkh2Akbm9OmxaedHUeCEwyQ0DW5ow
         xGDZItvirPOE9JLIdOuD1Kd8RliKuG0JbVzvR8Usuk0BqEYdI0sWjx0xElY3RUT6WO
         CZJ1t4yOqGj4A==
Date:   Mon, 10 Oct 2022 11:35:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     kernelci-results@groups.io, masahiroy@kernel.org
Cc:     bot@kernelci.org, Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
Message-ID: <Y0P1cBijSd2OfYVD@sirena.org.uk>
References: <633f0406.050a0220.9431e.d406@mx.google.com>
 <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
 <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
 <Y0AOD/EfGEiGevsD@sirena.org.uk>
 <CAK7LNASR0ufUDmAUdkH1sEtXH9DoG5_==XcNw+KxvpoUg=57bA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3vDlaSeEM/TzkV03"
Content-Disposition: inline
In-Reply-To: <CAK7LNASR0ufUDmAUdkH1sEtXH9DoG5_==XcNw+KxvpoUg=57bA@mail.gmail.com>
X-Cookie: This sentence no verb.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--3vDlaSeEM/TzkV03
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 07, 2022 at 11:35:25PM +0900, Masahiro Yamada wrote:

> I suspect "+debug" in "multi_v7_defconfig+debug"
> because the failure log says "ftrace bug" multiple times.

> Which config options does "+debug" enable?

> Can you share the .config file?

The baseline config and fragment are both in:

   https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defconfig%2Bdebug/gcc-10/config/

--3vDlaSeEM/TzkV03
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmND9W8ACgkQJNaLcl1U
h9BzVgf+ILZmxLbhK5A3d2jKv0GueN86KXSYBGNG2mmobxF0IWArfP3xcPSPdDvG
WdmwbXTkjEl3Wg7Z1k3J5FvaiO/hG2Sg9BQEkaPg8uOy4luQdGaVz2X84qlpiRcr
UWFYn5pFboe1nuU8dFJqA2VZd+HyGBRwhq551cbCBKIVc1VgrCltySlddYBTvC45
9vgblx2XgvfeSOzIJy3sG9MUhXQfBE/1HtNOBaAK00K/KAZmWfd1+pI/YDFSz+jc
/RQQG7HEPKApf/ptmGgzW61lp3XWc0HQTtww9YROnxBxNIVA2e815YlJW6kVLHFZ
B/JpNvI7E9t4f7V01aHrF9O63h4wBg==
=2gc/
-----END PGP SIGNATURE-----

--3vDlaSeEM/TzkV03--
