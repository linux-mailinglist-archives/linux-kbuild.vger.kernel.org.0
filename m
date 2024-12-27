Return-Path: <linux-kbuild+bounces-5258-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BE9FD4F9
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 14:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E71E41883D62
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Dec 2024 13:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079D61F2369;
	Fri, 27 Dec 2024 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="nGkmIgq+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E89118870C;
	Fri, 27 Dec 2024 13:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735306299; cv=none; b=WLXQvHAFFjqltbLEE/vGgDmjeBSohSrStnnAhBd4vuhZO6SJViOc0QIeqZPHnq6FOqfIk4+68YoCpI8gJu/88OdJLl+OUn/Hv+vKpX3gaBHHfriblaUikZTQ4tmm2LKMjEvynhLEFaTv2FpyA22O+DHixXjJKLD0aNfKeJ8A3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735306299; c=relaxed/simple;
	bh=vLsT37ljw2cQ6BmVLDKKpmltRZl5OUrh9WtC8H2kKo8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WXzjtq9rn8vXUXxmN8Vi/EAuf7b4HYkFjaMYHXYutJtVC5MR3TmxrcfMWI6rPDdRtHl8E0y0Z1gIAY0gKwafyub93qLIN15VPNaVP8CxVPU0WqDfPGjaZhmL1Au3V+U62abE5BjmvJrnbg70Y3KM5GYKbV1AfJF7iVkeutFe3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=nGkmIgq+; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EhxWDsh6z6UGdA/4uN8oWv7QY/79uJfIgjYBFN0difk=; t=1735306297; x=1735911097; 
	b=nGkmIgq+eTRw/gCsJ49tf9aPZy7/PPyiez7S1ZM7WjPQ4MN+rczkt8vbSMfFr4gHgE/NdGyfU3D
	mZYVszxSPumeHgSace4pbVmrN4BY1gH5YBmS4/wdocza13lLjqhMrtGvLTOqpA9XSGQmEVF+2SOJ/
	CdZAPVNnZgyvjPr4+2aaYqEEodS+J2Jm2sHcgTw/W8DBt2JWT3Ct2FShMz8N2AAij/g2F7QMN+2Dh
	+rz4ArEDwevlJSxZ9sBzPOL3A1iTRBTqfF6/OWsskSQarkxVcjwHrYMz36wIsi6VjVseQzwLHMHUe
	rABzUuaXK436MNY0xhR1gdayB1Ry8i5Xeqiw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tRAR9-00000001jdy-3nmP; Fri, 27 Dec 2024 14:31:31 +0100
Received: from dynamic-077-191-186-045.77.191.pool.telefonica.de ([77.191.186.45] helo=[192.168.178.50])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tRAR9-00000002ODh-2uBP; Fri, 27 Dec 2024 14:31:31 +0100
Message-ID: <92669b2d182b314f10fe7cc92ad6bc7fd4096d35.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 0/3] modpost: work around unaligned data access
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: gregkh@suse.de, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 nathan@kernel.org, 	nicolas@fjasle.eu, rusty@rustcorp.com.au
Date: Fri, 27 Dec 2024 14:31:30 +0100
In-Reply-To: <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
References: <20241225153343.134590-1-masahiroy@kernel.org>
	 <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
	 <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Masahiro,

On Thu, 2024-12-26 at 22:55 +0900, Masahiro Yamada wrote:
> > I have just applied this series against Linus' tree and I can confirm t=
hat it fixes the
> > unalignment access anymore on sparc64. There is no more "Bus error" and=
 the build succeeds.
> >=20
> > Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
>=20
>=20
> Thanks for the compile test.
>=20
> Loadable modules (*.ko files) are relocatable ELF.
> So, there is no alignment in *.ko files any more
> if the latest binutils is used.
>=20
> Just in case, I did run-tests for arm and arm64.
> Even if there is no alignment in *.ko files,
> I confirmed that the kernel can load modules.
>=20
> If you have time, please run-test and
> double-check loadable modules are working.

I have just verified that. I applied your series against v6.13-rc4 and can =
confirm
that module loading works without any issues on sparc64. Tested on SPARC T5=
 LDOM.

So, please extend my Tested-By to both compile and runtime testing on sparc=
64.

Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

