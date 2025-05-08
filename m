Return-Path: <linux-kbuild+bounces-7031-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CEAAF2E2
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 07:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CDEE7AD19E
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 05:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98647212D7C;
	Thu,  8 May 2025 05:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="xuOOEdhQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0198A770E2;
	Thu,  8 May 2025 05:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682153; cv=none; b=l9eCenFmfU8jlFLJTOd+l8YBhPqDHeIpNd3OZZGoWoXP/xeRb3bahmWSLe7sny6acWwIqJoNgYWd9iKVamx5RSdyUJQeZw41/jAQCzNE29H+F7Paz/YIGVGXJe8FsGP9pAiSotP78QsEEZ/xEMkc65Kj+FM5B3Pq/aU15VH+gd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682153; c=relaxed/simple;
	bh=YwOuQk1rONMwb2vNGR6Ps53Vx5wyoORvLw5IHYjvLgk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tsmCFaCPCdW7au2/LMDlCbH2A99Eg9FAalkX5z2xFgQNH0wDllXImCZWXbKKesTEQY60RajM398tLgIDxtZMYhAb0SIWESvEhUkdYib3mqKI/ZkQxa+du9xqjbktuHmidGinxD5Ww/7k+HW7qI/VyAWGhuKDPJcP+hCfRqLHSvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=xuOOEdhQ; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=abgIvTl95IldGAjgwx1zwym4dN3voLN7jqSpis9EXko=;
	t=1746682152; x=1747891752; b=xuOOEdhQa3u/BDSmZ9WDVMLhrIatfcGtnznlBVx6ep8ZK/V
	T+yZtq0bJuQreWvxR7NFccGRCSZO62Ph/uhxBrFWAVHmJ2usoV11oHD85A8ruZ6u6DKuOHIReU9XH
	mmER/qrv3wtz807MPnj9cQRlhF7/ZsqKO6g4Z3xpUlGW+n3vOkGNdhkfJ4v5I1BPucHaxCfi7oLuc
	issDBtxjYAC/BwhTnZD/f0grVFy+YyhBa8ke+Rc0DmEgs61SqbNyTyvRjSntPX+//0q5OgEbODykR
	ft0Ssw0a+sS1OEnZkFQ7rdmF/1cm4rPK+E5hMVgjdCQNKuOhXuNfqlHV3cVKDCCw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uCtog-00000009gKj-3jZY;
	Thu, 08 May 2025 07:29:07 +0200
Message-ID: <b1e4e83c0965e10f2fe59826d19eaf131ec7aef9.camel@sipsolutions.net>
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH
 as well
From: Johannes Berg <johannes@sipsolutions.net>
To: Shuah Khan <skhan@linuxfoundation.org>, Masahiro Yamada
	 <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>,  Richard Weinberger	 <richard@nod.at>,
 linux-um@lists.infradead.org, David Gow <davidgow@google.com>
Date: Thu, 08 May 2025 07:29:06 +0200
In-Reply-To: <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
References: <20250507074936.486648-1-masahiroy@kernel.org>
	 <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2025-05-07 at 15:38 -0600, Shuah Khan wrote:
> My workflow:
>=20
> - Build kernel on x86_64 with CONFIG_AMD_MEM_ENCRYPT enabled
>=20
> - Check for arch/x86/realmode/rm/pasyms.h
>    ls arch/x86/realmode/rm/pasyms.h
>       arch/x86/realmode/rm/pasyms.h
>=20
> - make ARCH=3Dum O=3D/linux/build
>   =20
>    This patch cleans the source tree, but doesn't remove
>    arch/x86/realmode/rm/pasyms.h
>=20
> - ls arch/x86/realmode/rm/pasyms.h
>       arch/x86/realmode/rm/pasyms.h

Is that even _expected_ to work? If you have x86 built first, I'd almost
expect you to have to do "make ARCH=3Dx86 mrproper" before building
another ARCH. I don't see how ARCH=3Dum would know how to do a full clean
up of ARCH=3Dx86, unless this is somehow arch-independent?

Or maybe that's not an issue with other architectures because UML is
special in that it uses parts of x86?

Though I guess the patch here should make it do that, more or less, but
it can't, likely because you're also switching from in-tree build to O=3D
build?

johannes

