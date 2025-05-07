Return-Path: <linux-kbuild+bounces-7001-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C10A4AAE655
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 18:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CF967BE4AC
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 16:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBE228D834;
	Wed,  7 May 2025 16:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="Se9SVE5g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1328C00D;
	Wed,  7 May 2025 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634445; cv=none; b=YL8mGEo5MsC7Te2yA2PiQw4xBdrlmSIrsKiPyjG8bVAMwtuE4020ahzmWBS2grObQ9/trOqci+aa+oggdPUiNA3zoQ/7JNnuNTaCVOoZ4rOOoH7V0aK6RW0P4Eyw26Z5wkOUvqsbpO5xyvnoG3TCIqpWBsheIKFbIspJoFMcaA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634445; c=relaxed/simple;
	bh=UKO/g83ghC3Bu1DE8s6oQ5sS7O3tZvT5JVduKAolUys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WdlfAMJX5CvA3F18gHkLDiQ9nGO8MTdIIMCcTVqndPLmHdvpLyiH0XZW7HlEaZhDslapnJFbx7xCjf0eQk3s0usuntevim7oANRVjgNwvWSm7fPYEAxjs0a6xrs/9NH3AFqOPIfyj1mgVI1ElYf6rYIZ1XR/nWSXlRNqRdgqNEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=Se9SVE5g; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MqGIOCVMPo1HNFOMfB65N3JXumwu7kUo9lvLDc+biAw=;
	t=1746634444; x=1747844044; b=Se9SVE5g/GmuCEJmJymENdPpXSpY/h6V7LglPGu0yMubI5Q
	Zr8zvugwMdeQCs1AAQStHbZj/k6XO1shNS5l4yKifk7fTqyA+m7YaXDY6jjHfO2/zSJEjITCv7t4O
	MYQxCR3t2Dpq0xnA5pBU+yhRx1NwNznS45SvgvRAP83b8kJAHFVSAuog8vmR+2XlfTPEUCOrtxlQv
	xlday0DlTifsa2gXwt6osMZcOL3osTHr0/iabYCEiJmyENi2bFVI6Mnl83F3ZBkK8IxCFfQIvpxKw
	WTjbfbFxiH3GhTUz43cu+NpSdPCzyigUO40EkQKCM337HeKHJ4hiYut7kowvWu9A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uChPE-00000008Jel-2P8T;
	Wed, 07 May 2025 18:14:00 +0200
Message-ID: <7a92e3eb5947837d16f8b7f1adec9ffc4fda397d.camel@sipsolutions.net>
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH
 as well
From: Johannes Berg <johannes@sipsolutions.net>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard Weinberger
 <richard@nod.at>, 	linux-um@lists.infradead.org
Date: Wed, 07 May 2025 18:13:59 +0200
In-Reply-To: <20250507074936.486648-1-masahiroy@kernel.org>
References: <20250507074936.486648-1-masahiroy@kernel.org>
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

On Wed, 2025-05-07 at 16:49 +0900, Masahiro Yamada wrote:
> Building the kernel with O=3D is affected by stale in-tree build artifact=
s.
>=20
> So, if the source tree is not clean, Kbuild displays the following:
>=20
>   $ make ARCH=3Dum O=3Dbuild defconfig
>   make[1]: Entering directory '/.../linux/build'
>   ***
>   *** The source tree is not clean, please run 'make ARCH=3Dum mrproper'
>   *** in /.../linux
>   ***
>   make[2]: *** [/.../linux/Makefile:673: outputmakefile] Error 1
>   make[1]: *** [/.../linux/Makefile:248: __sub-make] Error 2
>   make[1]: Leaving directory '/.../linux/build'
>   make: *** [Makefile:248: __sub-make] Error 2
>=20
> Usually, running 'make mrproper' is sufficient for cleaning the source
> tree for out-of-tree builds.
>=20
> However, building UML generates build artifacts not only in arch/um/,
> but also in the SUBARCH directory (i.e., arch/x86/). If in-tree stale
> files remain under arch/x86/, Kbuild will reuse them instead of creating
> new ones under the specified build directory.
>=20
> This commit makes 'make ARCH=3Dum clean' recurse into the SUBARCH directo=
ry.

Do you want to take that through your tree? I'm not sure we'd get it
into 6.15 at this point via uml, if you have some other material feel
free to take it:

Acked-by: Johannes Berg <johannes@sipsolutions.net>

Otherwise we can take it via uml tree for 6.16 too, let us know.

johannes

