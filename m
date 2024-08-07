Return-Path: <linux-kbuild+bounces-2900-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B463294AF92
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 20:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FEB6B24AB3
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 18:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4421013DB92;
	Wed,  7 Aug 2024 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="uc+EGbEa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E313BC12;
	Wed,  7 Aug 2024 18:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723054884; cv=none; b=d3q3m6dB/DpT2f8KXC9RNhphCZvFjloASI+AEL8gJiHPZsxpkzz+Y2/XlxplC38YhtGlYhTT/e3etKw+U3UOvMXijfVx+aret8Idq2t0mT8MOOmQLQWzwImk7Mlm/+lRfgO0wR1h43rtTjlRdpzPX8UdDa0UFw8r4Weicn7WYYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723054884; c=relaxed/simple;
	bh=gGDPCU4dvtVAs+kBN3Tni5ecXZO+1gYRmfY9xpseX/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIfv8/oYIqNUuSwhHsJ0gO3vYxjbmzwtPBXTvDwOQwDdze1T8o49DidHg0hk9l4HDRILnaBo8gSc/rOo4hznutA72m4PeVkHXgjK04fCA2oLFmYEYdraLxtBWjB8r6Ph6jsteht6UEoL1dbTt6W6ThyIudDCmnnAvc92iZEcPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=uc+EGbEa; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iIhEpjR88phsClPIDYc7AE9eN2SqLt7PRPIN0A7jsMg=; b=uc+EGbEanBApkFHme81cbRX9I5
	FnuLETyfx2KWioIBJhk2CLWNKYKuVR24+3qXSJsPTxepqKAZydjDFU3A23h7aweVgc97gTKHILld+
	jOBMLBS6t0kC2tMWc+KMxY972tvEBBdCbW4jbDT7V3c6PSVkRPjKpm4q4fLj+Z+ytbAVv7j+hq/3/
	CzCaqx7+0zv9GBX+Rv7g4FOl1wzDj8SlVTKmA5MJs3z+AJmPFyBbao5uCn3V1kGfAD8RR+/+HH4bq
	u7/KfHsYzj7hUqUj0MzFjynxNrT1YP2SoCM47/KBQyytZXZda+BDkMKdSZumRE/1SbIhiNokPx51d
	ew6RcLqQ==;
Received: from [2001:9e8:9f8:5201:6f0:21ff:fe91:394] (port=55006 helo=bergen)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sblHY-00AIFT-BZ;
	Wed, 07 Aug 2024 20:21:08 +0200
Date: Wed, 7 Aug 2024 20:20:11 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] treewide: remove unnecessary <linux/version.h> inclusion
Message-ID: <ZrO623duqRRWS5di@bergen>
References: <20240807174730.658429-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Tjx/mdBLejTbqNwV"
Content-Disposition: inline
In-Reply-To: <20240807174730.658429-1-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux 12.6
Jabber-ID: nicolas@jabber.no


--Tjx/mdBLejTbqNwV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 08 Aug 2024 02:47:28 GMT, Masahiro Yamada wrote:
> These files do not use any macros defined in <linux/version.h>.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  drivers/accessibility/speakup/genmap.c                | 1 -
>  drivers/accessibility/speakup/makemapdata.c           | 1 -
>  drivers/staging/media/atomisp/include/linux/atomisp.h | 1 -
>  samples/trace_events/trace_custom_sched.c             | 1 -
>  sound/soc/codecs/cs42l42.c                            | 1 -
>  5 files changed, 5 deletions(-)
>=20

Re-checking with

    $ git grep -rle '#include <linux/version.h>' >files-including-version.h
    $ <files-including-version.h xargs git grep -lr -eLINUX_VERSION_{CODE,M=
AJOR,PATCHLEVEL,SUBLEVEL} -e KERNEL_VERSION >using-macros-from-version.h
    $ diff files-including-version.h using-macros-from-version.h=20

reveals that also

    tools/testing/selftests/bpf/progs/dev_cgroup.c
    tools/testing/selftests/bpf/progs/netcnt_prog.c
    tools/testing/selftests/bpf/progs/test_map_lock.c
    tools/testing/selftests/bpf/progs/test_send_signal_kern.c
    tools/testing/selftests/bpf/progs/test_spin_lock.c
    tools/testing/selftests/bpf/progs/test_tcp_estats.c
    tools/testing/selftests/wireguard/qemu/init.c

are including but not using linux/version.h.  This shall probably not=20
go through kbuild tree, so it looks complete (enough) to me, thanks!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>


--Tjx/mdBLejTbqNwV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmazutcACgkQB1IKcBYm
EmmAgQ//fOYHScOcqm6K5Bipm8uEZlEgr+Pq5M2mmXafr8uqXEdie/gy9VinFAn8
rAYKQENPU511OtIO/5+LaEnGbL+WC69CgN2DeOtLMls2yDd5pcltQAM7Lh1Sgmkw
ZmlnV/ea540ogqaqaiO3EnKrMJJYwooSS8qthq1lrUaf76XLD504njBniSFsNXDY
0y6L5+g5DI64Lk7iwwEGy2ae8NSEosjNc46onOJpcuCl6KfpZkl1ej528tMeVThI
FM1m+pA6oFbbyLCPWsJPhnh88J3i0Bk5pqV67ZGTrjnCv5CslkSEZf+RifEj4Zqr
HLe40Xqhkvc8PsXK1uSWijCfPXerPdnAweFoRS9LsJuqkcNEcqwT+NZdZDm1mx9I
YUFj6KLWeqUdAlYwq5pHJyU+VFWGMyRxv5/Hjo6M1CASHHL3xk/a4cAtfI2bykOH
fkr7bxM4PBqCStAcs4XcPtJVVfaiRRvFeIRpix6KUXlFkO817GCJwRRnt1uf/l56
rBFALztWi5jMzpW2yvn7qyikfGh8ukagy6ugjqeLSo6rfTqhBWuABS/+6MxoZ5Xt
mWgIh37CSNMrr0XqtnEpYv1xDF1hWAfxhI0QwZWWYoW1K7lG0ZEhmKghWWPKJi1I
PQIraDvVA85sfypCRn7YSC7LUIMyQ0jtgITt7gZlgIbTy6IdKTc=
=yxVD
-----END PGP SIGNATURE-----

--Tjx/mdBLejTbqNwV--

