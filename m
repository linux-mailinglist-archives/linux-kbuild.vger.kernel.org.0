Return-Path: <linux-kbuild+bounces-9234-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87732BF8421
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 21:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2BBBB343778
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Oct 2025 19:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACF7350A07;
	Tue, 21 Oct 2025 19:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YIekb5Zs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ADD350A06;
	Tue, 21 Oct 2025 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761074918; cv=none; b=LFlPfdLzXOBMinsoiY7+kxq9n8uttxsjFXQ84s9YMzM6MSWDvucp/BJlT2vttro3XvG7YPELU1owUMW2xZJR94CapSV8sJQdz3KaM9pmZ9ZGNbrBqQE4EafG157Oy/sw/KxIlOwGgeSxew+jGG/63T54dN7JloX4s9z4QFYUKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761074918; c=relaxed/simple;
	bh=d+4538L4GbPPgZmAUvKo7z7ewA7xKe/nr6cYnTlwijo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=AVMQqrgFIpfgk8hdqsnO2pQdO8L7gy3oCTgwsZf+KiyM2o3ABjAH1SljftqFu7ThFtVJtdJXRXDsn+nKK14rHrIwemWFxvj6Jc2ydouHf5zog5bcb5pYRO9Bn+hDDkPaGPG4xrvSYyBNdh0cwmUW3+DHwkYmCnNuTu02UrbKVlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YIekb5Zs; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761074904; x=1761679704; i=markus.elfring@web.de;
	bh=oIQKJ9cydFZQTKbtM1G0DzHn+v74lRSWNp41hsgJOFs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YIekb5ZsUXbTVPmlzmfaJEmwyaS9QoMtRQedi7LgtbFYTFnApgyoSJQd/JAPwzNe
	 e6qhhfORM7FnbigMUhPLJe40SR5spiVFFkTXJJVbFUngKvgcthIueAWbSf94JdloB
	 /wPOarMl7vnFcxU7+idUtCHLwyEpywZklcaNGIa6r2huIct+cTThZJrDxcIzMoouD
	 PyYlPq/0xalHKok6im3FumvNidRPS0h4+CUrgxbOGzizmb2nBCZWnzfM85CBeKQGm
	 Tb7ZR0a3RuEvBmwK5l0fFiA8wKuJrmW01cH0x9duLJ5WXdut4DE7JQqwtW+TphhJj
	 UthY4ajnPBh9htGJlw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.255]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MhWor-1uWi9D2ejT-00oSq1; Tue, 21
 Oct 2025 21:28:24 +0200
Message-ID: <e8115a3f-da40-49af-9d69-191ea0f280fb@web.de>
Date: Tue, 21 Oct 2025 21:28:20 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Petr Vorel <pvorel@suse.cz>,
 Thomas Meyer <thomas@m3y3r.de>, Vegard Nossum <vegard.nossum@oracle.com>
References: <20251021171446.46942-1-biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH] Kconfig:Uses glibc so strscpy has to be manually- added
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251021171446.46942-1-biancaa2210329@ssn.edu.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F2Jc2hq/XnSU59YTgZpPNr62c5UqyUaMGOprATp86wNDJrcu86N
 a1wpgZAEFgfRpDH4umNRbDBOIVUCNrB0JgRzJtkcXJ2VDEVXqjfVKdPCjstKfN9TItRuti6
 6kIj/IUkBwHlEKKlvBNwNwME0zo8VFNK9Hm/FypbGwiKhREIfQ1vUwbxak6018U1+UFqvbC
 HMimVB7kL56NmSKSF0OGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Smyjbo34tsw=;WH92O3tCvFCnF1F00OHU0B3mbLW
 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
 hyuhA==

=E2=80=A6
> ---
>  scripts/kconfig/confdata.c | 16 +++++++++++++++-
>  scripts/kconfig/symbol.c   | 16 +++++++++++++++-
>  scripts/kconfig/util.c     | 17 ++++++++++++++++-
=E2=80=A6

You would like to use the function =E2=80=9Cstrscpy=E2=80=9D in these sour=
ce files.

I miss some information so far.

1. Helpful change description
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n45

2. Nicer summary phrase

3. More appropriate recipient selection
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.18-rc2#n231


=E2=80=A6
> --=20
> ::DISCLAIMER::
=E2=80=A6
> The=20
> contents of this e-mail and any attachment(s) are confidential and
=E2=80=A6

Please reconsider such hints once more for communication by the means of p=
ublic mailing lists.
https://subspace.kernel.org/etiquette.html#do-not-include-confidentiality-=
disclaimers

Regards,
Markus

