Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74765F7771
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Oct 2022 13:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiJGLbf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Oct 2022 07:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJGLbe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Oct 2022 07:31:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909A3A485D
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Oct 2022 04:31:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2B35E61CAF
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Oct 2022 11:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64212C433D6;
        Fri,  7 Oct 2022 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665142292;
        bh=Q2H3etKtwAPG5oSTTciYJ34vGRDEVtRGOummqim0Mhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ol4KmGXY7t+S083oEM90oj3Y3NDPM5UtnFRqKr1/Ji3nrrtNax+kSGZDS4qi5VprH
         8cYEXmavoId3adpwpKRxwK7xKu6EZoFvhx5gJXaXqfv7835aBCQ0BtA/LMo0cKfiI3
         l/w6SoHM7tqOP21R2B8VjQDFJoEQTiYvxq4gPEXrUFRMU68V6gCyb0PLeVTYQKEg7k
         0vOOhGot2xSrLvnRROrVCr7Q4r0wZn+jksTdR7e6Nq1hShZKyA9ddXGeo7Oo5CPZNB
         kOSamuZghTWPNFhd2Oet+YzEUOgxw+WAVG07HM4Nn3Q+OFzJ9OXOlwtfFet/1JQZb0
         mqT5P1TutSmVQ==
Date:   Fri, 7 Oct 2022 12:31:27 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
Message-ID: <Y0AOD/EfGEiGevsD@sirena.org.uk>
References: <633f0406.050a0220.9431e.d406@mx.google.com>
 <Yz8H+CIgq9A8WI6J@sirena.org.uk>
 <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
 <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aNqoaOQnVvAfZvJE"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ2L7fLG1zzS-MkgqKS+JYEvX62wPhZg-S+4vMk0cjNVg@mail.gmail.com>
X-Cookie: Approved for veterans.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--aNqoaOQnVvAfZvJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 02:38:06PM +0900, Masahiro Yamada wrote:

> The arm virt machine with gicv3 booted as far as I tested.
>=20
> So, I need to know more details about the settings of the KernelCI.

The HTML versions of the boot logs include the qemu command, these days
it's run using docker so so you can even get the specific version of
qemu version that was being used by kernelci in case that's important:

docker run --network=3Dhost --cap-add=3DNET_ADMIN --interactive --tty --rm =
--init --name=3Dlava-docker-qemu-7496529-2.1.1-gexyjab5hb --device=3D/dev/k=
vm --device=3D/dev/net/tun --mount=3Dtype=3Dbind,source=3D/var/lib/lava/dis=
patcher/tmp,destination=3D/var/lib/lava/dispatcher/tmp kernelci/qemu qemu-s=
ystem-arm -cpu cortex-a15 -machine virt-2.11,gic-version=3D3 -nographic -ne=
t nic,model=3Dvirtio,macaddr=3DDE:AD:BE:EF:45:5C -net bridge,br=3Dvirbr0 -m=
 1024 -monitor none -kernel /var/lib/lava/dispatcher/tmp/7496529/deployimag=
es-blwzkdvs/kernel/zImage -append "console=3DttyAMA0,115200 root=3D/dev/ram=
0 debug verbose console_msg_format=3Dsyslog earlycon" -initrd /var/lib/lava=
/dispatcher/tmp/7496529/deployimages-blwzkdvs/ramdisk/rootfs.cpio.gz -drive=
 format=3Dqcow2,file=3D/var/lib/lava/dispatcher/tmp/7496529/apply-overlay-g=
uest-f5mnvw0l/lava-guest.qcow2,media=3Ddisk,if=3Dvirtio,id=3Dlavatest

Everything from qemu-system-arm on is the command that's run inside the
container.

The logs also show the download of the filesystems that would be used,
though we don't get as far as actually using them so it's a bit moot:

https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defconf=
ig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.html

--aNqoaOQnVvAfZvJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNADg4ACgkQJNaLcl1U
h9BJAAf+Npyk7jWqnSrDAijhBdUVA69VSGfk28Ab7NcG85hAG4cJtCOBDJh2+tvf
kLIPEZW7MWNW8exN6MdwfDimkzniiRZKIWUPQ56x+FAhNYDm+NNRRctVTxl0SAQj
E4n6Tyab/sj8pA44f//zi5+c8KP/Fmwa0GM/R4EgQti3IcLGvM6TDsGPskHg4hXg
D+rUV9mnRb3ENNv2LZYY1sR5Oe5xj3mhgprvaxTkgMGEbn1acfWPnbeIugH/YkiT
e7OvZ3nFG8M/8HIzBrUN6eKlTS0xc4hYHgUpzKgFC3Lbi/Auntya9qX6IjxHBB1W
Pg65FOJbN9/R3LXM35E2NJFDYgtn4A==
=3zkl
-----END PGP SIGNATURE-----

--aNqoaOQnVvAfZvJE--
